Dans ce métier, vous n'avez pas d'abonnement à payer : les plateformes et les entreprises fournissent leurs outils. Mais les annotateurs avancés maîtrisent leurs **fonctions avancées** : annotation de vidéo par interpolation, attributs, pré-annotation par IA, configurations sur mesure. Ce module vous les enseigne avec CVAT et Label Studio, dont les principes se retrouvent dans tous les outils professionnels.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Annoter une vidéo avec des pistes et l'interpolation.
> 2. Utiliser des attributs pour enrichir chaque annotation.
> 3. Corriger efficacement une pré-annotation faite par l'IA.
> 4. Configurer une interface Label Studio sur mesure.
> 5. Mesurer la qualité avec l'IoU et l'accord entre annotateurs.

## Rappel : rien à acheter

| Situation | Outils |
| --- | --- |
| Plateformes d'annotation et d'évaluation d'IA | Outils propres à la plateforme, dans le navigateur |
| Entreprises d'annotation | CVAT, Label Studio ou outils maison, fournis |
| Projets directs | L'outil choisi par le client |

Votre investissement est votre **équipement** : un ordinateur fluide, un grand écran (ou deux), une souris précise, une connexion stable. Pour la vidéo et la 3D, une machine plus puissante fait une vraie différence.

## La vidéo : pistes et interpolation (CVAT)

Annoter une vidéo image par image serait interminable : 1 minute à 30 images par seconde = 1 800 images. Les outils utilisent des **pistes** et l'**interpolation**.

> [!definition] Interpolation
> Vous dessinez le cadre d'un objet sur une image, puis sur une image plus loin. L'outil calcule automatiquement la position du cadre sur toutes les images entre les deux. Vous corrigez seulement là où l'objet change de direction ou de vitesse.

### Annoter une vidéo en 7 étapes

1. Créez une tâche avec la vidéo et les étiquettes (voiture, moto, piéton…).
2. Choisissez le mode **piste** (*track*) au lieu de forme simple.
3. Dessinez le cadre de l'objet à sa **première apparition**.
4. Avancez de quelques images, **ajustez** le cadre : une **image clé** est créée.
5. Vérifiez que l'interpolation suit bien l'objet entre les images clés ; ajoutez des images clés là où il dévie.
6. Quand l'objet **sort du champ** ou est caché, marquez-le **hors champ** (*outside*) ou **caché** (*occluded*) selon les consignes.
7. Gardez **le même identifiant** du début à la fin : c'est le même objet, même s'il disparaît quelques images.

> [!attention]
> L'erreur la plus fréquente en vidéo : **changer d'identifiant** quand deux objets se croisent. Ralentissez la lecture à ces moments et vérifiez image par image.

## Les attributs

Un attribut ajoute une information à une annotation.

| Étiquette | Attributs possibles |
| --- | --- |
| Piéton | Âge apparent (adulte, enfant), action (marche, court, attend), porte un objet (oui / non) |
| Véhicule | Type (voiture, taxi-be, camion), état (garé, en mouvement), feux allumés (oui / non) |
| Déchet | Matière, taille, dans l'eau (oui / non) |

Pour les pistes vidéo, certains attributs peuvent **changer** au fil du temps (le piéton qui attend puis qui marche) : on les modifie à l'image où le changement a lieu.

## La pré-annotation par IA

De plus en plus de projets commencent par une annotation **automatique** que l'humain corrige.

### Les outils courants

1. **Détection automatique** : un modèle propose les cadres de tous les objets connus.
2. **Segmentation en un clic** : vous cliquez sur un objet, l'outil propose son contour (des modèles comme SAM, *Segment Anything*, sont intégrés dans certains outils).
3. **Suivi automatique** : l'outil suit l'objet dans la vidéo à partir d'un premier cadre.

### Corriger une pré-annotation : la méthode en 4 passes

| Passe | Ce que vous cherchez |
| --- | --- |
| **1. Oublis** | Les objets que l'IA n'a pas détectés |
| **2. Fausses détections** | Les cadres posés sur rien ou sur le mauvais objet |
| **3. Étiquettes** | Les objets détectés mais mal nommés |
| **4. Précision** | Les contours ou cadres trop larges, trop serrés, décalés |

