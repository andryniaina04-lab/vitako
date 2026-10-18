-- Migration du 18/10/2026 : chaque mise à jour d'une formation est envoyée par e-mail immédiatement,
-- sans la limite d'un e-mail par formation toutes les 24 heures (offre Resend payante).
-- Rejouable sans risque.

-- Enregistre une mise à jour et envoie les e-mails (par lots de 100 avec l'envoi groupé de Resend).
create or replace function public.announce_course_update(p_course text, p_kind text, p_note text default null)
returns bigint language plpgsql security definer set search_path = public as $$
declare
  v_id    bigint;
  v_title text;
  v_note  text;
  v_key   text;
  v_subj  text;
  v_n     int := 0;
  v_sent  int := 0;
  v_batch jsonb := '[]'::jsonb;
  r       record;
begin
  select title into v_title from public.courses where id = p_course and published;
  if v_title is null then return null; end if;
  v_note := coalesce(nullif(trim(p_note), ''), case when p_kind = 'new_version'
    then 'Nouvelle version : 6 modules, des leçons plus courtes avec schémas, tableaux, exercices et un QCM corrigé à chaque leçon. Votre progression a été conservée.'
    else 'Le contenu de la formation a été amélioré. Votre progression est conservée.' end);
  insert into public.course_updates (course_id, kind, note) values (p_course, p_kind, v_note) returning id into v_id;
  select count(*) into v_n from public.course_update_recipients(p_course);
  update public.course_updates set recipients = v_n where id = v_id;

  begin
    select decrypted_secret into v_key from vault.decrypted_secrets where name = 'resend_api_key' limit 1;
    if v_key is null or v_n = 0 then return v_id; end if;
    v_subj := case when p_kind = 'new_version' then 'Vitako : nouvelle version de « ' || v_title || ' »'
                   else 'Vitako : « ' || v_title || ' » a été mise à jour' end;
    for r in
      select x.* from public.course_update_recipients(p_course) x
       where x.email is not null
    loop
      v_batch := v_batch || jsonb_build_array(jsonb_build_object(
        'from', public.mail_from(), 'to', jsonb_build_array(r.email), 'subject', v_subj,
        'html', '<div style="font-family:Arial,sans-serif;font-size:15px;color:#13241B;line-height:1.5">'
          || '<h2 style="margin:0 0 12px;color:#0B7A55">' || case when p_kind = 'new_version' then 'Nouvelle version disponible' else 'Formation mise à jour' end || '</h2>'
          || '<p>Bonjour ' || public.html_escape(split_part(coalesce(r.full_name, ''), ' ', 1)) || ',</p>'
          || '<p>La formation <b>' || public.html_escape(v_title) || '</b>, que vous avez commencée, vient d''être mise à jour.</p>'
          || '<p>' || public.html_escape(v_note) || '</p>'
          || '<p><a href="https://vitako.mg/#/formation/' || p_course || '" style="display:inline-block;background:#0B7A55;color:#fff;padding:10px 18px;border-radius:8px;text-decoration:none;font-weight:bold">Voir la formation</a></p>'
          || '<p style="color:#56665C;font-size:13px">Vous recevez ce message parce que vous suivez cette formation sur Vitako. L''équipe Vitako</p></div>'));
      v_sent := v_sent + 1;
      if jsonb_array_length(v_batch) = 100 then
        perform net.http_post(url := 'https://api.resend.com/emails/batch',
          headers := jsonb_build_object('Authorization', 'Bearer ' || v_key, 'Content-Type', 'application/json'), body := v_batch);
        v_batch := '[]'::jsonb;
      end if;
    end loop;
    if jsonb_array_length(v_batch) > 0 then
      perform net.http_post(url := 'https://api.resend.com/emails/batch',
        headers := jsonb_build_object('Authorization', 'Bearer ' || v_key, 'Content-Type', 'application/json'), body := v_batch);
    end if;
    update public.course_updates set emailed = v_sent where id = v_id;
  exception when others then
    raise warning 'announce_course_update : e-mails non envoyés (%)', sqlerrm;
  end;
  return v_id;
end $$;
revoke execute on function public.announce_course_update(text, text, text) from public, anon, authenticated;
