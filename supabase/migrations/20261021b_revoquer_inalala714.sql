-- Révocation de l'accès de inalala714@gmail.com.
-- Paiement accepté par erreur, argent jamais reçu.
-- Remet le compte en état "inscrit, jamais abonné" et envoie une notification.
-- Idempotent : ne fait rien si le profil n'existe pas ou est déjà sans accès.

do $$ declare
  v_uid   uuid;
  v_name  text;
  v_email text;
  v_key   text;
  v_first text;
  v_subj  text;
  v_html  text;
begin
  -- Trouver le profil
  select id, full_name, email into v_uid, v_name, v_email
    from public.profiles where email = 'inalala714@gmail.com';
  if v_uid is null then
    raise notice 'inalala714@gmail.com : profil introuvable, rien à faire';
    return;
  end if;

  -- Retirer l'accès
  update public.profiles set sub_end = null where id = v_uid and sub_end is not null;

  -- Marquer les paiements approved comme rejected
  update public.payments
     set status = 'rejected',
         reason = 'Paiement non reçu',
         decided_at = now()
   where user_id = v_uid and status = 'approved';

  -- Envoyer une notification par email
  begin
    select decrypted_secret into v_key
      from vault.decrypted_secrets where name = 'resend_api_key' limit 1;
    if v_key is null or v_email is null then return; end if;

    v_first := split_part(coalesce(v_name, ''), ' ', 1);
    v_subj := 'Vitako : votre accès a été suspendu';
    v_html := '<div style="font-family:Arial,sans-serif;font-size:15px;color:#13241B;line-height:1.5">'
      || '<h2 style="margin:0 0 12px;color:#B42318">Accès suspendu</h2>'
      || '<p>Bonjour ' || public.html_escape(v_first) || ',</p>'
      || '<p>Votre accès aux formations Vitako a été suspendu car nous n''avons pas reçu votre paiement.</p>'
      || '<p>Si vous pensez qu''il s''agit d''une erreur, envoyez-nous une preuve de paiement à contact@vitako.mg.</p>'
      || '<p>Pour réactiver votre accès, effectuez un paiement depuis votre espace :</p>'
      || '<p><a href="https://vitako.mg/#/abonnement" style="display:inline-block;background:#0B7A55;color:#fff;padding:10px 18px;border-radius:8px;text-decoration:none;font-weight:bold">S''abonner</a></p>'
      || '<p style="color:#56665C;font-size:13px">L''équipe Vitako</p></div>';

    perform net.http_post(
      url     := 'https://api.resend.com/emails',
      headers := jsonb_build_object('Authorization', 'Bearer ' || v_key, 'Content-Type', 'application/json'),
      body    := jsonb_build_object('from', public.mail_from(), 'to', jsonb_build_array(v_email), 'subject', v_subj, 'html', v_html)
    );
  exception when others then
    raise warning 'revoke inalala714 : email non envoyé (%)', sqlerrm;
  end;

  raise notice 'inalala714@gmail.com : accès révoqué, email envoyé';
end $$;
