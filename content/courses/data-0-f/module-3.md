Chaque plateforme d'annotation a son propre outil, mais ils fonctionnent tous de la même façon. En apprenant deux outils gratuits très utilisés, **CVAT** pour les images et **Label Studio** pour le texte et les images, vous serez à l'aise sur n'importe quel projet. Ce module vous montre comment les prendre en main et comment travailler vite sans perdre en précision.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Créer une tâche et annoter des images avec des cadres dans CVAT.
> 2. Créer un projet de classification de texte dans Label Studio.
> 3. Utiliser les raccourcis clavier pour gagner du temps.
> 4. Exporter vos annotations.
> 5. Savoir pourquoi, dans ce métier, vous n'avez rien à acheter.

## Les outils de l'annotateur

| N° | Outil | Pour quoi | Accès |
| --- | --- | --- | --- |
| 1 | **CVAT** | Images et vidéos : cadres, polygones, points | Version en ligne (cvat.ai) avec offre gratuite, ou installation sur ordinateur |
| 2 | **Label Studio** | Texte, images, audio : classification, entités, transcription | Logiciel libre à installer, ou version en ligne |
| 3 | **Tableur** (Google Sheets) | Suivre votre temps, votre production et vos cas limites | Gratuit |
| 4 | **Fiche mémo** (document) | Règles du projet, cas limites | Gratuit |

> [!definition] Logiciel libre (open source)
> Un logiciel dont le code est public et qui peut être utilisé gratuitement. CVAT et Label Studio sont tous deux libres : ce sont des références que beaucoup d'entreprises utilisent ou imitent.

## CVAT : annoter des images

### Créer votre première tâche

1. Créez un compte gratuit sur la version en ligne de CVAT.
2. Cliquez sur **Projects → Create a new project** (ou directement **Tasks → Create a new task**).
3. Donnez un nom : « Véhicules Tana ».
4. Ajoutez les **étiquettes** (*labels*) : voiture, taxi-be, moto, vélo, charrette, autre. Choisissez une couleur pour chacune.
5. Importez 10 à 20 photos.
6. Cliquez sur **Submit** : la tâche est créée. Ouvrez-la puis cliquez sur le **Job** pour commencer.

### Dessiner un cadre

1. Dans la barre de gauche, choisissez l'outil **rectangle**.
2. Sélectionnez l'étiquette (par exemple « voiture »).
3. Cliquez sur **Shape** (forme), puis cliquez sur un coin de l'objet et sur le coin opposé.
4. Ajustez les bords en tirant sur les poignées, en **zoomant** (molette de la souris).
5. Passez à l'objet suivant.
6. Enregistrez régulièrement (**Ctrl + S**).

### Les raccourcis utiles dans CVAT

| Touche | Action |
| --- | --- |
| **N** | Dessiner une nouvelle forme avec le dernier outil utilisé |
| **F** | Image suivante |
| **D** | Image précédente |
| **Ctrl + S** | Enregistrer |
| **Molette** | Zoom avant / arrière |
| **Suppr** | Supprimer la forme sélectionnée |

Les raccourcis peuvent changer selon les versions : la liste complète est dans le menu d'aide de l'outil (souvent touche **F1**).

## Label Studio : annoter du texte

### Installer et démarrer

Sur un ordinateur avec Python installé, ouvrez un terminal et tapez :

```
pip install label-studio
label-studio start
```

Label Studio s'ouvre dans votre navigateur. Créez un compte local (il reste sur votre ordinateur).

### Créer un projet de classification

1. Cliquez sur **Create Project**, nommez-le « Avis clients ».
2. Dans **Data Import**, importez un fichier CSV ou texte avec une phrase par ligne.
3. Dans **Labeling Setup**, choisissez le modèle **Text Classification**.
4. Remplacez les choix proposés par : Positif, Négatif, Neutre.
5. Enregistrez, puis cliquez sur **Label All Tasks**.
6. Pour chaque texte, choisissez la catégorie et cliquez sur **Submit**.

