-- Migration du 17/10/2026 : un formateur peut revenir en compte étudiant.
-- Rejouable sans risque. Il garde son abonnement, ses cours et ses attestations.
-- Son profil formateur est retiré des listes (public et administrateur) mais conservé :
-- s'il redevient formateur, il le retrouve, et le profil repart en validation.

create or replace function public.leave_trainer()
returns void language plpgsql security definer set search_path = public as $$
declare v_uid uuid := auth.uid();
begin
  if v_uid is null then raise exception 'not_authenticated'; end if;
  update public.profiles set role = 'student' where id = v_uid;
  update public.trainer_profiles set status = 'draft', reason = null, decided_at = null, updated_at = now() where user_id = v_uid;
end $$;

create or replace function public.become_trainer()
returns void language plpgsql security definer set search_path = public as $$
declare v_uid uuid := auth.uid();
begin
  if v_uid is null then raise exception 'not_authenticated'; end if;
  update public.profiles set role = 'trainer' where id = v_uid;
  insert into public.trainer_profiles (user_id) values (v_uid) on conflict (user_id) do nothing;
  perform public.trainer_refresh_status(v_uid);
end $$;

revoke execute on function public.leave_trainer()  from public, anon;
revoke execute on function public.become_trainer() from public, anon;
grant  execute on function public.leave_trainer()  to authenticated;
grant  execute on function public.become_trainer() to authenticated;
