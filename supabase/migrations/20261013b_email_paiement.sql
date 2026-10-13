-- Migration du 13/10/2026 : e-mail à l'administrateur à chaque nouvelle demande de paiement.
-- Rejouable sans risque : exécutée par GitHub Actions avant seed.sql.
--
-- Envoi par Resend (https://resend.com) via l'extension pg_net de Supabase.
-- La clé et l'adresse de destination ne sont PAS dans ce fichier : elles sont rangées
-- dans le coffre-fort de Supabase (Vault), une seule fois, depuis le SQL Editor :
--   select vault.create_secret('re_...votre clé...', 'resend_api_key');
--   select vault.create_secret('votre.adresse@gmail.com', 'notify_email');
-- Tant que ces deux secrets n'existent pas, rien n'est envoyé et les paiements fonctionnent normalement.
-- Un problème d'envoi ne bloque jamais la demande de paiement de l'étudiant.

do $$
begin
  if exists (select 1 from pg_available_extensions where name = 'pg_net') then
    create extension if not exists pg_net with schema extensions;
  end if;
end $$;

-- Échappe un texte pour l'insérer dans le corps HTML de l'e-mail.
create or replace function public.html_escape(p text)
returns text language sql immutable as $$
  select replace(replace(replace(replace(coalesce(p, ''), '&', '&amp;'), '<', '&lt;'), '>', '&gt;'), '"', '&quot;');
$$;

create or replace function public.notify_new_payment()
returns trigger language plpgsql security definer set search_path = public as $$
declare
  v_key   text;
  v_to    text;
  v_name  text;
  v_email text;
  v_op    text := case new.operator when 'mvola' then 'MVola' when 'orange' then 'Orange Money' else new.operator end;
  v_amt   text := replace(to_char(new.amount, 'FM999G999G999'), ',', ' ') || ' Ar';
  v_when  text := to_char(new.created_at at time zone 'Indian/Antananarivo', 'DD/MM/YYYY à HH24:MI');
  v_html  text;
begin
  begin
    select decrypted_secret into v_key from vault.decrypted_secrets where name = 'resend_api_key' limit 1;
    select decrypted_secret into v_to  from vault.decrypted_secrets where name = 'notify_email'   limit 1;
    if v_key is null or v_to is null then
      return new;
    end if;
    select full_name, email into v_name, v_email from public.profiles where id = new.user_id;

    v_html := '<div style="font-family:Arial,sans-serif;font-size:15px;color:#13241B">'
      || '<h2 style="margin:0 0 12px;color:#0B7A55">Nouvelle demande de paiement</h2>'
      || '<table cellpadding="6" style="border-collapse:collapse">'
      || '<tr><td style="color:#56665C">Étudiant</td><td><b>' || public.html_escape(v_name) || '</b></td></tr>'
      || '<tr><td style="color:#56665C">E-mail</td><td>' || public.html_escape(v_email) || '</td></tr>'
      || '<tr><td style="color:#56665C">Opérateur</td><td>' || public.html_escape(v_op) || '</td></tr>'
      || '<tr><td style="color:#56665C">Référence</td><td><b style="font-family:monospace;font-size:16px">' || public.html_escape(new.reference) || '</b></td></tr>'
      || '<tr><td style="color:#56665C">Numéro expéditeur</td><td>' || coalesce(public.html_escape(new.sender), 'non indiqué') || '</td></tr>'
      || '<tr><td style="color:#56665C">Montant attendu</td><td><b>' || v_amt || '</b></td></tr>'
      || '<tr><td style="color:#56665C">Envoyée le</td><td>' || v_when || '</td></tr>'
      || '</table>'
      || '<p>Vérifiez la référence et le montant dans votre application ' || public.html_escape(v_op)
      || ', puis validez ou refusez la demande :</p>'
      || '<p><a href="https://vitako.vercel.app/#/admin" style="display:inline-block;background:#0B7A55;color:#fff;padding:10px 18px;border-radius:8px;text-decoration:none;font-weight:bold">Ouvrir l''administration</a></p>'
      || '<p style="color:#56665C;font-size:13px">Ne validez jamais à partir d''une capture d''écran.</p></div>';

    perform net.http_post(
      url     := 'https://api.resend.com/emails',
      headers := jsonb_build_object('Authorization', 'Bearer ' || v_key, 'Content-Type', 'application/json'),
      body    := jsonb_build_object(
        'from', 'Vitako <onboarding@resend.dev>',
        'to', jsonb_build_array(v_to),
        'subject', 'Vitako : paiement ' || v_op || ' ' || v_amt || ' – réf. ' || new.reference,
        'html', v_html
      )
    );
  exception when others then
    raise warning 'notify_new_payment : e-mail non envoyé (%)', sqlerrm;
  end;
  return new;
end;
$$;

revoke execute on function public.notify_new_payment() from public, anon, authenticated;

drop trigger if exists payments_notify_email on public.payments;
create trigger payments_notify_email
  after insert on public.payments
  for each row execute function public.notify_new_payment();