### Marquer des entités nommées

1. Créez un autre projet avec le modèle **Named Entity Recognition**.
2. Définissez les étiquettes : PERSONNE, LIEU, ORGANISATION, DATE, MONTANT.
3. Sélectionnez l'étiquette, puis surlignez le groupe de mots avec la souris.

> [!astuce] Travailler au clavier
> Dans Label Studio, les étiquettes reçoivent souvent un **numéro** (1, 2, 3…) : appuyez sur le chiffre au lieu de cliquer. **Ctrl + Entrée** valide la tâche. Sur des centaines de textes, vous gagnez beaucoup de temps.

## Exporter les annotations

Une fois le travail fini, on **exporte** les annotations dans un format que les ingénieurs de l'IA sauront lire.

| Format | Utilisé pour |
| --- | --- |
| **COCO** (JSON) | Cadres et segmentation d'images |
| **YOLO** | Cadres d'images, très utilisé pour la détection d'objets |
| **Pascal VOC** (XML) | Cadres d'images |
| **CSV / JSON** | Classification de textes |

Sur une plateforme, l'export est fait par l'équipe du projet : vous n'aurez souvent qu'à **valider** vos tâches. Mais savoir que ces formats existent montre que vous comprenez la suite du travail.

## Vitesse et précision

Dans ce métier, il faut être **rapide et précis** à la fois. Voici comment progresser sans sacrifier la qualité.

1. **Apprenez les raccourcis** dès le premier jour.
2. **Gardez la même routine** pour chaque image : d'abord les gros objets, puis les petits, de gauche à droite.
3. **Mesurez-vous** : notez chaque jour le nombre de tâches et votre taux de précision, s'il est affiché.
4. **Ralentissez** dès que votre précision baisse.
5. **Pauses régulières** : la fatigue est la première cause d'erreurs.

## Rien à acheter : les plateformes fournissent les outils

| Situation | Outils |
| --- | --- |
| Plateforme d'annotation | Son propre outil, dans le navigateur, fourni gratuitement |
| Entreprise d'annotation | Ses outils (souvent CVAT, Label Studio ou un outil maison) et parfois un ordinateur |
| Projet direct avec un client | Le client choisit l'outil et vous donne un accès |

Dans ce métier, vous **n'avez pas d'abonnement à payer**. Votre investissement, c'est votre équipement : ordinateur, souris, écran, connexion. Méfiez-vous de quiconque vous demande d'acheter un logiciel ou un « accès » pour pouvoir travailler.

> [!madagascar]
> Les outils en ligne consomment des données, surtout avec des images en haute définition. Pour vous entraîner, utilisez des images légères, et préférez une connexion fixe pour les vrais projets.

> [!retenir]
> - CVAT pour les images, Label Studio pour le texte : deux références gratuites.
> - Les raccourcis clavier font gagner un temps précieux.
> - Les annotations s'exportent en formats standard (COCO, YOLO, CSV).
> - Vitesse **et** précision : mesurez-vous et ralentissez si la qualité baisse.
> - Pas d'abonnement à payer : les outils sont fournis.

## Exercice pratique : vos deux premiers projets

> [!exercice] Exercice pratique · 2 heures
> 1. Dans CVAT, créez la tâche « Véhicules Tana » avec 15 photos de rues et annotez tous les véhicules avec des cadres, en suivant vos consignes du module 2.
> 2. Dans Label Studio, créez le projet « Avis clients » avec 30 avis (écrivez-les ou reprenez des commentaires publics) et classez-les.
> 3. Créez un projet d'entités nommées avec 10 phrases d'actualité malgache.
> 4. Notez le temps passé et le nombre de tâches pour chaque projet.
> 5. Exportez les annotations des cadres au format COCO ou YOLO.
>
> **À livrer** : des captures de chaque projet, vos fichiers d'export et votre tableau de temps.
