-- Tests de schema.sql. Lancer avec : tests/sql/run.sh
\set ON_ERROR_STOP 1
\set QUIET 1
\pset tuples_only on
\pset format unaligned

create schema t;
grant usage on schema t to anon, authenticated;
-- Exécute une requête et vérifie qu'elle échoue avec le message attendu.
create function t.err(p_sql text, p_expected text) returns boolean language plpgsql as $$
begin
  execute p_sql;
  raise notice 'attendu "%", aucune erreur', p_expected;
  return false;
exception when others then
  if position(p_expected in sqlerrm) > 0 then return true; end if;
  raise notice 'attendu "%", obtenu "%"', p_expected, sqlerrm;
  return false;
end $$;
grant execute on function t.err(text, text) to anon, authenticated;

\set A '''aaaaaaaa-0000-0000-0000-000000000001'''
\set B '''bbbbbbbb-0000-0000-0000-000000000002'''
\set ADM '''dddddddd-0000-0000-0000-000000000009'''

insert into auth.users (id, email, raw_user_meta_data) values
  (:A, 'fanja@exemple.mg', '{"full_name":"Fanja Rakoto"}'),
  (:B, 'hery@exemple.mg', '{"full_name":"Hery Randria"}'),
  (:ADM, 'admin@vitako.mg', '{}');
update public.profiles set is_admin = true where id = :ADM;

-- Données de test : un métier, deux niveaux.
insert into public.courses (id, job_key, job_name, level, title, hours, published) values
  ('t-0-f', 't-0', 'Testeur', 'f', 'Testeur – Fondamentaux', 10, true),
  ('t-0-a', 't-0', 'Testeur', 'a', 'Testeur – Avancé', 14, true),
  ('t-1-f', 't-1', 'Autre', 'f', 'Autre – Fondamentaux', 10, false);
insert into public.lessons (course_id, module_index, title, body_md) values
  ('t-0-f', 0, 'Module 1', 'Texte 1'), ('t-0-f', 1, 'Module 2', 'Texte 2'), ('t-0-a', 0, 'Module 1', 'Texte A');
insert into public.module_questions (course_id, module_index, question, options, correct) values
  ('t-0-f', 0, 'Q?', '["a","b"]', 0);
insert into public.exam_questions (course_id, question, options, correct)
  select 't-0-f', 'Question ' || g, '["bonne","mauvaise","mauvaise","mauvaise"]', 0 from generate_series(1, 12) g;
insert into public.exam_questions (course_id, question, options, correct)
  select 't-0-a', 'Question A' || g, '["bonne","mauvaise"]', 0 from generate_series(1, 3) g;

\echo '--- Comptes et catalogue'
select count(*) = 3 and bool_and(full_name <> '') from public.profiles;
select full_name = 'Fanja Rakoto' from public.profiles where id = :A;

set role anon;
select count(*) = 3 from public.courses;
select count(*) = 0 from public.lessons;
select t.err('select * from public.profiles', 'permission denied');
select t.err('select public.submit_payment(''mvola'',''ABCDEF'')', 'permission denied');
reset role;

\echo '--- Étudiant sans abonnement'
set role authenticated; set request.jwt.claim.sub = 'aaaaaaaa-0000-0000-0000-000000000001';
select count(*) = 0 from public.lessons;
select count(*) = 0 from public.module_questions;
select t.err('select * from public.exam_questions', 'permission denied');
select t.err('update public.profiles set sub_end = now() + interval ''1 year''', 'permission denied');
select t.err('update public.profiles set is_admin = true', 'permission denied');
update public.profiles set full_name = 'Fanja Rakotomalala' where id = auth.uid();
update public.profiles set full_name = 'Fanja Rakoto' where id = auth.uid();
select count(*) = 1 from public.profiles;  -- ne voit que son profil
select t.err('insert into public.progress (user_id, course_id, module_index) values (auth.uid(), ''t-0-f'', 0)', 'row-level security');
select t.err('select public.start_exam(''t-0-f'')', 'no_access');

