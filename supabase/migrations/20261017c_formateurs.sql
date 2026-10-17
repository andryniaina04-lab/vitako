-- Migration du 17/10/2026 : comptes formateurs (accompagnement personnalisé des étudiants).
-- Rejouable sans risque : exécutée par GitHub Actions avant seed.sql.
--
-- Deux types de compte : étudiant (student) et formateur (trainer). Même abonnement, même paiement.
-- Le formateur remplit un profil public : métier, domaines, bio, tarifs, contacts, photo de couverture
-- (paysage, 30 Ko au maximum) et visuel carré (10 Ko au maximum).
-- Règles :
--   * le profil doit être rempli AVANT le paiement de l'abonnement ;
--   * il n'est visible que s'il est validé par l'administrateur ET que l'abonnement est actif ;
--   * les contacts (WhatsApp, téléphone, e-mail, réseaux) ne sont donnés qu'aux personnes connectées ;
--   * un profil validé puis modifié reste visible ; un profil refusé puis corrigé repart en validation.

-- ---------------------------------------------------------------------
-- Type de compte
-- ---------------------------------------------------------------------
alter table public.profiles add column if not exists role text not null default 'student';
alter table public.profiles drop constraint if exists profiles_role_check;
alter table public.profiles add constraint profiles_role_check check (role in ('student', 'trainer'));
-- Le type de compte ne se change que par les fonctions ci-dessous (pas de droit d'écriture direct).

-- Le type est choisi à l'inscription (champ « role » des métadonnées). Toute autre valeur donne « student ».
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  insert into public.profiles (id, full_name, email, role)
  values (
    new.id,
    left(coalesce(nullif(trim(new.raw_user_meta_data ->> 'full_name'), ''), split_part(new.email, '@', 1)), 120),
    new.email,
    case when new.raw_user_meta_data ->> 'role' = 'trainer' then 'trainer' else 'student' end
  );
  return new;
end;
$$;

-- ---------------------------------------------------------------------
-- Profil public du formateur
-- ---------------------------------------------------------------------
create table if not exists public.trainer_profiles (
  user_id     uuid primary key references public.profiles (id) on delete cascade,
  headline    text not null default '' check (char_length(headline) <= 80),     -- métier affiché
  bio         text not null default '' check (char_length(bio) <= 1500),
  domains     text[] not null default '{}' check (cardinality(domains) <= 30),  -- identifiants des domaines
  rates       text not null default '' check (char_length(rates) <= 600),       -- tarifs d'accompagnement
  whatsapp    text check (whatsapp is null or whatsapp ~ '^\+?[0-9]{8,15}$'),
  phone       text check (phone is null or phone ~ '^\+?[0-9]{8,15}$'),
  email       text check (email is null or (char_length(email) <= 120 and email ~* '^[^[:space:]@]+@[^[:space:]@]+\.[^[:space:]@]+$')),
  facebook    text check (facebook  is null or (char_length(facebook)  <= 200 and facebook  ~ '^https?://[^[:space:]<>"]+$')),
  linkedin    text check (linkedin  is null or (char_length(linkedin)  <= 200 and linkedin  ~ '^https?://[^[:space:]<>"]+$')),
  instagram   text check (instagram is null or (char_length(instagram) <= 200 and instagram ~ '^https?://[^[:space:]<>"]+$')),
  tiktok      text check (tiktok    is null or (char_length(tiktok)    <= 200 and tiktok    ~ '^https?://[^[:space:]<>"]+$')),
  website     text check (website   is null or (char_length(website)   <= 200 and website   ~ '^https?://[^[:space:]<>"]+$')),
  cover_url   text check (cover_url  is null or char_length(cover_url)  <= 400),
  visual_url  text check (visual_url is null or char_length(visual_url) <= 400),
  -- draft : à compléter · pending : complet, en attente de validation · approved : validé · rejected : refusé ou masqué
  status      text not null default 'draft' check (status in ('draft', 'pending', 'approved', 'rejected')),
  reason      text check (reason is null or char_length(reason) <= 300),
  decided_at  timestamptz,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);
create index if not exists trainer_profiles_status on public.trainer_profiles (status);

alter table public.trainer_profiles enable row level security;
drop policy if exists trainer_profiles_read on public.trainer_profiles;
create policy trainer_profiles_read on public.trainer_profiles for select
  using (user_id = auth.uid() or public.is_admin());
revoke all on public.trainer_profiles from anon;
revoke insert, update, delete on public.trainer_profiles from authenticated;
grant select on public.trainer_profiles to authenticated;

-- Profil complet : métier, bio d'au moins 30 caractères, au moins un domaine, un moyen de contact et une photo.
create or replace function public.trainer_is_complete(p_user uuid)
returns boolean language sql stable security definer set search_path = public as $$
  select coalesce((
    select char_length(tp.headline) >= 3 and char_length(tp.bio) >= 30 and cardinality(tp.domains) >= 1
       and coalesce(tp.whatsapp, tp.phone, tp.email) is not null and p.avatar_url is not null
      from public.trainer_profiles tp join public.profiles p on p.id = tp.user_id
     where tp.user_id = p_user
  ), false);
$$;

-- Recalcule l'état après une modification du formateur.
create or replace function public.trainer_refresh_status(p_user uuid)
returns void language plpgsql security definer set search_path = public as $$
declare v_ok boolean := public.trainer_is_complete(p_user);
begin
  update public.trainer_profiles
     set status = case
           when not v_ok then 'draft'
           when status = 'approved' then 'approved'
           else 'pending'
         end,
         updated_at = now()
   where user_id = p_user;
end $$;

-- La photo de profil compte dans le profil complet : on recalcule quand elle change.
create or replace function public.profiles_avatar_changed()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  if new.role = 'trainer' and new.avatar_url is distinct from old.avatar_url then
    perform public.trainer_refresh_status(new.id);
  end if;
  return new;
end $$;
drop trigger if exists profiles_trainer_avatar on public.profiles;
create trigger profiles_trainer_avatar after update of avatar_url on public.profiles
  for each row execute function public.profiles_avatar_changed();

-- Numéro de téléphone : chiffres seulement (avec + éventuel au début), 8 à 15 chiffres.
create or replace function public.clean_phone(p text)
returns text language plpgsql immutable as $$
declare v text := regexp_replace(coalesce(p, ''), '[^0-9+]', '', 'g');
begin
  if v = '' then return null; end if;
  if v !~ '^\+?[0-9]{8,15}$' then raise exception 'bad_phone'; end if;
  return v;
end $$;

-- Lien vers un réseau social ou un site : https:// ajouté si absent.
create or replace function public.clean_link(p text)
returns text language plpgsql immutable as $$
declare v text := btrim(coalesce(p, ''));
begin
  if v = '' then return null; end if;
  if v !~* '^https?://' then v := 'https://' || v; end if;
  if char_length(v) > 200 or v !~ '^https?://[^[:space:]<>"]+\.[^[:space:]<>"]+$' then raise exception 'bad_link'; end if;
  return v;
end $$;

-- Le formateur enregistre son profil (tous les champs texte en une fois).
create or replace function public.save_trainer_profile(p jsonb)
returns public.trainer_profiles language plpgsql security definer set search_path = public as $$
declare
  v_uid      uuid := auth.uid();
  v_headline text := btrim(regexp_replace(coalesce(p ->> 'headline', ''), '\s+', ' ', 'g'));
  v_bio      text := btrim(coalesce(p ->> 'bio', ''));
  v_rates    text := btrim(coalesce(p ->> 'rates', ''));
  v_email    text := nullif(lower(btrim(coalesce(p ->> 'email', ''))), '');
  v_domains  text[];
  v_row      public.trainer_profiles;
begin
  if v_uid is null then raise exception 'not_authenticated'; end if;
  if not exists (select 1 from public.profiles where id = v_uid and role = 'trainer') then raise exception 'not_trainer'; end if;
  if char_length(v_headline) > 80 then raise exception 'headline_too_long'; end if;
  if char_length(v_bio) > 1500 then raise exception 'bio_too_long'; end if;
  if char_length(v_rates) > 600 then raise exception 'rates_too_long'; end if;
  if v_email is not null and (char_length(v_email) > 120 or v_email !~* '^[^[:space:]@]+@[^[:space:]@]+\.[^[:space:]@]+$') then
    raise exception 'bad_email';
  end if;
  select coalesce(array_agg(distinct e.d order by e.d), '{}') into v_domains
    from jsonb_array_elements_text(case when jsonb_typeof(p -> 'domains') = 'array' then p -> 'domains' else '[]'::jsonb end) as e(d);
  if cardinality(v_domains) > 30 or exists (
    select 1 from unnest(v_domains) as u(d)
     where not exists (select 1 from public.courses c where split_part(c.job_key, '-', 1) = u.d)
  ) then raise exception 'bad_domain'; end if;

  insert into public.trainer_profiles as t (user_id, headline, bio, domains, rates, whatsapp, phone, email,
                                            facebook, linkedin, instagram, tiktok, website)
  values (v_uid, v_headline, v_bio, v_domains, v_rates,
          public.clean_phone(p ->> 'whatsapp'), public.clean_phone(p ->> 'phone'), v_email,
          public.clean_link(p ->> 'facebook'), public.clean_link(p ->> 'linkedin'), public.clean_link(p ->> 'instagram'),
          public.clean_link(p ->> 'tiktok'), public.clean_link(p ->> 'website'))
  on conflict (user_id) do update set
    headline = excluded.headline, bio = excluded.bio, domains = excluded.domains, rates = excluded.rates,
    whatsapp = excluded.whatsapp, phone = excluded.phone, email = excluded.email,
    facebook = excluded.facebook, linkedin = excluded.linkedin, instagram = excluded.instagram,
    tiktok = excluded.tiktok, website = excluded.website;

  perform public.trainer_refresh_status(v_uid);
  select * into v_row from public.trainer_profiles where user_id = v_uid;
  return v_row;
end $$;

-- Photo de couverture (compartiment « covers », 30 Ko) ou visuel carré (compartiment « avatars », 10 Ko).
-- L'adresse doit pointer vers le dossier du formateur lui-même. null = retirer l'image.
create or replace function public.set_trainer_image(p_kind text, p_url text)
returns public.trainer_profiles language plpgsql security definer set search_path = public as $$
declare
  v_uid uuid := auth.uid();
  v_url text := nullif(btrim(coalesce(p_url, '')), '');
  v_row public.trainer_profiles;
begin
  if v_uid is null then raise exception 'not_authenticated'; end if;
  if not exists (select 1 from public.profiles where id = v_uid and role = 'trainer') then raise exception 'not_trainer'; end if;
  if p_kind not in ('cover', 'visual') then raise exception 'bad_image'; end if;
  if v_url is not null and v_url !~ ('^https://[a-z0-9]+\.supabase\.co/storage/v1/object/public/'
       || case when p_kind = 'cover' then 'covers/' || v_uid || '/cover' else 'avatars/' || v_uid || '/visuel' end
       || '\.(webp|jpg)(\?v=[0-9]+)?$') then
    raise exception 'bad_image';
  end if;
  insert into public.trainer_profiles (user_id) values (v_uid) on conflict (user_id) do nothing;
  update public.trainer_profiles
     set cover_url  = case when p_kind = 'cover'  then v_url else cover_url end,
         visual_url = case when p_kind = 'visual' then v_url else visual_url end,
         updated_at = now()
   where user_id = v_uid
  returning * into v_row;
  return v_row;
end $$;

-- Un étudiant déjà inscrit devient formateur (même compte, il garde ses cours et attestations).
create or replace function public.become_trainer()
returns void language plpgsql security definer set search_path = public as $$
declare v_uid uuid := auth.uid();
begin
  if v_uid is null then raise exception 'not_authenticated'; end if;
  update public.profiles set role = 'trainer' where id = v_uid;
  insert into public.trainer_profiles (user_id) values (v_uid) on conflict (user_id) do nothing;
end $$;

-- Profil public d'un formateur. null s'il n'est pas visible (sauf pour lui-même et l'administrateur, en aperçu).
-- Les contacts ne sont donnés qu'aux personnes connectées.
create or replace function public.get_trainer(p_id uuid)
returns jsonb language plpgsql stable security definer set search_path = public as $$
declare
  v_uid     uuid := auth.uid();
  r         record;
  v_visible boolean;
  v_owner   boolean;
  v_admin   boolean := public.is_admin();
  v_out     jsonb;
