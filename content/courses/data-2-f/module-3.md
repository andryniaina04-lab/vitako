Le tableur est l'outil principal de l'opérateur de saisie. Bien utilisé, il **empêche** les erreurs avant qu'elles arrivent, **nettoie** les données en quelques secondes et **contrôle** le travail automatiquement. Ce module vous fait prendre en main Google Sheets et Excel, la reconnaissance de texte gratuite, puis les outils payants que demandent certains clients.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Saisir vite au clavier dans un tableur avec les bons raccourcis.
> 2. Empêcher les erreurs avec la validation des données et les listes déroulantes.
> 3. Nettoyer des données avec 6 fonctions et la suppression des doublons.
> 4. Trier, filtrer et contrôler un tableau.
> 5. Transformer une image ou un PDF en texte avec un outil gratuit.
> 6. Savoir quand passer à Microsoft 365 et ABBYY FineReader.

## Les outils gratuits

| N° | Outil | À quoi il sert |
| --- | --- | --- |
| 1 | **Google Sheets** | Tableur en ligne, partage avec le client, historique des versions |
| 2 | **Excel** (selon la version disponible) | Le tableur le plus utilisé en entreprise |
| 3 | **Google Forms** | Créer un formulaire de saisie qui remplit un tableau automatiquement |
| 4 | **Google Drive** (reconnaissance de texte) | Transformer une image ou un PDF scanné en texte modifiable |
| 5 | **Site d'exercices de dactylographie** | S'entraîner chaque jour |

Les menus et fonctions ci-dessous sont donnés en français. Ils sont presque identiques dans Google Sheets et Excel.

## Saisir vite dans un tableur

| Touche | Action |
| --- | --- |
| **Tab** | Valider et passer à la cellule de droite |
| **Entrée** | Valider et passer à la ligne suivante (en revenant à la première colonne saisie après une série de Tab, dans Excel) |
| **Ctrl + flèche** | Aller au bout des données dans une direction |
| **Ctrl + D** | Recopier la cellule du dessus |
| **Ctrl + Z** | Annuler |
| **F2** | Modifier la cellule sans effacer son contenu (Excel) |

> [!astuce] Figer la ligne de titres
> **Affichage → Figer** (Google Sheets) ou **Affichage → Figer les volets** (Excel) : la ligne de titres reste visible quand vous descendez dans le tableau. Vous ne vous trompez plus de colonne.

## Empêcher les erreurs : la validation des données

La validation des données refuse (ou signale) une saisie qui ne respecte pas la règle. C'est le meilleur moyen d'éviter les erreurs.

### Créer une liste déroulante

1. Sélectionnez la colonne (par exemple « Moyen de paiement »).
2. **Données → Validation des données**.
3. Choisissez **Liste** (ou « Menu déroulant ») et entrez les choix : Espèces, MVola, Orange Money, Airtel Money, Virement.
4. Choisissez de **refuser** les saisies hors liste.

### Les autres règles utiles

| Colonne | Règle |
| --- | --- |
| Date | Doit être une date valide |
| Montant | Doit être un nombre supérieur à 0 |
| Quantité | Nombre entier entre 1 et 1 000 |
| Téléphone | Longueur exacte du texte (selon le format choisi) |

## Nettoyer des données : 6 fonctions

Dans les fonctions en français, on sépare les éléments par un **point-virgule** ( ; ).

| Fonction | Ce qu'elle fait | Exemple | Résultat |
| --- | --- | --- | --- |
| **SUPPRESPACE** | Supprime les espaces en trop | `=SUPPRESPACE(A2)` sur « Toamasina  » | « Toamasina » |
| **MAJUSCULE** | Met tout en majuscules | `=MAJUSCULE(A2)` sur « rakoto » | « RAKOTO » |
| **NOMPROPRE** | Met une majuscule à chaque mot | `=NOMPROPRE(A2)` sur « jean RAKOTO » | « Jean Rakoto » |
| **NB.SI** | Compte combien de fois une valeur apparaît | `=NB.SI(A:A;A2)` | 2 si la valeur est en double |
| **SOMME** | Additionne | `=SOMME(E2:E101)` | Le total de contrôle |
| **RECHERCHEV** | Cherche une valeur dans un autre tableau | `=RECHERCHEV(B2;Clients!A:C;3;FAUX)` | La ville du client dont le code est en B2 |

