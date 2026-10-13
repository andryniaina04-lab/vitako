Ce module vous fait prendre en main les outils du monteur audio : **Audacity**, gratuit et simple, et **Reaper**, un logiciel professionnel très complet à petit prix. Vous apprendrez à monter, nettoyer, mixer et exporter un épisode. Vous découvrirez aussi les outils payants : **Adobe Audition** et **iZotope RX**.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Monter un épisode dans Audacity.
> 2. Organiser un projet multipistes dans Reaper.
> 3. Appliquer une chaîne de traitement à une voix.
> 4. Ajouter musique et habillage, puis exporter.
> 5. Comprendre ce qu'apportent Adobe Audition et iZotope RX.

## Audacity : le montage simple

### Les fonctions essentielles

| Fonction | Usage |
| --- | --- |
| **Sélection et suppression** | Couper une erreur, un long silence |
| **Effets** | Réduction de bruit, égaliseur, compresseur, normalisation, limiteur |
| **Pistes** | Voix, musique, habillage sur des pistes séparées |
| **Enveloppes de volume** | Baisser la musique sous la voix |
| **Analyse** | Mesure des niveaux et du volume perçu |
| **Export** | WAV, MP3 et autres formats |

### Monter un épisode : la méthode

1. **Importez** l'enregistrement (gardez une copie de l'original).
2. **Écoutez** tout une première fois en notant les moments à couper.
3. **Coupez** les erreurs, faux départs, longs silences et hésitations excessives.
4. **Gardez** le naturel : quelques respirations et pauses rendent la voix vivante.
5. **Traitez** la voix (module 2).
6. **Ajoutez** générique et musique.
7. **Masterisez** au niveau demandé et exportez.

> [!astuce]
> Coupez de préférence **juste avant une respiration** ou dans un silence, et vérifiez que la coupe est inaudible. Une coupe au milieu d'un mot ou d'un souffle s'entend tout de suite.

## Reaper : le projet multipistes

> [!definition] Reaper
> Un logiciel professionnel de production audio (station audionumérique). Il propose une longue période d'essai, puis une licence peu chère pour un usage personnel ou les petites entreprises (vérifiez les conditions sur le site officiel).

| Fonction | Avantage pour le podcast |
| --- | --- |
| **Montage non destructif** | Les coupes et effets se modifient à tout moment |
| **Pistes et bus** | Une piste par voix, une piste musique, un bus pour toutes les voix |
| **Effets par piste** | Chaîne de traitement différente pour chaque intervenant |
| **Ripple editing** | Couper un passage décale automatiquement la suite sur toutes les pistes |
| **Modèles de projet** | Un modèle par podcast, prêt à l'emploi |
| **Rendu par lots** | Exporter plusieurs épisodes ou formats à la fois |

### Un modèle de projet de podcast

```
Piste 1 – Animatrice  : passe-haut → EQ → compresseur → dé-esseur
Piste 2 – Invité      : réduction de bruit → passe-haut → EQ → compresseur
Piste 3 – Musique     : volume baissé automatiquement sous les voix
Piste 4 – Habillage   : générique, jingles
Bus maître            : limiteur réglé selon la norme demandée
```

> [!madagascar]
> Pour un épisode enregistré à distance (appel en ligne), demandez à chaque intervenant d'**enregistrer sa propre voix en local** sur son téléphone ou son ordinateur, puis de vous envoyer le fichier. Le son est bien meilleur que celui de l'appel, souvent dégradé par une connexion instable.

## Mixer avec la musique

1. **Le générique** : musique seule quelques secondes, puis baisse sous la voix.
2. **La voix doit toujours dominer** : la musique de fond doit être nettement plus basse.
3. **Les transitions** entre les parties : courtes et cohérentes.
4. **Les droits** : utilisez de la musique **libre de droits** avec une licence qui autorise l'usage commercial, ou fournie par le client.

