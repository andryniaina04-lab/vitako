Les sous-titreurs professionnels travaillent avec des logiciels qui affichent la vidéo, la forme d'onde du son et la liste des sous-titres, et qui calculent automatiquement la vitesse de lecture. Ce module vous fait prendre en main les deux logiciels gratuits les plus utilisés, **Subtitle Edit** et **Aegisub**, les formats de fichiers, la mise en ligne sur YouTube et les outils payants de sous-titrage automatique.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Créer et synchroniser des sous-titres dans Subtitle Edit.
> 2. Utiliser la forme d'onde et les alertes de lisibilité.
> 3. Créer des sous-titres stylés dans Aegisub.
> 4. Choisir le bon format de fichier et l'exporter.
> 5. Mettre des sous-titres en ligne sur YouTube ou les incruster dans une vidéo.
> 6. Utiliser et corriger le sous-titrage automatique.

## Les outils gratuits

| N° | Outil | À quoi il sert |
| --- | --- | --- |
| 1 | **Subtitle Edit** (Windows, gratuit) | Créer, synchroniser, vérifier et convertir des sous-titres ; très complet |
| 2 | **Aegisub** (gratuit) | Sous-titres stylés (polices, couleurs, positions), très utilisé pour les vidéos créatives |
| 3 | **YouTube Studio** | Ajouter et modifier les sous-titres d'une vidéo YouTube |
| 4 | **HandBrake** ou un logiciel de montage | Incruster les sous-titres dans la vidéo |
| 5 | **Correcteurs** (LanguageTool, BonPatron) | Orthographe |

## Subtitle Edit : la prise en main

### L'écran

| Zone | Contenu |
| --- | --- |
| **Liste des sous-titres** | Numéro, entrée, sortie, durée, texte, alertes |
| **Zone de texte** | Le sous-titre sélectionné, avec le nombre de caractères et les CPS |
| **Vidéo** | La vidéo avec les sous-titres affichés |
| **Forme d'onde** | Le son sous forme graphique, avec les sous-titres en blocs à caler |

### Créer des sous-titres en 7 étapes

1. **Ouvrez la vidéo** (Vidéo → Ouvrir un fichier vidéo).
2. **Générez la forme d'onde** (cliquez dans la zone prévue).
3. **Réglez les règles** dans les options : nombre maximal de caractères par ligne, CPS maximal, durées minimale et maximale, selon le guide du client.
4. **Écoutez** une phrase, puis **sélectionnez** sur la forme d'onde la zone où elle est dite (glisser avec la souris) et ajoutez un sous-titre à cet endroit.
5. **Tapez le texte**, découpé correctement.
6. **Ajustez** l'entrée et la sortie en tirant les bords du bloc sur la forme d'onde.
7. Répétez, puis **vérifiez** avec les outils de contrôle.

> [!astuce] Le mode de synchronisation rapide
> Si vous avez déjà le texte (transcription), importez-le, puis utilisez le mode de synchronisation où vous appuyez sur une touche au début et à la fin de chaque phrase pendant la lecture. C'est beaucoup plus rapide que de tout caler à la souris.

### Les contrôles automatiques

Subtitle Edit signale en couleur les sous-titres qui posent problème : trop longs, trop rapides (CPS), trop courts, qui se chevauchent. La fonction **Corriger les erreurs courantes** propose des corrections automatiques (espaces, chevauchements, durées) : **lisez chaque proposition** avant de l'accepter.

Les versions récentes de Subtitle Edit proposent aussi des fonctions de **transcription automatique** (avec des modèles à télécharger) : vérifiez ce que propose votre version.

## Aegisub : des sous-titres stylés

Aegisub est apprécié pour les vidéos où l'apparence des sous-titres compte (clips, vidéos créatives, karaoké).

1. **Styles** : créez des styles (police, taille, couleur, contour, position) et appliquez-les aux lignes.
2. **Positionnement** : placez un sous-titre en haut de l'écran quand un texte important occupe le bas de l'image.
3. **Effets** : animations simples, karaoké (avec modération).
4. **Format** : Aegisub enregistre en **ASS**, un format qui garde les styles.

## Les formats de fichiers

| Format | Points forts | Usage |
| --- | --- | --- |
| **SRT** | Simple, lu partout ; pas de styles avancés | YouTube, plateformes, lecteurs vidéo |
| **VTT** (WebVTT) | Proche du SRT, conçu pour le web, positionnement possible | Sites web, lecteurs en ligne, plateformes de cours |
| **ASS / SSA** | Styles avancés (polices, couleurs, positions) | Incrustation stylée, vidéos créatives |
| **Formats professionnels** (comme ceux demandés par la télévision et le streaming) | Exigences techniques précises | Agences et diffuseurs, selon leurs spécifications |

