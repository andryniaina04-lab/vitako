-- Migration du 22/10/2026 : emailing depuis l'administration + offre réservée aux destinataires d'une campagne.
-- Rejouable sans risque : exécutée par GitHub Actions avant seed.sql.
--
-- Principe
--  * L'administrateur rédige une campagne (onglet Emailing), choisit le public, puis l'envoie.
--  * L'envoi passe par Resend (clé dans le coffre-fort Vault « resend_api_key », jamais dans ce fichier),
--    par lots de 50 via l'API batch, déclenchés un par un depuis la page d'administration.
--  * Chaque destinataire a un jeton personnel : lien vers la page de l'offre et lien de désinscription.
--  * Offre : une campagne peut porter un prix spécial (ex. 20 000 Ar), réservé aux destinataires qui n'ont
--    jamais été abonnés. L'offre dure « offer_days » jours après l'envoi ; au premier clic, le destinataire a
--    « countdown_days » jours pour en profiter (compte à rebours de la page), sans dépasser la fin de l'offre.
--  * Le prix de la promotion du site (settings) n'est pas modifié.

alter table public.profiles add column if not exists email_optout boolean not null default false;

create table if not exists public.email_campaigns (
  id             uuid primary key default gen_random_uuid(),
  created_at     timestamptz not null default now(),
  updated_at     timestamptz not null default now(),
  subject        text not null check (char_length(subject) between 1 and 150),
  preheader      text not null default '' check (char_length(preheader) <= 200),
  title          text not null default '' check (char_length(title) <= 150),
  body           text not null default '' check (char_length(body) <= 6000),
  cta_label      text not null default 'Voir l''offre' check (char_length(cta_label) between 1 and 60),
  audience       text not null default 'never' check (audience in ('never', 'expired', 'all')),
  offer_price    int check (offer_price is null or offer_price between 1000 and 1000000),
  offer_days     int not null default 10 check (offer_days between 1 and 60),
  countdown_days int not null default 5 check (countdown_days between 1 and 60),
  status         text not null default 'draft' check (status in ('draft', 'sending', 'sent')),
  started_at     timestamptz,
  constraint email_campaigns_offer_never check (offer_price is null or audience = 'never')
);

create table if not exists public.email_recipients (
  campaign_id   uuid not null references public.email_campaigns (id) on delete cascade,
  user_id       uuid not null references public.profiles (id) on delete cascade,
  email         text not null,
  token         uuid not null unique default gen_random_uuid(),
  status        text not null default 'pending' check (status in ('pending', 'queued', 'sent', 'failed')),
  request_id    bigint,
  error         text,
  queued_at     timestamptz,
  first_seen_at timestamptz,
  clicks        int not null default 0,
  primary key (campaign_id, user_id)
);
create index if not exists email_recipients_user on public.email_recipients (user_id);
create index if not exists email_recipients_status on public.email_recipients (campaign_id, status);

-- Relance (23/10/2026) : une campagne peut relancer une campagne avec offre (parent_id). Elle part aux
-- destinataires qui n'ont pas encore cliqué, avec la même offre, le même lien et la même date de fin.
alter table public.email_campaigns add column if not exists parent_id uuid references public.email_campaigns (id) on delete cascade;
alter table public.email_campaigns drop constraint if exists email_campaigns_audience_check;
alter table public.email_campaigns add constraint email_campaigns_audience_check check (audience in ('never', 'expired', 'all', 'relance'));

-- Accès uniquement par les fonctions ci-dessous (security definer).
alter table public.email_campaigns  enable row level security;
alter table public.email_recipients enable row level security;
revoke all on public.email_campaigns  from anon, authenticated;
revoke all on public.email_recipients from anon, authenticated;

-- ---------------------------------------------------------------------
-- Public visé
-- ---------------------------------------------------------------------
create or replace function public.never_subscribed(p_uid uuid)
returns boolean language sql stable security definer set search_path = public as $$
  select exists (select 1 from public.profiles p where p.id = p_uid and p.sub_end is null)
     and not exists (select 1 from public.payments x where x.user_id = p_uid and x.status = 'approved');
$$;

create or replace function public.campaign_audience(p_audience text)
returns table (user_id uuid, email text, full_name text)
language sql stable security definer set search_path = public as $$
  select p.id, p.email, p.full_name
  from public.profiles p
  where not p.is_admin
    and not p.email_optout
    and coalesce(p.email, '') ~ '^[^@\s]+@[^@\s]+\.[^@\s]+$'
    and case p_audience
      when 'never'   then p.role = 'student' and p.sub_end is null
                          and not exists (select 1 from public.payments x where x.user_id = p.id and x.status = 'approved')
      when 'expired' then p.sub_end is not null and p.sub_end <= now()
      when 'all'     then true
      else false
    end;
$$;

