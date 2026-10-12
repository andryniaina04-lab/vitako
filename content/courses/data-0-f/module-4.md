Dans ce module, vous menez un projet d'annotation complet, comme dans une vraie entreprise : lecture des consignes, phase de test, production, contrôle qualité de votre propre travail et rapport final. Vous apprenez aussi à jouer le rôle de **contrôleur qualité**, première étape pour évoluer dans le métier.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Suivre les 5 phases d'un projet d'annotation.
> 2. Réussir une phase de test (calibration).
> 3. Tenir un journal des cas limites.
> 4. Contrôler la qualité d'un lot d'annotations.
> 5. Rédiger un rapport de projet.

## Le cas pratique : « Marché propre »

> [!exemple] Votre projet
> Une startup développe une application qui repère les déchets sur les photos des marchés pour aider les communes à organiser le ramassage. Elle vous confie **200 photos** de marchés malgaches à annoter avec des cadres, selon 4 catégories : **plastique**, **organique** (restes de fruits, légumes), **papier-carton**, **autre déchet**. Elle vous confie aussi **150 messages** d'habitants à classer : *signalement*, *question*, *remerciement*, *hors sujet*.

## Les 5 phases d'un projet d'annotation

| N° | Phase | Ce que vous faites | Résultat |
| --- | --- | --- | --- |
| 1 | **Consignes** | Lire, faire sa fiche mémo, poser ses questions | Fiche mémo d'une page |
| 2 | **Calibration** (test) | Annoter un petit lot que le client vérifie | Votre taux de précision de départ |
| 3 | **Production** | Annoter l'ensemble du lot | Annotations terminées |
| 4 | **Contrôle qualité** | Relire un échantillon, corriger | Taux d'erreurs mesuré |
| 5 | **Livraison** | Exporter, rédiger le rapport | Fichiers + rapport |

## Phase 1 : les consignes du projet « Marché propre »

Voici un extrait des consignes du client :

1. Encadrer chaque déchet **visible au sol ou sur les étals**, pas ceux dans une poubelle fermée.
2. Un **tas de déchets mélangés** reçoit un seul cadre « autre déchet » s'il est impossible de séparer les objets.
3. Les **sacs plastiques encore utilisés** (par un vendeur ou un client) ne sont **pas** des déchets.
4. Les objets de moins de 10 pixels de côté ne sont pas annotés.
5. En cas de doute entre deux catégories, choisir celle qui couvre **la plus grande partie** de l'objet.

> [!astuce]
> Transformez chaque règle en **question** pour votre fiche mémo : « Est-ce dans une poubelle fermée ? → ne pas annoter. » « Le sac est-il tenu par quelqu'un ? → ne pas annoter. » Vous décidez plus vite.

## Phase 2 : la calibration

> [!definition] Calibration
> Un petit lot de test (souvent 20 à 50 exemples) que tous les annotateurs font avant la production. Le client compare les réponses aux siennes et explique les erreurs. Sur les plateformes, on parle souvent de **test de qualification**.

### Réussir sa calibration en 4 points

1. Prenez **tout votre temps** : la vitesse ne compte pas encore.
2. Appliquez les consignes **à la lettre**, même si une règle vous semble étrange.
3. Signalez chaque hésitation.
4. Lisez **attentivement** les retours, et ajoutez chaque correction à votre fiche mémo.

## Phase 3 : la production

### Organiser son travail

1. Découpez le lot : 200 photos = **8 sessions de 25 photos**.
2. Après chaque session : pause de 10 minutes.
3. Notez dans votre **tableau de suivi** : date, nombre de tâches, temps passé, cas limites.

| Session | Photos | Temps | Cas limites rencontrés |
| --- | --- | --- | --- |
| 1 | 1 à 25 | 1 h 10 | 3 (sacs pendus à un étal) |
| 2 | 26 à 50 | 55 min | 1 (déchet dans l'eau) |
| … | … | … | … |

### Le journal des cas limites

Pour chaque cas limite, notez : le numéro de l'exemple, la description, ce que vous avez décidé, la règle utilisée, et la réponse du client s'il y en a une.

> [!exemple] Une ligne du journal
> **Photo 37** · Sac plastique accroché à un étal, personne ne le tient · Décision : non annoté (règle 3 : encore utilisé par le vendeur) · Question envoyée au client · Réponse : « Correct, un sac accroché à un étal est en usage. »

## Phase 4 : le contrôle qualité

Avant de livrer, contrôlez vous-même votre travail comme le ferait un contrôleur.

### La méthode

1. Tirez **au hasard 10 %** des tâches (20 photos et 15 messages).
2. Vérifiez chaque annotation avec la **grille de contrôle** ci-dessous.
3. Comptez les erreurs et calculez votre **taux de précision**.
4. Si vous trouvez une **erreur répétée** (la même règle mal appliquée), corrigez-la **dans tout le lot**, pas seulement dans l'échantillon.

### La grille de contrôle des cadres

| N° | Question | Oui / Non |
| --- | --- | --- |
| 1 | Tous les déchets visibles sont-ils encadrés ? | |
| 2 | Chaque cadre est-il serré ? | |
| 3 | Chaque cadre contient-il tout l'objet visible ? | |
| 4 | L'étiquette est-elle la bonne ? | |
| 5 | Les règles 1 à 5 du client sont-elles respectées ? | |

> [!exemple] Calcul du taux de précision
> Sur 20 photos contrôlées, vous comptez 160 cadres, dont 8 erreurs (oubli, cadre trop large, mauvaise étiquette). Précision : (160 − 8) ÷ 160 × 100 = **95 %**.

## Phase 5 : la livraison et le rapport

Le rapport tient sur une page :

1. **Volume** : nombre de photos et de messages annotés, nombre total de cadres.
2. **Temps passé** et temps moyen par tâche.
3. **Qualité** : votre taux de précision sur l'échantillon contrôlé, les erreurs corrigées.
4. **Cas limites** : les 3 à 5 plus fréquents, avec la décision prise.
5. **Propositions** pour améliorer les consignes.

> [!attention] Erreurs fréquentes des débutants
> - Sauter la relecture des consignes après la calibration.
> - Corriger seulement l'échantillon contrôlé et pas les mêmes erreurs dans le reste du lot.
> - Ne pas noter les cas limites, puis prendre des décisions différentes pour des cas identiques.
> - Travailler 4 heures d'affilée et livrer une fin de lot bâclée.

> [!retenir]
> - 5 phases : consignes, calibration, production, contrôle qualité, livraison.
> - La calibration se fait lentement, à la lettre, et ses retours vont dans la fiche mémo.
> - Un journal des cas limites garantit des décisions identiques pour des cas identiques.
> - Contrôlez 10 % de votre travail et corrigez les erreurs répétées partout.
> - Un rapport court : volume, temps, qualité, cas limites, propositions.

## Exercice pratique : le projet « Marché propre »

> [!exercice] Exercice pratique · 3 heures
> 1. Rassemblez 50 photos de marchés ou de rues (vos photos, ou des images libres de droits).
> 2. Rédigez votre fiche mémo à partir des 5 consignes du client.
> 3. Annotez les 10 premières photos lentement (calibration), puis relisez-les avec la grille.
> 4. Annotez les 40 photos suivantes dans CVAT, avec votre tableau de suivi et votre journal des cas limites.
> 5. Écrivez 50 messages d'habitants et classez-les dans Label Studio.
> 6. Contrôlez 10 % de votre travail, calculez votre taux de précision et rédigez le rapport.
>
> **À livrer** : la fiche mémo, les exports, le tableau de suivi, le journal des cas limites et le rapport. C'est votre projet de portfolio.
