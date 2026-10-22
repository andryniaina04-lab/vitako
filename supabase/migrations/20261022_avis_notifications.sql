-- Migration du 22/10/2026 : notification de l'administrateur pour les nouveaux avis.
-- Un avis est « nouveau » tant que l'administrateur n'a pas ouvert l'onglet Avis.
-- Rejouable sans risque : exécutée par GitHub Actions avant seed.sql.

-- Les avis déjà reçus sont considérés comme vus (pas de notification pour l'historique).
alter table public.reviews add column if not exists admin_seen boolean not null default true;
alter table public.reviews alter column admin_seen set default false;

-- Envoi d'un avis : identique à avant, mais un avis envoyé ou modifié redevient « nouveau ».
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
  insert into public.reviews (user_id, course_id, rating, comment, can_publish, admin_seen)
  values (v_uid, p_course, p_rating, v_comment, coalesce(p_publish, false), false)
  on conflict (user_id, course_id) do update
    set rating = excluded.rating, comment = excluded.comment, can_publish = excluded.can_publish, created_at = now(), admin_seen = false
  returning * into v_row;
  return v_row;
end $$;

-- Liste des avis pour l'administrateur, avec l'indicateur « nouveau ».
create or replace function public.admin_reviews()
returns jsonb language plpgsql stable security definer set search_path = public as $$
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  return coalesce((
    select jsonb_agg(jsonb_build_object(
      'id', r.id, 'course_id', r.course_id, 'course_title', c.title, 'rating', r.rating, 'comment', r.comment,
      'can_publish', r.can_publish, 'created_at', r.created_at, 'full_name', p.full_name, 'email', p.email,
      'is_new', not r.admin_seen
    ) order by r.created_at desc)
    from public.reviews r
    join public.profiles p on p.id = r.user_id
    left join public.courses c on c.id = r.course_id
  ), '[]'::jsonb);
end $$;

create or replace function public.admin_reviews_new_count()
returns int language plpgsql stable security definer set search_path = public as $$
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  return (select count(*) from public.reviews where not admin_seen);
end $$;

create or replace function public.admin_reviews_mark_seen()
returns void language plpgsql security definer set search_path = public as $$
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  update public.reviews set admin_seen = true where not admin_seen;
end $$;

revoke execute on function public.admin_reviews_new_count() from public, anon;
revoke execute on function public.admin_reviews_mark_seen()  from public, anon;
grant  execute on function public.admin_reviews_new_count() to authenticated;
grant  execute on function public.admin_reviews_mark_seen()  to authenticated;
