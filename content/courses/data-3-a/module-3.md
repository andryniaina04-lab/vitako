Un tableau de bord avec un chiffre faux perd la confiance de la direction pour longtemps. Ce module vous donne les méthodes des analystes professionnels : contrôler la qualité des données, concevoir des tableaux de bord vraiment utiles, documenter, versionner et garder des rapports rapides.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Mettre en place des contrôles automatiques de qualité.
> 2. Concevoir un tableau de bord orienté décision.
> 3. Raconter une analyse avec des données.
> 4. Documenter et versionner vos travaux.
> 5. Garder des rapports rapides.

## Les contrôles de qualité

| Contrôle | Exemple | Comment |
| --- | --- | --- |
| **Totaux** | Les ventes du mois = le total de la comptabilité (à 0,5 % près) | Mesure de contrôle comparée chaque mois |
| **Complétude** | Les 3 magasins ont envoyé leurs données pour tous les jours | Comptage des jours par magasin |
| **Valeurs inattendues** | Montants négatifs, quantités énormes, dates futures | Mesures d'alerte |
| **Correspondances** | Chaque produit vendu existe dans la table des produits | Comptage des lignes sans correspondance |
| **Fraîcheur** | La dernière actualisation date de moins de 24 heures | Date de dernière actualisation affichée |

> [!astuce]
> Créez une **page de contrôle** cachée ou réservée aux analystes dans le rapport : totaux de contrôle, lignes sans correspondance, jours manquants, date d'actualisation. Consultez-la avant chaque présentation.

## Concevoir un tableau de bord orienté décision

### Les 3 niveaux

| Niveau | Pour qui | Contenu |
| --- | --- | --- |
| **Synthèse** | Direction | 5 à 8 indicateurs, tendances, alertes |
| **Analyse** | Responsables | Découpage par magasin, produit, période ; causes |
| **Détail** | Équipes opérationnelles | Listes : commandes en retard, produits en rupture |

### Les règles visuelles

1. **En haut à gauche** : le plus important.
2. **Chaque chiffre avec une comparaison** : objectif, période précédente.
3. **Des couleurs de signal limitées** : rouge seulement pour ce qui demande une action.
4. **Des titres qui disent le message** quand le rapport est commenté.
5. **Une page = une question**.
6. **Testé sur téléphone** si la direction le consulte sur mobile.

> [!attention]
> Un tableau de bord avec 30 graphiques n'aide personne. Si un graphique ne mène à **aucune décision ni action**, retirez-le ou déplacez-le dans une page d'analyse.

## Raconter une analyse

### La structure en 5 temps

1. **Le contexte** : pourquoi cette analyse ?
2. **Le constat principal** en une phrase.
3. **Les preuves** : 2 à 3 graphiques, du général au détail.
4. **La cause** et son impact chiffré.
5. **La recommandation** et la prochaine étape.

> [!exemple] Un constat principal bien écrit
> « Le taux de remboursement des prêts de la coopérative a baissé de 96 % à 89 % en 6 mois, et 80 % de cette baisse vient de 2 agences de la région Atsimo-Andrefana, où la sécheresse a réduit les récoltes. »

## Documenter et versionner

### La documentation d'un projet

| Document | Contenu |
| --- | --- |
| **Fiches d'indicateurs** | Définitions validées |
| **Schéma des sources** | D'où viennent les données, à quelle fréquence |
| **Description du modèle** | Tables, relations, mesures principales |
| **Procédure d'actualisation** | Qui, quand, que faire en cas d'échec |
| **Journal des modifications** | Date, changement, raison, auteur |

### Les versions

1. **Nommez** les fichiers avec une version (`Rapport_Direction_v2.3.pbix`) ou utilisez un dépôt Git pour les requêtes SQL et les scripts.
2. **Testez** les changements dans une copie avant de publier.
3. **Gardez** la version précédente publiée pour revenir en arrière.

## Garder des rapports rapides

| Problème | Solution |
| --- | --- |
| Modèle trop lourd | Supprimer les colonnes inutiles, réduire la précision des dates et heures |
| Trop de visuels sur une page | Répartir sur plusieurs pages |
| Mesures lentes | Simplifier, éviter les calculs ligne par ligne inutiles |
| Données trop détaillées | Agréger (par jour plutôt que par seconde) si le détail n'est pas utilisé |
| Transformations dans le rapport | Les faire en amont (Power Query, SQL) |

> [!madagascar]
> Si les responsables consultent les rapports avec une **connexion mobile limitée**, préférez des pages légères, peu de visuels par page, et des **abonnements par e-mail** (image ou PDF) qui ne demandent pas d'ouvrir le rapport en ligne.

> [!retenir]
> - 5 contrôles de qualité et une page de contrôle.
> - 3 niveaux de tableaux de bord, chaque chiffre comparé, une page par question.
> - Une analyse racontée en 5 temps, avec un constat en une phrase.
> - Une documentation complète et des versions testées.
> - Des rapports légers et rapides.

## Exercice pratique : qualité et récit

> [!exercice] Exercice pratique · 3 heures 30
> 1. Ajoutez une page de contrôle à votre rapport du module 2 avec les 5 contrôles.
> 2. Réorganisez le rapport en 3 niveaux et appliquez les règles visuelles.
> 3. Rédigez une analyse en 5 temps sur une question tirée de vos données.
> 4. Rédigez la documentation complète du projet.
>
> **À livrer** : votre rapport amélioré, votre analyse et votre documentation.