> [!exemple] Nettoyer une colonne de noms en 4 étapes
> 1. Insérez une colonne vide à côté de la colonne « Nom ».
> 2. Tapez `=NOMPROPRE(SUPPRESPACE(A2))` dans la première cellule, puis recopiez vers le bas.
> 3. Copiez la nouvelle colonne, puis **Collage spécial → Valeurs uniquement** à la place de l'ancienne.
> 4. Supprimez la colonne de travail.

### Supprimer les doublons

- **Google Sheets** : **Données → Nettoyage des données → Supprimer les doublons**.
- **Excel** : **Données → Supprimer les doublons**.

**Attention** : faites toujours une **copie** de la feuille avant, et choisissez bien les colonnes qui définissent un doublon (par exemple le numéro de facture, pas le nom du client, qui peut revenir plusieurs fois normalement).

## Trier, filtrer, contrôler

1. **Trier** : sélectionnez tout le tableau, puis trier par une colonne (date, montant). Ne triez **jamais** une seule colonne : les lignes seraient mélangées.
2. **Filtrer** : **Données → Créer un filtre** (Sheets) ou **Données → Filtrer** (Excel). Vous affichez par exemple seulement les montants supérieurs à 1 000 000 Ar, ou les cellules vides.
3. **Contrôler** avec des formules :
   - `=NBVAL(A2:A1000)` compte les lignes remplies (comparez au nombre de documents).
   - `=SOMME(E2:E1000)` donne le total de contrôle.
   - `=NB.SI(A:A;A2)>1` repère les identifiants en double.
4. **Mise en forme conditionnelle** : colorez automatiquement les cellules vides ou les montants anormaux pour les voir d'un coup d'œil.

> [!attention]
> Gardez **toujours** une copie de la version d'origine avant de nettoyer, trier ou supprimer. Dans Google Sheets, l'**historique des versions** (Fichier → Historique des versions) permet aussi de revenir en arrière.

## Formulaires de saisie avec Google Forms

Pour saisir beaucoup de questionnaires identiques, un formulaire est souvent plus rapide et plus sûr qu'un tableau.

1. Créez un **Google Forms** avec une question par champ du questionnaire papier, dans le **même ordre**.
2. Utilisez des **choix multiples** et des **listes** dès que possible : moins de frappe, moins d'erreurs.
3. Rendez les champs importants **obligatoires**.
4. Reliez le formulaire à une **feuille Google Sheets** : chaque envoi crée une ligne.

## La reconnaissance de texte (OCR)

> [!definition] OCR
> *Optical Character Recognition*, ou reconnaissance optique de caractères : un logiciel qui « lit » le texte d'une image ou d'un PDF scanné et le transforme en texte que l'on peut copier.

### L'OCR gratuit de Google Drive

1. Importez l'image ou le PDF dans Google Drive.
2. **Clic droit → Ouvrir avec → Google Docs**.
3. Le document s'ouvre avec l'image en haut et le **texte reconnu** en dessous.
4. Copiez le texte dans votre tableau, puis **vérifiez chaque chiffre** : l'OCR confond souvent 0 et O, 1 et l, 5 et S, surtout sur des documents de mauvaise qualité.

L'OCR fait gagner du temps sur les documents **imprimés** et nets. Sur l'écriture manuscrite ou les documents abîmés, la saisie manuelle reste souvent plus sûre.

## Un nouvel outil gratuit à tester : GridCraft (ArtCraft)

**ArtCraft** est une suite de logiciels de création **gratuits et open source** (licence MIT ou Apache 2.0), publiée en octobre 2026 par un développeur indépendant. Elle fonctionne sur Windows, Mac et Linux, sans compte, et veut proposer des équivalents gratuits des grands logiciels payants. Pour les tableaux, elle propose **GridCraft**, un tableur gratuit qui veut remplacer Excel, publié en octobre 2026.