\echo '--- Déclaration de paiement'
select t.err('select public.submit_payment(''airtel'',''ABCDEF'')', 'bad_operator');
select t.err('select public.submit_payment(''mvola'',''AB'')', 'bad_reference');
select t.err('select public.submit_payment(''mvola'',''ABC DEF 123'',''0321234567'')', 'sender_operator_mismatch');
select t.err('select public.submit_payment(''mvola'',''ABCDEF123'',''03812'')', 'bad_sender');
select (public.submit_payment('mvola', ' mp241012.0915.b42817 ', null)).status = 'pending';
select reference = 'MP241012.0915.B42817' and sender is null and amount = public.current_price_ar() from public.payments;
select public.current_price_ar() = case when (now() at time zone 'Indian/Antananarivo')::date <= date '2026-11-30' then 30000 else 60000 end;
select t.err('select public.submit_payment(''orange'',''XYZ12345'')', 'already_pending');
select t.err('insert into public.payments (user_id, operator, reference, amount) values (auth.uid(), ''mvola'', ''ZZZZZZ'', 1)', 'permission denied');
select t.err('select public.admin_decide_payment((select id from public.payments limit 1), true)', 'forbidden');
reset role;
\echo '--- Promotion : fin automatique'
update public.settings set value = '2000-01-01' where key = 'promo_until';
select public.current_price_ar() = 60000;
update public.settings set value = '2999-12-31' where key = 'promo_until';
select public.current_price_ar() = 30000;
update public.settings set value = '2026-11-30' where key = 'promo_until';

set role authenticated; set request.jwt.claim.sub = 'bbbbbbbb-0000-0000-0000-000000000002';
select t.err('select public.submit_payment(''mvola'',''MP241012.0915.B42817'')', 'reference_used');
select count(*) = 0 from public.payments;  -- ne voit pas le paiement de Fanja
select (public.submit_payment('orange', 'CI241012.1200.A1', '032 12 345 67')).sender = '0321234567';
reset role;

\echo '--- Validation par l''administrateur'
set role authenticated; set request.jwt.claim.sub = 'dddddddd-0000-0000-0000-000000000009';
select count(*) = 2 from public.payments where status = 'pending';
select count(*) = 3 from public.profiles;
select (public.admin_decide_payment((select id from public.payments where reference = 'MP241012.0915.B42817'), true)).status = 'approved';
select t.err('select public.admin_decide_payment((select id from public.payments where reference = ''MP241012.0915.B42817''), false)', 'already_decided');
select (public.admin_decide_payment((select id from public.payments where reference = 'CI241012.1200.A1'), false, 'Montant incorrect')).reason = 'Montant incorrect';
select count(*) = 3 from public.lessons;  -- l'admin voit les leçons
reset role;
select sub_end between now() + interval '29 days 23 hours' and now() + interval '30 days 1 hour'
  from public.profiles where id = :A;
select sub_end is null from public.profiles where id = :B;

\echo '--- Référence refusée réutilisable'
set role authenticated; set request.jwt.claim.sub = 'bbbbbbbb-0000-0000-0000-000000000002';
select (public.submit_payment('orange', 'CI241012.1200.A1')).status = 'pending';
reset role;

\echo '--- Étudiante abonnée : leçons, progression, examen'
set role authenticated; set request.jwt.claim.sub = 'aaaaaaaa-0000-0000-0000-000000000001';
select count(*) = 3 from public.lessons;
select count(*) = 1 from public.module_questions;
select t.err('select public.start_exam(''t-0-f'')', 'modules_incomplete');
insert into public.progress (user_id, course_id, module_index) values (auth.uid(), 't-0-f', 0), (auth.uid(), 't-0-f', 1);
select t.err('insert into public.progress (user_id, course_id, module_index) values (auth.uid(), ''t-0-f'', 7)', 'row-level security');
select t.err('insert into public.progress (user_id, course_id, module_index) values (''bbbbbbbb-0000-0000-0000-000000000002'', ''t-0-f'', 0)', 'row-level security');
select t.err('select public.start_exam(''t-1-f'')', 'not_found');

select public.start_exam('t-0-f') as exam \gset
select jsonb_array_length(:'exam'::jsonb -> 'questions') = 10;
select not (:'exam'::jsonb::text like '%correct%');
-- Tout faux : 0/100, pas d'attestation.
select (public.submit_exam((:'exam'::jsonb ->> 'attempt_id')::uuid,
          (select jsonb_object_agg(q ->> 'id', 1) from jsonb_array_elements(:'exam'::jsonb -> 'questions') q))) as r \gset
