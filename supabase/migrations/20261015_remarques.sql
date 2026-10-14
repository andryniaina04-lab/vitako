-- Migration du 15/10/2026 : remarques des visiteurs et des apprenants (menu « Envoyer une remarque »),
-- lues par l'administrateur dans l'onglet « Remarques ».
-- Rejouable sans risque : exécutée par GitHub Actions avant seed.sql.

create table if not exists public.feedback (
  id         uuid primary key default gen_random_uuid(),
  user_id    uuid references public.profiles (id) on delete set null,
  email      text check (email is null or char_length(email) <= 200),
  category   text not null check (category in ('site', 'bug', 'formation', 'autre')),
  message    text not null check (char_length(message) between 10 and 2000),
  page       text check (page is null or char_length(page) <= 200),
  status     text not null default 'new' check (status in ('new', 'read')),
  created_at timestamptz not null default now()
);
create index if not exists feedback_created on public.feedback (created_at desc);

alter table public.feedback enable row level security;
-- Aucune politique de lecture : seules les fonctions ci-dessous y accèdent.
revoke all on public.feedback from anon, authenticated;

-- Envoi d'une remarque (compte connecté ou visiteur). Limites anti-abus :
-- 5 par heure pour un compte, 30 par heure pour l'ensemble des visiteurs sans compte.
create or replace function public.submit_feedback(p_category text, p_message text, p_email text default null, p_page text default null)
returns uuid language plpgsql security definer set search_path = public as $$
declare
  v_uid   uuid := auth.uid();
  v_msg   text := btrim(coalesce(p_message, ''));
  v_email text := nullif(lower(btrim(coalesce(p_email, ''))), '');
  v_id    uuid;
begin
  if p_category is null or p_category not in ('site', 'bug', 'formation', 'autre') then raise exception 'bad_category'; end if;
  if char_length(v_msg) < 10 then raise exception 'message_too_short'; end if;
  if char_length(v_msg) > 2000 then raise exception 'message_too_long'; end if;
  if v_email is not null and v_email !~ '^[^@\s]+@[^@\s]+\.[^@\s]+$' then raise exception 'bad_email'; end if;
  if v_uid is not null then
    if (select count(*) from public.feedback where user_id = v_uid and created_at > now() - interval '1 hour') >= 5 then
      raise exception 'too_many_feedback';
    end if;
    if v_email is null then select email into v_email from public.profiles where id = v_uid; end if;
  else
    if (select count(*) from public.feedback where user_id is null and created_at > now() - interval '1 hour') >= 30 then
      raise exception 'too_many_feedback';
    end if;
  end if;
  insert into public.feedback (user_id, email, category, message, page)
  values (v_uid, left(v_email, 200), p_category, v_msg, left(nullif(btrim(coalesce(p_page, '')), ''), 200))
  returning id into v_id;
  return v_id;
end $$;

create or replace function public.admin_feedback()
returns jsonb language plpgsql stable security definer set search_path = public as $$
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  return coalesce((
    select jsonb_agg(jsonb_build_object(
      'id', f.id, 'category', f.category, 'message', f.message, 'page', f.page, 'status', f.status,
      'created_at', f.created_at, 'email', f.email, 'full_name', p.full_name, 'has_account', f.user_id is not null
    ) order by f.created_at desc)
    from public.feedback f left join public.profiles p on p.id = f.user_id
  ), '[]'::jsonb);
end $$;

create or replace function public.admin_feedback_mark(p_id uuid, p_read boolean)
returns void language plpgsql security definer set search_path = public as $$
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  update public.feedback set status = case when p_read then 'read' else 'new' end where id = p_id;
  if not found then raise exception 'not_found'; end if;
end $$;

create or replace function public.admin_feedback_new_count()
returns int language plpgsql stable security definer set search_path = public as $$
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  return (select count(*) from public.feedback where status = 'new');
end $$;

revoke execute on function public.submit_feedback(text, text, text, text) from public;
revoke execute on function public.admin_feedback()                         from public, anon;
revoke execute on function public.admin_feedback_mark(uuid, boolean)       from public, anon;
revoke execute on function public.admin_feedback_new_count()               from public, anon;
grant  execute on function public.submit_feedback(text, text, text, text) to anon, authenticated;
grant  execute on function public.admin_feedback()                         to authenticated;
grant  execute on function public.admin_feedback_mark(uuid, boolean)       to authenticated;
grant  execute on function public.admin_feedback_new_count()               to authenticated;
