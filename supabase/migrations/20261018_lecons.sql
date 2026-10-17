-- Migration du 18/10/2026 : formations « version 2 », découpées en leçons avec un QCM par leçon.
-- Rejouable sans risque : exécutée par GitHub Actions avant seed.sql.
--
-- Une formation version 2 : 6 modules, 4 à 6 leçons par module, un QCM (avec explications)
-- après chaque leçon, examen final de 20 questions tirées parmi 60.
-- Tant que courses.v2_live est faux, la version 2 n'est visible que par l'administrateur
-- (aperçu) : les étudiants continuent de suivre la version actuelle (tables lessons et module_questions).
-- Le passage en ligne (fonction course_go_live) convertit la progression déjà faite.

alter table public.courses add column if not exists v2_live boolean not null default false;
alter table public.exam_questions add column if not exists version smallint not null default 1;
create index if not exists exam_questions_course_version on public.exam_questions (course_id, version);

-- Modules de la version 2 (titre et résumé)
create table if not exists public.modules2 (
  course_id    text not null references public.courses (id) on delete cascade,
  module_index int  not null check (module_index between 0 and 19),
  title        text not null,
  summary      text not null default '',
  primary key (course_id, module_index)
);

-- Leçons de la version 2
create table if not exists public.lesson_parts (
  course_id    text not null,
  module_index int  not null,
  part_index   int  not null check (part_index between 0 and 19),
  title        text not null,
  minutes      int  not null default 10,
  body_md      text not null default '',
  primary key (course_id, module_index, part_index),
  foreign key (course_id, module_index) references public.modules2 (course_id, module_index) on delete cascade
);

-- QCM de fin de leçon, avec l'explication de la bonne réponse
create table if not exists public.part_questions (
  id           bigint generated always as identity primary key,
  course_id    text not null,
  module_index int  not null,
  part_index   int  not null,
  position     int  not null default 0,
  question     text not null,
  options      jsonb not null check (jsonb_typeof(options) = 'array' and jsonb_array_length(options) between 2 and 6),
  correct      int  not null check (correct >= 0),
  explanation  text not null default '',
  foreign key (course_id, module_index, part_index) references public.lesson_parts (course_id, module_index, part_index) on delete cascade
);
create index if not exists part_questions_part on public.part_questions (course_id, module_index, part_index);

-- Leçons terminées par chaque étudiant (QCM rendu), avec le nombre de bonnes réponses
create table if not exists public.part_progress (
  user_id      uuid not null references public.profiles (id) on delete cascade,
  course_id    text not null references public.courses (id) on delete cascade,
  module_index int  not null,
  part_index   int  not null,
  good         int,
  total        int,
  completed_at timestamptz not null default now(),
  primary key (user_id, course_id, module_index, part_index)
);

-- La version 2 est-elle visible par la personne connectée ? (en ligne, ou aperçu administrateur)
create or replace function public.v2_visible(p_course text)
returns boolean language sql stable security definer set search_path = public as $$
  select coalesce((select c.v2_live from public.courses c where c.id = p_course), false) or public.is_admin();
$$;

alter table public.modules2       enable row level security;
alter table public.lesson_parts   enable row level security;
alter table public.part_questions enable row level security;
alter table public.part_progress  enable row level security;
drop policy if exists modules2_read on public.modules2;
drop policy if exists lesson_parts_read on public.lesson_parts;
drop policy if exists part_questions_read on public.part_questions;
drop policy if exists part_progress_read on public.part_progress;
create policy modules2_read on public.modules2 for select using (public.has_access() and public.v2_visible(course_id));
create policy lesson_parts_read on public.lesson_parts for select using (public.has_access() and public.v2_visible(course_id));
create policy part_questions_read on public.part_questions for select using (public.has_access() and public.v2_visible(course_id));
create policy part_progress_read on public.part_progress for select using (user_id = auth.uid() or public.is_admin());
revoke all on public.modules2, public.lesson_parts, public.part_questions, public.part_progress from anon;
revoke insert, update, delete on public.modules2, public.lesson_parts, public.part_questions, public.part_progress from authenticated;
grant select on public.modules2, public.lesson_parts, public.part_questions, public.part_progress to authenticated;

