-- Migration : formation d'aperçu gratuit (free_preview)
-- Un cours marqué free_preview = true est accessible aux inscrits (pas besoin d'abonnement)
-- pour les leçons et les tests de module. L'examen et l'attestation restent bloqués
-- sans abonnement actif.

-- 1. Ajouter le champ free_preview à la table courses
alter table public.courses add column if not exists free_preview boolean not null default false;

-- 2. Mettre free-1-f en aperçu gratuit (mis à jour par build.mjs, mais on le pose ici aussi)
update public.courses set free_preview = true where id = 'free-1-f';

-- 3. Fonction : est-ce que ce cours est en aperçu gratuit ?
create or replace function public.is_free_preview(p_course text)
returns boolean language sql stable security definer set search_path = public as $$
  select coalesce((select free_preview from public.courses where id = p_course), false);
$$;

-- 4. Fonction : l'utilisateur peut-il lire les leçons de ce cours ?
-- Vrai si abonné/admin OU si le cours est en aperçu gratuit et l'utilisateur est connecté.
create or replace function public.can_read_lesson(p_course text)
returns boolean language sql stable security definer set search_path = public as $$
  select (
    public.has_access()
    or (
      auth.uid() is not null
      and public.is_free_preview(p_course)
    )
  );
$$;

-- 5. Mettre à jour la policy des leçons pour inclure les aperçus gratuits
drop policy if exists lessons_read on public.lessons;
create policy lessons_read on public.lessons for select
  using (public.can_read_lesson(course_id));

-- 6. Mettre à jour la policy des questions de module
drop policy if exists module_questions_read on public.module_questions;
create policy module_questions_read on public.module_questions for select
  using (public.can_read_lesson(course_id));

-- 7. Mettre à jour la policy de progression
-- L'inscription à la progression (marquer un module terminé) nécessite un abonnement actif
-- SAUF pour les cours en aperçu gratuit (pour que l'étudiant puisse avancer).
drop policy if exists progress_insert on public.progress;
create policy progress_insert on public.progress for insert
  with check (
    user_id = auth.uid()
    and public.can_read_lesson(course_id)
    and exists (
      select 1 from public.lessons l
      where l.course_id = progress.course_id and l.module_index = progress.module_index
    )
  );

-- 8. La fonction start_exam vérifie déjà has_access() — elle bloque donc l'examen
-- pour les non-abonnés même sur un cours free_preview. Rien à changer côté examen.
-- (La migration ne modifie pas start_exam ni submit_exam.)
