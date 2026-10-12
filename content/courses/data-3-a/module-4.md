Les organisations internationales, les cabinets de conseil et les entreprises étrangères offrent les missions d'analyse les mieux payées. Elles attendent des rapports en anglais, le respect strict de la protection des données, des méthodes reconnues et une collaboration à distance efficace. Ce module vous prépare à travailler avec elles.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Appliquer les règles de protection des données dans vos analyses.
> 2. Travailler avec des données d'enquêtes et des indicateurs de projets.
> 3. Présenter une analyse en anglais.
> 4. Collaborer à distance sur des données partagées.
> 5. Réussir les tests techniques des recruteurs.

## Protéger les données

### Les 7 règles

1. **Minimisation** : ne travaillez qu'avec les données nécessaires à la question.
2. **Pseudonymisation** : remplacez les noms et numéros par des identifiants quand c'est possible.
3. **Agrégation** : présentez des résultats par groupe, jamais des données individuelles identifiables.
4. **Petits effectifs** : ne publiez pas de chiffres sur des groupes de quelques personnes, qui permettraient de les reconnaître.
5. **Accès limités** : chaque personne ne voit que ce dont elle a besoin (sécurité au niveau des lignes).
6. **Stockage sûr** : outils de l'organisation, pas de copies sur des clés USB ou des messageries personnelles.
7. **Lois applicables** : loi malgache sur les données personnelles, RGPD pour les personnes en Europe, règles du bailleur.

> [!attention]
> Dans une enquête auprès de 300 ménages d'une commune, un tableau qui croise village, sexe, âge et maladie peut permettre d'identifier une personne. Regroupez les catégories ou masquez les cases avec moins de 5 personnes, selon les règles du projet.

## Les données d'enquêtes et les indicateurs de projets

### Les outils de collecte courants

| Outil | Usage |
| --- | --- |
| **KoboToolbox** | Formulaires d'enquête sur téléphone, même hors connexion, très utilisé par les ONG |
| **ODK** | Collecte mobile, base de nombreux outils humanitaires |
| **Formulaires en ligne** | Enquêtes simples |

### Le cadre de suivi d'un projet

| Niveau | Exemple d'indicateur | Source |
| --- | --- | --- |
| **Activités** | Nombre de formations agricoles organisées | Registre du projet |
| **Produits** | Nombre d'agriculteurs formés (dont femmes) | Listes de présence |
| **Résultats** | Part des agriculteurs qui appliquent la nouvelle technique | Enquête de suivi |
| **Impact** | Évolution du rendement moyen de riz | Enquêtes de début et de fin |

> [!definition] Données de référence (baseline)
> La valeur d'un indicateur au début du projet. Sans elle, il est impossible de montrer une évolution.

> [!madagascar]
> Les données collectées sur le terrain à Madagascar contiennent souvent des noms de lieux écrits de plusieurs façons, des réponses en malgache et des unités locales (kapoaka, daba). Prévoyez des **listes de référence** (communes, fokontany), des **conversions d'unités** validées par l'équipe du projet, et une **traduction** des réponses ouvertes.

## Présenter une analyse en anglais

### Le vocabulaire

| Français | Anglais |
| --- | --- |
| Tableau de bord | Dashboard |
| Indicateur clé | Key performance indicator (KPI) |
| Évolution sur un an | Year-over-year change |
| Tendance | Trend |
| Données manquantes | Missing data |
| Valeur aberrante | Outlier |
| Échantillon | Sample |
| Constat principal | Key finding |

> [!exemple] Résumé en anglais
> "Key finding: loan repayment fell from 96% to 89% over six months. Two branches in the Atsimo-Andrefana region account for 80% of the decline, coinciding with a drought that reduced harvests. We recommend rescheduling options for affected borrowers and weekly monitoring of these branches. Note: data for July is incomplete for one branch."

## Collaborer à distance

| Pratique | Pourquoi |
| --- | --- |
| **Une seule source de vérité** | Tout le monde utilise le même jeu de données et les mêmes définitions |
| **Requêtes et scripts versionnés** (Git) | On sait qui a changé quoi |
| **Revue par un collègue** des analyses importantes | Repérer les erreurs avant la direction |
| **Notes de méthode** jointes à chaque analyse | Hypothèses, filtres, limites |
| **Communication écrite** claire | Les collègues dans d'autres fuseaux comprennent sans réunion |

## Réussir les tests techniques

| Test | Ce qui est évalué | Préparation |
| --- | --- | --- |
| **SQL** | Jointures, regroupements, fonctions de fenêtre | Entraînement régulier sur des exercices |
| **Excel** | Formules, tableaux croisés, nettoyage | Exercices chronométrés |
| **Étude de cas** | Analyser un jeu de données en temps limité et présenter | Méthode en 5 temps, structure claire |
| **Power BI ou Tableau** | Modèle, mesures, visualisation | Projets de portfolio |
| **Entretien** | Explication de vos projets | Présenter 2 projets en 5 minutes chacun |

```sql
-- Fonction de fenêtre : classement des produits par magasin
SELECT magasin, produit, SUM(montant) AS ventes,
       RANK() OVER (PARTITION BY magasin ORDER BY SUM(montant) DESC) AS rang
FROM ventes
GROUP BY magasin, produit;
```

> [!retenir]
> - 7 règles de protection des données, dont l'agrégation et l'attention aux petits effectifs.
> - Collecte avec KoboToolbox ou ODK, indicateurs par niveau et données de référence.
> - Des analyses présentées en anglais avec un constat clair.
> - Une source de vérité, des versions, des revues et des notes de méthode.
> - Des tests techniques préparés : SQL, Excel, étude de cas, BI.

## Exercice pratique : un projet international

> [!exercice] Exercice pratique · 3 heures
> 1. Prenez un jeu de données d'enquête public (ou créez-en un) et appliquez les 7 règles de protection.
> 2. Construisez le cadre de suivi d'un projet fictif avec 8 indicateurs sur 4 niveaux.
> 3. Rédigez un résumé d'analyse en anglais.
> 4. Faites 10 exercices SQL, dont 3 avec des fonctions de fenêtre.
>
> **À livrer** : votre jeu de données protégé, votre cadre, votre résumé et vos requêtes.
