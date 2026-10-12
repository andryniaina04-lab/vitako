Les entreprises qui traitent beaucoup de données utilisent **Microsoft Excel** dans sa version complète (Microsoft 365), avec **Power Query** pour nettoyer et transformer automatiquement des fichiers, et des logiciels de reconnaissance de texte professionnels comme **ABBYY FineReader**. Ce module vous apprend leurs fonctions avancées.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Organiser les données dans des tableaux structurés.
> 2. Utiliser les fonctions de recherche et de condition avancées.
> 3. Nettoyer et combiner des fichiers avec Power Query.
> 4. Résumer des données avec un tableau croisé dynamique.
> 5. Extraire des tableaux de PDF scannés avec ABBYY FineReader.

## Les tableaux structurés

> [!definition] Tableau structuré
> Une plage de données transformée en **tableau** (Insertion → Tableau, ou Ctrl + T). Il s'agrandit automatiquement quand on ajoute des lignes, applique les formules à toute la colonne, et permet d'écrire des formules avec le nom des colonnes.

### Les avantages

1. **Formules lisibles** : `=[@Quantité]*[@Prix]` au lieu de `=C2*D2`.
2. **Recopie automatique** des formules dans les nouvelles lignes.
3. **Filtres et mise en forme** intégrés.
4. **Source fiable** pour les tableaux croisés dynamiques et Power Query.

Nommez chaque tableau clairement (exemple : `T_Clients`, `T_Factures`) dans l'onglet de création de tableau.

## Les fonctions avancées

### Rechercher une valeur

| Fonction | Usage | Exemple |
| --- | --- | --- |
| **RECHERCHEX** (Microsoft 365) | Chercher une valeur dans une colonne et renvoyer celle d'une autre colonne, dans n'importe quel sens | `=RECHERCHEX([@Code];T_Clients[Code];T_Clients[Ville];"Introuvable")` |
| **INDEX + EQUIV** | Même usage, compatible avec les anciennes versions | `=INDEX(T_Clients[Ville];EQUIV([@Code];T_Clients[Code];0))` |

> [!astuce]
> Le dernier argument de RECHERCHEX (« Introuvable ») remplace le message d'erreur. Filtrez ensuite la colonne sur « Introuvable » : vous voyez immédiatement les codes qui posent problème.

### Tester des conditions

| Fonction | Usage | Exemple |
| --- | --- | --- |
| **SI** | Une condition | `=SI([@Montant]>1000000;"Contrôle";"OK")` |
| **SI.CONDITIONS** | Plusieurs conditions dans l'ordre | `=SI.CONDITIONS([@Âge]<18;"Mineur";[@Âge]<60;"Adulte";VRAI;"Senior")` |
| **ET / OU** | Combiner des conditions | `=SI(ET([@Enfants]>[@Personnes]);"Incohérent";"OK")` |
| **SIERREUR** | Remplacer une erreur par une valeur | `=SIERREUR(formule;"À vérifier")` |

### Compter et additionner avec des critères

