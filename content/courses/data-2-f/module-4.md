Dans ce module, vous traitez un vrai lot de saisie, comme ceux que confient les entreprises et les ONG : 100 questionnaires d'enquête à saisir, nettoyer, contrôler et livrer. Vous suivez la méthode d'un professionnel, du bon de commande au rapport de livraison.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Analyser une consigne de saisie et préparer le tableau.
> 2. Organiser un lot de documents pour ne rien perdre.
> 3. Saisir un lot avec un rythme régulier et un suivi.
> 4. Contrôler la qualité avec un échantillon et des totaux.
> 5. Livrer avec un rapport clair.

## Le cas pratique : l'enquête « Rano sy Fahasalamana »

> [!exemple] Votre mission
> Une ONG a mené une enquête sur l'accès à l'eau dans 4 communes de la région Analamanga. Elle vous confie **100 questionnaires** scannés (PDF), remplis à la main par les enquêteurs. Chaque questionnaire contient 15 questions : commune, date, nombre de personnes dans le foyer, source d'eau principale, distance jusqu'à la source, prix payé par mois, etc. Elle veut un tableau propre sous **5 jours**, avec un **taux d'erreur inférieur à 0,5 %**.

## Étape 1 : analyser la consigne

Avant de saisir la première ligne, lisez toute la consigne et posez vos questions **en une seule fois**.

### Les 8 questions à se poser

1. Quelles sont les **colonnes** attendues, dans quel **ordre** ?
2. Quel **format** pour les dates, les nombres, les noms ?
3. Les réponses à choix sont-elles à saisir en **texte** (« Puits ») ou en **code** (« 2 ») ?
4. Que faire d'une réponse **illisible** ? D'une réponse **vide** ? D'une **réponse incohérente** (12 personnes dans le foyer, mais 0 adulte) ?
5. Faut-il saisir les **commentaires** écrits en marge ?
6. Quel **format de fichier** livrer (Excel, Google Sheets, CSV) ?
7. Quel **taux d'erreur** est accepté, et comment sera-t-il contrôlé ?
8. Les données sont-elles **confidentielles** (noms, téléphones) ?

> [!exemple] Extrait du tableau de codes fourni par l'ONG
>
> | Question | Réponse | Code à saisir |
> | --- | --- | --- |
> | Source d'eau principale | Robinet dans la maison | 1 |
> | | Borne-fontaine | 2 |
> | | Puits | 3 |
> | | Rivière ou source | 4 |
> | | Autre | 9 |
> | Réponse illisible | - | 98 |
> | Pas de réponse | - | 99 |

## Étape 2 : préparer le tableau et les documents

### Le tableau

