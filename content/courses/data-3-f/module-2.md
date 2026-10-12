Ce module vous donne les bases de l'analyse de données : organiser des données propres, les nettoyer, calculer les indicateurs essentiels, choisir le bon graphique et éviter les erreurs d'interprétation.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Organiser des données en tableau propre.
> 2. Nettoyer des données avec une méthode en 7 points.
> 3. Calculer les indicateurs statistiques de base.
> 4. Choisir le bon graphique selon la question.
> 5. Éviter les erreurs d'interprétation courantes.

## Des données bien organisées

> [!definition] Données « tabulaires »
> Un tableau où **chaque ligne est une observation** (une vente, un client, une réponse à une enquête) et **chaque colonne est une variable** (date, produit, quantité, prix). Une seule information par cellule.

| Bon tableau | Mauvais tableau |
| --- | --- |
| Une ligne par vente | Plusieurs ventes dans une même cellule |
| Une colonne « Date » avec de vraies dates | Des dates écrites de façons différentes |
| Une colonne « Magasin » | Un onglet par magasin avec des formats différents |
| Pas de cellules fusionnées | Titres fusionnés au milieu des données |
| Pas de totaux au milieu des données | Lignes « Total » mélangées aux ventes |

## Nettoyer : la méthode en 7 points

| N° | Problème | Exemple | Correction |
| --- | --- | --- | --- |
| 1 | **Doublons** | La même vente enregistrée deux fois | Supprimer les doublons sur un identifiant |
| 2 | **Formats de dates** | 03/04/2026, 2026-04-03, 3 avril | Convertir en vraies dates, un seul format |
| 3 | **Nombres stockés en texte** | « 12 500 Ar » | Retirer « Ar » et les espaces, convertir en nombre |
| 4 | **Orthographes différentes** | Antananarivo, Tana, Antanarivo | Une seule valeur de référence |
| 5 | **Espaces en trop** | « Analakely » et « Analakely » suivi d'une espace | Fonction SUPPRESPACE |
| 6 | **Valeurs manquantes** | Prix vide | Chercher la valeur, ou décider d'exclure, et le noter |
| 7 | **Valeurs aberrantes** | Quantité de 10 000 au lieu de 10 | Vérifier avec la source avant de corriger |

> [!attention]
> Gardez toujours une **copie des données d'origine**, et notez chaque correction dans un **journal de nettoyage**. Si un résultat surprend le client, vous devez pouvoir expliquer exactement ce que vous avez modifié.

## Les indicateurs de base

| Indicateur | Définition | Exemple (ventes de 5 jours : 10, 12, 11, 13, 54) |
| --- | --- | --- |
| **Somme** | Total | 100 |
| **Moyenne** | Somme ÷ nombre de valeurs | 20 |
| **Médiane** | Valeur du milieu quand on les range | 12 |
| **Minimum et maximum** | Plus petite et plus grande valeur | 10 et 54 |
| **Pourcentage** | Part d'un total | 54 ÷ 100 = 54 % des ventes le dernier jour |
| **Évolution** | (Nouveau − ancien) ÷ ancien | De 10 à 12 : +20 % |

> [!definition] Moyenne et médiane
> La **moyenne** est sensible aux valeurs extrêmes : un seul jour exceptionnel (54) la fait monter à 20. La **médiane** (12) montre mieux une journée « normale ». Pour les salaires, les prix ou les revenus, regardez toujours les deux.

## Choisir le bon graphique

| Question | Graphique adapté |
| --- | --- |
| Comment cela évolue-t-il dans le temps ? | Courbe |
| Quelles catégories sont les plus grandes ? | Barres horizontales, triées |
| Quelle part de l'ensemble ? (2 à 4 parts) | Barres empilées à 100 %, ou anneau avec peu de parts |
| Deux variables sont-elles liées ? | Nuage de points |
| Comment les valeurs sont-elles réparties ? | Histogramme |
| Un chiffre clé | Grand nombre avec sa comparaison |

### Les règles d'un graphique clair

1. **Un titre qui dit le message** : « Les ventes d'Analakely baissent depuis mars », pas « Ventes ».
2. **Des axes lisibles** avec les unités (Ar, kg, %).
3. **Un axe vertical qui commence à zéro** pour les barres.
4. **Peu de couleurs** : une couleur pour mettre en valeur, du gris pour le reste.
5. **Pas d'effets 3D** ni de décorations inutiles.

## Les erreurs d'interprétation

| Erreur | Exemple | Bonne attitude |
| --- | --- | --- |
| **Corrélation et cause** | « Les ventes de parapluies et de rhumes augmentent ensemble, donc les parapluies rendent malade » | La saison des pluies explique les deux |
| **Petits nombres** | « +100 % de ventes ! » (de 2 à 4) | Donner aussi les chiffres absolus |
| **Comparaison injuste** | Comparer décembre à février | Comparer à la même période de l'année précédente |
| **Données incomplètes** | Un magasin n'a envoyé que 2 semaines | Signaler la limite |

> [!madagascar]
> Pensez aux **saisons et aux événements** propres à Madagascar quand vous analysez des chiffres : saison des pluies et cyclones, rentrée scolaire, fêtes de fin d'année, fête nationale du 26 juin, campagnes de vanille ou de litchis. Ils expliquent souvent des hausses ou des baisses.

> [!retenir]
> - Une ligne par observation, une colonne par variable, une information par cellule.
> - Nettoyage en 7 points, avec copie d'origine et journal.
> - Somme, moyenne, médiane, min et max, pourcentage, évolution.
> - Le graphique choisi selon la question, avec un titre qui dit le message.
> - Corrélation n'est pas cause ; attention aux petits nombres et aux comparaisons injustes.

## Exercice pratique : nettoyer et résumer

> [!exercice] Exercice pratique · 2 heures 30
> 1. Créez (ou téléchargez) un tableau de 100 ventes avec des erreurs volontaires : doublons, dates mélangées, nombres en texte, orthographes différentes.
> 2. Nettoyez-le avec la méthode en 7 points et tenez un journal.
> 3. Calculez les 6 indicateurs par magasin.
> 4. Créez 3 graphiques adaptés, chacun avec un titre qui dit le message.
>
> **À livrer** : vos fichiers avant et après, votre journal, vos indicateurs et vos graphiques.