begin
  select p.full_name, p.avatar_url, p.sub_end, tp.headline, tp.bio, tp.domains, tp.rates,
         tp.whatsapp, tp.phone, tp.email, tp.facebook, tp.linkedin, tp.instagram, tp.tiktok, tp.website,
         tp.cover_url, tp.visual_url, tp.status, tp.reason
    into r
    from public.profiles p join public.trainer_profiles tp on tp.user_id = p.id
   where p.id = p_id and p.role = 'trainer';
  if not found then return null; end if;
  v_visible := r.status = 'approved' and r.sub_end is not null and r.sub_end > now();
  v_owner := v_uid is not null and v_uid = p_id;
  if not v_visible and not v_owner and not v_admin then return null; end if;

  v_out := jsonb_build_object(
    'user_id', p_id, 'full_name', r.full_name, 'avatar_url', r.avatar_url, 'headline', r.headline,
    'bio', r.bio, 'domains', to_jsonb(r.domains), 'rates', r.rates,
    'cover_url', r.cover_url, 'visual_url', r.visual_url, 'visible', v_visible);
  if v_owner or v_admin then
    v_out := v_out || jsonb_build_object('status', r.status, 'reason', r.reason, 'sub_end', r.sub_end);
  end if;
  if v_uid is not null then
    v_out := v_out || jsonb_build_object('contacts', jsonb_strip_nulls(jsonb_build_object(
      'whatsapp', r.whatsapp, 'phone', r.phone, 'email', r.email, 'facebook', r.facebook,
      'linkedin', r.linkedin, 'instagram', r.instagram, 'tiktok', r.tiktok, 'website', r.website)));
  end if;
  return v_out;
