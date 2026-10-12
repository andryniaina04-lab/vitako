Un gestionnaire de données avancé ne se contente pas de contrôler à la main : il construit des **systèmes de contrôle** qui repèrent automatiquement les erreurs, mesure la qualité et documente chaque correction. Ce module vous donne ces méthodes, pour traiter de gros volumes avec une qualité garantie.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Comparer automatiquement deux saisies d'un même lot.
> 2. Créer une feuille de contrôles de cohérence.
> 3. Tenir un journal des corrections.
> 4. Mesurer la qualité avec des indicateurs.
> 5. Organiser le traitement de gros volumes.

## Comparer automatiquement une double saisie

Au niveau Fondamentaux, vous avez vu le principe de la double saisie. Voici comment comparer les deux tableaux **automatiquement**.

### La méthode

1. Les deux saisies ont la **même structure** et le même **identifiant** sur chaque ligne.
2. Dans une troisième feuille, pour chaque champ, comparez les deux valeurs :

```
=SI(RECHERCHEX([@ID];Saisie2[ID];Saisie2[Montant])=[@Montant];"";"DIFFÉRENT")
```

3. Ajoutez une colonne qui compte les différences par ligne.
4. Filtrez les lignes avec au moins une différence.
5. **Vérifiez chaque différence sur le document d'origine** et corrigez la bonne saisie.

> [!exemple] Résultat d'une double saisie
> 500 questionnaires × 15 champs = 7 500 champs comparés. 42 différences trouvées. Après vérification sur les documents : 23 erreurs dans la saisie A, 19 dans la saisie B. La base finale est corrigée, et on connaît le taux d'erreur de chaque opérateur (23 ÷ 7 500 ≈ 0,31 % et 19 ÷ 7 500 ≈ 0,25 %).

## La feuille de contrôles de cohérence

Les contrôles de cohérence repèrent les données **impossibles** ou **suspectes**, même quand la saisie respecte le document.

### Les 6 types de contrôles

| Type | Exemple de règle | Formule ou outil |
| --- | --- | --- |
| **Plage** | Âge entre 0 et 110 | `=OU([@Âge]<0;[@Âge]>110)` |
| **Format** | Téléphone de 10 chiffres | `=NBCAR([@Téléphone])<>10` |
| **Logique** | Enfants ≤ personnes du ménage | `=[@Enfants]>[@Personnes]` |
| **Doublon** | Identifiant unique | `=NB.SI([ID];[@ID])>1` |
| **Complétude** | Champs obligatoires remplis | `=NBVIDE(...)>0` |
| **Valeur aberrante** | Montant 10 fois supérieur à la moyenne | Comparaison à la moyenne ou à la médiane |

### Organiser les contrôles

1. **Une colonne par contrôle**, qui affiche VRAI quand il y a un problème.
2. **Une colonne « Nombre d'alertes »** qui additionne les problèmes de la ligne.
3. **Une mise en forme conditionnelle** qui colore les lignes en alerte.
4. **Un résumé** en haut de la feuille : nombre d'alertes par type.

> [!astuce]
> Construisez la feuille de contrôles **une fois** pour un type de projet, puis réutilisez-la. Avec Power Query, elle se met à jour toute seule à chaque nouveau lot.

## Le journal des corrections

Toute correction de données doit être **traçable** : on doit pouvoir savoir qui a changé quoi, quand et pourquoi.

| Date | ID | Champ | Ancienne valeur | Nouvelle valeur | Raison | Par |
| --- | --- | --- | --- | --- | --- | --- |
| 14/03 | Q0127 | Âge | 250 | 25 | Erreur de saisie, vérifiée sur le document | HR |
| 14/03 | Q0188 | Commune | Ambohidratrimo | Ambohidratrimo | Espace en trop supprimé | HR |
| 15/03 | Q0213 | Enfants | 7 | — | Incohérent avec 4 personnes ; document illisible ; signalé au client | HR |

> [!attention]
> Ne corrigez **jamais** une donnée d'enquête ou une donnée comptable « parce qu'elle semble fausse » sans source. Si le document ne permet pas de trancher, **signalez** au client au lieu de deviner.

## Mesurer la qualité

### Les indicateurs à suivre

| Indicateur | Calcul | Objectif courant (exemple) |
| --- | --- | --- |
| **Taux d'erreur de saisie** | Erreurs ÷ champs contrôlés | Moins de 0,5 % (souvent bien moins dans certains domaines) |
| **Taux de complétude** | Champs remplis ÷ champs attendus | Plus de 98 % |
| **Taux de doublons** | Doublons ÷ lignes | 0 % après nettoyage |
| **Alertes de cohérence résolues** | Alertes traitées ÷ alertes totales | 100 % (corrigées ou signalées) |
| **Productivité** | Lignes ou champs par heure | Selon le type de document |

### Le rapport de qualité

Livrez avec chaque base :

1. **Le volume** traité.
2. **Les indicateurs** de qualité.
3. **Les contrôles** effectués et leur résultat.
4. **Le journal** des corrections.
5. **Les points ouverts** : données manquantes ou douteuses signalées.

## Organiser le traitement de gros volumes

### Le découpage en lots

1. **Découpez** le travail en lots de taille égale (par exemple 200 documents).
2. **Numérotez** les lots et suivez-les dans un tableau : statut, opérateur, date, taux d'erreur.
3. **Contrôlez chaque lot** avant de l'intégrer à la base finale.
4. **Livrez par lots** si le client le souhaite : il commence à utiliser les données plus tôt.

### Les règles de gestion des fichiers

1. **Ne travaillez jamais sur l'original** : gardez une copie intacte des données reçues.
2. **Nommez les versions** : `2026-03-14_Enquete_Eau_Lot03_V2.xlsx`.
3. **Une seule base de référence**, mise à jour selon une procédure claire.
4. **Sauvegardez** chaque jour, sur un autre support ou en ligne.

> [!madagascar]
> Pour les gros volumes, organisez votre travail en fonction de votre connexion : téléchargez les lots la veille, travaillez hors connexion (Excel, Google Sheets en mode hors connexion), et envoyez les résultats quand la connexion est stable. Prévenez le client de votre organisation pour qu'il sache quand attendre les livraisons.

> [!retenir]
> - Une double saisie se compare automatiquement, chaque différence vérifiée sur le document.
> - 6 types de contrôles de cohérence, organisés dans une feuille réutilisable.
> - Un journal des corrections : qui, quoi, quand, pourquoi.
> - Des indicateurs de qualité et un rapport livré avec chaque base.
> - Des lots numérotés, des versions nommées, l'original toujours intact.

## Exercice pratique : un système de contrôle

> [!exercice] Exercice pratique · 3 heures
> 1. Créez deux saisies du même lot de 50 questionnaires, avec des différences volontaires (environ 10).
> 2. Construisez la feuille de comparaison automatique et trouvez toutes les différences.
> 3. Créez une feuille de contrôles avec au moins 5 types de contrôles et un résumé des alertes.
> 4. Tenez le journal de vos corrections.
> 5. Rédigez le rapport de qualité du lot.
>
> **À livrer** : le fichier Excel (comparaison, contrôles, journal) et le rapport de qualité.