-- ---------------------------------------------------------------------
-- Offre et prix
-- ---------------------------------------------------------------------
-- Offre en cours d'un utilisateur (la moins chère s'il y en a plusieurs), ou rien.
create or replace function public.offer_for(p_uid uuid)
returns table (campaign_id uuid, price int, deadline timestamptz, offer_end timestamptz, first_seen_at timestamptz)
language sql stable security definer set search_path = public as $$
  select c.id, c.offer_price,
         least(c.started_at + make_interval(days => c.offer_days),
               coalesce(r.first_seen_at, now()) + make_interval(days => c.countdown_days)) as deadline,
         c.started_at + make_interval(days => c.offer_days),
         r.first_seen_at
  from public.email_recipients r
  join public.email_campaigns c on c.id = r.campaign_id
  where r.user_id = p_uid
    and c.offer_price is not null
    and c.started_at is not null
    and r.status in ('queued', 'sent')
    and public.never_subscribed(p_uid)
    and now() < least(c.started_at + make_interval(days => c.offer_days),
                      coalesce(r.first_seen_at, now()) + make_interval(days => c.countdown_days))
  order by c.offer_price, 3
  limit 1;
$$;

-- Prix à payer pour un utilisateur : offre personnelle si elle est plus basse, sinon prix du site.
create or replace function public.price_for_user(p_uid uuid)
returns int language sql stable security definer set search_path = public as $$
  select least(public.current_price_ar(), coalesce((select o.price from public.offer_for(p_uid) o), public.current_price_ar()));
$$;

-- Offre de l'utilisateur connecté (pour l'affichage du prix sur le site).
create or replace function public.my_offer()
returns jsonb language plpgsql stable security definer set search_path = public as $$
declare o record;
begin
  if auth.uid() is null then return null; end if;
  select * into o from public.offer_for(auth.uid());
  if not found or o.price >= public.current_price_ar() then return null; end if;
  return jsonb_build_object('campaign_id', o.campaign_id, 'price', o.price, 'deadline', o.deadline,
                            'offer_end', o.offer_end, 'started', o.first_seen_at is not null);
end $$;

-- Ouverture de la page de l'offre, par le lien de l'e-mail (jeton) ou par l'utilisateur connecté.
-- Démarre le compte à rebours personnel au premier passage.
create or replace function public.offer_open(p_token uuid default null)
returns jsonb language plpgsql security definer set search_path = public as $$
declare
  r public.email_recipients;
  c public.email_campaigns;
  o record;
  v_first text;
begin
  -- Lien de l'e-mail de test (jeton zéro) : aperçu de la dernière offre, pour l'administrateur seulement.
  if p_token = '00000000-0000-0000-0000-000000000000'::uuid then
    if not public.is_admin() then return jsonb_build_object('found', false); end if;
    select * into c from public.email_campaigns where offer_price is not null order by created_at desc limit 1;
    if c.id is null then return jsonb_build_object('found', false); end if;
    select split_part(btrim(full_name), ' ', 1) into v_first from public.profiles where id = auth.uid();
    return jsonb_build_object('found', true, 'valid', true, 'preview', true, 'price', c.offer_price,
      'deadline', now() + make_interval(days => c.countdown_days), 'offer_end', now() + make_interval(days => c.offer_days),
      'already_subscribed', false, 'first_name', v_first, 'mine', true);
  end if;
  if p_token is not null then
    select * into r from public.email_recipients where token = p_token;
  elsif auth.uid() is not null then
    select x.* into r from public.email_recipients x
      join public.email_campaigns k on k.id = x.campaign_id
      where x.user_id = auth.uid() and k.offer_price is not null and k.started_at is not null and x.status in ('queued', 'sent')
      order by k.started_at desc limit 1;
  end if;
  if r.campaign_id is null then return jsonb_build_object('found', false); end if;
  select * into c from public.email_campaigns where id = r.campaign_id;
  if c.offer_price is null or c.started_at is null then return jsonb_build_object('found', false); end if;

  if r.first_seen_at is null and now() < c.started_at + make_interval(days => c.offer_days) then
    update public.email_recipients set first_seen_at = now(), clicks = clicks + 1
      where campaign_id = r.campaign_id and user_id = r.user_id;
  else
    update public.email_recipients set clicks = clicks + 1 where campaign_id = r.campaign_id and user_id = r.user_id;
  end if;

  select * into o from public.offer_for(r.user_id) where campaign_id = r.campaign_id;
  select split_part(btrim(full_name), ' ', 1) into v_first from public.profiles where id = r.user_id;
  return jsonb_build_object(
    'found', true,
    'valid', o.campaign_id is not null,
    'price', c.offer_price,
    'deadline', o.deadline,
    'offer_end', c.started_at + make_interval(days => c.offer_days),
    'already_subscribed', not public.never_subscribed(r.user_id),
    'first_name', v_first,
    'mine', r.user_id = auth.uid()
  );
