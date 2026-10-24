-- Migration du 24/10/2026 : notifications push sur téléphone (site installable / navigateur).
-- Rejouable sans risque : exécutée par GitHub Actions avant seed.sql.
--
-- Fonctionnement
--  * Le navigateur de l'utilisateur s'abonne (bouton « Activer les notifications ») : push_subscribe.
--  * La base prépare les messages et les envoie à la fonction Vercel https://vitako.mg/api/push (pg_net),
--    qui les chiffre et les transmet aux services de notification (Google, Apple, Mozilla).
--  * La fonction Vercel vérifie le secret « push_secret » (coffre-fort Vault, créé ici automatiquement)
--    avec push_check. La clé privée VAPID est seulement dans Vercel (variable VAPID_PRIVATE_KEY).
--  * Envoyés : nouveau paiement (administrateurs), paiement validé ou refusé (étudiant), lancement d'une
--    offre (inscrits jamais abonnés), rappel 24 h avant la fin d'une offre personnelle (toutes les heures).
--  * Un problème d'envoi ne bloque jamais un paiement.

create table if not exists public.push_subscriptions (
  endpoint   text primary key,
  user_id    uuid not null references public.profiles (id) on delete cascade,
  p256dh     text not null,
  auth       text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists push_subscriptions_user on public.push_subscriptions (user_id);
alter table public.push_subscriptions enable row level security;
revoke all on public.push_subscriptions from anon, authenticated;

create table if not exists public.push_requests (
  request_id bigint primary key,
  created_at timestamptz not null default now(),
  kind       text not null,
  messages   int not null default 0,
  result     jsonb
);
alter table public.push_requests enable row level security;
revoke all on public.push_requests from anon, authenticated;

-- Rappel « se termine dans moins de 24 h » envoyé une seule fois par offre.
alter table public.email_recipients add column if not exists offer_reminded_at timestamptz;

-- Secret partagé avec la fonction Vercel (créé une seule fois, jamais affiché).
do $$
begin
  if not exists (select 1 from vault.decrypted_secrets where name = 'push_secret') then
    perform vault.create_secret(replace(gen_random_uuid()::text || gen_random_uuid()::text, '-', ''), 'push_secret');
  end if;
exception when others then
  raise warning 'push_secret non créé (%)', sqlerrm;
end $$;

create or replace function public.push_check(p_secret text)
returns boolean language plpgsql stable security definer set search_path = public as $$
declare v text;
begin
  select decrypted_secret into v from vault.decrypted_secrets where name = 'push_secret' limit 1;
  return v is not null and p_secret is not null and length(p_secret) >= 32 and p_secret = v;
end $$;

-- Abonnement du navigateur de l'utilisateur connecté (un même téléphone passe au dernier compte connecté).
create or replace function public.push_subscribe(p_endpoint text, p_p256dh text, p_auth text)
returns void language plpgsql security definer set search_path = public as $$
begin
  if auth.uid() is null then raise exception 'not_authenticated'; end if;
  if coalesce(p_endpoint, '') !~ '^https://\S+$' or length(p_endpoint) > 1000 or coalesce(p_p256dh, '') !~ '^[A-Za-z0-9_-]{80,100}$'
     or coalesce(p_auth, '') !~ '^[A-Za-z0-9_-]{16,30}$' then
    raise exception 'bad_subscription';
  end if;
  insert into public.push_subscriptions (endpoint, user_id, p256dh, auth)
  values (p_endpoint, auth.uid(), p_p256dh, p_auth)
  on conflict (endpoint) do update set user_id = excluded.user_id, p256dh = excluded.p256dh, auth = excluded.auth, updated_at = now();
  -- 10 appareils au plus par compte : on garde les plus récents.
  delete from public.push_subscriptions where user_id = auth.uid() and endpoint in (
    select endpoint from public.push_subscriptions where user_id = auth.uid() order by updated_at desc offset 10);
end $$;

create or replace function public.push_unsubscribe(p_endpoint text)
returns void language plpgsql security definer set search_path = public as $$
begin
  delete from public.push_subscriptions where endpoint = p_endpoint and user_id = auth.uid();
end $$;

-- Retire les abonnements expirés signalés par la fonction Vercel lors des envois précédents.
create or replace function public.push_sync()
returns void language plpgsql security definer set search_path = public, extensions as $$
declare r record; v jsonb;
begin
  for r in select q.request_id, h.status_code, h.content from public.push_requests q
           join net._http_response h on h.id = q.request_id where q.result is null loop
    begin v := r.content::jsonb; exception when others then v := jsonb_build_object('error', left(coalesce(r.content, ''), 200)); end;
    v := coalesce(v, '{}'::jsonb) || jsonb_build_object('status', r.status_code);
    update public.push_requests set result = v where request_id = r.request_id;
    if jsonb_typeof(v->'gone') = 'array' then
      delete from public.push_subscriptions where endpoint in (select jsonb_array_elements_text(v->'gone'));
    end if;
  end loop;
  delete from public.push_requests where created_at < now() - interval '30 days';
end $$;

-- Envoie une notification à une liste d'utilisateurs (tous leurs appareils). Renvoie le nombre d'appareils visés.
create or replace function public.push_send(p_users uuid[], p_title text, p_body text, p_url text, p_tag text, p_kind text default 'autre')
returns int language plpgsql security definer set search_path = public, extensions as $$
declare
  v_secret text;
  v_total int := 0;
  v_batch jsonb;
  v_req bigint;
  v_off int := 0;
  v_n int;
begin
  select decrypted_secret into v_secret from vault.decrypted_secrets where name = 'push_secret' limit 1;
  if v_secret is null or p_users is null or cardinality(p_users) = 0 then return 0; end if;
  perform public.push_sync();
  loop
    select coalesce(jsonb_agg(jsonb_build_object('endpoint', s.endpoint, 'p256dh', s.p256dh, 'auth', s.auth,
             'payload', jsonb_build_object('title', p_title, 'body', p_body, 'url', coalesce(p_url, '/'), 'tag', coalesce(p_tag, 'vitako')))), '[]'::jsonb),
           count(*)
      into v_batch, v_n
      from (select * from public.push_subscriptions where user_id = any (p_users) order by endpoint offset v_off limit 400) s;
    exit when v_n = 0;
    v_req := net.http_post(
      url := 'https://vitako.mg/api/push',
      headers := jsonb_build_object('Content-Type', 'application/json'),
      body := jsonb_build_object('secret', v_secret, 'messages', v_batch),
      timeout_milliseconds := 60000);
    insert into public.push_requests (request_id, kind, messages) values (v_req, coalesce(p_kind, 'autre'), v_n) on conflict do nothing;
    v_total := v_total + v_n;
    v_off := v_off + 400;
  end loop;
  return v_total;
exception when others then
  raise warning 'push_send : %', sqlerrm;
  return v_total;
end $$;

-- ---------------------------------------------------------------------
-- Paiements
-- ---------------------------------------------------------------------
create or replace function public.push_payment_events()
returns trigger language plpgsql security definer set search_path = public as $$
declare
  v_name text;
  v_op   text := case new.operator when 'mvola' then 'MVola' when 'orange' then 'Orange Money' else new.operator end;
begin
  begin
    if tg_op = 'INSERT' and new.status = 'pending' then
      select full_name into v_name from public.profiles where id = new.user_id;
      perform public.push_send(array(select id from public.profiles where is_admin),
        'Nouveau paiement à valider', coalesce(v_name, 'Un étudiant') || ' · ' || v_op || ' · ' || public.fmt_ar(new.amount),
        '/#/admin', 'pay-' || new.id, 'paiement_admin');
    elsif tg_op = 'UPDATE' and old.status = 'pending' and new.status = 'approved' then
      perform public.push_send(array[new.user_id], 'Paiement validé ✓',
        'Ton accès à toutes les formations est activé' || coalesce(' jusqu''au ' || to_char(new.access_until at time zone 'Indian/Antananarivo', 'DD/MM/YYYY'), '') || '. Bonne formation !',
        '/#/formations', 'pay-' || new.id, 'paiement_valide');
    elsif tg_op = 'UPDATE' and old.status = 'pending' and new.status = 'rejected' then
      perform public.push_send(array[new.user_id], 'Paiement non validé',
        coalesce(nullif(new.reason, ''), 'Paiement introuvable') || '. Vérifie la référence dans ton SMS et renvoie-la.',
        '/#/abonnement', 'pay-' || new.id, 'paiement_refuse');
    end if;
  exception when others then
    raise warning 'push_payment_events : %', sqlerrm;
  end;
  return new;
end $$;

drop trigger if exists payments_push on public.payments;
create trigger payments_push after insert or update of status on public.payments
  for each row execute function public.push_payment_events();

-- ---------------------------------------------------------------------
-- Offres
-- ---------------------------------------------------------------------
-- Au lancement d'une campagne avec offre : tous les inscrits jamais abonnés (étudiants) ayant activé les notifications.
create or replace function public.push_campaign_started()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  begin
    if new.started_at is not null and old.started_at is null and new.offer_price is not null and new.parent_id is null then
      perform public.push_send(
        array(select p.id from public.profiles p where p.role = 'student' and not p.is_admin and public.never_subscribed(p.id)
                and exists (select 1 from public.push_subscriptions s where s.user_id = p.id)),
        'Offre spéciale : ' || public.fmt_ar(new.offer_price) || ' au lieu de ' || public.fmt_ar(public.setting_int('price_ar', 60000)),
        '30 jours d''accès à toutes les formations Vitako. Offre limitée dans le temps.',
        '/#/offre', 'offre-' || new.id, 'offre');
    end if;
  exception when others then
    raise warning 'push_campaign_started : %', sqlerrm;
  end;
  return new;
end $$;

drop trigger if exists email_campaigns_push on public.email_campaigns;
create trigger email_campaigns_push after update of started_at on public.email_campaigns
  for each row execute function public.push_campaign_started();

-- Rappel : l'offre personnelle se termine dans moins de 24 h (lancé toutes les heures par GitHub Actions).
create or replace function public.push_offer_reminders()
returns int language plpgsql security definer set search_path = public as $$
declare v_users uuid[]; v_n int := 0; o record;
begin
  select array_agg(distinct r.user_id) into v_users
    from public.email_recipients r
    join public.email_campaigns c on c.id = r.campaign_id
   where c.offer_price is not null and c.parent_id is null and c.started_at is not null
     and r.offer_reminded_at is null and r.status in ('queued', 'sent')
     and exists (select 1 from public.push_subscriptions s where s.user_id = r.user_id)
     and exists (select 1 from public.offer_for(r.user_id) f where f.campaign_id = c.id and f.deadline <= now() + interval '24 hours');
  if v_users is null then return 0; end if;
  for o in select u as user_id, f.price from unnest(v_users) u, lateral public.offer_for(u) f loop
    perform public.push_send(array[o.user_id], 'Ton offre se termine bientôt ⏰',
      'Plus que quelques heures pour accéder à toutes les formations pour ' || public.fmt_ar(o.price) || ' au lieu de ' || public.fmt_ar(public.setting_int('price_ar', 60000)) || '.',
      '/#/offre', 'offre-rappel', 'offre_rappel');
    v_n := v_n + 1;
  end loop;
  update public.email_recipients r set offer_reminded_at = now()
   where r.user_id = any (v_users) and r.offer_reminded_at is null;
  return v_n;
end $$;

-- Notification de test sur les appareils de l'administrateur connecté.
create or replace function public.admin_push_test()
returns int language plpgsql security definer set search_path = public as $$
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  return public.push_send(array[auth.uid()], 'Test Vitako 🔔', 'Les notifications fonctionnent sur ce téléphone.', '/#/admin/stats', 'test', 'test');
end $$;

-- Bilan pour l'administrateur (onglet Statistiques).
create or replace function public.admin_push_stats()
returns jsonb language plpgsql stable security definer set search_path = public as $$
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  return jsonb_build_object(
    'devices', (select count(*) from public.push_subscriptions),
    'users',   (select count(distinct user_id) from public.push_subscriptions),
    'sent30',  (select coalesce(sum((result->>'sent')::int), 0) from public.push_requests where created_at > now() - interval '30 days'),
    'last_error', (select result->>'error' from public.push_requests where result ? 'error' order by created_at desc limit 1)
  );
end $$;

revoke execute on function public.push_check(text)                                   from public;
revoke execute on function public.push_subscribe(text, text, text)                   from public, anon;
revoke execute on function public.push_unsubscribe(text)                             from public, anon;
revoke execute on function public.push_sync()                                        from public, anon, authenticated;
revoke execute on function public.push_send(uuid[], text, text, text, text, text)    from public, anon, authenticated;
revoke execute on function public.push_payment_events()                              from public, anon, authenticated;
revoke execute on function public.push_campaign_started()                            from public, anon, authenticated;
revoke execute on function public.push_offer_reminders()                             from public, anon, authenticated;
revoke execute on function public.admin_push_stats()                                 from public, anon;
revoke execute on function public.admin_push_test()                                  from public, anon;
grant  execute on function public.admin_push_test()                                  to authenticated;
grant  execute on function public.push_check(text)                                   to anon, authenticated;
grant  execute on function public.push_subscribe(text, text, text)                   to authenticated;
grant  execute on function public.push_unsubscribe(text)                             to authenticated;
grant  execute on function public.admin_push_stats()                                 to authenticated;
