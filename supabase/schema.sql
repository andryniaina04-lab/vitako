-- =====================================================================
-- Vitako : schéma de la base de données
-- À exécuter une seule fois dans Supabase > SQL Editor, avant seed.sql.
-- =====================================================================

-- ---------------------------------------------------------------------
-- Tables
-- ---------------------------------------------------------------------

-- Réglages modifiables sans toucher au code (prix de l'abonnement, durée).
create table public.settings (
  key   text primary key,
  value text not null
);
insert into public.settings (key, value) values
  ('price_ar', '60000'),
  ('promo_price_ar', '30000'),      -- prix réduit (0 ou absent = pas de promotion)
  ('promo_until', '2026-11-30'),    -- dernier jour de la promotion, heure de Madagascar
  ('access_days', '30');

-- Un profil par compte. Créé automatiquement à l'inscription.
create table public.profiles (
  id         uuid primary key references auth.users (id) on delete cascade,
  full_name  text not null check (char_length(full_name) between 1 and 120),
  email      text,
  is_admin   boolean not null default false,
  sub_end    timestamptz,                 -- fin de l'accès aux cours
  created_at timestamptz not null default now()
);

-- Les 100 formations (catalogue). published = contenu disponible.
create table public.courses (
  id        text primary key,             -- ex. design-0-f
  job_key   text not null,                -- ex. design-0
  job_name  text not null,                -- ex. Graphiste
  level     text not null check (level in ('f', 'a')),
  title     text not null,                -- ex. Graphiste – Fondamentaux
  hours     int  not null default 10,
  published boolean not null default false
);
create index courses_job_key on public.courses (job_key);

-- Leçons (une par module). Réservées aux abonnés.
create table public.lessons (
  course_id    text not null references public.courses (id) on delete cascade,
  module_index int  not null check (module_index between 0 and 19),
  title        text not null,
  summary      text not null default '',
  body_md      text not null default '',
  video_url    text,
  primary key (course_id, module_index)
);

-- Petits tests de fin de module (entraînement). Réservés aux abonnés.
create table public.module_questions (
  id           bigint generated always as identity primary key,
  course_id    text not null,
  module_index int  not null,
  position     int  not null default 0,
  question     text not null,
  options      jsonb not null check (jsonb_typeof(options) = 'array' and jsonb_array_length(options) between 2 and 6),
  correct      int  not null check (correct >= 0),
  foreign key (course_id, module_index) references public.lessons (course_id, module_index) on delete cascade
);

-- Banque de questions de l'examen final. Jamais lisible depuis le site :
-- seules les fonctions start_exam / submit_exam y accèdent.
create table public.exam_questions (
  id        bigint generated always as identity primary key,
  course_id text not null references public.courses (id) on delete cascade,
  question  text not null,
  options   jsonb not null check (jsonb_typeof(options) = 'array' and jsonb_array_length(options) between 2 and 6),
  correct   int  not null check (correct >= 0)
);
create index exam_questions_course on public.exam_questions (course_id);

-- Modules terminés par chaque étudiant.
create table public.progress (
  user_id      uuid not null references public.profiles (id) on delete cascade,
  course_id    text not null references public.courses (id) on delete cascade,
  module_index int  not null,
  completed_at timestamptz not null default now(),
  primary key (user_id, course_id, module_index)
);

-- Passages d'examen. Le score est calculé par la base, pas par le navigateur.
create table public.exam_attempts (
  id           uuid primary key default gen_random_uuid(),
  user_id      uuid not null references public.profiles (id) on delete cascade,
  course_id    text not null references public.courses (id) on delete cascade,
  question_ids bigint[] not null,
  started_at   timestamptz not null default now(),
  submitted_at timestamptz,
  score        int check (score between 0 and 100)
);
create index exam_attempts_user_course on public.exam_attempts (user_id, course_id);

-- Attestations : une par formation réussie, une par métier complet.
create table public.certificates (
  id        text primary key,               -- ex. VTK-2026-4F9A2C
  user_id   uuid not null references public.profiles (id) on delete cascade,
  kind      text not null check (kind in ('course', 'job')),
  course_id text references public.courses (id),
  job_key   text not null,
  full_name text not null,                  -- nom au moment de la délivrance
  title     text not null,
  score     int,
  hours     int,
  issued_at timestamptz not null default now()
);
create unique index certificates_one_per_course on public.certificates (user_id, course_id) where kind = 'course';
create unique index certificates_one_per_job    on public.certificates (user_id, job_key)   where kind = 'job';

-- Paiements Mobile Money déclarés par les étudiants, validés à la main.
create table public.payments (
  id           uuid primary key default gen_random_uuid(),
  user_id      uuid not null references public.profiles (id) on delete cascade,
  operator     text not null check (operator in ('mvola', 'orange')),
  reference    text not null check (reference ~ '^[A-Z0-9][A-Z0-9.-]{4,39}$'),
  sender       text check (sender is null or sender ~ '^03[0-9]{8}$'),
  amount       int  not null,
  status       text not null default 'pending' check (status in ('pending', 'approved', 'rejected')),
  reason       text,
  created_at   timestamptz not null default now(),
  decided_at   timestamptz,
  decided_by   uuid references public.profiles (id),
  access_until timestamptz
);
-- Une référence ne peut servir qu'une fois (sauf si le paiement a été refusé).
create unique index payments_reference_once on public.payments (operator, reference) where status <> 'rejected';
-- Un seul paiement en attente à la fois par étudiant.
create unique index payments_one_pending on public.payments (user_id) where status = 'pending';
create index payments_status on public.payments (status, created_at);

-- ---------------------------------------------------------------------
-- Fonctions utilitaires
-- ---------------------------------------------------------------------

create or replace function public.is_admin()
returns boolean language sql stable security definer set search_path = public as $$
  select coalesce((select p.is_admin from public.profiles p where p.id = auth.uid()), false);
$$;

-- Vrai si la personne connectée peut suivre les cours (abonnée ou admin).
create or replace function public.has_access()
returns boolean language sql stable security definer set search_path = public as $$
  select coalesce((
    select p.is_admin or (p.sub_end is not null and p.sub_end > now())
    from public.profiles p where p.id = auth.uid()
  ), false);
$$;

create or replace function public.setting_int(p_key text, p_default int)
returns int language sql stable security definer set search_path = public as $$
  select coalesce((select value::int from public.settings where key = p_key), p_default);
$$;

-- Prix à payer aujourd'hui : prix réduit jusqu'au dernier jour de la promotion inclus
-- (date de Madagascar), sinon prix normal.
create or replace function public.current_price_ar()
returns int language sql stable set search_path = public as $$
  select case
    when public.setting_int('promo_price_ar', 0) > 0
     and (select value from public.settings where key = 'promo_until') ~ '^\d{4}-\d{2}-\d{2}$'
     and (now() at time zone 'Indian/Antananarivo')::date
         <= (select value::date from public.settings where key = 'promo_until')
    then public.setting_int('promo_price_ar', 0)
    else public.setting_int('price_ar', 60000)
  end;
$$;

-- Crée le profil dès qu'un compte est créé dans Supabase Auth.
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  insert into public.profiles (id, full_name, email)
  values (
    new.id,
    left(coalesce(nullif(trim(new.raw_user_meta_data ->> 'full_name'), ''), split_part(new.email, '@', 1)), 120),
    new.email
  );
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- Numéro d'attestation unique, ex. VTK-2026-4F9A2C.
create or replace function public.new_certificate_id()
returns text language plpgsql volatile set search_path = public as $$
declare v_id text;
begin
  loop
    v_id := 'VTK-' || to_char(now(), 'YYYY') || '-' || upper(substr(md5(gen_random_uuid()::text), 1, 6));
    exit when not exists (select 1 from public.certificates where id = v_id);
  end loop;
  return v_id;
end;
$$;

-- ---------------------------------------------------------------------
-- Paiements
-- ---------------------------------------------------------------------

-- L'étudiant déclare son paiement : opérateur, référence du SMS, numéro (facultatif).
create or replace function public.submit_payment(p_operator text, p_reference text, p_sender text default null)
returns public.payments language plpgsql security definer set search_path = public as $$
declare
  v_uid    uuid := auth.uid();
  v_ref    text := upper(regexp_replace(coalesce(p_reference, ''), '\s', '', 'g'));
  v_sender text := nullif(regexp_replace(coalesce(p_sender, ''), '\D', '', 'g'), '');
  v_row    public.payments;
begin
  if v_uid is null then raise exception 'not_authenticated'; end if;
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

-- L'administrateur valide (accès prolongé) ou refuse (avec un motif).
create or replace function public.admin_decide_payment(p_id uuid, p_approve boolean, p_reason text default null)
returns public.payments language plpgsql security definer set search_path = public as $$
declare
  v_pay   public.payments;
  v_until timestamptz;
  v_days  int := public.setting_int('access_days', 30);
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  select * into v_pay from public.payments where id = p_id for update;
  if not found then raise exception 'not_found'; end if;
  if v_pay.status <> 'pending' then raise exception 'already_decided'; end if;

  if p_approve then
    update public.profiles
       set sub_end = greatest(coalesce(sub_end, now()), now()) + make_interval(days => v_days)
     where id = v_pay.user_id
    returning sub_end into v_until;
    update public.payments
       set status = 'approved', decided_at = now(), decided_by = auth.uid(), access_until = v_until
     where id = p_id
    returning * into v_pay;
  else
    update public.payments
       set status = 'rejected', decided_at = now(), decided_by = auth.uid(),
           reason = coalesce(nullif(trim(p_reason), ''), 'Paiement introuvable')
     where id = p_id
    returning * into v_pay;
  end if;
  return v_pay;
end;
$$;

-- ---------------------------------------------------------------------
-- Examens et attestations
-- ---------------------------------------------------------------------

-- Tire 10 questions au hasard (sans les réponses) et ouvre un passage.
create or replace function public.start_exam(p_course text)
returns jsonb language plpgsql security definer set search_path = public as $$
declare
  v_uid     uuid := auth.uid();
  v_ids     bigint[];
  v_attempt uuid;
  v_needed  int;
  v_done    int;
begin
  if v_uid is null then raise exception 'not_authenticated'; end if;
  if not public.has_access() then raise exception 'no_access'; end if;
  if not exists (select 1 from public.courses where id = p_course and published) then
    raise exception 'not_found';
  end if;

  select count(*) into v_needed from public.lessons where course_id = p_course;
  select count(*) into v_done   from public.progress where user_id = v_uid and course_id = p_course;
  if v_done < v_needed then raise exception 'modules_incomplete'; end if;

  if (select count(*) from public.exam_attempts
       where user_id = v_uid and started_at > now() - interval '1 hour') >= 30 then
    raise exception 'too_many_attempts';
  end if;

  select array_agg(id) into v_ids
  from (select id from public.exam_questions where course_id = p_course order by random() limit 10) s;
  if v_ids is null then raise exception 'no_questions'; end if;

  insert into public.exam_attempts (user_id, course_id, question_ids)
  values (v_uid, p_course, v_ids)
  returning id into v_attempt;

  return jsonb_build_object(
    'attempt_id', v_attempt,
    'questions', (
      select jsonb_agg(jsonb_build_object('id', q.id, 'question', q.question, 'options', q.options)
                       order by array_position(v_ids, q.id))
      from public.exam_questions q where q.id = any (v_ids)
    )
  );
end;
$$;

-- Corrige le passage, enregistre le score et délivre les attestations.
-- p_answers : {"<id question>": <index de la réponse choisie>, ...}
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

-- Vérification publique d'une attestation par son numéro (sans connexion).
create or replace function public.verify_certificate(p_id text)
returns jsonb language sql stable security definer set search_path = public as $$
  select jsonb_build_object('id', id, 'kind', kind, 'title', title, 'full_name', full_name,
                            'score', score, 'hours', hours, 'issued_at', issued_at)
  from public.certificates where id = upper(trim(p_id));
$$;

-- ---------------------------------------------------------------------
-- Sécurité : qui peut lire et écrire quoi (Row Level Security)
-- ---------------------------------------------------------------------

alter table public.settings         enable row level security;
alter table public.profiles         enable row level security;
alter table public.courses          enable row level security;
alter table public.lessons          enable row level security;
alter table public.module_questions enable row level security;
alter table public.exam_questions   enable row level security;
alter table public.progress         enable row level security;
alter table public.exam_attempts    enable row level security;
alter table public.certificates     enable row level security;
alter table public.payments         enable row level security;

-- Réglages et catalogue : visibles par tous, même sans compte.
create policy settings_read on public.settings for select using (true);
create policy courses_read  on public.courses  for select using (true);

-- Profil : chacun voit le sien, l'admin voit tout.
create policy profiles_read on public.profiles for select
  using (id = auth.uid() or public.is_admin());
create policy profiles_update_own on public.profiles for update
  using (id = auth.uid()) with check (id = auth.uid());

-- Leçons et petits tests : abonnés actifs (et admin) uniquement.
create policy lessons_read on public.lessons for select
  using (public.has_access());
create policy module_questions_read on public.module_questions for select
  using (public.has_access());

-- Banque d'examen : aucune politique = personne ne la lit depuis le site.

-- Progression : chacun lit la sienne ; ajout seulement avec un abonnement actif.
create policy progress_read on public.progress for select
  using (user_id = auth.uid() or public.is_admin());
create policy progress_insert on public.progress for insert
  with check (user_id = auth.uid() and public.has_access()
              and exists (select 1 from public.lessons l
                           where l.course_id = progress.course_id and l.module_index = progress.module_index));

-- Examens, attestations, paiements : lecture des siens (admin : tout).
-- Les écritures passent uniquement par les fonctions ci-dessus.
create policy exam_attempts_read on public.exam_attempts for select
  using (user_id = auth.uid() or public.is_admin());
create policy certificates_read on public.certificates for select
  using (user_id = auth.uid() or public.is_admin());
create policy payments_read on public.payments for select
  using (user_id = auth.uid() or public.is_admin());

-- Droits au niveau des colonnes et des tables.
revoke all on public.exam_questions from anon, authenticated;
revoke insert, update, delete on public.settings, public.courses, public.lessons, public.module_questions,
  public.exam_attempts, public.certificates, public.payments from anon, authenticated;
revoke insert, delete, update on public.profiles from anon, authenticated;
grant update (full_name) on public.profiles to authenticated;
revoke update, delete on public.progress from anon, authenticated;
revoke all on public.progress, public.profiles, public.payments, public.exam_attempts, public.certificates from anon;

-- Fonctions : appel réservé aux comptes connectés, sauf la vérification d'attestation.
revoke execute on function public.submit_payment(text, text, text)            from public, anon;
revoke execute on function public.admin_decide_payment(uuid, boolean, text)   from public, anon;
revoke execute on function public.start_exam(text)                            from public, anon;
revoke execute on function public.submit_exam(uuid, jsonb)                    from public, anon;
revoke execute on function public.new_certificate_id()                        from public, anon, authenticated;
grant  execute on function public.submit_payment(text, text, text)            to authenticated;
grant  execute on function public.admin_decide_payment(uuid, boolean, text)   to authenticated;
grant  execute on function public.start_exam(text)                            to authenticated;
grant  execute on function public.submit_exam(uuid, jsonb)                    to authenticated;
grant  execute on function public.verify_certificate(text)                    to anon, authenticated;
