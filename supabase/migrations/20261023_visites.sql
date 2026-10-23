-- Migration du 23/10/2026 : visites du site, affichées dans Administration > Statistiques.
-- Rejouable sans risque : exécutée par GitHub Actions avant seed.sql.
--
-- Mesure anonyme : un identifiant de visiteur tiré au hasard dans le navigateur (aucune adresse IP,
-- aucun cookie publicitaire). Les pages d'administration et les visites de l'administrateur ne sont pas comptées.
-- Une ligne par page vue ; agrégats calculés seulement pour l'administrateur.

create table if not exists public.site_visits (
  id      bigint generated always as identity primary key,
  at      timestamptz not null default now(),
  visitor uuid not null,
  session uuid not null,
  path    text not null,
  source  text not null default 'direct',
  device  text not null default 'mobile',
  user_id uuid
);
create index if not exists site_visits_at on public.site_visits (at);
create index if not exists site_visits_session on public.site_visits (session, at);

alter table public.site_visits enable row level security;
revoke all on public.site_visits from anon, authenticated;

create or replace function public.track_visit(p_visitor uuid, p_session uuid, p_path text, p_source text, p_device text)
returns void language plpgsql security definer set search_path = public as $$
begin
  if p_visitor is null or p_session is null or coalesce(p_path, '') !~ '^/[a-z0-9/_-]{0,80}$' or p_path like '/admin%' then return; end if;
  if public.is_admin() then return; end if;
  -- Garde-fou contre les envois en boucle : 30 pages par minute et par session au maximum.
  if (select count(*) from public.site_visits where session = p_session and at > now() - interval '1 minute') >= 30 then return; end if;
  insert into public.site_visits (visitor, session, path, source, device, user_id)
  values (p_visitor, p_session, p_path,
          case when p_source in ('direct', 'facebook', 'instagram', 'tiktok', 'whatsapp', 'google', 'youtube', 'linkedin', 'email', 'app', 'autre') then p_source else 'autre' end,
          case when p_device in ('mobile', 'ordinateur', 'tablette') then p_device else 'mobile' end,
          auth.uid());
end $$;

create or replace function public.admin_visit_stats()
returns jsonb language plpgsql stable security definer set search_path = public as $$
declare v_today date := (now() at time zone 'Indian/Antananarivo')::date;
begin
  if not public.is_admin() then raise exception 'forbidden'; end if;
  return (
    with v as (
      select *, (at at time zone 'Indian/Antananarivo')::date as day
      from public.site_visits where at >= now() - interval '31 days'
    )
    select jsonb_build_object(
      'today', jsonb_build_object('views', (select count(*) from v where day = v_today),
                                  'visitors', (select count(distinct visitor) from v where day = v_today)),
      'week',  jsonb_build_object('views', (select count(*) from v where day > v_today - 7),
                                  'visitors', (select count(distinct visitor) from v where day > v_today - 7)),
      'month', jsonb_build_object('views', (select count(*) from v where day > v_today - 30),
                                  'visitors', (select count(distinct visitor) from v where day > v_today - 30),
                                  'sessions', (select count(distinct session) from v where day > v_today - 30),
                                  'logged', (select count(distinct visitor) from v where day > v_today - 30 and user_id is not null)),
      'total', (select count(*) from public.site_visits),
      'days', (select coalesce(jsonb_agg(jsonb_build_object('d', d::date, 'views', coalesce(x.views, 0), 'visitors', coalesce(x.visitors, 0)) order by d), '[]'::jsonb)
               from generate_series(v_today - 29, v_today, interval '1 day') d
               left join (select day, count(*) as views, count(distinct visitor) as visitors from v group by day) x on x.day = d::date),
      'pages', (select coalesce(jsonb_agg(jsonb_build_object('path', path, 'views', views, 'visitors', visitors) order by views desc), '[]'::jsonb)
                from (select path, count(*) as views, count(distinct visitor) as visitors from v where day > v_today - 30
                      group by path order by count(*) desc limit 15) t),
      'sources', (select coalesce(jsonb_agg(jsonb_build_object('source', source, 'visitors', visitors) order by visitors desc), '[]'::jsonb)
                  from (select source, count(distinct visitor) as visitors from v where day > v_today - 30 group by source) t),
      'devices', (select coalesce(jsonb_agg(jsonb_build_object('device', device, 'visitors', visitors) order by visitors desc), '[]'::jsonb)
                  from (select device, count(distinct visitor) as visitors from v where day > v_today - 30 group by device) t)
    )
  );
end $$;

revoke execute on function public.track_visit(uuid, uuid, text, text, text) from public;
revoke execute on function public.admin_visit_stats()                       from public, anon;
grant  execute on function public.track_visit(uuid, uuid, text, text, text) to anon, authenticated;
grant  execute on function public.admin_visit_stats()                       to authenticated;