Subtitle Edit **convertit** d'un format à l'autre (Fichier → Enregistrer sous → choisir le format). Vérifiez toujours le fichier converti.

> [!definition] Encodage
> Enregistrez les fichiers de sous-titres en **UTF-8** : les accents et les caractères spéciaux s'afficheront correctement partout.

## YouTube et l'incrustation

### Ajouter des sous-titres sur YouTube

1. Ouvrez **YouTube Studio**, puis la vidéo, puis **Sous-titres**.
2. Choisissez la **langue**.
3. **Importez** le fichier SRT (avec horodatage).
4. Vérifiez l'affichage sur la vidéo.
5. Ajoutez d'autres langues de la même façon.

### Incruster les sous-titres

Pour les réseaux sociaux, le client veut souvent des sous-titres **dans l'image** :

1. Dans un **logiciel de montage** (DaVinci Resolve, CapCut), importez le fichier SRT, choisissez le style, puis exportez.
2. Ou avec **HandBrake** : ajoutez le fichier de sous-titres et choisissez l'option d'incrustation (*burn in*), puis exportez.
3. Vérifiez la lisibilité **sur téléphone** : taille, contraste, position (pas sous les boutons de l'application).

## Le sous-titrage automatique

| Outil | Usage |
| --- | --- |
| **Sous-titres automatiques de YouTube** | Gratuits, à corriger dans YouTube Studio |
| **CapCut** | Sous-titres automatiques pour vidéos courtes |
| **Descript** et services payants de sous-titrage automatique | Transcription automatique, export SRT, correction dans l'outil |

### Corriger un sous-titrage automatique

1. **Écoutez tout** en lisant chaque sous-titre.
2. **Corrigez les mots** faux, les noms propres, les chiffres, la ponctuation.
3. **Redécoupez** : les outils automatiques coupent souvent au milieu d'un groupe de sens.
4. **Vérifiez la vitesse de lecture** et condensez si besoin.
5. **Ajustez la synchronisation**.

Comme pour toute transcription automatique : **ne mettez pas de vidéo confidentielle** dans un outil en ligne sans l'accord du client.

## Les outils payants

| Outil | Ce qu'il apporte | Quand le prendre |
| --- | --- | --- |
| **Descript** | Transcription automatique, correction du texte avec la vidéo, export de sous-titres, montage par le texte | Quand vous travaillez souvent pour des créateurs et que le client accepte l'outil |
| **Offres payantes de sous-titrage automatique** | Transcription automatique dans de nombreuses langues, export en plusieurs formats | Pour accélérer les gros volumes, toujours avec relecture humaine |
| **Logiciels professionnels de sous-titrage** | Exigés par certaines agences de télévision ou de streaming | Seulement si une agence l'exige |

Les prix changent : vérifiez-les sur les sites officiels.

> [!madagascar]
> La reconnaissance automatique du **malagasy** est encore limitée dans beaucoup d'outils. Pour les vidéos en malagasy, comptez sur une transcription humaine : c'est justement là que votre travail a le plus de valeur.

> [!retenir]
> - Subtitle Edit : forme d'onde, règles réglées selon le client, contrôles automatiques.
> - Aegisub : styles et positionnement, format ASS.
> - SRT pour presque tout, VTT pour le web, ASS pour les styles ; toujours en UTF-8.
> - YouTube Studio pour les fichiers ; montage ou HandBrake pour l'incrustation.
> - Le sous-titrage automatique se corrige en 5 étapes, sans vidéo confidentielle en ligne.

## Exercice pratique : vos premiers sous-titres complets

> [!exercice] Exercice pratique · 2 heures 30
> 1. Installez Subtitle Edit, réglez les règles (42 caractères, 17 CPS, 1 à 7 secondes).
> 2. Sous-titrez dans la même langue une vidéo publique de 3 minutes, en synchronisant avec la forme d'onde.
> 3. Corrigez toutes les alertes et exportez en SRT et en VTT.
> 4. Dans Aegisub, créez un style et appliquez-le à 10 sous-titres de la même vidéo ; exportez en ASS.
> 5. Incrustez les sous-titres dans une version verticale de 30 secondes et vérifiez sur téléphone.
>
> **À livrer** : vos fichiers SRT, VTT et ASS, la vidéo incrustée et une capture de Subtitle Edit sans alerte.
