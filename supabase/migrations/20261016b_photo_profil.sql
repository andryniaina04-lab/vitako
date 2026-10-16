-- Migration du 16/10/2026 : photo de profil des apprenants.
-- Rejouable sans risque : exécutée par GitHub Actions avant seed.sql.
--
-- La photo est réduite et compressée dans le navigateur (320 x 320 px, WebP ou JPEG, environ 20 à 40 Ko)
-- avant l'envoi. Elle est rangée dans Supabase Storage, compartiment public « avatars »,
-- dans un dossier au nom de l'utilisateur : chacun ne peut écrire que dans son propre dossier.

alter table public.profiles add column if not exists avatar_url text;
alter table public.profiles drop constraint if exists profiles_avatar_url_check;
alter table public.profiles add constraint profiles_avatar_url_check
  check (avatar_url is null or (char_length(avatar_url) <= 400
         and avatar_url ~ '^https://[a-z0-9]+\.supabase\.co/storage/v1/object/public/avatars/'));
grant update (full_name, avatar_url) on public.profiles to authenticated;

do $$
begin
  if not exists (select 1 from information_schema.schemata where schema_name = 'storage') then
    raise notice 'Pas de Supabase Storage ici : compartiment avatars non créé.';
    return;
  end if;

  insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
  values ('avatars', 'avatars', true, 204800, array['image/webp', 'image/jpeg', 'image/png'])
  on conflict (id) do update set public = true, file_size_limit = 204800,
    allowed_mime_types = array['image/webp', 'image/jpeg', 'image/png'];

  drop policy if exists avatars_select_own on storage.objects;
  drop policy if exists avatars_insert_own on storage.objects;
  drop policy if exists avatars_update_own on storage.objects;
  drop policy if exists avatars_delete_own on storage.objects;
  -- Nécessaire pour remplacer une photo existante (upsert). Les images restent lisibles par lien public.
  create policy avatars_select_own on storage.objects for select to authenticated
    using (bucket_id = 'avatars' and (storage.foldername(name))[1] = auth.uid()::text);
  create policy avatars_insert_own on storage.objects for insert to authenticated
    with check (bucket_id = 'avatars' and (storage.foldername(name))[1] = auth.uid()::text);
  create policy avatars_update_own on storage.objects for update to authenticated
    using (bucket_id = 'avatars' and (storage.foldername(name))[1] = auth.uid()::text)
    with check (bucket_id = 'avatars' and (storage.foldername(name))[1] = auth.uid()::text);
  create policy avatars_delete_own on storage.objects for delete to authenticated
    using (bucket_id = 'avatars' and (storage.foldername(name))[1] = auth.uid()::text);
end $$;