> [!attention]
> Utiliser une chanson connue sans autorisation peut faire **retirer** l'épisode des plateformes et exposer le client à des poursuites. Gardez toujours la preuve de la licence de chaque musique utilisée.

## Exporter et livrer

| Livrable | Format courant |
| --- | --- |
| Épisode pour les plateformes | MP3, au niveau demandé par le client (souvent autour de −16 LUFS) |
| Version de qualité pour archives | WAV |
| Extraits pour les réseaux sociaux | Fichiers courts, parfois avec vidéo (forme d'onde animée) |

## Un nouvel outil gratuit à tester : SoundCraft (ArtCraft)

**ArtCraft** est une suite de logiciels de création **gratuits et open source** (licence MIT ou Apache 2.0), publiée en octobre 2026 par un développeur indépendant. Elle fonctionne sur Windows, Mac et Linux, sans compte, et veut proposer des équivalents gratuits des grands logiciels payants. Pour l'audio, elle propose **SoundCraft**, ajouté en octobre 2026.

| Application ArtCraft | Équivalent payant | Usage dans ce métier |
| --- | --- | --- |
| **SoundCraft** | Pro Tools | Enregistrement, montage multipistes et mixage |
| **FilmCraft** | Adobe Premiere Pro | Monter un podcast vidéo |

> [!attention] Une version encore en test
> SoundCraft vient d'être publié et son niveau de maturité n'est pas encore connu ; les autres logiciels de la suite sont en version alpha, avec des bugs. Pour l'instant :
> - testez-le sur vos **projets personnels** ;
> - gardez **Audacity et Reaper** pour les épisodes de vos clients ;
> - **enregistrez souvent** et écoutez chaque export en entier avant de livrer ;
> - téléchargez-les **uniquement depuis le site officiel getartcraft.com ou la page GitHub du projet**, jamais depuis un site de téléchargement inconnu.

> [!astuce]
> Comparez un même montage dans Reaper et dans SoundCraft : vous saurez vite si SoundCraft peut devenir un outil de travail pour vous.

## Les outils payants

| Outil | Ce qu'il apporte |
| --- | --- |
| **Adobe Audition** | Logiciel complet de montage et de nettoyage, éditeur spectral, outils de correction et de normalisation, intégration avec Premiere Pro pour la vidéo |
| **iZotope RX** | Référence de la réparation audio : réduction de bruit, de réverbération, de clics de bouche, de saturation, avec une grande précision |

> [!definition] Éditeur spectral
> Une vue qui montre les fréquences du son dans le temps. On y voit et on peut effacer précisément un bruit isolé (toux, sonnerie, chaise) sans toucher à la voix.

> [!madagascar]
> Audition (abonnement Adobe) et iZotope RX (licence ou abonnement selon les versions) sont facturés en dollars. Commencez avec Audacity et Reaper ; investissez dans un outil de réparation quand vos clients vous envoient régulièrement des enregistrements difficiles. Vérifiez les prix et les promotions sur les sites officiels.

> [!retenir]
> - Audacity pour monter simplement ; Reaper pour les projets multipistes professionnels.
> - Coupes inaudibles, naturel préservé.
> - Une chaîne de traitement par voix et un limiteur au mastering.
> - Musique sous la voix, avec licence vérifiée.
> - Audition et iZotope RX pour les réparations difficiles.

## Exercice pratique : votre premier épisode

> [!exercice] Exercice pratique · 4 heures
> 1. Enregistrez une conversation de 15 minutes à deux voix (chacun sur son téléphone).
> 2. Montez-la dans Audacity : coupes, silences, hésitations.
> 3. Refaites le projet dans Reaper avec un modèle multipistes et une chaîne de traitement par voix.
> 4. Ajoutez un générique avec une musique libre de droits (notez la licence).
> 5. Exportez en MP3 au niveau d'environ −16 LUFS et en WAV.
>
> **À livrer** : l'enregistrement brut, l'épisode final, une capture du projet Reaper et la licence de la musique.