end $$;

-- Désinscription des e-mails d'information (lien en bas de chaque e-mail).
create or replace function public.email_unsubscribe(p_token uuid)
returns boolean language plpgsql security definer set search_path = public as $$
declare v_uid uuid;
begin
  select user_id into v_uid from public.email_recipients where token = p_token;
  if v_uid is null then return false; end if;
  update public.profiles set email_optout = true where id = v_uid;
  return true;
end $$;

-- Préférence modifiable depuis « Mon espace ».
create or replace function public.set_email_optout(p_optout boolean)
returns void language plpgsql security definer set search_path = public as $$
begin
  if auth.uid() is null then raise exception 'not_authenticated'; end if;
  update public.profiles set email_optout = coalesce(p_optout, false) where id = auth.uid();
end $$;

-- ---------------------------------------------------------------------
-- Paiement : même contrôle qu'avant, montant = prix de l'utilisateur (offre éventuelle)
-- ---------------------------------------------------------------------
create or replace function public.submit_payment(p_operator text, p_reference text, p_sender text default null)
returns public.payments language plpgsql security definer set search_path = public as $$
declare
  v_uid    uuid := auth.uid();
  v_ref    text := upper(regexp_replace(coalesce(p_reference, ''), '\s', '', 'g'));
  v_sender text := nullif(regexp_replace(coalesce(p_sender, ''), '\D', '', 'g'), '');
  v_row    public.payments;
begin
  if v_uid is null then raise exception 'not_authenticated'; end if;
  if exists (select 1 from public.profiles where id = v_uid and role = 'trainer')
     and coalesce((select status from public.trainer_profiles where user_id = v_uid), 'draft') = 'draft' then
    raise exception 'trainer_profile_incomplete';
  end if;
  if p_operator not in ('mvola', 'orange') then raise exception 'bad_operator'; end if;
  if v_ref !~ '^[A-Z0-9][A-Z0-9.-]{4,39}$' then raise exception 'bad_reference'; end if;
  if v_sender is not null then
    if v_sender !~ '^03[0-9]{8}$' then raise exception 'bad_sender'; end if;
    if (p_operator = 'mvola'  and left(v_sender, 3) not in ('034', '038'))
    or (p_operator = 'orange' and left(v_sender, 3) not in ('032', '037')) then
      raise exception 'sender_operator_mismatch';
    end if;
  end if;
  if exists (select 1 from public.payments where user_id = v_uid and status = 'pending') then
    raise exception 'already_pending';
  end if;
  if exists (select 1 from public.payments where operator = p_operator and reference = v_ref and status <> 'rejected') then
    raise exception 'reference_used';
  end if;

  insert into public.payments (user_id, operator, reference, sender, amount)
  values (v_uid, p_operator, v_ref, v_sender, public.price_for_user(v_uid))
  returning * into v_row;
  return v_row;
end;
$$;

-- ---------------------------------------------------------------------
-- Contenu de l'e-mail
-- ---------------------------------------------------------------------
-- Destinataires d'une relance : ont reçu la campagne d'origine, n'ont pas cliqué, toujours jamais abonnés,
-- pas désinscrits et sans paiement en attente.
create or replace function public.relance_audience(p_parent uuid)
returns table (user_id uuid, email text, full_name text)
language sql stable security definer set search_path = public as $$
  select p.id, r.email, p.full_name
  from public.email_recipients r
  join public.profiles p on p.id = r.user_id
  where r.campaign_id = p_parent and r.status = 'sent' and r.first_seen_at is null
    and not p.email_optout and public.never_subscribed(p.id)
    and not exists (select 1 from public.payments x where x.user_id = p.id and x.status = 'pending');
$$;

-- Une relance reprend le prix et les durées de sa campagne d'origine (pour le texte de l'e-mail).
create or replace function public.campaign_effective(c public.email_campaigns)
returns public.email_campaigns language plpgsql stable security definer set search_path = public as $$
declare o public.email_campaigns;
begin
  if c.parent_id is not null then
    select * into o from public.email_campaigns where id = c.parent_id;
    if o.id is not null then
      c.offer_price := o.offer_price; c.offer_days := o.offer_days; c.countdown_days := o.countdown_days;
    end if;
  end if;
  return c;
end $$;

create or replace function public.fmt_ar(p int)
returns text language sql immutable as $$
  select replace(replace(to_char(p, 'FM999G999G999'), ',', ' '), '.', ' ') || ' Ar';
$$;

