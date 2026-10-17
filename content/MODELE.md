# Modèle de rédaction des formations Vitako

Toutes les formations suivent la même structure, pour que les étudiants s'y retrouvent
d'une formation à l'autre. La formation de référence est `courses/design-0-f`
(Graphiste – Fondamentaux).

## 1. Structure d'une formation

- **5 modules**, numérotés et progressifs : du métier aux premiers clients payants.
- Fondamentaux : 1. Le métier et ses clients · 2. Les bases · 3. Les outils (gratuits puis payants) ·
  4. Un premier projet complet · 5. Trouver des clients et se faire payer.
- Avancé : 1. Se spécialiser · 2. Outils professionnels · 3. Qualité et rapidité ·
  4. Clients internationaux · 5. Développer son activité.
- **4 à 6 objectifs** numérotés, chacun commençant par un verbe d'action (« Créer », « Calculer »…).
- **Durée** : 12 à 16 heures, exercices compris.

## 2. Structure d'un module (`module-N.md`)

1. **Introduction** : 2 à 4 phrases. Ce que le module apporte et pourquoi c'est utile pour gagner de l'argent.
2. **Encadré Objectifs** : 4 à 6 points numérotés « À la fin de ce module, vous saurez : ».
3. **4 à 6 sections** `##` : elles sont numérotées automatiquement (2.1, 2.2…).
   Dans chaque section :
   - une phrase qui dit l'essentiel ;
   - des **étapes numérotées** pour tout ce qui se fait dans l'ordre ;
   - un **tableau** dès qu'on compare des choses (outils, formats, prix) ;
   - au moins un **encadré Exemple** concret, de préférence à Madagascar.
4. **Encadré Attention** : les erreurs fréquentes des débutants.
5. **Encadré Spécial Madagascar** quand c'est utile : coupures, connexion, paiement, clients locaux.
6. **Encadré À retenir** : 4 ou 5 points, juste avant l'exercice.
7. **Dernière section `## Exercice pratique : …`** avec un encadré Exercice :
   durée estimée, étapes numérotées, et une ligne **À livrer**.
   L'exercice doit pouvoir rejoindre le portfolio de l'étudiant.

## 3. Les encadrés

```
> [!objectifs]
> [!exemple] Titre facultatif
> [!astuce]
> [!attention] Erreurs fréquentes
> [!madagascar]
> [!retenir]
> [!exercice] Exercice pratique · 45 minutes
> [!definition] Mot à définir
```

Chaque ligne de l'encadré commence par `>`. On peut y mettre des listes, des tableaux et du gras.

Pour une arborescence de dossiers, une commande ou du code HTML/CSS, utilisez un bloc de code
entre deux lignes ```. Ne numérotez pas les titres `##` à la main : la numérotation est automatique.

## 4. Style

- **Vouvoiement**, phrases courtes, mots simples.
- Un terme technique est expliqué la première fois (encadré Définition).
- Des chiffres concrets : tailles en px, délais, prix **donnés comme exemples**.
- Ne jamais citer un prix de logiciel comme définitif : renvoyer au site officiel.
- Pas de promesse de revenus garantis.
- Exemples ancrés à Madagascar : villes, commerces, Mobile Money, ariary.

## 5. Tests et examen (`course.json`)

- **3 questions par module**, sur les points les plus importants de la leçon.
- **Au moins 20 questions d'examen** (10 sont tirées au hasard à chaque passage).
- 4 réponses par question, une seule bonne, mise en premier dans le fichier
  (`"correct": 0`) : l'ordre est mélangé automatiquement.
- Les mauvaises réponses doivent être plausibles, sans piège sur la formulation.
- Titre facultatif : `"title"` dans `course.json` remplace le titre automatique
  « Métier – Niveau » (utilisé par tech-4-a, « Administrateur Microsoft 365 et Google Workspace »).

## 6. Publier

1. `node tools/build.mjs`, puis `node tools/stamp.mjs`.
2. Envoyer sur GitHub : le site se met à jour (Vercel) et `supabase/seed.sql`
   est exécuté automatiquement dans Supabase (GitHub Actions).
4. Faire relire la formation par un professionnel du métier avant de l'annoncer.

---

# Version 2 : formations complètes en leçons (depuis le 18/10/2026)

