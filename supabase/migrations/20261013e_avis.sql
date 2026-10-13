-- Migration du 13/10/2026 : avis des apprenants après une attestation (onglet « Avis » de l'administration).
-- Rejouable sans risque : exécutée par GitHub Actions avant seed.sql.

create table if not exists public.reviews (
  id         uuid primary key default gen_random_uuid(),
  user_id    uuid not null references public.profiles (id) on delete cascade,
  course_id  text not null references public.courses (id),
  rating     int  not null check (rating between 1 and 5),
  comment    text not null default '' check (char_length(comment) <= 1000),
  can_publish boolean not null default false,   -- accord pour citer l'avis sur le site
  created_at timestamptz not null default now(),
  unique (user_id, course_id)
);
create index if not exists reviews_created on public.reviews (created_at desc);

alter table public.reviews enable row level security;
drop policy if exists reviews_read on public.reviews;
create policy reviews_read on public.reviews for select
  using (user_id = auth.uid() or public.is_admin());
revoke all on public.reviews from anon;
revoke insert, update, delete on public.reviews from authenticated;
grant select on public.reviews to authenticated;

-- Envoi d'un avis : seulement pour une formation dont on a l'attestation. Un avis par formation (modifiable).
create or replace function public.submit_review(p_course text, p_rating int, p_comment text default '', p_publish boolean default false)
returns public.reviews language plpgsql security definer set search_path = public as $$
declare
  v_uid uuid := auth.uid();
  v_row public.reviews;
  v_comment text := left(btrim(coalesce(p_comment, '')), 1000);
begin
  if v_uid is null then raise exception 'not_authenticated'; end if;
  if p_rating is null or p_rating < 1 or p_rating > 5 then raise exception 'bad_rating'; end if;
  if not exists (select 1 from public.certificates c where c.user_id = v_uid and c.kind = 'course' and c.course_id = p_course) then
    raise exception 'no_certificate';
  end if;
  insert into public.reviews (user_id, course_id, rating, comment, can_publish)
  values (v_uid, p_course, p_rating, v_comment, coalesce(p_publish, false))
  on conflict (user_id, course_id) do update
    set rating = excluded.rating, comment = excluded.comment, can_publish = excluded.can_publish, created_at = now()
  returning * into v_row;
  return v_row;
end $$;

-- Liste des avis pour l'administrateur (nom, e-mail, titre de la formation).
create or replace function public.admin_reviews()
returns jsonb language plpgsql stable security definer set search_path = public as $$
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  return coalesce((
    select jsonb_agg(jsonb_build_object(
      'id', r.id, 'course_id', r.course_id, 'course_title', c.title, 'rating', r.rating, 'comment', r.comment,
      'can_publish', r.can_publish, 'created_at', r.created_at, 'full_name', p.full_name, 'email', p.email
    ) order by r.created_at desc)
    from public.reviews r
    join public.profiles p on p.id = r.user_id
    left join public.courses c on c.id = r.course_id
  ), '[]'::jsonb);
end $$;

revoke execute on function public.submit_review(text, int, text, boolean) from public, anon;
revoke execute on function public.admin_reviews()                          from public, anon;
grant  execute on function public.submit_review(text, int, text, boolean) to authenticated;
grant  execute on function public.admin_reviews()                          to authenticated;
