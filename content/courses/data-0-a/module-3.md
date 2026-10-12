Un annotateur avancé est jugé sur sa **qualité constante** et sur sa capacité à **améliorer celle des autres**. C'est ce qui ouvre les postes de contrôleur qualité, de formateur et de responsable de projet. Ce module vous apprend à contrôler, à classer les erreurs, à écrire des consignes et à travailler plus vite sans dégrader la précision.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Contrôler le travail d'autres annotateurs avec une méthode d'échantillonnage.
> 2. Classer les erreurs avec une grille de types d'erreurs.
> 3. Rédiger un retour utile à un annotateur.
> 4. Écrire ou améliorer des consignes d'annotation.
> 5. Augmenter votre vitesse sans perdre en précision.

## Le rôle de contrôleur qualité

> [!definition] Contrôleur qualité (reviewer)
> Un annotateur expérimenté qui vérifie le travail des autres, corrige les erreurs, mesure la qualité et fait remonter les problèmes de consignes. Ce rôle est en général mieux payé que l'annotation simple.

### Contrôler un lot en 5 étapes

1. **Tirez un échantillon au hasard** : souvent 5 à 10 % du lot, et au moins quelques dizaines de tâches.
2. **Contrôlez chaque tâche entièrement**, avec la grille des types d'erreurs.
3. **Calculez le taux de précision** de l'annotateur sur l'échantillon.
4. **Décidez** : lot accepté, lot à corriger par l'annotateur, ou lot à refaire.
5. **Rédigez un retour** individuel.

> [!exemple] Décision sur un lot
> Lot de 500 images. Échantillon de 50 images, 400 cadres contrôlés, 28 erreurs.
> Précision : (400 − 28) ÷ 400 × 100 = **93 %**. Objectif du projet : 95 %.
> Décision : lot renvoyé à l'annotateur avec la liste des types d'erreurs, puis nouveau contrôle sur un autre échantillon.

## La grille des types d'erreurs

Classer les erreurs permet de comprendre **pourquoi** elles arrivent, et donc de les corriger à la source.

| Type | Exemple | Cause probable |
| --- | --- | --- |
| **Oubli** | Un piéton non annoté | Fatigue, objet petit, zoom insuffisant |
| **Fausse annotation** | Un cadre sur une ombre | Mauvaise compréhension de la catégorie |
| **Mauvaise étiquette** | Une moto étiquetée vélo | Catégories proches, consigne floue |
| **Précision** | Cadre trop large | Travail trop rapide |
| **Règle non respectée** | Objet caché annoté en entier | Consigne mal lue |
| **Incohérence** | Même cas traité de deux façons | Pas de journal des cas limites |
| **Justification faible** (évaluation d'IA) | « La réponse B est meilleure » sans raison | Méthode de justification non maîtrisée |

## Rédiger un retour utile

Un bon retour fait progresser l'annotateur sans le décourager.

### La structure en 4 parties

1. **Le résultat** : « Précision de 93 % sur l'échantillon, objectif 95 %. »
2. **Ce qui va bien** : « Aucune erreur d'étiquette, très bon travail sur les objets cachés. »
3. **Les 2 ou 3 types d'erreurs principaux**, avec **un exemple** précis pour chacun : « 12 oublis de piétons de petite taille (exemples : images 34, 112, 245). »
4. **L'action** : « Zoomez à 200 % sur les zones éloignées avant de valider chaque image. »

> [!attention]
> Un retour sans exemple (« tu fais trop d'erreurs ») ne sert à rien. Un retour humiliant fait fuir les bons annotateurs. Restez **précis, factuel et bienveillant**.

## Écrire ou améliorer des consignes

Au niveau avancé, on vous demandera de **signaler** puis de **rédiger** des améliorations de consignes.

### La structure de consignes claires

1. **Le but du projet** en 3 lignes : à quoi serviront les données.
2. **Les catégories**, avec une définition et **2 exemples corrects** et **2 exemples incorrects** pour chacune.
3. **Les règles générales** (précision des cadres, objets cachés, objets coupés).
4. **Les cas limites** connus et la décision pour chacun.
5. **La foire aux questions**, enrichie au fil du projet.
6. **L'historique des modifications**, daté.

### Signaler un problème de consigne

> [!exemple] Signalement au responsable du projet
> « Bonjour, sur le lot 14, 3 annotateurs ont traité différemment les tricycles motorisés (bajaj) : 2 les ont étiquetés « moto », 1 « voiture ». La consigne ne mentionne pas ce cas. Proposition : ajouter une catégorie « tricycle motorisé », ou préciser qu'ils sont à étiqueter « moto ». Exemples : images 1203, 1210 et 1388. »

## Augmenter sa vitesse sans perdre en précision

| N° | Méthode | Gain |
| --- | --- | --- |
| 1 | **Raccourcis clavier** appris par cœur | Moins de clics, moins de fatigue |
| 2 | **Routine fixe** pour chaque tâche (ordre de lecture de l'image, ordre des étiquettes) | Moins d'oublis, plus de rythme |
| 3 | **Fiche mémo** des cas limites à portée de vue | Moins d'hésitations |
| 4 | **Blocs de travail** de 45 à 50 minutes avec pause | Précision stable sur la journée |
| 5 | **Mesure quotidienne** du nombre de tâches et de la précision | Vous voyez vos progrès et vos baisses |
| 6 | **Deux écrans** : consignes d'un côté, outil de l'autre | Moins d'aller-retour |

> [!astuce] La règle de la précision d'abord
> Augmentez votre vitesse **seulement** quand votre précision est stable au-dessus de l'objectif pendant au moins une semaine. Si elle baisse, revenez au rythme précédent. Sur la plupart des projets, un annotateur rapide mais imprécis est exclu ; un annotateur précis qui accélère progressivement est promu.

> [!madagascar]
> Les catégories des consignes viennent souvent d'autres pays et ne prévoient pas les objets courants à Madagascar (taxi-be, charrettes à zébus, pousse-pousse, bajaj). Votre connaissance du terrain est précieuse : signalez ces cas avec des exemples, c'est exactement ce que cherchent les bons responsables de projet.

> [!retenir]
> - Contrôle : échantillon au hasard, contrôle complet, taux de précision, décision, retour.
> - Classez les erreurs pour en comprendre les causes.
> - Un retour en 4 parties, précis et bienveillant.
> - Des consignes avec exemples corrects et incorrects, cas limites et historique.
> - La vitesse vient après une précision stable.

## Exercice pratique : contrôler et améliorer

> [!exercice] Exercice pratique · 3 heures
> 1. Demandez à 2 proches d'annoter rapidement 20 images (avec vos consignes « véhicules malgaches » du niveau Fondamentaux).
> 2. Contrôlez leur travail avec la grille des types d'erreurs, calculez leur précision et prenez une décision.
> 3. Rédigez un retour en 4 parties pour chacun.
> 4. Réécrivez vos consignes avec la structure en 6 parties, en ajoutant les cas limites révélés par leurs erreurs.
> 5. Rédigez un signalement de problème de consigne avec exemples.
>
> **À livrer** : vos 2 rapports de contrôle, vos 2 retours, les consignes réécrites et le signalement.