Formation de référence : `courses/design-0-f/v2` (Graphiste – Fondamentaux, 50 h).
Une formation version 2 vit dans le sous-dossier `v2/` de la formation. Tant que `"live": false`,
seul l'administrateur la voit (aperçu) ; les étudiants suivent la version actuelle.

## Structure

- **6 modules** de **5 leçons** (4 à 6 possibles). Métiers : 40 à 50 h ; formations courtes
  (Développement personnel, Compétences numériques, Démarrer en freelance) : 20 à 25 h.
- **Durée calculée automatiquement** par `node tools/build.mjs` : lecture (120 mots/min) + 5 min de QCM
  par leçon + durées écrites dans les encadrés `[!exercice]` et `[!projet]` + 1 h d'examen.
- Fichiers : `v2/course.json` (description, objectifs, `live`, `progress_map`, liste des modules),
  `v2/m1.json` … `v2/m6.json` (titre, résumé, leçons et QCM), `v2/exam.json` (60 questions),
  et une leçon par fichier : `v2/m1-l1.md`, `v2/m1-l2.md`…
- `progress_map` : pour chaque module de l'ancienne version, le numéro (à partir de 0) du module
  de la nouvelle version qui le remplace. Sert à convertir la progression des étudiants à la mise en ligne.
- **QCM** : 5 questions par leçon, chacune avec `"why"` (l'explication affichée après la réponse).
- **Examen** : 60 questions ; 20 tirées au hasard à chaque passage ; 50/100 pour réussir.

## Structure d'une leçon (1 200 à 1 500 mots, environ 12 minutes)

1. Introduction de 2 à 4 phrases.
2. `> [!objectifs] Objectifs de la leçon` : 3 à 5 points.
3. 3 à 5 sections `##` (numérotées automatiquement 2.3.1, 2.3.2…), avec au moins :
   **2 schémas**, **1 tableau**, **1 exemple à Madagascar** (`[!exemple]` ou `[!madagascar]`).
4. `> [!erreur]` (erreur fréquente et sa correction) et/ou `> [!attention]`.
5. `> [!retenir]` : 4 ou 5 points.
6. `## Exercice pratique : …` avec `> [!exercice] Exercice pratique · 45 minutes` et une ligne **À livrer**.
7. Dernière leçon du module : `## Projet du module N : …` avec `> [!projet] Projet du module · 2 heures`.

## Encadrés supplémentaires

```
> [!erreur] Titre      erreur fréquente, puis la bonne pratique
> [!projet] Projet du module · 2 heures
> [!cle] Titre         une idée ou un chiffre clé
```

## Schémas (dessinés par le site, légers, compatibles téléphone et thème sombre)

Un bloc qui commence par ```` ```schema <type> ```` et une ligne facultative `titre: …` :

| Type | Une ligne = | Exemple de ligne |
| --- | --- | --- |
| etapes | une étape | `Brief : le client explique son besoin` |
| cycle | une étape qui recommence | `Publier : 3 fois par semaine` |
| comparaison | une rangée | `colonnes: À éviter \| À faire` puis `texte A \| texte B` ; `ton: mauvais-bon` |
| entonnoir, pyramide | un niveau | `Niveau 1 : le message principal` |
| arbre | un dossier ou fichier (2 espaces par niveau) | `  Sources/ # photos reçues du client` |
| ecran | une zone ou une légende | `haut: Barre de menus [1]` puis `[1] explication` |
| palette | une couleur | `#0B7A55 Vert principal \| 60 %` |
| barres | une barre | `Réseaux sociaux : 5` |
| formats | un format | `Story : 1080 x 1920` |
| typo | une ligne de texte | `Titre \| 44 \| gras \| Niveau 1` |
| contraste | une paire | `#FFFFFF sur #0B7A55 Texte blanc` |
| composition | une note | `regle: tiers` (ou `z`, `marges`), `sujet: haut-droite` |
| chiffres | un chiffre clé | `50 % : d'acompte avant de commencer` |
| checklist | un point | `[x] fait` ou `[ ] à faire` |

Aperçu d'une leçon : `python3 tests/browser/preview-lesson.py content/courses/<id>/v2/m1-l1.md sortie.png 390`.

## Mise en ligne

Passer `"live": true` dans `v2/course.json`, lancer `node tools/build.mjs`, puis envoyer sur GitHub.
La mise à jour automatique convertit la progression (table `progress`, leçons cochées) ; les attestations
déjà délivrées ne changent pas.
