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