1. Une colonne **N° questionnaire** en premier (l'identifiant unique).
2. Les 15 colonnes dans **l'ordre du questionnaire papier** : vos yeux suivent le document de haut en bas, vos doigts suivent le tableau de gauche à droite.
3. Une colonne **Remarques** à la fin, pour signaler un problème.
4. La **ligne de titres figée**.
5. Les **validations** : listes de codes, dates valides, nombres entre des limites raisonnables (exemple : nombre de personnes entre 1 et 30).

### Les documents

1. Vérifiez que vous avez bien **100 fichiers**, et qu'ils s'ouvrent tous.
2. **Renommez**-les si besoin dans un ordre clair : `Q001.pdf`, `Q002.pdf`… `Q100.pdf`.
3. Créez une **liste de suivi** : numéro, saisi (oui / non), problème.

## Étape 3 : saisir le lot

### Organiser les sessions

| Session | Questionnaires | Temps | Problèmes notés |
| --- | --- | --- | --- |
| 1 | Q001 à Q020 | 1 h 40 | Q007 : âge illisible (98) ; Q015 : 2 sources cochées |
| 2 | Q021 à Q040 | 1 h 25 | Q033 : page 2 manquante |
| … | … | … | … |

1. Sessions de **20 questionnaires** environ, puis une pause.
2. Le document à **gauche** (ou sur le premier écran), le tableau à **droite**.
3. Toujours le **même ordre** de saisie, colonne par colonne.
4. Vérifiez le **N° questionnaire** au début de chaque ligne : c'est la protection contre les décalages.
5. Notez chaque problème dans la colonne **Remarques** et dans la liste de suivi.

> [!astuce] Le rythme
> Les premiers questionnaires sont lents : vous découvrez l'écriture des enquêteurs et les cas difficiles. Ne vous inquiétez pas : votre vitesse augmente nettement après une vingtaine de documents. Ne sacrifiez jamais la précision pour rattraper le temps.

### Les cas difficiles

| Cas | Ce qu'on fait |
| --- | --- |
| Réponse illisible | Code 98 et remarque, **jamais** une supposition |
| Deux réponses cochées pour une question à choix unique | Suivre la consigne ; si rien n'est prévu, saisir la première et le signaler en remarque |
| Réponse incohérente (prix de l'eau de 2 000 000 Ar par mois) | Saisir ce qui est écrit, et le signaler en remarque |
| Page manquante | Saisir ce qui existe, codes 99 pour le reste, et signaler |

## Étape 4 : contrôler la qualité

### Les 5 contrôles

1. **Comptage** : 100 lignes, 100 numéros différents (vérifiez avec NB.SI qu'il n'y a pas de doublon).
2. **Cellules vides** : la mise en forme conditionnelle les fait ressortir ; chaque vide doit être un 99 ou être justifié.
3. **Valeurs anormales** : triez chaque colonne de nombres et regardez les plus petites et les plus grandes valeurs.
4. **Échantillon** : tirez **10 questionnaires au hasard** et comparez **chaque champ** avec le document.
5. **Calcul du taux d'erreur** sur l'échantillon.

> [!exemple] Calcul du taux d'erreur
> 10 questionnaires × 15 champs = 150 champs contrôlés. Vous trouvez 1 erreur.
> Taux d'erreur : 1 ÷ 150 × 100 ≈ **0,67 %**. C'est **au-dessus** de l'objectif de 0,5 %.
> Que faire ? Corrigez l'erreur, cherchez si elle se répète (même type d'erreur sur d'autres lignes), puis contrôlez **10 autres questionnaires**. Si le nouvel échantillon est sans erreur : 1 erreur sur 300 champs ≈ 0,33 %, l'objectif est atteint.

## Étape 5 : livrer avec un rapport

Le rapport tient sur une page :

1. **Volume** : 100 questionnaires saisis, 1 500 champs.
2. **Temps** total et temps moyen par questionnaire.
3. **Qualité** : taille de l'échantillon contrôlé, erreurs trouvées et corrigées, taux d'erreur final.
4. **Problèmes** : la liste des questionnaires avec remarques (illisibles, pages manquantes, incohérences).
5. **Fichier livré** : nom, format, nombre de lignes et de colonnes.

> [!madagascar]
> Les questionnaires remplis par différents enquêteurs ont des écritures très différentes. Si un enquêteur a une écriture difficile, signalez-le à l'ONG dans le rapport, avec les numéros concernés : elle pourra vérifier auprès de lui. C'est une information précieuse pour elle.

> [!attention] Erreurs fréquentes des débutants
> - Commencer à saisir avant d'avoir posé ses questions.
> - Un ordre de colonnes différent de l'ordre du questionnaire.
> - Deviner une réponse illisible.
> - Contrôler seulement quelques champs au lieu de questionnaires complets.
> - Livrer sans rapport ni liste des problèmes.

> [!retenir]
> - Lire toute la consigne et poser ses questions en une fois.
> - Un tableau dans l'ordre du document, avec validations et colonne Remarques.
> - Des sessions régulières, un suivi, et le numéro vérifié à chaque ligne.
> - 5 contrôles, dont un échantillon complet et le calcul du taux d'erreur.
> - Un rapport d'une page avec la liste des problèmes.

## Exercice pratique : votre lot de saisie

> [!exercice] Exercice pratique · 4 heures
> 1. Créez un questionnaire papier de 10 questions (sur un sujet simple : habitudes de transport, usage du téléphone) et faites-le remplir à la main par 30 personnes de votre entourage, ou remplissez-en vous-même 30 en variant les écritures.
> 2. Rédigez la consigne de saisie et le tableau de codes.
> 3. Préparez le tableau avec validations, puis saisissez les 30 questionnaires en notant votre temps et les problèmes.
> 4. Faites les 5 contrôles, avec un échantillon de 5 questionnaires, et calculez votre taux d'erreur.
> 5. Rédigez le rapport de livraison.
>
> **À livrer** : la consigne, le tableau final, la liste de suivi, votre calcul du taux d'erreur et le rapport. C'est votre projet de portfolio.