end $$;

-- Liste publique des formateurs visibles (sans les contacts) : menu Accompagnement et fiches des formations.
create or replace function public.list_trainers()
returns jsonb language sql stable security definer set search_path = public as $$
  select coalesce(jsonb_agg(jsonb_build_object(
    'user_id', p.id, 'full_name', p.full_name, 'avatar_url', p.avatar_url, 'headline', tp.headline,
    'domains', to_jsonb(tp.domains), 'rates', tp.rates, 'cover_url', tp.cover_url
  ) order by p.full_name), '[]'::jsonb)
  from public.trainer_profiles tp join public.profiles p on p.id = tp.user_id
  where p.role = 'trainer' and tp.status = 'approved' and p.sub_end is not null and p.sub_end > now();
$$;

-- ---------------------------------------------------------------------
-- Administration
-- ---------------------------------------------------------------------
-- Tous les formateurs, avec leur profil complet, leur abonnement et un éventuel paiement en attente.
create or replace function public.admin_trainers()
returns jsonb language plpgsql stable security definer set search_path = public as $$
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  return coalesce((
    select jsonb_agg(jsonb_build_object(
      'user_id', p.id, 'full_name', p.full_name, 'email', p.email, 'avatar_url', p.avatar_url,
      'sub_end', p.sub_end, 'created_at', p.created_at,
      'headline', coalesce(tp.headline, ''), 'bio', coalesce(tp.bio, ''), 'domains', to_jsonb(coalesce(tp.domains, '{}')),
      'rates', coalesce(tp.rates, ''), 'whatsapp', tp.whatsapp, 'phone', tp.phone, 'contact_email', tp.email,
      'facebook', tp.facebook, 'linkedin', tp.linkedin, 'instagram', tp.instagram, 'tiktok', tp.tiktok, 'website', tp.website,
      'cover_url', tp.cover_url, 'visual_url', tp.visual_url,
      'status', coalesce(tp.status, 'draft'), 'reason', tp.reason, 'decided_at', tp.decided_at, 'updated_at', tp.updated_at,
      'has_pending_payment', exists (select 1 from public.payments x where x.user_id = p.id and x.status = 'pending')
    ) order by case coalesce(tp.status, 'draft') when 'pending' then 0 when 'rejected' then 1 when 'approved' then 2 else 3 end,
               tp.updated_at desc nulls last)
    from public.profiles p left join public.trainer_profiles tp on tp.user_id = p.id
    where p.role = 'trainer'
  ), '[]'::jsonb);