select (:'r'::jsonb ->> 'score')::int = 0 and not (:'r'::jsonb ->> 'passed')::boolean and (:'r'::jsonb ->> 'certificate_id') is null;
select t.err('select public.submit_exam(''' || (:'exam'::jsonb ->> 'attempt_id') || '''::uuid, ''{}''::jsonb)', 'already_submitted');
select t.err('update public.exam_attempts set score = 100', 'permission denied');
select t.err('insert into public.certificates (id,user_id,kind,job_key,full_name,title) values (''X'',auth.uid(),''course'',''t-0'',''x'',''x'')', 'permission denied');

-- 5 bonnes réponses sur 10 : 50/100, réussi.
select public.start_exam('t-0-f') as exam \gset
select (public.submit_exam((:'exam'::jsonb ->> 'attempt_id')::uuid,
          (select jsonb_object_agg(q ->> 'id', case when n <= 5 then 0 else 2 end)
             from jsonb_array_elements(:'exam'::jsonb -> 'questions') with ordinality as e(q, n)))) as r \gset
select (:'r'::jsonb ->> 'score')::int = 50 and (:'r'::jsonb ->> 'passed')::boolean
   and (:'r'::jsonb ->> 'certificate_id') like 'VTK-%' and (:'r'::jsonb ->> 'attempts')::int = 2
   and (:'r'::jsonb ->> 'best')::int = 50 and (:'r'::jsonb ->> 'job_certificate_id') is null;

-- Réponses truquées (texte, index hors limites) : comptées fausses.
select public.start_exam('t-0-f') as exam \gset
select (public.submit_exam((:'exam'::jsonb ->> 'attempt_id')::uuid,
          (select jsonb_object_agg(q ->> 'id', 'bonne') from jsonb_array_elements(:'exam'::jsonb -> 'questions') q)) ->> 'score')::int = 0;

-- Meilleur score : 100, une seule attestation, score mis à jour.
select public.start_exam('t-0-f') as exam \gset
select (public.submit_exam((:'exam'::jsonb ->> 'attempt_id')::uuid,
          (select jsonb_object_agg(q ->> 'id', 0) from jsonb_array_elements(:'exam'::jsonb -> 'questions') q)) ->> 'score')::int = 100;
select count(*) = 1 and max(score) = 100 from public.certificates where kind = 'course';

\echo '--- Parcours complet (Fondamentaux + Avancé)'
insert into public.progress (user_id, course_id, module_index) values (auth.uid(), 't-0-a', 0);
select public.start_exam('t-0-a') as exam \gset
select jsonb_array_length(:'exam'::jsonb -> 'questions') = 3;
select (public.submit_exam((:'exam'::jsonb ->> 'attempt_id')::uuid,
          (select jsonb_object_agg(q ->> 'id', 0) from jsonb_array_elements(:'exam'::jsonb -> 'questions') q))) as r \gset
select (:'r'::jsonb ->> 'job_certificate_id') like 'VTK-%';
select count(*) = 3 from public.certificates;
select title = 'Testeur' and hours = 24 and full_name = 'Fanja Rakoto' from public.certificates where kind = 'job';
reset role;

\echo '--- Vérification publique et confidentialité'
select id as cert from public.certificates where kind = 'job' \gset
set role anon;
select (public.verify_certificate(lower(:'cert'))) ->> 'full_name' = 'Fanja Rakoto';
select public.verify_certificate('VTK-0000-NOPE') is null;
select t.err('select * from public.certificates', 'permission denied');
reset role;
set role authenticated; set request.jwt.claim.sub = 'bbbbbbbb-0000-0000-0000-000000000002';
select count(*) = 0 from public.certificates;
select count(*) = 0 from public.exam_attempts;
select count(*) = 0 from public.progress;
select count(*) = 0 from public.lessons;
reset role;

\echo '--- Abonnement expiré puis prolongation'
update public.profiles set sub_end = now() - interval '1 minute' where id = :A;
set role authenticated; set request.jwt.claim.sub = 'aaaaaaaa-0000-0000-0000-000000000001';
select count(*) = 0 from public.lessons;
select count(*) = 3 from public.certificates;  -- les attestations restent
select t.err('select public.start_exam(''t-0-f'')', 'no_access');
reset role;
update public.profiles set sub_end = now() + interval '10 days' where id = :A;
set role authenticated; set request.jwt.claim.sub = 'aaaaaaaa-0000-0000-0000-000000000001';
select (public.submit_payment('mvola', 'MP241112.0800.C1', '0381234567')).status = 'pending';
reset role;
set role authenticated; set request.jwt.claim.sub = 'dddddddd-0000-0000-0000-000000000009';
select (public.admin_decide_payment((select id from public.payments where reference = 'MP241112.0800.C1'), true)).access_until as until \gset
select :'until'::timestamptz between now() + interval '39 days 23 hours' and now() + interval '40 days 1 hour';
reset role;
\echo '--- Fin'

\echo '--- Statistiques administrateur'
set role authenticated; set request.jwt.claim.sub = 'aaaaaaaa-0000-0000-0000-000000000001';
select t.err('select public.admin_stats()', 'forbidden');
reset role;
set role authenticated; set request.jwt.claim.sub = 'dddddddd-0000-0000-0000-000000000009';
select (public.admin_stats()->'users'->>'total')::int >= 1;
select (public.admin_stats()->'payments'->>'approved')::int >= 1 and (public.admin_stats()->'payments'->>'revenue_total')::int > 0;
select jsonb_array_length(public.admin_stats()->'signups') = 30;
select jsonb_typeof(public.admin_stats()->'top_courses') = 'array';
reset role;
set role anon;
select t.err('select public.admin_stats()', 'permission denied');
reset role;

-- Avis après une attestation
set role authenticated; set request.jwt.claim.sub = 'bbbbbbbb-0000-0000-0000-000000000002';
select t.err('select public.submit_review(''t-0-f'', 5, ''Super'')', 'no_certificate');
select t.err('insert into public.reviews (user_id, course_id, rating) values (auth.uid(), ''t-0-f'', 5)', 'permission denied');
select t.err('select public.admin_reviews()', 'forbidden');
reset role;
set role authenticated; set request.jwt.claim.sub = 'aaaaaaaa-0000-0000-0000-000000000001';
select t.err('select public.submit_review(''t-0-f'', 6, '''')', 'bad_rating');
select (public.submit_review('t-0-f', 4, '  Très claire  ', true)).comment = 'Très claire';
select (public.submit_review('t-0-f', 5, 'Encore mieux', false)).rating = 5;   -- modification, pas de doublon
select count(*) = 1 from public.reviews;
reset role;
set role authenticated; set request.jwt.claim.sub = 'bbbbbbbb-0000-0000-0000-000000000002';
select count(*) = 0 from public.reviews;   -- ne voit pas l'avis des autres
reset role;
set role authenticated; set request.jwt.claim.sub = 'dddddddd-0000-0000-0000-000000000009';
select jsonb_array_length(public.admin_reviews()) = 1 and public.admin_reviews()->0->>'full_name' = 'Fanja Rakoto' and (public.admin_reviews()->0->>'rating')::int = 5;
reset role;
set role anon;
select t.err('select public.submit_review(''t-0-f'', 5)', 'permission denied');
reset role;

