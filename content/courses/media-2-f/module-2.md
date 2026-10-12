Ce module vous donne les bases techniques du son : comprendre une forme d'onde, les niveaux et le volume perçu, les formats audio, les principaux défauts d'un enregistrement et les traitements essentiels (égaliseur, compresseur, réduction de bruit).

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Lire une forme d'onde et éviter la saturation.
> 2. Comprendre le volume perçu (LUFS) et les normes de diffusion.
> 3. Choisir les bons formats audio.
> 4. Reconnaître les défauts courants d'un enregistrement.
> 5. Expliquer le rôle de l'égaliseur, du compresseur et de la réduction de bruit.

## La forme d'onde et les niveaux

> [!definition] Forme d'onde
> La représentation visuelle du son : plus l'onde est haute, plus le son est fort. Les silences apparaissent comme des lignes plates.

> [!definition] Saturation (clipping)
> Quand le son dépasse le niveau maximal (0 dBFS), le haut de l'onde est « coupé ». Le son devient grésillant et ce défaut est très difficile à réparer.

| Niveau | Signification |
| --- | --- |
| **0 dBFS** | Le maximum absolu ; à ne jamais dépasser |
| **Crêtes autour de −6 à −3 dBFS** pendant l'enregistrement | Zone confortable, avec une marge de sécurité |
| **Crête maximale (true peak) autour de −1 dBFS** au mastering | Marge pour éviter la distorsion lors de la compression par les plateformes |

## Le volume perçu : les LUFS

> [!definition] LUFS
> Une unité qui mesure le **volume perçu** par l'oreille sur toute la durée d'un fichier. Deux épisodes au même niveau LUFS paraissent aussi forts l'un que l'autre.

| Usage | Repère courant (à vérifier selon la plateforme ou le client) |
| --- | --- |
| Podcast | Environ −16 LUFS (stéréo) |
| Livre audio | Normes précises imposées par la plateforme de distribution (niveau moyen, bruit de fond, crêtes) |
| Vidéo en ligne | Souvent autour de −14 LUFS |

> [!attention]
> Les plateformes publient leurs propres recommandations et les mettent parfois à jour. Lisez les **spécifications techniques** de la plateforme ou du client avant de livrer, surtout pour les livres audio, qui sont refusés s'ils ne respectent pas les normes.

## Les formats audio

| Format | Usage | Point clé |
| --- | --- | --- |
| **WAV** | Travail, archives, livraison de qualité | Sans perte, lourd |
| **MP3** | Publication de podcasts | Compressé ; souvent 128 kbit/s en mono ou 192 kbit/s en stéréo pour la parole |
| **M4A (AAC)** | Publication, vidéo | Compressé, bonne qualité |
| **FLAC** | Archives | Sans perte, plus léger que le WAV |

> [!astuce]
> Travaillez toujours à partir des fichiers **originaux en WAV** (ou dans le meilleur format disponible), et n'exportez en MP3 qu'à la fin. Ne retravaillez jamais un MP3 déjà compressé si vous avez l'original.

## Les défauts courants

| Défaut | Cause | Solution principale |
| --- | --- | --- |
| **Bruit de fond** (ventilateur, circulation) | Pièce bruyante | Réduction de bruit, avec modération |
| **Souffle** | Micro de mauvaise qualité, gain trop fort | Réduction de bruit |
| **Écho, réverbération** | Pièce vide aux murs durs | Réduction de réverbération (outils spécialisés) ; difficile à corriger |
| **Plosives** (« p », « b » qui explosent) | Bouche trop près du micro | Filtre passe-haut ciblé, correction manuelle |
| **Sifflantes** (« s » trop forts) | Voix, micro | Dé-esseur |
| **Clics de bouche** | Bouche sèche | Suppression manuelle ou outil spécialisé |
| **Volume inégal** | Voix fortes et faibles | Compresseur, ajustements de volume |
| **Saturation** | Gain trop fort | Très difficile à réparer ; prévenir à l'enregistrement |

## Les traitements essentiels

| Traitement | Rôle | Exemple d'usage |
| --- | --- | --- |
| **Filtre passe-haut** | Supprimer les graves inutiles (bourdonnements, chocs) | Couper en dessous d'environ 80 Hz pour une voix |
| **Égaliseur (EQ)** | Corriger le timbre | Retirer un son « nasillard », ajouter de la clarté |
| **Compresseur** | Réduire l'écart entre les passages forts et faibles | Voix plus régulière et présente |
| **Dé-esseur** | Adoucir les « s » trop forts | Voix aiguës ou micro brillant |
| **Réduction de bruit** | Diminuer le bruit de fond constant | Ventilateur, souffle |
| **Limiteur** | Empêcher les crêtes de dépasser un niveau | Dernier traitement du mastering |

> [!definition] Chaîne de traitement
> L'ordre dans lequel on applique les traitements. Un ordre courant pour la voix : réduction de bruit → filtre passe-haut → égaliseur → compresseur → dé-esseur → limiteur (au mastering).

> [!madagascar]
> Beaucoup d'enregistrements faits à Madagascar contiennent des bruits typiques : circulation, coqs, pluie sur un toit en tôle, groupe électrogène. La réduction de bruit aide, mais le meilleur conseil à donner aux clients reste d'**enregistrer dans une petite pièce meublée** (rideaux, tissus) et au moment le plus calme de la journée.

> [!retenir]
> - Ne jamais dépasser 0 dBFS ; garder une marge à l'enregistrement.
> - Les LUFS mesurent le volume perçu ; respectez les normes de la plateforme.
> - Travailler en WAV, publier en MP3 à la fin.
> - Reconnaître bruit, souffle, écho, plosives, sifflantes, clics, volume inégal.
> - Une chaîne de traitement dans l'ordre, sans excès.

## Exercice pratique : diagnostiquer un enregistrement

> [!exercice] Exercice pratique · 2 heures
> 1. Enregistrez 3 minutes de voix dans 3 lieux différents (pièce vide, pièce meublée, extérieur).
> 2. Pour chaque enregistrement, listez les défauts entendus avec leur moment précis.
> 3. Mesurez les crêtes et le volume perçu (outils de mesure d'Audacity ou une extension gratuite).
> 4. Proposez pour chacun une chaîne de traitement.
>
> **À livrer** : vos 3 enregistrements, vos diagnostics et vos chaînes de traitement.
