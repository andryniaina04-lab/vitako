-- Migration du 13/10/2026 : formations à niveau unique (domaine Développement personnel).
-- Pas d'attestation « parcours complet » pour un métier qui n'a qu'une formation.
-- Rejouable sans risque : exécutée par GitHub Actions avant seed.sql.

create or replace function public.submit_exam(p_attempt uuid, p_answers jsonb)
returns jsonb language plpgsql security definer set search_path = public as $$
declare
  v_uid      uuid := auth.uid();
  v_att      public.exam_attempts;
  v_course   public.courses;
  v_good     int;
  v_total    int;
  v_score    int;
  v_cert     text;
  v_job_cert text;
  v_name     text;
begin
  if v_uid is null then raise exception 'not_authenticated'; end if;
  select * into v_att from public.exam_attempts where id = p_attempt and user_id = v_uid for update;
  if not found then raise exception 'not_found'; end if;
  if v_att.submitted_at is not null then raise exception 'already_submitted'; end if;
  if v_att.started_at < now() - interval '3 hours' then raise exception 'expired'; end if;
  if not public.has_access() then raise exception 'no_access'; end if;

  select
    count(*) filter (where (p_answers ->> q.id::text) ~ '^[0-9]{1,2}$'
                       and (p_answers ->> q.id::text)::int = q.correct),
    count(*)
  into v_good, v_total
  from public.exam_questions q where q.id = any (v_att.question_ids);

  if v_total = 0 then raise exception 'no_questions'; end if;
  v_score := round(v_good * 100.0 / v_total);

  update public.exam_attempts set submitted_at = now(), score = v_score where id = p_attempt;

  select * into v_course from public.courses where id = v_att.course_id;
  select full_name into v_name from public.profiles where id = v_uid;

  if v_score >= 50 then
    select id into v_cert from public.certificates
     where user_id = v_uid and kind = 'course' and course_id = v_course.id;
    if v_cert is null then
      insert into public.certificates (id, user_id, kind, course_id, job_key, full_name, title, score, hours)
      values (public.new_certificate_id(), v_uid, 'course', v_course.id, v_course.job_key, v_name,
              v_course.title, v_score, v_course.hours)
      returning id into v_cert;
    else
      update public.certificates set score = greatest(coalesce(score, 0), v_score) where id = v_cert;
    end if;

    -- Attestation de parcours complet : tous les niveaux du métier réussis
    -- (seulement pour les métiers en deux niveaux, pas pour les formations à niveau unique).
    if (select count(*) from public.courses where job_key = v_course.job_key) >= 2
       and (select count(*) from public.certificates c
         where c.user_id = v_uid and c.kind = 'course' and c.job_key = v_course.job_key)
       >= (select count(*) from public.courses where job_key = v_course.job_key)
    then
      select id into v_job_cert from public.certificates
       where user_id = v_uid and kind = 'job' and job_key = v_course.job_key;
      if v_job_cert is null then
        insert into public.certificates (id, user_id, kind, job_key, full_name, title, hours)
        values (public.new_certificate_id(), v_uid, 'job', v_course.job_key, v_name, v_course.job_name,
                (select sum(hours) from public.courses where job_key = v_course.job_key))
        returning id into v_job_cert;
      end if;
    end if;
  end if;

  return jsonb_build_object(
    'score', v_score,
    'good', v_good,
    'total', v_total,
    'passed', v_score >= 50,
    'best', (select max(score) from public.exam_attempts
              where user_id = v_uid and course_id = v_att.course_id and submitted_at is not null),
    'attempts', (select count(*) from public.exam_attempts
                  where user_id = v_uid and course_id = v_att.course_id and submitted_at is not null),
    'certificate_id', v_cert,
    'job_certificate_id', v_job_cert
  );
end;
$$;
