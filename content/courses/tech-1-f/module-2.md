Ce module vous donne les bases du métier de testeur : analyser une exigence, écrire des cas de test, choisir les bonnes données de test, rédiger un rapport de bug parfait et organiser une campagne de tests.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Analyser une exigence et trouver ce qu'il faut tester.
> 2. Écrire des cas de test clairs.
> 3. Choisir les données de test avec des techniques reconnues.
> 4. Rédiger un rapport de bug complet.
> 5. Organiser une campagne de tests.

## Analyser une exigence

> [!exemple] Une exigence
> « Le client peut commander de 1 à 10 exemplaires d'un produit. La livraison est offerte à partir de 50 000 Ar d'achat. Le code promo BIENVENUE donne 10 % de remise sur la première commande. »

### Les questions du testeur

1. Que se passe-t-il avec 0 ou 11 exemplaires ?
2. La livraison est-elle offerte à **exactement** 50 000 Ar ?
3. La remise est-elle calculée avant ou après la livraison ?
4. Le code promo fonctionne-t-il en minuscules ?
5. Que se passe-t-il si le client essaie le code une deuxième fois ?

> [!astuce]
> Envoyez vos questions **avant** de tester. Beaucoup de bugs viennent d'exigences ambiguës, et une question bien posée évite des heures de développement inutile.

## Écrire un cas de test

| Champ | Exemple |
| --- | --- |
| **Identifiant** | CT-012 |
| **Titre** | Livraison offerte à partir de 50 000 Ar |
| **Préconditions** | Client connecté, panier vide |
| **Étapes** | 1. Ajouter un produit à 50 000 Ar. 2. Ouvrir le panier. |
| **Données** | Produit « Panier de fruits », 50 000 Ar |
| **Résultat attendu** | Frais de livraison : 0 Ar ; total : 50 000 Ar |
| **Priorité** | Haute |

### Les règles

1. **Un cas = un objectif** de vérification.
2. **Des étapes précises**, qu'une autre personne peut suivre sans aide.
3. **Un résultat attendu vérifiable** (un chiffre, un message exact).
4. **Des cas positifs** (ce qui doit marcher) **et négatifs** (ce qui doit être refusé).

## Choisir les données de test

### Les classes d'équivalence

> [!definition] Classes d'équivalence
> On regroupe les valeurs qui doivent donner le même comportement, et on teste une valeur de chaque groupe au lieu de toutes.

| Classe | Exemples de quantité | Résultat attendu |
| --- | --- | --- |
| Valide | 1 à 10 (on teste 5) | Accepté |
| Trop petit | 0 ou négatif (on teste 0) | Refusé avec message |
| Trop grand | 11 et plus (on teste 15) | Refusé avec message |

### Les valeurs limites

> [!definition] Valeurs limites
> Les erreurs se cachent souvent aux frontières. On teste juste avant, sur et juste après chaque limite.

| Limite | Valeurs à tester |
| --- | --- |
| Quantité minimale (1) | 0, 1, 2 |
| Quantité maximale (10) | 9, 10, 11 |
| Livraison offerte (50 000 Ar) | 49 999, 50 000, 50 001 |

## Le rapport de bug

| Champ | Exemple |
| --- | --- |
| **Titre** | Livraison facturée à 3 000 Ar pour un panier d'exactement 50 000 Ar |
| **Environnement** | Version 2.4.1, Chrome 129, Windows 11 ; aussi sur Android 12 (Chrome) |
| **Préconditions** | Client connecté, panier vide |
| **Étapes pour reproduire** | 1. Ajouter « Panier de fruits » (50 000 Ar). 2. Ouvrir le panier. |
| **Résultat obtenu** | Frais de livraison : 3 000 Ar, total 53 000 Ar |
| **Résultat attendu** | Frais de livraison : 0 Ar (exigence : offerte à partir de 50 000 Ar) |
| **Fréquence** | Systématique |
| **Gravité** | Majeure |
| **Pièces jointes** | Capture du panier, vidéo de 15 secondes |

### Gravité et priorité

| Gravité | Définition | Exemple |
| --- | --- | --- |
| **Bloquante** | Empêche une fonction essentielle | Impossible de payer |
| **Majeure** | Fonction importante incorrecte | Mauvais calcul de livraison |
| **Mineure** | Gêne sans conséquence importante | Texte mal aligné |
| **Cosmétique** | Détail visuel | Faute d'orthographe dans une infobulle |

> [!attention]
> Un rapport de bug décrit des **faits**, sans jugement (« le développeur a mal fait… »). Un bug que le développeur ne peut pas reproduire ne sera pas corrigé : les étapes doivent être précises.

## Organiser une campagne de tests

1. **Périmètre** : quelles fonctions, quels appareils, quelle version.
2. **Cas de test** préparés et priorisés.
3. **Exécution** : chaque cas marqué réussi, échoué ou bloqué.
4. **Rapports de bugs** pour chaque échec.
5. **Retests** des corrections et **régression** des fonctions voisines.
6. **Bilan** : nombre de cas, réussis, échoués, bugs ouverts par gravité, recommandation.

> [!madagascar]
> Incluez toujours dans vos campagnes un **téléphone Android d'entrée de gamme** et une **connexion lente** (simulée dans les outils du navigateur). Ce sont les conditions réelles de nombreux utilisateurs, et une source fréquente de bugs que les équipes ne voient pas.

> [!retenir]
> - Questionnez les exigences avant de tester.
> - Des cas de test précis, positifs et négatifs, avec un résultat attendu vérifiable.
> - Classes d'équivalence et valeurs limites pour choisir les données.
> - Des rapports de bugs factuels, reproductibles, avec gravité.
> - Une campagne : périmètre, cas, exécution, bugs, retests, bilan.

## Exercice pratique : vos premiers cas et rapports

> [!exercice] Exercice pratique · 3 heures
> 1. Écrivez 8 questions sur l'exigence de l'exemple.
> 2. Écrivez 12 cas de test (positifs et négatifs) avec les classes d'équivalence et les valeurs limites.
> 3. Testez un vrai site de commerce en ligne avec 6 de ces cas (adaptés).
> 4. Rédigez au moins 3 rapports de bugs complets (ou de « suspicions » si vous ne trouvez pas de bug).
> 5. Rédigez le bilan de votre campagne.
>
> **À livrer** : vos questions, vos cas de test, vos rapports et votre bilan.