| Fonction | Usage |
| --- | --- |
| **NB.SI.ENS** | Compter les lignes qui respectent plusieurs critères (exemple : questionnaires d'un enquêteur dans une commune) |
| **SOMME.SI.ENS** | Additionner selon plusieurs critères (exemple : montant des factures d'un fournisseur sur un mois) |
| **UNIQUE**, **FILTRE**, **TRIER** (Microsoft 365) | Extraire la liste des valeurs uniques, filtrer et trier par formule |

## Power Query : nettoyer et combiner automatiquement

> [!definition] Power Query
> Un outil intégré à Excel (onglet Données → Obtenir des données) qui importe des données, les transforme par étapes enregistrées, et les charge dans un tableau. Quand de nouvelles données arrivent, on clique sur **Actualiser** : toutes les étapes se rejouent automatiquement.

### Nettoyer un fichier en 8 étapes

1. **Importez** le fichier (Excel, CSV, dossier entier).
2. **Promouvez** la première ligne en en-têtes si besoin.
3. **Définissez le type** de chaque colonne (texte, nombre entier, décimal, date).
4. **Supprimez** les espaces en trop (Transformer → Format → Supprimer les espaces).
5. **Mettez en forme** les noms (Majuscule à chaque mot).
6. **Remplacez** les valeurs incorrectes (exemple : « Tana » → « Antananarivo »).
7. **Supprimez les doublons** sur la colonne identifiant.
8. **Chargez** le résultat dans un nouveau tableau.

Chaque étape apparaît dans la liste **Étapes appliquées** : vous pouvez la modifier ou la supprimer à tout moment.

### Combiner des fichiers

| Opération | Usage | Exemple |
| --- | --- | --- |
| **Ajouter** (empiler) | Mettre bout à bout des fichiers de même structure | Les 12 fichiers mensuels de ventes en un seul tableau |
| **Fusionner** (joindre) | Ajouter des colonnes d'un autre tableau grâce à une clé commune | Ajouter la ville du client à chaque facture grâce au code client |
| **Importer un dossier** | Combiner automatiquement tous les fichiers d'un dossier | Chaque nouveau fichier déposé est intégré à l'actualisation |

> [!exemple] Gain de temps réel
> Un client envoie chaque semaine 5 fichiers d'enquêteurs à combiner et nettoyer. À la main : environ 2 heures par semaine. Avec Power Query : la première mise en place prend 3 heures, puis chaque semaine il suffit de déposer les fichiers dans le dossier et de cliquer sur Actualiser, soit quelques minutes.

## Le tableau croisé dynamique

> [!definition] Tableau croisé dynamique
> Un outil qui résume un grand tableau en quelques clics : totaux, moyennes, comptages, par catégorie et par période.

### Créer un tableau croisé en 5 étapes

1. Cliquez dans votre tableau structuré, puis **Insertion → Tableau croisé dynamique**.
2. Glissez une colonne en **Lignes** (exemple : Commune).
3. Glissez une colonne en **Colonnes** si besoin (exemple : Source d'eau).
4. Glissez une colonne en **Valeurs** (exemple : Nombre de ménages, en comptage).
5. Ajoutez un **segment** (filtre cliquable) pour la date ou l'enquêteur.

C'est l'outil idéal pour le **suivi de collecte** et les **rapports de qualité**.

## ABBYY FineReader : la reconnaissance professionnelle

| Fonction | Usage |
| --- | --- |
| **Reconnaissance de haute précision** | Documents imprimés, nombreuses langues |
| **Conversion de PDF en Excel** | Extraire des tableaux en gardant les colonnes |
| **Zones de reconnaissance** | Indiquer précisément où sont le texte, les tableaux, les images |
| **Vérification** | Les caractères incertains sont signalés pour une vérification rapide |
| **Traitement par lots** | Convertir automatiquement des dizaines de documents (selon la version) |
| **Comparaison de documents** | Trouver les différences entre deux versions d'un document |

### La méthode

1. **Scannez** les documents en bonne qualité (souvent 300 ppp, nets, droits).
2. **Réglez la langue** des documents.
3. **Vérifiez les zones** détectées, surtout les tableaux.
4. **Lancez la reconnaissance**, puis **vérifiez les caractères incertains** signalés.
5. **Exportez** vers Excel et **contrôlez** les totaux et les chiffres (comptage, somme, échantillon).

> [!attention]
> Même un excellent logiciel de reconnaissance fait des erreurs. Le contrôle humain des chiffres reste **indispensable** : c'est justement là que vous apportez votre valeur.

## Quels outils acheter ?

| Situation | Conseil |
| --- | --- |
| Employé d'une entreprise de traitement de données | Outils fournis |
| Freelance avec des clients qui exigent Excel complet | Abonnement Microsoft 365 |
| Gros volumes de documents scannés | ABBYY FineReader (ou outil de reconnaissance équivalent) |
| Petits volumes | Google Sheets, OCR de Google Drive, versions d'essai |

> [!madagascar]
> Les abonnements se paient en devises par carte bancaire internationale. Calculez le temps gagné : si Power Query vous fait gagner plusieurs heures par semaine sur un client régulier, l'abonnement est rentabilisé dès le premier mois.

> [!retenir]
> - Des tableaux structurés et nommés, source de toutes vos analyses.
> - RECHERCHEX, INDEX + EQUIV, SI.CONDITIONS, NB.SI.ENS, SOMME.SI.ENS.
> - Power Query : des étapes de nettoyage enregistrées et rejouées en un clic.
> - Le tableau croisé dynamique pour résumer et suivre.
> - ABBYY FineReader pour les gros volumes scannés, toujours avec un contrôle humain.

## Exercice pratique : automatiser un nettoyage

> [!exercice] Exercice pratique · 3 heures
> 1. Créez 3 fichiers de 30 lignes chacun (même structure : code client, nom, ville, date, montant), avec des erreurs volontaires : espaces, minuscules, doublons, villes écrites de plusieurs façons.
> 2. Dans Power Query, combinez-les, nettoyez-les en 8 étapes et chargez le résultat.
> 3. Ajoutez un tableau de clients et fusionnez-le pour récupérer la ville par code client.
> 4. Créez un tableau croisé dynamique des montants par ville et par mois.
> 5. Si possible, testez la version d'essai d'ABBYY FineReader sur une facture scannée et comparez avec l'OCR de Google Drive.
>
> **À livrer** : le fichier Excel avec les requêtes, le tableau croisé et votre comparaison de reconnaissance.
