-- Migration du 18/10/2026 : prévenir les abonnés quand une formation qu'ils ont commencée ou terminée
-- est mise à jour (nouvelle version ou contenu modifié).
-- Rejouable sans risque : exécutée par GitHub Actions avant seed.sql.
--
-- Qui est prévenu : les personnes avec un abonnement actif (hors administrateurs) qui ont au moins
-- une partie terminée dans la formation, ou son attestation.
-- Comment : une notification dans la cloche du site (fonction my_course_updates) et un e-mail
-- (même clé Resend que les autres e-mails, secret Vault « resend_api_key »).
-- Au plus un e-mail par formation et par personne toutes les 24 heures, pour ne pas inonder les
-- abonnés quand on corrige plusieurs fois la même formation dans la journée.
-- Un problème d'envoi ne bloque jamais la mise à jour du contenu.

alter table public.courses add column if not exists content_hash text;

create table if not exists public.course_updates (
  id         bigserial primary key,
  course_id  text not null references public.courses (id) on delete cascade,
  kind       text not null check (kind in ('new_version', 'update')),
  note       text,
  recipients int not null default 0,
  emailed    int not null default 0,
  created_at timestamptz not null default now()
);
create index if not exists course_updates_course on public.course_updates (course_id, created_at desc);
alter table public.course_updates enable row level security;
revoke all on public.course_updates from anon, authenticated;
grant select on public.course_updates to authenticated;
drop policy if exists course_updates_admin on public.course_updates;
create policy course_updates_admin on public.course_updates for select to authenticated using (public.is_admin());

-- Personnes à prévenir pour une formation, et date à laquelle elles l'ont commencée.
create or replace function public.course_update_recipients(p_course text)
returns table (user_id uuid, email text, full_name text, started_at timestamptz)
language sql stable security definer set search_path = public as $$
  with s as (
    select pp.user_id, min(pp.completed_at) as t from public.part_progress pp where pp.course_id = p_course group by 1
    union all
    select pr.user_id, min(pr.completed_at) from public.progress pr where pr.course_id = p_course group by 1
    union all
    select c.user_id, min(c.issued_at) from public.certificates c where c.kind = 'course' and c.course_id = p_course group by 1
  )
  select p.id, p.email, p.full_name, min(s.t)
    from s join public.profiles p on p.id = s.user_id
   where not p.is_admin and p.sub_end is not null and p.sub_end > now()
   group by p.id, p.email, p.full_name;
$$;
revoke execute on function public.course_update_recipients(text) from public, anon, authenticated;

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
         and not exists (select 1 from public.course_updates u
                          where u.course_id = p_course and u.id <> v_id and u.emailed > 0
                            and u.created_at > now() - interval '24 hours')
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

-- Appelée par seed.sql avec l'empreinte du contenu visible de chaque formation :
-- {"design-0-f": {"h": "…", "note": "…"}, …}. Une empreinte qui change = une mise à jour.
-- Première fois (empreinte vide) : on enregistre sans prévenir.
-- Si plus de 10 formations changent d'un coup, c'est un changement technique : on enregistre sans prévenir.
create or replace function public.sync_course_hashes(p jsonb)
returns int language plpgsql security definer set search_path = public as $$
declare
  r record;
  v_changed text[] := '{}';
  v_count int := 0;
begin
  for r in select c.id, c.content_hash, p -> c.id ->> 'h' as h from public.courses c where p ? c.id loop
    if r.content_hash is not null and r.content_hash is distinct from r.h then v_changed := v_changed || r.id; end if;
    update public.courses set content_hash = r.h where id = r.id and content_hash is distinct from r.h;
  end loop;
  if cardinality(v_changed) > 10 then
    raise notice 'sync_course_hashes : % formations modifiées d''un coup, aucune notification', cardinality(v_changed);
    return 0;
  end if;
  for r in select unnest(v_changed) as id loop
    -- Déjà annoncée dans cette même mise à jour (mise en ligne d'une nouvelle version) : rien de plus.
    continue when exists (select 1 from public.course_updates u where u.course_id = r.id and u.created_at = now());
    perform public.announce_course_update(r.id, 'update', p -> r.id ->> 'note');
    v_count := v_count + 1;
  end loop;
  return v_count;
end $$;
revoke execute on function public.sync_course_hashes(jsonb) from public, anon, authenticated;

-- Mise en ligne d'une version 2 : la même chose qu'avant, puis on prévient les abonnés concernés.
create or replace function public.course_go_live(p_course text, p_map int[])
returns void language plpgsql security definer set search_path = public as $$
begin
  if (select v2_live from public.courses where id = p_course) then return; end if;
  create temporary table if not exists _v1_progress (user_id uuid, module_index int, completed_at timestamptz) on commit drop;
  delete from _v1_progress;
  insert into _v1_progress select user_id, module_index, completed_at from public.progress where course_id = p_course;
  delete from public.progress where course_id = p_course;
  insert into public.progress (user_id, course_id, module_index, completed_at)
    select distinct on (o.user_id, p_map[o.module_index + 1]) o.user_id, p_course, p_map[o.module_index + 1], o.completed_at
      from _v1_progress o where p_map[o.module_index + 1] is not null
    on conflict do nothing;
  insert into public.part_progress (user_id, course_id, module_index, part_index, completed_at)
    select pr.user_id, p_course, lp.module_index, lp.part_index, pr.completed_at
      from public.progress pr join public.lesson_parts lp on lp.course_id = pr.course_id and lp.module_index = pr.module_index
     where pr.course_id = p_course
    on conflict do nothing;
  update public.courses set v2_live = true where id = p_course;
  perform public.announce_course_update(p_course, 'new_version', null);
end $$;
revoke execute on function public.course_go_live(text, int[]) from public, anon, authenticated;

-- Pour la cloche du site : les mises à jour des 60 derniers jours des formations que la personne
-- connectée avait commencées avant la mise à jour (abonnement actif requis).
create or replace function public.my_course_updates()
returns table (id bigint, course_id text, title text, kind text, note text, created_at timestamptz)
language sql stable security definer set search_path = public as $$
  with mine as (
    select s.course_id, min(s.t) as t from (
      select pp.course_id, pp.completed_at as t from public.part_progress pp where pp.user_id = auth.uid()
      union all select pr.course_id, pr.completed_at from public.progress pr where pr.user_id = auth.uid()
      union all select c.course_id, c.issued_at from public.certificates c where c.user_id = auth.uid() and c.kind = 'course'
    ) s group by 1
  )
  select u.id, u.course_id, c.title, u.kind, u.note, u.created_at
    from public.course_updates u
    join mine m on m.course_id = u.course_id and m.t < u.created_at
    join public.courses c on c.id = u.course_id
   where u.created_at > now() - interval '60 days'
     and exists (select 1 from public.profiles p where p.id = auth.uid() and p.sub_end is not null and p.sub_end > now())
   order by u.created_at desc
   limit 20;
$$;
revoke execute on function public.my_course_updates() from public, anon;
grant execute on function public.my_course_updates() to authenticated;

-- Formations passées en version 2 avant cette migration (18/10/2026) : on prévient une fois.
do $$
declare r record;
begin
  for r in select c.id from public.courses c
            where c.v2_live and not exists (select 1 from public.course_updates u where u.course_id = c.id) loop
    perform public.announce_course_update(r.id, 'new_version', null);
  end loop;
end $$;
