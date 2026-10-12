#!/usr/bin/env bash
# Teste supabase/schema.sql puis le chargement de supabase/seed.sql sur un Postgres local.
# Chaque ligne "t" = test réussi, "f" = test échoué.
set -euo pipefail
cd "$(dirname "$0")/../.."
DB=vitako_test
PSQL="psql -X -v ON_ERROR_STOP=1 -q"
fresh() {
  su postgres -c "dropdb --if-exists $DB && createdb $DB"
  su postgres -c "$PSQL -d $DB -f tests/sql/supabase_stub.sql"
  su postgres -c "$PSQL -d $DB -f supabase/schema.sql"
}

fresh
OUT=$(su postgres -c "$PSQL -d $DB -f tests/sql/test.sql" 2>&1) || { echo "$OUT"; echo "Arrêt sur erreur SQL"; exit 1; }
echo "$OUT"
PASS=$(grep -cx 't' <<<"$OUT" || true)
FAIL=$(grep -cx 'f' <<<"$OUT" || true)
echo "Réussis : $PASS · Échoués : $FAIL"

echo '--- Chargement de seed.sql (deux fois, pour vérifier les mises à jour)'
fresh
su postgres -c "$PSQL -d $DB -f supabase/seed.sql"
su postgres -c "$PSQL -d $DB -f supabase/seed.sql"
su postgres -c "$PSQL -d $DB -tAc \"select 'formations : ' || count(*) || ', publiées : ' || count(*) filter (where published) from public.courses\""
su postgres -c "$PSQL -d $DB -tAc \"select 'leçons : ' || count(*) || ', questions de module : ' || (select count(*) from public.module_questions) || ', questions d''examen : ' || (select count(*) from public.exam_questions) from public.lessons\""
[ "$FAIL" -eq 0 ]
