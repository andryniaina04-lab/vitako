-- Migration du 16/10/2026 : e-mails automatiques signés Vitako.
-- Rejouable sans risque : exécutée par GitHub Actions avant seed.sql.
--
-- 1. Signature Vitako (logo, contact, réseaux sociaux) en bas des e-mails à l'administrateur et aux étudiants.
-- 2. L'e-mail à l'administrateur part aussi de l'adresse du secret Vault « mail_from » (avant : toujours
--    onboarding@resend.dev). Répondre à cet e-mail écrit directement à l'étudiant.
-- 3. Quand un étudiant répond à « accès activé » ou « paiement non validé », la réponse arrive sur contact@vitako.mg.
--
-- Rappel : tant que le domaine vitako.mg n'est pas « Verified » dans Resend, ne créez PAS le secret « mail_from »
-- avec une adresse @vitako.mg : Resend refuserait tous les envois.

create or replace function public.mail_signature()
returns text language sql immutable as $sig$
  select '<div style="margin-top:28px;padding-top:16px;border-top:1px solid #D9E2D7"><table cellpadding="0" cellspacing="0" border="0" role="presentation" style="border-collapse:collapse;font-family:''Figtree'', Arial, Helvetica, sans-serif;color:#13241B;">
  <tr>
    <td style="vertical-align:middle;padding:0 18px 0 0;border-right:2px solid #0B7A55;"><a href="https://vitako.mg" target="_blank" style="text-decoration:none;"><img src="https://vitako.vercel.app/assets/img/email/vitako-logo-email.png" width="162" height="32" alt="Vitako" style="display:block;border:0;width:162px;height:32px;"></a></td>
    <td style="vertical-align:middle;padding:2px 0 2px 18px;">
      <div style="font-family:''Figtree'', Arial, Helvetica, sans-serif;font-size:13px;line-height:18px;">
        <a href="mailto:contact@vitako.mg" style="color:#0B7A55;text-decoration:none;">contact@vitako.mg</a><span style="color:#D9E2D7;">&nbsp;&nbsp;|&nbsp;&nbsp;</span><a href="https://vitako.mg" target="_blank" style="color:#0B7A55;text-decoration:none;font-weight:bold;">vitako.mg</a>
      </div>
      <table cellpadding="0" cellspacing="0" border="0" role="presentation" style="border-collapse:collapse;margin-top:10px;"><tr><td style="padding:0 6px 0 0;"><a href="https://www.facebook.com/vitako.mg" target="_blank" style="text-decoration:none;"><img src="https://vitako.vercel.app/assets/img/email/facebook.png" width="24" height="24" alt="Facebook" style="display:block;border:0;width:24px;height:24px;"></a></td><td style="padding:0 6px 0 0;"><a href="https://www.instagram.com/vitako.mg" target="_blank" style="text-decoration:none;"><img src="https://vitako.vercel.app/assets/img/email/instagram.png" width="24" height="24" alt="Instagram" style="display:block;border:0;width:24px;height:24px;"></a></td><td style="padding:0 6px 0 0;"><a href="https://www.tiktok.com/@vitako.mg" target="_blank" style="text-decoration:none;"><img src="https://vitako.vercel.app/assets/img/email/tiktok.png" width="24" height="24" alt="TikTok" style="display:block;border:0;width:24px;height:24px;"></a></td><td style="padding:0 6px 0 0;"><a href="https://www.linkedin.com/company/vitako-mg" target="_blank" style="text-decoration:none;"><img src="https://vitako.vercel.app/assets/img/email/linkedin.png" width="24" height="24" alt="LinkedIn" style="display:block;border:0;width:24px;height:24px;"></a></td><td style="padding:0 0px 0 0;"><a href="https://www.youtube.com/@vitako.mg" target="_blank" style="text-decoration:none;"><img src="https://vitako.vercel.app/assets/img/email/youtube.png" width="24" height="24" alt="YouTube" style="display:block;border:0;width:24px;height:24px;"></a></td></tr></table>
    </td>
  </tr>
</table>
<table cellpadding="0" cellspacing="0" border="0" role="presentation" style="border-collapse:collapse;">
  <tr>
    <td style="padding-top:12px;font-family:''Figtree'', Arial, Helvetica, sans-serif;font-size:12px;line-height:17px;">
      <span style="color:#0B7A55;font-weight:bold;">Apprends un métier, travaille à distance.</span><span style="color:#56665C;">&nbsp;&nbsp;111 formations · 13 domaines · attestation</span>
    </td>
  </tr>
</table></div>'::text;
$sig$;
revoke execute on function public.mail_signature() from public, anon, authenticated;

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
    v_html := v_html || public.mail_signature();

    perform net.http_post(
      url     := 'https://api.resend.com/emails',
      headers := jsonb_build_object('Authorization', 'Bearer ' || v_key, 'Content-Type', 'application/json'),
      body    := jsonb_build_object(
        'from', public.mail_from(),
        'to', jsonb_build_array(v_to),
        'reply_to', coalesce(nullif(v_email, ''), 'contact@vitako.mg'),
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

    v_html := v_html || public.mail_signature();

    perform net.http_post(
      url     := 'https://api.resend.com/emails',
      headers := jsonb_build_object('Authorization', 'Bearer ' || v_key, 'Content-Type', 'application/json'),
      body    := jsonb_build_object('from', public.mail_from(), 'reply_to', 'contact@vitako.mg', 'to', jsonb_build_array(v_email), 'subject', v_subj, 'html', v_html)
    );
  exception when others then
    raise warning 'notify_payment_decision : e-mail non envoyé (%)', sqlerrm;
  end;
  return new;
end;
$$;
revoke execute on function public.notify_payment_decision() from public, anon, authenticated;
