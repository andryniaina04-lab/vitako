Ce module vous donne les bases techniques de la retouche : comprendre une image numérique, lire un histogramme, corriger l'exposition et les couleurs, travailler avec des calques et des masques sans abîmer l'original, et exporter dans le bon format.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Comprendre les pixels, la résolution et les formats d'image.
> 2. Lire un histogramme et corriger l'exposition.
> 3. Corriger la balance des blancs et les couleurs.
> 4. Travailler de façon non destructive avec calques et masques.
> 5. Exporter dans le bon format et la bonne taille.

## L'image numérique

| Notion | Ce que c'est | Exemple |
| --- | --- | --- |
| **Pixel** | Le plus petit point de l'image | Une photo de 4 000 × 3 000 pixels |
| **Résolution** | Nombre de pixels | 12 mégapixels |
| **Profil de couleur** | La façon de décrire les couleurs | sRGB pour le web |
| **Profondeur** | Nombre de nuances par couleur | 8 bits (JPEG), 16 bits (TIFF, RAW) |

### Les formats

| Format | Usage | Point clé |
| --- | --- | --- |
| **JPEG** | Web, envoi aux clients | Compressé, léger, perd un peu de qualité à chaque enregistrement |
| **PNG** | Images avec transparence (produit détouré) | Sans perte, plus lourd |
| **WebP** | Web moderne | Léger, avec transparence possible |
| **TIFF** | Archives, impression | Sans perte, très lourd |
| **PSD** | Fichier de travail Photoshop ou Photopea avec calques | Garde toutes les modifications |
| **RAW** | Fichier brut de l'appareil photo | Beaucoup d'informations, à « développer » |

> [!astuce]
> Gardez toujours l'**original** intact et un **fichier de travail** avec les calques (PSD). Exportez ensuite les versions finales (JPEG, PNG) pour le client.

## L'histogramme et l'exposition

> [!definition] Histogramme
> Un graphique qui montre la répartition des tons de l'image, des ombres (à gauche) aux hautes lumières (à droite). Il aide à voir si une photo est trop sombre, trop claire ou manque de contraste.

| Histogramme | Signification | Correction |
| --- | --- | --- |
| Tassé à gauche | Photo sous-exposée (sombre) | Augmenter l'exposition ou les tons moyens |
| Tassé à droite, collé au bord | Photo surexposée, blancs « brûlés » | Baisser les hautes lumières |
| Étroit, au milieu | Manque de contraste | Courbes ou niveaux pour étirer les tons |

### Les outils de correction

1. **Niveaux** : régler le point noir, le point blanc et les tons moyens.
2. **Courbes** : ajuster finement la luminosité et le contraste.
3. **Ombres et hautes lumières** : récupérer des détails dans les zones sombres et claires.

## La balance des blancs et les couleurs

> [!definition] Balance des blancs
> Le réglage qui rend les blancs vraiment blancs. Une photo prise sous une ampoule est souvent trop jaune ; à l'ombre, trop bleue.

| Problème | Correction |
| --- | --- |
| Photo trop jaune ou orange | Refroidir (vers le bleu) |
| Photo trop bleue | Réchauffer (vers le jaune) |
| Dominante verte ou magenta | Corriger la teinte |
| Couleurs ternes | Augmenter légèrement la vibrance |

> [!attention]
> Pour les photos de produits, la couleur doit être **fidèle au produit réel**. Si le client vend un sac en raphia naturel, ne le rendez pas plus doré qu'il n'est : les retours de clients déçus coûtent cher à la boutique. Demandez un échantillon de couleur ou une photo de référence si besoin.

## Calques et masques : travailler sans abîmer

| Outil | Rôle |
| --- | --- |
| **Calque** | Une couche de l'image ; on peut le masquer, le modifier, le supprimer |
| **Calque de réglage** | Une correction (courbes, couleurs) appliquée sans modifier les pixels d'origine |
| **Masque** | Une zone noire et blanche qui montre ou cache une partie d'un calque (blanc = visible, noir = caché) |
| **Duplication du calque** | Travailler sur une copie, garder l'original |

> [!exemple] Éclaircir seulement le produit
> 1. Ajoutez un calque de réglage **Courbes** et éclaircissez.
> 2. Remplissez son masque en **noir** (la correction disparaît).
> 3. Peignez en **blanc** sur le produit : la correction n'apparaît que sur lui.

## Exporter correctement

| Usage | Format | Taille | Profil |
| --- | --- | --- | --- |
| Boutique en ligne | JPEG ou WebP | Selon la plateforme (souvent 1 000 à 2 000 px de côté) | sRGB |
| Produit sur fond transparent | PNG ou WebP | Selon l'usage | sRGB |
| Réseaux sociaux | JPEG | Formats carrés ou verticaux selon le réseau | sRGB |
| Impression | TIFF ou JPEG haute qualité | Selon la taille d'impression | Selon l'imprimeur |

> [!madagascar]
> Pour les sites de clients malgaches, exportez des images **légères** (par exemple moins de 300 Ko pour une photo de produit, selon la qualité visée) : les visiteurs utilisent souvent des données mobiles. Une image lourde ralentit le site et fait fuir les acheteurs.

> [!retenir]
> - Pixels, résolution, sRGB pour le web ; JPEG, PNG, WebP, TIFF, PSD, RAW.
> - L'histogramme guide la correction de l'exposition.
> - Des blancs vraiment blancs et des couleurs fidèles au produit.
> - Calques de réglage et masques pour ne jamais abîmer l'original.
> - Un export adapté à l'usage, léger pour le web.

## Exercice pratique : corriger 5 photos

> [!exercice] Exercice pratique · 2 heures 30
> 1. Prenez 5 photos de produits avec votre téléphone, dans des lumières différentes (ampoule, fenêtre, ombre).
> 2. Pour chacune, regardez l'histogramme et corrigez l'exposition avec niveaux ou courbes.
> 3. Corrigez la balance des blancs pour obtenir des couleurs fidèles.
> 4. Éclaircissez seulement le produit avec un calque de réglage et un masque.
> 5. Exportez une version web légère et gardez le fichier de travail.
>
> **À livrer** : les photos avant et après, et une capture de vos calques.
