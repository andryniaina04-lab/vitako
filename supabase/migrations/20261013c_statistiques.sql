-- Migration du 13/10/2026 : statistiques pour l'administrateur (page « Statistiques »).
-- Rejouable sans risque : exécutée par GitHub Actions avant seed.sql.
-- Ne renvoie que des chiffres agrégés et les titres des formations, jamais de données personnelles.

create or replace function public.admin_stats()
returns jsonb language plpgsql stable security definer set search_path = public as $$
declare
  v_today date := (now() at time zone 'Indian/Antananarivo')::date;
  v_month date := date_trunc('month', v_today)::date;
  v jsonb;
begin
  if not public.is_admin() then
    raise exception 'forbidden';
  end if;

  with st as (select id, created_at, sub_end from public.profiles where not is_admin)
  select jsonb_build_object(
    'users', jsonb_build_object(
      'total',  (select count(*) from st),
      'today',  (select count(*) from st where (created_at at time zone 'Indian/Antananarivo')::date = v_today),
      'week',   (select count(*) from st where created_at >= now() - interval '7 days'),
      'month',  (select count(*) from st where created_at >= now() - interval '30 days')
    ),
    'subs', jsonb_build_object(
      'active',  (select count(*) from st where sub_end > now()),
      'expired', (select count(*) from st where sub_end <= now()),
      'never',   (select count(*) from st where sub_end is null),
      'ending7', (select count(*) from st where sub_end > now() and sub_end <= now() + interval '7 days')
    ),
    'payments', jsonb_build_object(
      'pending',  (select count(*) from public.payments where status = 'pending'),
      'approved', (select count(*) from public.payments where status = 'approved'),
      'rejected', (select count(*) from public.payments where status = 'rejected'),
      'revenue_total', (select coalesce(sum(amount), 0) from public.payments where status = 'approved'),
      'revenue_month', (select coalesce(sum(amount), 0) from public.payments where status = 'approved'
                          and (coalesce(decided_at, created_at) at time zone 'Indian/Antananarivo')::date >= v_month)
    ),
    'learning', jsonb_build_object(
      'learners',     (select count(distinct user_id) from public.progress),
      'active7',      (select count(distinct user_id) from public.progress where completed_at >= now() - interval '7 days'),
      'modules_done', (select count(*) from public.progress),
      'exams',        (select count(*) from public.exam_attempts where submitted_at is not null),
      'exams_passed', (select count(*) from public.exam_attempts where submitted_at is not null and score >= 50),
      'course_certs', (select count(*) from public.certificates where kind = 'course'),
      'job_certs',    (select count(*) from public.certificates where kind = 'job')
    ),
    'signups', (
      select jsonb_agg(jsonb_build_object('d', d::date, 'n', coalesce(n, 0)) order by d)
      from generate_series(v_today - 29, v_today, interval '1 day') d
      left join (
        select (created_at at time zone 'Indian/Antananarivo')::date as day, count(*) as n
        from st group by 1
      ) x on x.day = d::date
    ),
    'top_courses', coalesce((
      select jsonb_agg(t order by t.learners desc, t.title)
      from (
        select c.id, c.title,
               count(distinct p.user_id) as learners,
               (select count(*) from public.certificates ce where ce.course_id = c.id and ce.kind = 'course') as certs
        from public.courses c
        join public.progress p on p.course_id = c.id
        group by c.id, c.title
        order by learners desc, c.title
        limit 10
      ) t
    ), '[]'::jsonb)
  ) into v;
  return v;
end;
$$;

revoke execute on function public.admin_stats() from public, anon;
grant execute on function public.admin_stats() to authenticated;