> [!astuce]
> Ne faites **pas confiance** à la pré-annotation parce qu'elle « a l'air bonne ». Les IA se trompent de façon régulière sur certains cas (objets petits, sombres, partiellement cachés) : repérez ces cas dans les premières tâches et vérifiez-les en priorité ensuite.

## Label Studio : une interface sur mesure

Label Studio permet de configurer exactement l'interface dont un projet a besoin, avec un petit code de configuration.

> [!exemple] Configuration pour comparer deux réponses d'IA
> ```
> <View>
>   <Text name="question" value="$question"/>
>   <Text name="reponse_a" value="$reponse_a"/>
>   <Text name="reponse_b" value="$reponse_b"/>
>   <Choices name="preference" toName="question" choice="single" required="true">
>     <Choice value="A est meilleure"/>
>     <Choice value="B est meilleure"/>
>     <Choice value="Égalité"/>
>   </Choices>
>   <TextArea name="justification" toName="question" required="true"/>
> </View>
> ```
> Chaque tâche affiche la question, les deux réponses, un choix obligatoire et une case de justification obligatoire.

### Les autres fonctions utiles

1. **Relations** : relier deux entités dans un texte (« Rasoa » *travaille pour* « Banque X »).
2. **Pré-annotations** importées : le fichier de tâches contient déjà des propositions à vérifier.
3. **Instructions** affichées dans l'interface, pour garder les consignes sous les yeux.

## Mesurer la qualité

### L'IoU pour les cadres

> [!definition] IoU (intersection sur union)
> Une mesure de la ressemblance entre deux cadres : la surface commune divisée par la surface totale couverte par les deux. 1 = identiques, 0 = aucun recouvrement. Beaucoup de projets exigent une IoU minimale avec le cadre de référence (souvent autour de 0,7 à 0,9 selon les projets).

> [!exemple] Calcul simple
> Votre cadre fait 100 pixels², celui de référence aussi. Ils se recouvrent sur 80 pixels². L'union vaut 100 + 100 − 80 = 120 pixels². IoU = 80 ÷ 120 ≈ **0,67**.

### L'accord entre annotateurs

Quand plusieurs personnes annotent les mêmes données, on mesure à quel point elles sont **d'accord**. Un accord faible révèle des consignes floues ou un annotateur qui les comprend mal. Si vous êtes souvent en désaccord avec les autres, relisez les consignes et votre fiche mémo.

> [!madagascar]
> La vidéo et la 3D demandent beaucoup de données à télécharger. Travaillez ces tâches avec une connexion fixe, et prévenez le responsable du projet si votre connexion limite votre rythme : il pourra vous confier d'autres types de tâches pendant les périodes difficiles.

> [!retenir]
> - Vidéo : pistes, images clés, interpolation, et un identifiant constant.
> - Les attributs enrichissent chaque annotation.
> - Pré-annotation : 4 passes de correction, sans faire confiance aveuglément.
> - Label Studio se configure sur mesure pour chaque projet.
> - IoU et accord entre annotateurs : les mesures de votre qualité.

## Exercice pratique : vidéo et interface sur mesure

> [!exercice] Exercice pratique · 3 heures
> 1. Filmez 20 secondes d'une rue avec votre téléphone et annotez dans CVAT toutes les personnes et véhicules avec des pistes, l'interpolation et 2 attributs.
> 2. Testez un outil de pré-annotation (si disponible dans votre version) et corrigez en 4 passes ; sinon, demandez à un proche d'annoter 5 images « vite » et corrigez son travail en 4 passes.
> 3. Dans Label Studio, créez l'interface de comparaison de réponses d'IA et faites 10 comparaisons avec justification.
> 4. Calculez l'IoU de 3 de vos cadres par rapport à des cadres refaits avec soin.
>
> **À livrer** : l'export de votre vidéo annotée, votre rapport de correction, l'export Label Studio et vos 3 calculs d'IoU.
