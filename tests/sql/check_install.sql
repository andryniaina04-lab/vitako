select
  (select count(*) from pg_tables where schemaname = 'public' and rowsecurity) as securite,
  (select count(*) from pg_policies where schemaname = 'public') as regles,
  (select count(*) from pg_proc p join pg_namespace n on n.oid = p.pronamespace
     where n.nspname = 'public' and p.proname in ('is_admin','has_access','setting_int','handle_new_user',
     'new_certificate_id','submit_payment','admin_decide_payment','start_exam','submit_exam','verify_certificate')) as fonctions,
  (select count(*) from pg_trigger where tgname = 'on_auth_user_created') as declencheur,
  not has_function_privilege('anon', 'public.submit_exam(uuid,jsonb)', 'execute') as droits_ok,
  (select count(*) from public.courses) as formations,
  (select count(*) from public.exam_questions) as questions;