-- L'étudiant termine une leçon (QCM rendu). Quand toutes les leçons d'un module sont faites,
-- le module est validé (table progress, utilisée par l'examen, les statistiques et Mon espace).
create or replace function public.complete_part(p_course text, p_module int, p_part int, p_good int default null, p_total int default null)
returns jsonb language plpgsql security definer set search_path = public as $$
declare
  v_uid   uuid := auth.uid();
  v_parts int;
  v_done  int;
begin
  if v_uid is null then raise exception 'not_authenticated'; end if;
  if not public.has_access() then raise exception 'no_access'; end if;
  if not public.v2_visible(p_course) then raise exception 'not_found'; end if;
  if not exists (select 1 from public.lesson_parts where course_id = p_course and module_index = p_module and part_index = p_part) then
    raise exception 'not_found';
  end if;
  insert into public.part_progress (user_id, course_id, module_index, part_index, good, total)
  values (v_uid, p_course, p_module, p_part,
          case when p_good between 0 and 50 then p_good end, case when p_total between 1 and 50 then p_total end)
  on conflict (user_id, course_id, module_index, part_index) do update
    set good = greatest(coalesce(part_progress.good, 0), coalesce(excluded.good, 0)), total = coalesce(excluded.total, part_progress.total);

  select count(*) into v_parts from public.lesson_parts where course_id = p_course and module_index = p_module;
  select count(*) into v_done from public.part_progress pp
   where pp.user_id = v_uid and pp.course_id = p_course and pp.module_index = p_module
     and exists (select 1 from public.lesson_parts lp where lp.course_id = pp.course_id and lp.module_index = pp.module_index and lp.part_index = pp.part_index);
  if v_done >= v_parts then
    insert into public.progress (user_id, course_id, module_index) values (v_uid, p_course, p_module)
    on conflict do nothing;
  end if;
  return jsonb_build_object('module_done', v_done >= v_parts, 'parts_done', v_done, 'parts', v_parts);
end $$;

-- Mise en ligne de la version 2 d'une formation (appelée par seed.sql quand « live » est vrai).
-- p_map[i] = numéro (à partir de 0) du module de la version 2 qui remplace le module i de la version 1.
-- La progression déjà faite est convertie ; les attestations ne changent pas. Sans effet si déjà en ligne.
create or replace function public.course_go_live(p_course text, p_map int[])
returns void language plpgsql security definer set search_path = public as $$
begin
  if (select v2_live from public.courses where id = p_course) then return; end if;
  create temporary table if not exists _v1_progress (user_id uuid, module_index int, completed_at timestamptz) on commit drop;
  delete from _v1_progress;
  insert into _v1_progress select user_id, module_index, completed_at from public.progress where course_id = p_course;
  delete from public.progress where course_id = p_course;
  insert into public.progress (user_id, course_id, module_index, completed_at)
    select distinct on (o.user_id, p_map[o.module_index + 1]) o.user_id, p_course, p_map[o.module_index + 1], o.completed_at
      from _v1_progress o where p_map[o.module_index + 1] is not null
    on conflict do nothing;
  insert into public.part_progress (user_id, course_id, module_index, part_index, completed_at)
    select pr.user_id, p_course, lp.module_index, lp.part_index, pr.completed_at
      from public.progress pr join public.lesson_parts lp on lp.course_id = pr.course_id and lp.module_index = pr.module_index
     where pr.course_id = p_course
    on conflict do nothing;
  update public.courses set v2_live = true where id = p_course;
end $$;

-- Examen : en version 2, 20 questions tirées parmi celles de la version 2,
-- et l'examen s'ouvre quand tous les modules de la version 2 sont terminés.
create or replace function public.start_exam(p_course text)
returns jsonb language plpgsql security definer set search_path = public as $$
declare
  v_uid     uuid := auth.uid();
  v_ids     bigint[];
  v_attempt uuid;
  v_needed  int;
  v_done    int;
  v_v2      boolean;
begin
  if v_uid is null then raise exception 'not_authenticated'; end if;
  if not public.has_access() then raise exception 'no_access'; end if;
  if not exists (select 1 from public.courses where id = p_course and published) then
    raise exception 'not_found';
  end if;
  v_v2 := public.v2_visible(p_course) and exists (select 1 from public.modules2 where course_id = p_course);

  if v_v2 then
    select count(*) into v_needed from public.modules2 where course_id = p_course;
    select count(*) into v_done from public.modules2 m
     where m.course_id = p_course
       and (select count(*) from public.part_progress pp where pp.user_id = v_uid and pp.course_id = p_course and pp.module_index = m.module_index)
           >= (select count(*) from public.lesson_parts lp where lp.course_id = p_course and lp.module_index = m.module_index);
  else
    select count(*) into v_needed from public.lessons where course_id = p_course;
    select count(*) into v_done   from public.progress where user_id = v_uid and course_id = p_course;
  end if;
  if v_done < v_needed then raise exception 'modules_incomplete'; end if;

  if (select count(*) from public.exam_attempts
       where user_id = v_uid and started_at > now() - interval '1 hour') >= 30 then
    raise exception 'too_many_attempts';
  end if;

  select array_agg(id) into v_ids
  from (select id from public.exam_questions
         where course_id = p_course and version = case when v_v2 then 2 else 1 end
         order by random() limit case when v_v2 then 20 else 10 end) s;
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

revoke execute on function public.v2_visible(text)                       from public, anon;
revoke execute on function public.complete_part(text, int, int, int, int) from public, anon;
revoke execute on function public.course_go_live(text, int[])            from public, anon, authenticated;
revoke execute on function public.start_exam(text)                       from public, anon;
grant  execute on function public.v2_visible(text)                       to authenticated;
grant  execute on function public.complete_part(text, int, int, int, int) to authenticated;
grant  execute on function public.start_exam(text)                       to authenticated;
