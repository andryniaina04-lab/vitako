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

Chaque ligne de l'encadré commence par `>`. On peut y mettre des listes et du gras.

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

## 6. Publier

1. `node tools/build.mjs`, puis `node tools/stamp.mjs`.
2. Envoyer sur GitHub : le site se met à jour (Vercel) et `supabase/seed.sql`
   est exécuté automatiquement dans Supabase (GitHub Actions).
4. Faire relire la formation par un professionnel du métier avant de l'annoncer.