-- Remplace {prenom}, {prix}, {prix_normal}, {jours} dans un texte déjà échappé.
create or replace function public.campaign_fill(p_text text, c public.email_campaigns, p_first text)
returns text language sql stable set search_path = public as $$
  select replace(replace(replace(replace(coalesce(p_text, ''),
    '{prenom}', public.html_escape(coalesce(p_first, ''))),
    '{prix}', public.fmt_ar(coalesce(c.offer_price, public.current_price_ar()))),
    '{prix_normal}', public.fmt_ar(public.setting_int('price_ar', 60000))),
    '{jours}', c.countdown_days::text);
$$;

create or replace function public.campaign_html(c public.email_campaigns, p_first text, p_token text)
returns text language plpgsql stable security definer set search_path = public as $$
declare
  v_link  text := 'https://vitako.mg/#/offre?t=' || p_token;
  v_unsub text := 'https://vitako.mg/#/desinscription?t=' || p_token;
  v_body  text;
  v_price text := '';
  v_relance boolean := c.parent_id is not null;
  v_ld    text := '';
  v_start timestamptz;
begin
  c := public.campaign_effective(c);
  -- Annotations Gmail (onglet Promotions) : grande image, prix et date de fin affichés dans la liste.
  -- Même image pour tous les destinataires ; Gmail décide seul de l'afficher (filtres de qualité).
  if c.offer_price is not null then
    v_start := coalesce((select o.started_at from public.email_campaigns o where o.id = c.parent_id), c.started_at, now());
    v_ld := '<script type="application/ld+json">' || jsonb_build_array(
      jsonb_build_object('@context', 'http://schema.org/', '@type', 'Organization', 'name', 'Vitako', 'url', 'https://vitako.mg',
                         'logo', 'https://vitako.mg/assets/img/app/icon-512.png'),
      jsonb_build_object('@context', 'http://schema.org/', '@type', 'PromotionCard',
                         'image', 'https://vitako.mg/assets/img/email/offre-gmail.jpg', 'url', v_link,
                         'headline', 'Toutes les formations : ' || public.fmt_ar(c.offer_price) || ' au lieu de ' || public.fmt_ar(public.setting_int('price_ar', 60000)),
                         'price', c.offer_price, 'priceCurrency', 'MGA',
                         'discountValue', public.setting_int('price_ar', 60000) - c.offer_price),
      jsonb_build_object('@context', 'http://schema.org/', '@type', 'DiscountOffer',
                         'description', public.fmt_ar(c.offer_price) || ' au lieu de ' || public.fmt_ar(public.setting_int('price_ar', 60000)),
                         'offerPageUrl', v_link, 'merchantHomepageUrl', 'https://vitako.mg',
                         'availabilityStarts', to_char(v_start at time zone 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS"Z"'),
                         'availabilityEnds', to_char((v_start + make_interval(days => c.offer_days)) at time zone 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS"Z"'))
    )::text || '</script>';
  end if;
  -- Corps : texte échappé, paragraphes séparés par une ligne vide, **gras** autorisé.
  v_body := public.campaign_fill(public.html_escape(c.body), c, p_first);
  v_body := regexp_replace(v_body, '\*\*([^*]+)\*\*', '<b>\1</b>', 'g');
  v_body := '<p style="margin:0 0 16px">' || replace(replace(replace(v_body, E'\r', ''), E'\n\n', '</p><p style="margin:0 0 16px">'), E'\n', '<br>') || '</p>';

  if c.offer_price is not null then
    v_price := '<table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="margin:6px 0 22px"><tr><td align="center" style="background:#E0F0E8;border-radius:14px;padding:18px">'
      || '<div style="font-size:13px;color:#56665C;text-transform:uppercase;letter-spacing:1px;font-weight:bold">Offre réservée aux inscrits</div>'
      || '<div style="font-size:30px;line-height:38px;font-weight:bold;color:#0B7A55;margin-top:4px">' || public.fmt_ar(c.offer_price)
      || ' <span style="font-size:16px;color:#56665C;font-weight:normal">/ 30 jours</span></div>'
      || '<div style="font-size:15px;color:#56665C">au lieu de <s style="color:#B42318">' || public.fmt_ar(public.setting_int('price_ar', 60000)) || '</s></div>'
      || '</td></tr></table>';
  end if;

  return '<!doctype html><html lang="fr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>' || public.html_escape(c.subject) || '</title>' || v_ld || '</head>'
    || '<body style="margin:0;padding:0;background:#F3F6F1">'
    || '<div style="display:none;max-height:0;overflow:hidden;opacity:0">' || public.campaign_fill(public.html_escape(c.preheader), c, p_first) || '</div>'
    || '<table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="background:#F3F6F1"><tr><td align="center" style="padding:20px 12px">'
    || '<table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%" style="max-width:600px;background:#FFFFFF;border-radius:16px;overflow:hidden;font-family:Arial,Helvetica,sans-serif;color:#13241B">'
    || case when v_relance then '' else '<tr><td><a href="' || v_link || '" target="_blank"><img src="https://vitako.mg/assets/img/email/offre-banniere.jpg" width="600" alt="Vitako : apprends un métier, travaille à distance" style="display:block;width:100%;height:auto;border:0"></a></td></tr>' end
    || '<tr><td style="padding:28px 28px 8px;font-size:16px;line-height:25px">'
    || case when c.title <> '' then '<h1 style="margin:0 0 16px;font-size:24px;line-height:31px;color:#0B3D2A">' || public.campaign_fill(public.html_escape(c.title), c, p_first) || '</h1>' else '' end
    || v_body
    || v_price
    || '<table role="presentation" cellpadding="0" cellspacing="0" border="0" width="100%"><tr><td align="center" style="padding:4px 0 24px">'
    || '<a href="' || v_link || '" target="_blank" style="display:inline-block;background:#0B7A55;color:#FFFFFF;font-size:17px;font-weight:bold;text-decoration:none;padding:15px 30px;border-radius:12px">' || public.campaign_fill(public.html_escape(c.cta_label), c, p_first) || '</a>'
    || '</td></tr></table>'
    || public.mail_signature()
    || '</td></tr>'
    || '<tr><td style="padding:18px 28px 26px;font-size:12px;line-height:18px;color:#56665C;border-top:1px solid #D9E2D7">'
    || 'Tu reçois cet e-mail parce que tu as un compte sur Vitako. '
    || '<a href="' || v_unsub || '" target="_blank" style="color:#56665C">Ne plus recevoir ces e-mails</a>.'
    || '</td></tr></table></td></tr></table></body></html>';
end $$;

-- Expéditeur des campagnes, distinct des e-mails de compte (paiement, accès) : Gmail classe chaque
-- adresse séparément, les offres ne font donc pas passer les e-mails de paiement dans « Promotions ».
-- Secret Vault facultatif « mail_from_marketing » ; sinon offres@<domaine de mail_from> si c'est vitako.mg.
create or replace function public.mail_from_marketing()
returns text language plpgsql stable security definer set search_path = public as $$
declare v text;
begin
  begin
    select decrypted_secret into v from vault.decrypted_secrets where name = 'mail_from_marketing' limit 1;
  exception when others then v := null;
  end;
  if nullif(trim(v), '') is not null then return trim(v); end if;
  if public.mail_from() ~* '@vitako\.mg>?\s*$' then return 'Vitako <offres@vitako.mg>'; end if;
  return public.mail_from();
end $$;
revoke execute on function public.mail_from_marketing() from public, anon, authenticated;

-- Un e-mail prêt pour l'API Resend.
create or replace function public.campaign_message(c public.email_campaigns, p_to text, p_first text, p_token text)
returns jsonb language plpgsql stable security definer set search_path = public as $$
declare e public.email_campaigns := public.campaign_effective(c);
begin
  return jsonb_build_object(
    'from', public.mail_from_marketing(),
    'reply_to', 'contact@vitako.mg',
    'to', jsonb_build_array(p_to),
    'subject', public.campaign_fill(e.subject, e, p_first),
    'html', public.campaign_html(c, p_first, p_token),
    'headers', jsonb_build_object('List-Unsubscribe',
      '<https://vitako.mg/#/desinscription?t=' || p_token || '>, <mailto:contact@vitako.mg?subject=D%C3%A9sinscription>')
  );
end $$;

-- ---------------------------------------------------------------------
-- Administration
-- ---------------------------------------------------------------------
create or replace function public.admin_campaigns()
returns jsonb language plpgsql stable security definer set search_path = public as $$
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  return coalesce((
    select jsonb_agg(to_jsonb(c) || jsonb_build_object(
      'recipients', (select count(*) from public.email_recipients r where r.campaign_id = c.id),
      'pending',    (select count(*) from public.email_recipients r where r.campaign_id = c.id and r.status = 'pending'),
      'queued',     (select count(*) from public.email_recipients r where r.campaign_id = c.id and r.status = 'queued'),
      'sent',       (select count(*) from public.email_recipients r where r.campaign_id = c.id and r.status = 'sent'),
      'failed',     (select count(*) from public.email_recipients r where r.campaign_id = c.id and r.status = 'failed'),
      'last_error', (select r.error from public.email_recipients r where r.campaign_id = c.id and r.status = 'failed' limit 1),
      'clicked',    case when c.parent_id is null
                      then (select count(*) from public.email_recipients r where r.campaign_id = c.id and r.first_seen_at is not null)
                      else (select count(*) from public.email_recipients r join public.email_recipients o on o.user_id = r.user_id and o.campaign_id = c.parent_id
                             where r.campaign_id = c.id and c.started_at is not null and o.first_seen_at >= c.started_at) end,
      'relance_now', case when c.parent_id is null and c.offer_price is not null and c.status = 'sent'
                      then (select count(*) from public.relance_audience(c.id)) else 0 end,
      'parent_subject', (select o.subject from public.email_campaigns o where o.id = c.parent_id),
      'paid',       (select count(distinct x.user_id) from public.payments x join public.email_recipients r on r.user_id = x.user_id and r.campaign_id = c.id
                      where x.status = 'approved' and c.started_at is not null and x.created_at >= c.started_at),
      'paid_pending', (select count(distinct x.user_id) from public.payments x join public.email_recipients r on r.user_id = x.user_id and r.campaign_id = c.id
                      where x.status = 'pending' and c.started_at is not null and x.created_at >= c.started_at),
      'revenue',    (select coalesce(sum(x.amount), 0) from public.payments x join public.email_recipients r on r.user_id = x.user_id and r.campaign_id = c.id
                      where x.status = 'approved' and c.started_at is not null and x.created_at >= c.started_at),
      'audience_now', case when c.parent_id is null then (select count(*) from public.campaign_audience(c.audience))
                           else (select count(*) from public.relance_audience(c.parent_id)) end
    ) order by c.created_at desc)
    from public.email_campaigns c
  ), '[]'::jsonb);
end $$;

create or replace function public.admin_audience_counts()
returns jsonb language plpgsql stable security definer set search_path = public as $$
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  return jsonb_build_object(
    'never',   (select count(*) from public.campaign_audience('never')),
    'expired', (select count(*) from public.campaign_audience('expired')),
    'all',     (select count(*) from public.campaign_audience('all')),
    'optout',  (select count(*) from public.profiles where email_optout and not is_admin),
    'mail_from', public.mail_from_marketing()
  );
end $$;

-- Création ou modification d'un brouillon.
create or replace function public.admin_campaign_save(p jsonb)
returns public.email_campaigns language plpgsql security definer set search_path = public as $$
declare
  v_id  uuid := nullif(p->>'id', '')::uuid;
  v_row public.email_campaigns;
  v_aud text := coalesce(nullif(p->>'audience', ''), 'never');
  v_price int := nullif(p->>'offer_price', '')::int;
  v_parent uuid := nullif(p->>'parent_id', '')::uuid;
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  if v_id is not null then select parent_id into v_parent from public.email_campaigns where id = v_id; end if;
  if v_parent is not null then
    if not exists (select 1 from public.email_campaigns where id = v_parent and parent_id is null and offer_price is not null and started_at is not null) then
      raise exception 'not_found';
    end if;
    v_aud := 'relance';
  elsif v_aud = 'relance' then v_aud := 'never';
  end if;
  if v_aud <> 'never' then v_price := null; end if;
  if v_id is null then
    insert into public.email_campaigns (subject, preheader, title, body, cta_label, audience, offer_price, offer_days, countdown_days, parent_id)
    values (btrim(p->>'subject'), coalesce(btrim(p->>'preheader'), ''), coalesce(btrim(p->>'title'), ''), coalesce(p->>'body', ''),
            coalesce(nullif(btrim(p->>'cta_label'), ''), 'Voir l''offre'), v_aud, v_price,
            coalesce(nullif(p->>'offer_days', '')::int, 10), coalesce(nullif(p->>'countdown_days', '')::int, 5), v_parent)
    returning * into v_row;
  else
    update public.email_campaigns set
      subject = btrim(p->>'subject'), preheader = coalesce(btrim(p->>'preheader'), ''), title = coalesce(btrim(p->>'title'), ''),
      body = coalesce(p->>'body', ''), cta_label = coalesce(nullif(btrim(p->>'cta_label'), ''), 'Voir l''offre'),
      audience = v_aud, offer_price = v_price,
      offer_days = coalesce(nullif(p->>'offer_days', '')::int, 10), countdown_days = coalesce(nullif(p->>'countdown_days', '')::int, 5),
      updated_at = now()
    where id = v_id and status = 'draft'
    returning * into v_row;
    if v_row.id is null then raise exception 'campaign_locked'; end if;
  end if;
  return v_row;
end $$;

create or replace function public.admin_campaign_delete(p_id uuid)
returns void language plpgsql security definer set search_path = public as $$
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  delete from public.email_campaigns where id = p_id and status = 'draft';
  if not found then raise exception 'campaign_locked'; end if;
end $$;

-- Aperçu HTML (pour la page d'administration).
create or replace function public.admin_campaign_preview(p_id uuid)
returns text language plpgsql stable security definer set search_path = public as $$
declare c public.email_campaigns; v_first text;
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  select * into c from public.email_campaigns where id = p_id;
  if c.id is null then raise exception 'not_found'; end if;
  select split_part(btrim(full_name), ' ', 1) into v_first from public.profiles where id = auth.uid();
  return public.campaign_html(c, v_first, '00000000-0000-0000-0000-000000000000');
end $$;

-- E-mail de test à l'adresse de l'administrateur connecté.
create or replace function public.admin_campaign_test(p_id uuid)
returns text language plpgsql security definer set search_path = public as $$
declare c public.email_campaigns; v_key text; v_to text; v_first text; v_msg jsonb;
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  select * into c from public.email_campaigns where id = p_id;
  if c.id is null then raise exception 'not_found'; end if;
  select decrypted_secret into v_key from vault.decrypted_secrets where name = 'resend_api_key' limit 1;
  if v_key is null then raise exception 'resend_missing'; end if;
  select email, split_part(btrim(full_name), ' ', 1) into v_to, v_first from public.profiles where id = auth.uid();
  v_msg := public.campaign_message(c, v_to, v_first, '00000000-0000-0000-0000-000000000000');
  v_msg := jsonb_set(v_msg, '{subject}', to_jsonb('[TEST] ' || (v_msg->>'subject')));
  perform net.http_post(
    url := 'https://api.resend.com/emails',
    headers := jsonb_build_object('Authorization', 'Bearer ' || v_key, 'Content-Type', 'application/json'),
    body := v_msg,
    timeout_milliseconds := 20000);
  return v_to;
end $$;

-- Lancement : fige la liste des destinataires et démarre l'offre (une seule fois).
create or replace function public.admin_campaign_start(p_id uuid)
returns int language plpgsql security definer set search_path = public as $$
declare c public.email_campaigns; v_n int;
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  select * into c from public.email_campaigns where id = p_id for update;
  if c.id is null then raise exception 'not_found'; end if;
  if not exists (select 1 from vault.decrypted_secrets where name = 'resend_api_key') then raise exception 'resend_missing'; end if;
  if c.status = 'draft' then
    if c.parent_id is not null then
      insert into public.email_recipients (campaign_id, user_id, email)
        select c.id, a.user_id, lower(btrim(a.email)) from public.relance_audience(c.parent_id) a
        on conflict do nothing;
    else
      insert into public.email_recipients (campaign_id, user_id, email)
        select c.id, a.user_id, lower(btrim(a.email)) from public.campaign_audience(c.audience) a
        on conflict do nothing;
    end if;
    update public.email_campaigns set status = 'sending', started_at = now(), updated_at = now() where id = c.id;
  end if;
  select count(*) into v_n from public.email_recipients where campaign_id = c.id;
  return v_n;
end $$;

-- Met à jour l'état des lots déjà envoyés à Resend (réponses de pg_net).
create or replace function public.campaign_sync(p_id uuid)
returns void language plpgsql security definer set search_path = public, extensions as $$
begin
  update public.email_recipients r
     set status = case when h.status_code between 200 and 299 then 'sent' else 'failed' end,
         error  = case when h.status_code between 200 and 299 then null
                       else left(coalesce(h.error_msg, '') || ' ' || coalesce(h.status_code::text, '') || ' ' || coalesce(h.content::text, ''), 300) end
    from net._http_response h
   where r.campaign_id = p_id and r.status = 'queued' and h.id = r.request_id
     and (h.status_code is not null or h.error_msg is not null);
  -- Sans réponse au bout de 15 minutes : considéré comme échoué (peut être renvoyé).
  update public.email_recipients set status = 'failed', error = 'Pas de réponse de Resend'
   where campaign_id = p_id and status = 'queued' and queued_at < now() - interval '15 minutes';
end $$;

-- Envoie le lot suivant (50 destinataires au plus) et renvoie l'état de la campagne.
create or replace function public.admin_campaign_send_batch(p_id uuid)
returns jsonb language plpgsql security definer set search_path = public, extensions as $$
declare
  c public.email_campaigns;
  v_key text;
  v_batch jsonb;
  v_users uuid[];
  v_req bigint;
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  select * into c from public.email_campaigns where id = p_id;
  if c.id is null or c.status = 'draft' then raise exception 'not_started'; end if;
  select decrypted_secret into v_key from vault.decrypted_secrets where name = 'resend_api_key' limit 1;
  if v_key is null then raise exception 'resend_missing'; end if;

  perform public.campaign_sync(p_id);

  select coalesce(jsonb_agg(public.campaign_message(c, r.email, split_part(btrim(p.full_name), ' ', 1),
           coalesce((select o.token from public.email_recipients o where o.campaign_id = c.parent_id and o.user_id = r.user_id), r.token)::text)), '[]'::jsonb),
         coalesce(array_agg(r.user_id), '{}')
    into v_batch, v_users
    from (select * from public.email_recipients
           where campaign_id = p_id and status = 'pending'
           order by user_id limit 50 for update skip locked) r
    join public.profiles p on p.id = r.user_id;

  if jsonb_array_length(v_batch) > 0 then
    v_req := net.http_post(
      url := 'https://api.resend.com/emails/batch',
      headers := jsonb_build_object('Authorization', 'Bearer ' || v_key, 'Content-Type', 'application/json'),
      body := v_batch,
      timeout_milliseconds := 30000);
    update public.email_recipients set status = 'queued', request_id = v_req, queued_at = now(), error = null
     where campaign_id = p_id and user_id = any (v_users);
  end if;

  if not exists (select 1 from public.email_recipients where campaign_id = p_id and status in ('pending', 'queued')) then
    update public.email_campaigns set status = 'sent', updated_at = now() where id = p_id and status = 'sending';
  end if;

  return jsonb_build_object(
    'batch', jsonb_array_length(v_batch),
    'pending', (select count(*) from public.email_recipients where campaign_id = p_id and status = 'pending'),
    'queued',  (select count(*) from public.email_recipients where campaign_id = p_id and status = 'queued'),
    'sent',    (select count(*) from public.email_recipients where campaign_id = p_id and status = 'sent'),
    'failed',  (select count(*) from public.email_recipients where campaign_id = p_id and status = 'failed'));
end $$;

-- Remet les envois échoués dans la file.
create or replace function public.admin_campaign_retry(p_id uuid)
returns int language plpgsql security definer set search_path = public as $$
declare v_n int;
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  update public.email_recipients set status = 'pending', error = null where campaign_id = p_id and status = 'failed';
  get diagnostics v_n = row_count;
  if v_n > 0 then update public.email_campaigns set status = 'sending', updated_at = now() where id = p_id; end if;
  return v_n;
end $$;

-- ---------------------------------------------------------------------
-- Droits
-- ---------------------------------------------------------------------
revoke execute on function public.never_subscribed(uuid)                      from public, anon, authenticated;
revoke execute on function public.campaign_audience(text)                     from public, anon, authenticated;
revoke execute on function public.offer_for(uuid)                             from public, anon, authenticated;
revoke execute on function public.price_for_user(uuid)                        from public, anon, authenticated;
revoke execute on function public.campaign_fill(text, public.email_campaigns, text) from public, anon, authenticated;
revoke execute on function public.campaign_html(public.email_campaigns, text, text) from public, anon, authenticated;
revoke execute on function public.campaign_message(public.email_campaigns, text, text, text) from public, anon, authenticated;
revoke execute on function public.campaign_sync(uuid)                         from public, anon, authenticated;
revoke execute on function public.fmt_ar(int)                                 from public, anon, authenticated;
revoke execute on function public.relance_audience(uuid)                      from public, anon, authenticated;
revoke execute on function public.campaign_effective(public.email_campaigns)  from public, anon, authenticated;
revoke execute on function public.my_offer()                                  from public, anon;
revoke execute on function public.offer_open(uuid)                            from public;
revoke execute on function public.email_unsubscribe(uuid)                     from public;
revoke execute on function public.set_email_optout(boolean)                   from public, anon;
revoke execute on function public.submit_payment(text, text, text)            from public, anon;
revoke execute on function public.admin_campaigns()                           from public, anon;
revoke execute on function public.admin_audience_counts()                     from public, anon;
revoke execute on function public.admin_campaign_save(jsonb)                  from public, anon;
revoke execute on function public.admin_campaign_delete(uuid)                 from public, anon;
revoke execute on function public.admin_campaign_preview(uuid)                from public, anon;
revoke execute on function public.admin_campaign_test(uuid)                   from public, anon;
revoke execute on function public.admin_campaign_start(uuid)                  from public, anon;
revoke execute on function public.admin_campaign_send_batch(uuid)             from public, anon;
revoke execute on function public.admin_campaign_retry(uuid)                  from public, anon;
grant  execute on function public.my_offer()                                  to authenticated;
grant  execute on function public.offer_open(uuid)                            to anon, authenticated;
grant  execute on function public.email_unsubscribe(uuid)                     to anon, authenticated;
grant  execute on function public.set_email_optout(boolean)                   to authenticated;
grant  execute on function public.submit_payment(text, text, text)            to authenticated;
grant  execute on function public.admin_campaigns()                           to authenticated;
grant  execute on function public.admin_audience_counts()                     to authenticated;
grant  execute on function public.admin_campaign_save(jsonb)                  to authenticated;
grant  execute on function public.admin_campaign_delete(uuid)                 to authenticated;
grant  execute on function public.admin_campaign_preview(uuid)                to authenticated;
grant  execute on function public.admin_campaign_test(uuid)                   to authenticated;
grant  execute on function public.admin_campaign_start(uuid)                  to authenticated;
grant  execute on function public.admin_campaign_send_batch(uuid)             to authenticated;
grant  execute on function public.admin_campaign_retry(uuid)                  to authenticated;