| Application ArtCraft | Équivalent payant | Usage dans ce métier |
| --- | --- | --- |
| **GridCraft** | Microsoft Excel | Tableaux, formules et calculs |
| **WordCraft** | Microsoft Word | Rapports et documents |
| **PdfCraft** | Adobe Acrobat Pro | Fichiers PDF |

> [!attention] Une version encore en test
> GridCraft vient d'être publié et la presse spécialisée le juge encore loin d'Excel. Pour l'instant :
> - testez-le sur des **fichiers d'entraînement**, jamais sur les données réelles d'un client ;
> - **vérifiez chaque formule** et chaque total en comparant avec Excel ou Google Sheets ;
> - vérifiez qu'il ouvre et enregistre correctement les fichiers **.xlsx** avant de l'utiliser avec quelqu'un d'autre ;
> - téléchargez-les **uniquement depuis le site officiel getartcraft.com ou la page GitHub du projet**, jamais depuis un site de téléchargement inconnu.

> [!astuce]
> Pour les données des clients, une erreur de formule peut coûter très cher. Restez sur Excel ou Google Sheets pour le travail réel, et suivez les nouvelles versions de GridCraft.

## Quand passer aux outils payants ?

| Outil payant | Ce qu'il apporte | Qui le paie en général |
| --- | --- | --- |
| **Microsoft Excel** (Microsoft 365) | Toutes les fonctions d'Excel, dont **Power Query** pour nettoyer et transformer de gros fichiers automatiquement ; compatibilité totale avec les fichiers des entreprises | Vous, si vos clients exigent Excel ; ou l'entreprise qui vous emploie |
| **ABBYY FineReader** | OCR professionnel très précis, conversion de PDF en Excel en gardant les tableaux, traitement de nombreux documents à la fois | Vous, si vous traitez de gros volumes de documents scannés ; ou le client |

Les prix changent : vérifiez-les sur les sites officiels. Dans les entreprises de traitement de données, les logiciels sont **fournis**. En freelance, commencez avec Google Sheets et l'OCR de Google Drive, et investissez quand un client régulier l'exige.

> [!madagascar]
> Google Sheets fonctionne en ligne, mais il peut aussi être utilisé **hors connexion** dans le navigateur Chrome si vous activez ce mode à l'avance dans Google Drive. Utile pendant les coupures de connexion : vos saisies sont synchronisées au retour d'Internet.

> [!retenir]
> - Tab, Entrée, Ctrl + D et une ligne de titres figée pour saisir vite.
> - Validation des données et listes déroulantes : les erreurs sont bloquées à la source.
> - SUPPRESPACE, NOMPROPRE, MAJUSCULE, NB.SI, SOMME, RECHERCHEV pour nettoyer et contrôler.
> - Toujours une copie avant de nettoyer ou de supprimer des doublons.
> - OCR pour gagner du temps, mais chaque chiffre est vérifié.

## Exercice pratique : un tableau qui se protège

> [!exercice] Exercice pratique · 2 heures
> 1. Reprenez votre tableau de 20 reçus du module 2 dans Google Sheets.
> 2. Ajoutez une liste déroulante pour « Moyen de paiement » et des règles pour « Date » et « Montant ».
> 3. Ajoutez volontairement 5 erreurs (espaces, minuscules, doublon), puis nettoyez-les avec les fonctions et la suppression des doublons.
> 4. Ajoutez les formules de contrôle (NBVAL, SOMME, NB.SI) et une mise en forme conditionnelle pour les cellules vides.
> 5. Prenez en photo un document imprimé (facture, page de livre), passez-le dans l'OCR de Google Drive et comptez les erreurs de reconnaissance.
> 6. Créez un Google Forms de 6 questions relié à une feuille.
>
> **À livrer** : le lien de votre tableau (en lecture seule), le lien du formulaire et votre compte rendu sur l'OCR.