end $$;

-- Valider (profil visible si l'abonnement est actif) ou refuser / masquer un profil, avec un motif.
create or replace function public.admin_decide_trainer(p_user uuid, p_approve boolean, p_reason text default null)
returns public.trainer_profiles language plpgsql security definer set search_path = public as $$
declare v_row public.trainer_profiles;
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  select * into v_row from public.trainer_profiles where user_id = p_user for update;
  if not found then raise exception 'not_found'; end if;
  if p_approve and not public.trainer_is_complete(p_user) then raise exception 'trainer_profile_incomplete'; end if;
  update public.trainer_profiles
     set status = case when p_approve then 'approved' else 'rejected' end,
         reason = case when p_approve then null else left(coalesce(nullif(btrim(p_reason), ''), 'Profil à corriger'), 300) end,
         decided_at = now()
   where user_id = p_user
  returning * into v_row;
  return v_row;
end $$;

-- Profils à valider hors paiement : complets, en attente, abonnement actif et aucun paiement en attente
-- (ceux qui ont un paiement en attente se valident depuis l'onglet Paiements).
create or replace function public.admin_trainer_todo()
returns int language plpgsql stable security definer set search_path = public as $$
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  return (select count(*) from public.trainer_profiles tp join public.profiles p on p.id = tp.user_id
           where tp.status = 'pending' and p.sub_end > now()
             and not exists (select 1 from public.payments x where x.user_id = p.id and x.status = 'pending'));
end $$;

-- ---------------------------------------------------------------------
-- Paiement : un formateur doit d'abord remplir son profil
-- (copie de la version du 13/10/2026, avec ce contrôle en plus)
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
  values (v_uid, p_operator, v_ref, v_sender, public.current_price_ar())
  returning * into v_row;
  return v_row;
end;
$$;

-- ---------------------------------------------------------------------
-- Droits d'appel
-- ---------------------------------------------------------------------
revoke execute on function public.trainer_is_complete(uuid)                  from public, anon, authenticated;
revoke execute on function public.trainer_refresh_status(uuid)               from public, anon, authenticated;
revoke execute on function public.profiles_avatar_changed()                  from public, anon, authenticated;
revoke execute on function public.save_trainer_profile(jsonb)                from public, anon;
revoke execute on function public.set_trainer_image(text, text)              from public, anon;
revoke execute on function public.become_trainer()                           from public, anon;
revoke execute on function public.admin_trainers()                           from public, anon;
revoke execute on function public.admin_decide_trainer(uuid, boolean, text)  from public, anon;
revoke execute on function public.admin_trainer_todo()                       from public, anon;
revoke execute on function public.submit_payment(text, text, text)           from public, anon;
grant  execute on function public.save_trainer_profile(jsonb)                to authenticated;
grant  execute on function public.set_trainer_image(text, text)              to authenticated;
grant  execute on function public.become_trainer()                           to authenticated;
grant  execute on function public.admin_trainers()                           to authenticated;
grant  execute on function public.admin_decide_trainer(uuid, boolean, text)  to authenticated;
grant  execute on function public.admin_trainer_todo()                       to authenticated;
grant  execute on function public.submit_payment(text, text, text)           to authenticated;
grant  execute on function public.get_trainer(uuid)                          to anon, authenticated;
grant  execute on function public.list_trainers()                            to anon, authenticated;

-- ---------------------------------------------------------------------
-- Compartiment « covers » : photos de couverture des formateurs (30 Ko au maximum)
-- ---------------------------------------------------------------------
do $$
begin
  if not exists (select 1 from information_schema.schemata where schema_name = 'storage') then
    raise notice 'Pas de Supabase Storage ici : compartiment covers non créé.';
    return;
  end if;

  insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
  values ('covers', 'covers', true, 30720, array['image/webp', 'image/jpeg'])
  on conflict (id) do update set public = true, file_size_limit = 30720,
    allowed_mime_types = array['image/webp', 'image/jpeg'];

  drop policy if exists covers_select_own on storage.objects;
  drop policy if exists covers_insert_own on storage.objects;
  drop policy if exists covers_update_own on storage.objects;
  drop policy if exists covers_delete_own on storage.objects;
  create policy covers_select_own on storage.objects for select to authenticated
    using (bucket_id = 'covers' and (storage.foldername(name))[1] = auth.uid()::text);
  create policy covers_insert_own on storage.objects for insert to authenticated
    with check (bucket_id = 'covers' and (storage.foldername(name))[1] = auth.uid()::text);
  create policy covers_update_own on storage.objects for update to authenticated
    using (bucket_id = 'covers' and (storage.foldername(name))[1] = auth.uid()::text)
    with check (bucket_id = 'covers' and (storage.foldername(name))[1] = auth.uid()::text);
  create policy covers_delete_own on storage.objects for delete to authenticated
    using (bucket_id = 'covers' and (storage.foldername(name))[1] = auth.uid()::text);
end $$;