-- E-mail à l'étudiant après la décision de l'administrateur (sans clé Resend : rien n'est envoyé, rien ne bloque)
select exists (select 1 from pg_trigger where tgname = 'payments_decision_email');
select public.mail_from() = 'Vitako <onboarding@resend.dev>';

-- Remarques
set role anon;
select public.submit_feedback('site', 'Le site est très clair, merci !', 'visiteur@exemple.mg', '/') is not null;
select t.err('select public.submit_feedback(''site'', ''court'')', 'message_too_short');
select t.err('select public.submit_feedback(''nimporte'', ''Un message assez long'')', 'bad_category');
select t.err('select public.submit_feedback(''site'', ''Un message assez long'', ''pas-un-email'')', 'bad_email');
select t.err('select * from public.feedback', 'permission denied');
select t.err('select public.admin_feedback()', 'permission denied');
reset role;
set role authenticated; set request.jwt.claim.sub = 'aaaaaaaa-0000-0000-0000-000000000001';
select public.submit_feedback('bug', 'Le bouton examen ne répond pas sur mon téléphone.') is not null;
select t.err('select public.admin_feedback()', 'forbidden');
reset role;
set role authenticated; set request.jwt.claim.sub = 'dddddddd-0000-0000-0000-000000000009';
select jsonb_array_length(public.admin_feedback()) = 2 and public.admin_feedback_new_count() = 2;
select (public.admin_feedback()->0->>'full_name') = 'Fanja Rakoto' and (public.admin_feedback()->0->>'email') is not null;
select public.admin_feedback_mark((public.admin_feedback()->0->>'id')::uuid, true);
select public.admin_feedback_new_count() = 1;
reset role;

\echo '--- Formateurs : inscription et profil'
\set T '''eeeeeeee-0000-0000-0000-000000000005'''
\set X '''ffffffff-0000-0000-0000-000000000006'''
insert into auth.users (id, email, raw_user_meta_data) values
  (:T, 'tiana@exemple.mg', '{"full_name":"Tiana Rasoa","role":"trainer"}'),
  (:X, 'malin@exemple.mg', '{"full_name":"Malin","role":"admin"}');
select role = 'trainer' from public.profiles where id = :T;
select role = 'student' and not is_admin from public.profiles where id = :X;   -- seul « trainer » est accepté

set role authenticated; set request.jwt.claim.sub = 'eeeeeeee-0000-0000-0000-000000000005';
select t.err('update public.profiles set role = ''student'' where id = auth.uid()', 'permission denied');
select t.err('select public.submit_payment(''mvola'',''MPFORM.0001'')', 'trainer_profile_incomplete');
select t.err('select public.save_trainer_profile(''{"domains":["inconnu"]}'')', 'bad_domain');
select t.err('select public.save_trainer_profile(''{"whatsapp":"12"}'')', 'bad_phone');
select t.err('select public.save_trainer_profile(''{"facebook":"javascript:alert(1)"}'')', 'bad_link');
select t.err('select public.save_trainer_profile(''{"email":"pas-un-email"}'')', 'bad_email');
select t.err('select public.save_trainer_profile(jsonb_build_object(''bio'', repeat(''x'', 1501)))', 'bio_too_long');
select (public.save_trainer_profile('{"headline":"Graphiste freelance","domains":["t"]}')).status = 'draft';
-- Tout est rempli sauf la photo : encore à compléter
select (public.save_trainer_profile('{"headline":"  Graphiste   freelance ","bio":"Graphiste depuis 6 ans, j''accompagne les débutants pas à pas.","domains":["t","t"],"whatsapp":"034 12 345 67","facebook":"facebook.com/tiana","rates":"20 000 Ar la séance"}')).status = 'draft';
select headline = 'Graphiste freelance' and domains = '{t}' and whatsapp = '0341234567' and facebook = 'https://facebook.com/tiana'
  from public.trainer_profiles where user_id = auth.uid();
-- La photo de profil complète le profil : il passe en attente de validation
update public.profiles set avatar_url = 'https://abc.supabase.co/storage/v1/object/public/avatars/eeeeeeee-0000-0000-0000-000000000005/avatar.webp' where id = auth.uid();
select status = 'pending' from public.trainer_profiles where user_id = auth.uid();
select t.err('update public.trainer_profiles set status = ''approved''', 'permission denied');
select t.err('select public.set_trainer_image(''cover'', ''https://evil.example/cover.webp'')', 'bad_image');
select t.err('select public.set_trainer_image(''cover'', ''https://abc.supabase.co/storage/v1/object/public/covers/aaaaaaaa-0000-0000-0000-000000000001/cover.webp'')', 'bad_image');
select (public.set_trainer_image('cover', 'https://abc.supabase.co/storage/v1/object/public/covers/eeeeeeee-0000-0000-0000-000000000005/cover.webp?v=123')).cover_url like '%/cover.webp?v=123';
select (public.set_trainer_image('visual', 'https://abc.supabase.co/storage/v1/object/public/avatars/eeeeeeee-0000-0000-0000-000000000005/visuel.jpg')).visual_url is not null;
select not (public.get_trainer(auth.uid()) ->> 'visible')::boolean and public.get_trainer(auth.uid()) ->> 'status' = 'pending';  -- aperçu
select (public.submit_payment('mvola', 'MPFORM.0001')).status = 'pending';
reset role;

set role anon; set request.jwt.claim.sub = '';
select public.get_trainer(:T) is null;
select jsonb_array_length(public.list_trainers()) = 0;
select t.err('select * from public.trainer_profiles', 'permission denied');
select t.err('select public.become_trainer()', 'permission denied');
reset role;
set role authenticated; set request.jwt.claim.sub = 'bbbbbbbb-0000-0000-0000-000000000002';
select public.get_trainer(:T) is null;
select count(*) = 0 from public.trainer_profiles;
select t.err('select public.admin_decide_trainer(''eeeeeeee-0000-0000-0000-000000000005'', true)', 'forbidden');
select t.err('select public.admin_trainers()', 'forbidden');
select t.err('select public.save_trainer_profile(''{}'')', 'not_trainer');
reset role;

\echo '--- Formateurs : validation du paiement et du profil en même temps'
set role authenticated; set request.jwt.claim.sub = 'dddddddd-0000-0000-0000-000000000009';
select public.admin_trainers() -> 0 ->> 'status' = 'pending' and (public.admin_trainers() -> 0 ->> 'has_pending_payment')::boolean;
select public.admin_trainer_todo() = 0;   -- son paiement est en attente : il se valide depuis l'onglet Paiements
select (public.admin_decide_payment((select id from public.payments where reference = 'MPFORM.0001'), true)).status = 'approved';
select (public.admin_decide_trainer(:T, true)).status = 'approved';
reset role;

set role anon; set request.jwt.claim.sub = '';
select public.get_trainer(:T) ->> 'headline' = 'Graphiste freelance' and public.get_trainer(:T) -> 'contacts' is null and public.get_trainer(:T) -> 'status' is null;
select jsonb_array_length(public.list_trainers()) = 1 and public.list_trainers() -> 0 ->> 'full_name' = 'Tiana Rasoa' and public.list_trainers() -> 0 -> 'whatsapp' is null;
reset role;
set role authenticated; set request.jwt.claim.sub = 'bbbbbbbb-0000-0000-0000-000000000002';
select public.get_trainer(:T) -> 'contacts' ->> 'whatsapp' = '0341234567' and public.get_trainer(:T) -> 'contacts' ->> 'facebook' = 'https://facebook.com/tiana';
reset role;

\echo '--- Formateurs : modifié (reste visible), masqué par l''admin, corrigé (repart en validation)'
set role authenticated; set request.jwt.claim.sub = 'eeeeeeee-0000-0000-0000-000000000005';
select (public.save_trainer_profile('{"headline":"Graphiste et illustratrice","bio":"Graphiste depuis 6 ans, j''accompagne les débutants pas à pas.","domains":["t"],"whatsapp":"0341234567"}')).status = 'approved';
reset role;
set role authenticated; set request.jwt.claim.sub = 'dddddddd-0000-0000-0000-000000000009';
select (public.admin_decide_trainer(:T, false, 'Photo inadaptée')).reason = 'Photo inadaptée';
reset role;
set role anon; set request.jwt.claim.sub = '';
select public.get_trainer(:T) is null;
reset role;
set role authenticated; set request.jwt.claim.sub = 'eeeeeeee-0000-0000-0000-000000000005';
select public.get_trainer(auth.uid()) ->> 'reason' = 'Photo inadaptée';
update public.profiles set avatar_url = 'https://abc.supabase.co/storage/v1/object/public/avatars/eeeeeeee-0000-0000-0000-000000000005/avatar.jpg' where id = auth.uid();
select status = 'pending' from public.trainer_profiles where user_id = auth.uid();   -- nouvelle photo : repart en validation
reset role;
set role authenticated; set request.jwt.claim.sub = 'dddddddd-0000-0000-0000-000000000009';
select public.admin_trainer_todo() = 1;
select (public.admin_decide_trainer(:T, true)).status = 'approved';
select public.admin_trainer_todo() = 0;
reset role;

\echo '--- Formateurs : abonnement terminé, profil masqué'
update public.profiles set sub_end = now() - interval '1 minute' where id = :T;
set role anon; set request.jwt.claim.sub = '';
select public.get_trainer(:T) is null and jsonb_array_length(public.list_trainers()) = 0;
reset role;

\echo '--- Un étudiant devient formateur'
set role authenticated; set request.jwt.claim.sub = 'bbbbbbbb-0000-0000-0000-000000000002';
select count(*) = 1 from (select public.become_trainer()) x;
select role = 'trainer' from public.profiles where id = auth.uid();
select t.err('select public.submit_payment(''orange'',''CI241020.0800.Z9'')', 'trainer_profile_incomplete');
reset role;
set role authenticated; set request.jwt.claim.sub = 'dddddddd-0000-0000-0000-000000000009';
select t.err('select public.admin_decide_trainer(''bbbbbbbb-0000-0000-0000-000000000002'', true)', 'trainer_profile_incomplete');
select jsonb_array_length(public.admin_trainers()) = 2;
reset role;
