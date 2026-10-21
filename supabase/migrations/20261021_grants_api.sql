-- Ajout des GRANT explicites pour toutes les tables du schéma public.
-- Requis après le 30 octobre 2026 pour les nouveaux projets, branches de
-- prévisualisation et supabase db reset. Les tables existantes ne sont pas
-- affectées, mais ces GRANT assurent la compatibilité future.
-- Idempotent : GRANT est un no-op si le droit existe déjà.

-- anon et authenticated : droits d'accès via l'API
grant select on public.settings to anon, authenticated;
grant select, insert on public.profiles to authenticated;
grant select on public.courses to anon, authenticated;
grant select on public.lessons to authenticated;
grant select on public.module_questions to authenticated;
grant select on public.exam_questions to authenticated;
grant select, insert, update on public.progress to authenticated;
grant select, insert, update on public.exam_attempts to authenticated;
grant select on public.certificates to anon, authenticated;
grant select, insert on public.payments to authenticated;
grant select, insert on public.reviews to authenticated;
grant select, insert on public.feedback to authenticated;
grant select on public.trainer_profiles to authenticated;
grant select on public.modules2 to authenticated;
grant select on public.lesson_parts to authenticated;
grant select on public.part_questions to authenticated;
grant select, insert, update on public.part_progress to authenticated;
grant select on public.course_updates to authenticated;

-- service_role : accès complet (n'existe pas dans l'environnement de test local)
do $$ begin
  if exists (select 1 from pg_roles where rolname = 'service_role') then
    execute 'grant select, insert, update, delete on public.settings to service_role';
    execute 'grant select, insert, update, delete on public.profiles to service_role';
    execute 'grant select, insert, update, delete on public.courses to service_role';
    execute 'grant select, insert, update, delete on public.lessons to service_role';
    execute 'grant select, insert, update, delete on public.module_questions to service_role';
    execute 'grant select, insert, update, delete on public.exam_questions to service_role';
    execute 'grant select, insert, update, delete on public.progress to service_role';
    execute 'grant select, insert, update, delete on public.exam_attempts to service_role';
    execute 'grant select, insert, update, delete on public.certificates to service_role';
    execute 'grant select, insert, update, delete on public.payments to service_role';
    execute 'grant select, insert, update, delete on public.reviews to service_role';
    execute 'grant select, insert, update, delete on public.feedback to service_role';
    execute 'grant select, insert, update, delete on public.trainer_profiles to service_role';
    execute 'grant select, insert, update, delete on public.modules2 to service_role';
    execute 'grant select, insert, update, delete on public.lesson_parts to service_role';
    execute 'grant select, insert, update, delete on public.part_questions to service_role';
    execute 'grant select, insert, update, delete on public.part_progress to service_role';
    execute 'grant select, insert, update, delete on public.course_updates to service_role';
  end if;
end $$;
