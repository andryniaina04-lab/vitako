-- Migration du 14/10/2026 : e-mail à l'étudiant quand l'administrateur valide (ou refuse) son paiement.
-- Rejouable sans risque : exécutée par GitHub Actions avant seed.sql.
--
-- Utilise la même clé Resend que l'e-mail à l'administrateur (secret Vault « resend_api_key »).
-- Adresse d'expédition : secret Vault facultatif « mail_from », par exemple
--   select vault.create_secret('Vitako <contact@vitako.mg>', 'mail_from');
-- Important : avec l'adresse de test de Resend (onboarding@resend.dev), Resend n'envoie qu'à l'adresse
-- du propriétaire du compte Resend. Pour écrire aux étudiants, il faut vérifier un nom de domaine dans
-- Resend (par exemple vitako.mg), puis créer le secret « mail_from » avec une adresse de ce domaine.
-- Un problème d'envoi ne bloque jamais la validation du paiement.

create or replace function public.mail_from()
returns text language plpgsql stable security definer set search_path = public as $$
declare v text;
begin
  begin
    select decrypted_secret into v from vault.decrypted_secrets where name = 'mail_from' limit 1;
  exception when others then v := null;
  end;
  return coalesce(nullif(trim(v), ''), 'Vitako <onboarding@resend.dev>');
end $$;
revoke execute on function public.mail_from() from public, anon, authenticated;

create or replace function public.notify_payment_decision()
returns trigger language plpgsql security definer set search_path = public as $$
declare
  v_key   text;
  v_name  text;
  v_email text;
  v_first text;
  v_op    text := case new.operator when 'mvola' then 'MVola' when 'orange' then 'Orange Money' else new.operator end;
  v_amt   text := replace(to_char(new.amount, 'FM999G999G999'), ',', ' ') || ' Ar';
  v_until text := to_char(new.access_until at time zone 'Indian/Antananarivo', 'DD/MM/YYYY');
  v_subj  text;
  v_html  text;
begin
  if old.status <> 'pending' or new.status not in ('approved', 'rejected') then
    return new;
  end if;
  begin
    select decrypted_secret into v_key from vault.decrypted_secrets where name = 'resend_api_key' limit 1;
    if v_key is null then return new; end if;
    select full_name, email into v_name, v_email from public.profiles where id = new.user_id;
    if v_email is null then return new; end if;
    v_first := split_part(coalesce(v_name, ''), ' ', 1);

    if new.status = 'approved' then
      v_subj := 'Vitako : votre accès est activé jusqu''au ' || v_until;
      v_html := '<div style="font-family:Arial,sans-serif;font-size:15px;color:#13241B;line-height:1.5">'
        || '<h2 style="margin:0 0 12px;color:#0B7A55">Votre accès est activé</h2>'
        || '<p>Bonjour ' || public.html_escape(v_first) || ',</p>'
        || '<p>Votre paiement ' || public.html_escape(v_op) || ' de <b>' || v_amt || '</b> (réf. '
        || public.html_escape(new.reference) || ') a été validé.</p>'
        || '<p>Vous avez accès à toutes les formations Vitako jusqu''au <b>' || v_until || '</b>.</p>'
        || '<p><a href="https://vitako.vercel.app/#/formations" style="display:inline-block;background:#0B7A55;color:#fff;padding:10px 18px;border-radius:8px;text-decoration:none;font-weight:bold">Commencer une formation</a></p>'
        || '<p style="color:#56665C;font-size:13px">Bonne formation ! L''équipe Vitako</p></div>';
    else
      v_subj := 'Vitako : votre paiement n''a pas pu être validé';
      v_html := '<div style="font-family:Arial,sans-serif;font-size:15px;color:#13241B;line-height:1.5">'
        || '<h2 style="margin:0 0 12px;color:#B42318">Paiement non validé</h2>'
        || '<p>Bonjour ' || public.html_escape(v_first) || ',</p>'
        || '<p>Nous n''avons pas pu valider votre paiement ' || public.html_escape(v_op) || ' (réf. '
        || public.html_escape(new.reference) || ').</p>'
        || '<p>Motif : <b>' || public.html_escape(new.reason) || '</b></p>'
        || '<p>Vérifiez la référence dans le SMS de confirmation, puis envoyez une nouvelle demande :</p>'
        || '<p><a href="https://vitako.vercel.app/#/abonnement" style="display:inline-block;background:#0B7A55;color:#fff;padding:10px 18px;border-radius:8px;text-decoration:none;font-weight:bold">Renvoyer ma référence</a></p>'
        || '<p style="color:#56665C;font-size:13px">L''équipe Vitako</p></div>';
    end if;

    perform net.http_post(
      url     := 'https://api.resend.com/emails',
      headers := jsonb_build_object('Authorization', 'Bearer ' || v_key, 'Content-Type', 'application/json'),
      body    := jsonb_build_object('from', public.mail_from(), 'to', jsonb_build_array(v_email), 'subject', v_subj, 'html', v_html)
    );
  exception when others then
    raise warning 'notify_payment_decision : e-mail non envoyé (%)', sqlerrm;
  end;
  return new;
end;
$$;
revoke execute on function public.notify_payment_decision() from public, anon, authenticated;

drop trigger if exists payments_decision_email on public.payments;
create trigger payments_decision_email
  after update of status on public.payments
  for each row execute function public.notify_payment_decision();
