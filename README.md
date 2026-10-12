# Vitako

Plateforme de formation aux métiers du freelance et du télétravail pour les jeunes de Madagascar.
50 métiers, chacun en deux niveaux (Fondamentaux et Avancé), soit 100 formations, avec petits tests,
examen final (50/100 pour réussir, essais illimités) et attestations PDF.

Le site est fait de fichiers simples (HTML, CSS, JavaScript) : **rien à installer ni à compiler**.
La base de données, les comptes et la sécurité sont gérés par **Supabase**.

## Mise en ligne, étape par étape

### 1. Créer la base de données (Supabase)

1. Créez un compte sur [supabase.com](https://supabase.com), puis **New project**.
   Choisissez un mot de passe de base de données solide et gardez-le en lieu sûr.
2. Ouvrez **SQL Editor**, collez tout le contenu de `supabase/schema.sql`, puis cliquez sur **Run**.
3. Faites de même avec `supabase/seed.sql` (le catalogue et le contenu des formations).
4. **Authentication → URL Configuration** :
   - *Site URL* : l'adresse de votre site (par exemple `https://vitako.vercel.app`, puis votre nom de domaine).
   - *Redirect URLs* : ajoutez la même adresse.
5. **Authentication → Providers → Email** : laissez « Confirm email » activé (recommandé).
   Les e-mails d'inscription et de mot de passe oublié partent automatiquement. Le service d'e-mail
   inclus est limité : pour beaucoup d'inscriptions, branchez un service SMTP (Authentication → Emails → SMTP).
6. **Project Settings → API** : copiez *Project URL* et la clé *anon public*.

### 2. Relier le site à Supabase

Ouvrez `assets/js/config.js` et collez l'adresse et la clé :

```js
supabaseUrl: 'https://xxxxxxxx.supabase.co',
supabaseAnonKey: 'eyJhbGciOi...',
```

La clé *anon* peut être publique : la base refuse tout ce qui n'est pas autorisé.
Ne mettez **jamais** la clé *service_role* dans le site.

C'est aussi dans ce fichier que se trouvent les numéros MVola et Orange Money et le délai de validation annoncé.

### 3. Mettre le site en ligne (Vercel)

1. Créez un compte sur [vercel.com](https://vercel.com) avec votre compte GitHub.
2. **Add New → Project**, choisissez le dépôt `vitako`, puis **Deploy** (aucun réglage nécessaire).
3. Chaque modification enregistrée sur GitHub met le site à jour automatiquement.
4. Pour votre nom de domaine : Vercel → votre projet → **Settings → Domains**.

### 4. Devenir administrateur

Créez votre compte sur le site, puis dans Supabase → **SQL Editor** :

```sql
update public.profiles set is_admin = true where email = 'votre@email.com';
```

Le lien **Administration** apparaît alors dans le menu.

## Valider un paiement

1. L'étudiant envoie 25 000 Ar par MVola ou Orange Money, puis saisit la **référence** du SMS
   (son numéro est facultatif).
2. Dans **Administration**, vérifiez dans votre application MVola ou Orange Money que la référence
   existe et que le montant est bon. **Jamais à partir d'une capture d'écran.**
3. **Valider** donne 30 jours d'accès (ajoutés à la fin si l'étudiant est déjà abonné).
   **Refuser** demande un motif, que l'étudiant voit.
4. L'accès se coupe tout seul à la date de fin. Les attestations restent visibles.

Changer le prix ou la durée (dans SQL Editor) :

```sql
update public.settings set value = '30000' where key = 'price_ar';
update public.settings set value = '30' where key = 'access_days';
```

## Ajouter ou modifier une formation

Le contenu est dans `content/` :

- `content/catalog.json` : les 10 domaines et les 50 métiers (nom, description, outils gratuits et payants).
- `content/courses/<id>/` : une formation rédigée, par exemple `design-0-f` (Graphiste – Fondamentaux).
  - `course.json` : durée, description, objectifs, modules (titre, résumé, lien vidéo, petit test) et banque d'examen (au moins 10 questions, 20 conseillées).
  - `module-1.md` … `module-5.md` : le texte des leçons (titres `##`, listes `-`, tableaux, **gras**).

L'identifiant d'une formation est `<domaine>-<n° du métier>-<niveau>` : `f` pour Fondamentaux, `a` pour Avancé.
Exemples : `design-0-a` (Graphiste – Avancé), `data-0-f` (Annotateur de données IA – Fondamentaux).

Pour publier :

1. Créez ou modifiez le dossier de la formation.
2. Lancez `node tools/build.mjs` (il met à jour `assets/js/data.js` et `supabase/seed.sql`).
3. Exécutez `supabase/seed.sql` dans Supabase → SQL Editor. Les comptes, paiements et attestations ne sont pas touchés.
4. Enregistrez les changements sur GitHub : le site se met à jour.

**Vidéos** : mettez le lien dans `video_url` du module (YouTube, Vimeo ou fichier `.mp4`).
Sans lien, la leçon affiche « Vidéo bientôt disponible » et le texte suffit pour réussir le test.

## Vérifier une attestation

Chaque attestation a un numéro (ex. `VTK-2026-4F9A2C`). N'importe qui peut le vérifier
sur la page **Vérifier une attestation** (lien en bas du site).

## Sécurité

- Les leçons et les tests ne sont lisibles que par les abonnés actifs.
- Les réponses de l'examen ne quittent jamais la base : la note est calculée par Supabase.
- Un étudiant ne peut pas se donner un abonnement, une note ou une attestation.
- Une référence de paiement ne peut servir qu'une fois.

## Tests (pour les développeurs)

- Base de données : `tests/sql/run.sh` (Postgres 16 local).
- Parcours complet dans un navigateur, avec un faux Supabase : `python3 tests/browser/run.py` (Playwright).

## Organisation des fichiers

```
index.html              page unique du site
assets/css/app.css      styles (thème clair et sombre)
assets/js/config.js     réglages (Supabase, numéros de paiement)
assets/js/app.js        pages et actions
assets/js/api.js        accès à Supabase
assets/js/catalog.js    catalogue des 100 formations
assets/js/data.js       généré par tools/build.mjs
assets/js/markdown.js   affichage des leçons
assets/js/pdf.js        attestation PDF
content/                contenu des formations
supabase/schema.sql     base de données et sécurité
supabase/seed.sql       généré : catalogue et contenu
tools/build.mjs         génère data.js et seed.sql
tests/                  tests
```
