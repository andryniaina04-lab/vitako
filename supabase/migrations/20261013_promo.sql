-- Migration du 13/10/2026 : promotion de lancement (30 000 Ar au lieu de 60 000 Ar jusqu'au 30/11/2026).
-- Rejouable sans risque : exécutée par GitHub Actions avant seed.sql.
insert into public.settings (key, value) values
  ('promo_price_ar', '30000'),
  ('promo_until', '2026-11-30')
on conflict (key) do nothing;
-- Nouveau prix normal (seulement si l'ancien prix n'a pas été changé entre-temps)
update public.settings set value = '60000' where key = 'price_ar' and value = '25000';

-- Prix à payer aujourd'hui : prix réduit jusqu'au dernier jour de la promotion inclus
-- (date de Madagascar), sinon prix normal.
create or replace function public.current_price_ar()
returns int language sql stable set search_path = public as $$
  select case
    when public.setting_int('promo_price_ar', 0) > 0
     and (select value from public.settings where key = 'promo_until') ~ '^\d{4}-\d{2}-\d{2}$'
     and (now() at time zone 'Indian/Antananarivo')::date
         <= (select value::date from public.settings where key = 'promo_until')
    then public.setting_int('promo_price_ar', 0)
    else public.setting_int('price_ar', 60000)
  end;
$$;

create or replace function public.submit_payment(p_operator text, p_reference text, p_sender text default null)
returns public.payments language plpgsql security definer set search_path = public as $$
declare
  v_uid    uuid := auth.uid();
  v_ref    text := upper(regexp_replace(coalesce(p_reference, ''), '\s', '', 'g'));
  v_sender text := nullif(regexp_replace(coalesce(p_sender, ''), '\D', '', 'g'), '');
  v_row    public.payments;
begin
  if v_uid is null then raise exception 'not_authenticated'; end if;
  if p_operator not in ('mvola', 'orange') then raise exception 'bad_operator'; end if;
  if v_ref !~ '^[A-Z0-9][A-Z0-9.-]{4,39}$' then raise exception 'bad_reference'; end if;
  if v_sender is not null then
    if v_sender !~ '^03[0-9]{8}$' then raise exception 'bad_sender'; end if;
    if (p_operator = 'mvola'  and left(v_sender, 3) not in ('034', '038'))
    or (p_operator = 'orange' and left(v_sender, 3) not in ('032', '037')) then
      raise exception 'sender_operator_mismatch';
    end if;
  end if;
  if exists (select 1 from public.payments where user_id = v_uid and status = 'pending') then
    raise exception 'already_pending';
  end if;
  if exists (select 1 from public.payments where operator = p_operator and reference = v_ref and status <> 'rejected') then
    raise exception 'reference_used';
  end if;

  insert into public.payments (user_id, operator, reference, sender, amount)
  values (v_uid, p_operator, v_ref, v_sender, public.current_price_ar())
  returning * into v_row;
  return v_row;
end;
$$;
revoke execute on function public.submit_payment(text, text, text) from public, anon;
