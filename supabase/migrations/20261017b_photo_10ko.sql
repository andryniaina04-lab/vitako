-- Photos de profil : 10 Ko au maximum (le site compresse avant l'envoi).
do $$
begin
  if exists (select 1 from information_schema.schemata where schema_name = 'storage') then
    update storage.buckets set file_size_limit = 10240 where id = 'avatars';
  end if;
end $$;
