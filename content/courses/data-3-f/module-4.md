Dans ce module, vous réalisez une analyse complète pour une petite chaîne de magasins, de la question du client jusqu'aux recommandations. C'est le type de projet qui deviendra votre première étude de cas de portfolio.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Transformer une demande vague en questions précises.
> 2. Préparer et vérifier les données.
> 3. Mener l'analyse et trouver les causes.
> 4. Construire un tableau de bord utile.
> 5. Présenter des résultats et des recommandations.

## Le cas pratique : « Épicerie Mirana »

> [!exemple] Votre client
> **Épicerie Mirana** a 3 magasins à Antananarivo (Analakely, Ankorondrano, Ivandry). Le gérant, M. Hery, vous envoie les exports de caisse de 12 mois (environ 85 000 lignes) et une liste des produits avec leurs prix d'achat. Sa demande : « Mon chiffre d'affaires augmente, mais il me reste moins d'argent. Je ne comprends pas pourquoi. »

## Étape 1 : préciser la question

### Les questions à poser au client

1. Que voulez-vous décider après cette analyse ?
2. Quelle période et quels magasins ?
3. Les prix d'achat ont-ils changé pendant l'année ?
4. Y a-t-il eu des événements particuliers (travaux, promotions, nouveau magasin) ?
5. Qui regardera le tableau de bord, et à quelle fréquence ?

### Les questions d'analyse

| N° | Question |
| --- | --- |
| 1 | Comment évoluent le chiffre d'affaires et la marge par mois et par magasin ? |
| 2 | Quels produits rapportent le plus de marge ? Lesquels sont vendus à perte ? |
| 3 | Le panier moyen et le nombre de clients évoluent-ils ? |
| 4 | Les promotions ont-elles augmenté les ventes assez pour compenser les remises ? |

## Étape 2 : préparer et vérifier les données

1. **Importez** les exports dans Power Query.
2. **Nettoyez** avec la méthode en 7 points.
3. **Reliez** les ventes aux prix d'achat.
4. **Vérifiez** : le total annuel correspond-il au chiffre que connaît le gérant ? Chaque produit vendu a-t-il un prix d'achat ?

| Contrôle | Résultat | Action |
| --- | --- | --- |
| Total des ventes vs comptabilité | Écart de 0,4 % | Acceptable, noté |
| Produits sans prix d'achat | 37 produits sur 620 | Liste envoyée au gérant |
| Doublons | 212 lignes | Supprimées, notées dans le journal |
| Mois de juillet du magasin d'Ivandry | Manquant | Demandé au client |

> [!attention]
> Ne présentez jamais un résultat avant d'avoir **vérifié les totaux** avec une source que le client connaît (comptabilité, chiffre annoncé). Une erreur de données découverte pendant la présentation détruit la confiance.

## Étape 3 : analyser

> [!exemple] Ce que révèle l'analyse
> - Le chiffre d'affaires a augmenté de 12 %, mais la marge brute a baissé de 4 %.
> - 8 produits de grande consommation (huile, sucre, riz importé) ont vu leur prix d'achat augmenter de 15 à 25 % sans que le prix de vente suive : ils sont maintenant vendus à perte ou presque.
> - Ces 8 produits représentent 22 % du chiffre d'affaires.
> - Les promotions du samedi augmentent les ventes de 30 %, mais la remise coûte plus que la marge gagnée sur 5 des 8 produits concernés.

### La méthode

1. **Commencez large** : évolution globale.
2. **Découpez** : par magasin, par catégorie, par produit, par mois.
3. **Cherchez les écarts** : ce qui a le plus changé.
4. **Vérifiez une cause** avec d'autres données (prix d'achat, promotions).
5. **Chiffrez l'impact** : combien d'ariary cela représente.

## Étape 4 : le tableau de bord

| Zone | Contenu |
| --- | --- |
| **En haut** | Chiffre d'affaires, marge brute, taux de marge, nombre de clients, panier moyen, avec évolution |
| **Au milieu** | Courbe du chiffre d'affaires et de la marge par mois |
| **En bas à gauche** | Classement des produits par marge (les 10 meilleurs et les 10 pires) |
| **En bas à droite** | Comparaison des 3 magasins |
| **Filtres** | Magasin, catégorie, période |

> [!astuce]
> Montrez une **première version** au client après quelques jours. Il vous dira ce qui lui est vraiment utile, et vous éviterez de construire des pages que personne ne regardera.

## Étape 5 : présenter et recommander

### La structure de la présentation

1. **Le message principal** en une phrase : « Votre marge baisse parce que 8 produits importants sont vendus presque à perte depuis la hausse des prix d'achat. »
2. **Les preuves** : 2 ou 3 graphiques clairs.
3. **L'impact chiffré** : « environ X millions d'ariary de marge perdue sur 6 mois ».
4. **Les recommandations** : revoir les prix de 8 produits, arrêter 5 promotions non rentables, surveiller les prix d'achat chaque mois.
5. **Les limites** : données manquantes, hypothèses.
6. **La suite** : tableau de bord mis à jour chaque mois.

> [!madagascar]
> Présentez les montants en **ariary** avec des séparateurs de milliers clairs (12 500 000 Ar), et adaptez le vocabulaire au client : un gérant d'épicerie comprend « argent gagné sur chaque produit » mieux que « marge brute unitaire ».

> [!retenir]
> - Transformez une demande vague en 3 à 5 questions précises.
> - Vérifiez les totaux avant toute analyse.
> - Du général au détail, puis cherchez et chiffrez les causes.
> - Un tableau de bord simple, validé tôt avec le client.
> - Un message principal, des preuves, des recommandations et les limites.

## Exercice pratique : l'analyse Mirana

> [!exercice] Exercice pratique · 8 heures (sur plusieurs jours)
> 1. Créez un jeu de données réaliste (ventes de 3 magasins sur 12 mois et prix d'achat) ou utilisez un jeu de données public de ventes.
> 2. Rédigez les questions d'analyse.
> 3. Nettoyez, reliez et vérifiez les données avec un journal.
> 4. Menez l'analyse et chiffrez au moins 2 causes.
> 5. Construisez le tableau de bord.
> 6. Rédigez une présentation de 6 diapositives ou une note de 2 pages.
>
> **À livrer** : vos fichiers, votre tableau de bord, votre présentation et une étude de cas d'une page. C'est votre projet de portfolio.
