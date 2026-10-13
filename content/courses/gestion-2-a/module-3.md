Un catalogue professionnel reste **propre dans la durée**, même avec des milliers de produits, plusieurs fournisseurs et plusieurs personnes qui le modifient. Ce module vous donne les méthodes des meilleurs : règles de données, taxonomie, contrôles automatiques, gestion des versions et documentation.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Rédiger un dictionnaire de données pour un catalogue.
> 2. Construire une taxonomie et des valeurs d'options normalisées.
> 3. Mettre en place des contrôles automatiques de qualité.
> 4. Gérer les sauvegardes et les versions des fichiers.
> 5. Documenter les processus pour une équipe.

## Le dictionnaire de données

> [!definition] Dictionnaire de données
> Un document qui décrit chaque champ du catalogue : son nom, son format, ses valeurs autorisées, s'il est obligatoire, et qui le remplit.

| Champ | Format | Valeurs autorisées | Obligatoire | Responsable |
| --- | --- | --- | --- | --- |
| SKU | MAJUSCULES-TIRETS | Règle de nommage | Oui | Gestionnaire de catalogue |
| Couleur | Texte | Liste fermée de 12 couleurs | Oui (si option) | Gestionnaire de catalogue |
| Poids | Nombre en grammes | Supérieur à 0 | Oui | Logistique |
| Code-barres | 8, 12, 13 ou 14 chiffres | Code valide du fabricant | Selon le canal | Fournisseur |
| Composition | Métachamp texte | Format « 100 % coton » | Oui (vêtements) | Fournisseur |

## Taxonomie et valeurs normalisées

| Valeurs reçues | Valeur normalisée |
| --- | --- |
| bleu, Bleu foncé, indigo, Navy | Indigo |
| rouge, Bordeaux, rouge vin | Bordeaux |
| m, Moyen, Medium, M | M |

| Niveau de taxonomie | Exemple |
| --- | --- |
| Catégorie principale | Femme |
| Sous-catégorie | Robes |
| Type de produit | Robe portefeuille |
| Catégorie Google (pour les flux) | Catégorie standard correspondante de Google |

> [!astuce]
> Une **table de normalisation** unique, partagée par toute l'équipe, évite que chaque personne invente ses propres valeurs. Les filtres de la boutique restent alors propres et utiles.

## Les contrôles automatiques

| Contrôle | Méthode |
| --- | --- |
| **Champs obligatoires vides** | Formule ou filtre dans l'export |
| **Valeurs hors liste** | Comparaison avec la table de normalisation |
| **Prix anormaux** | Prix inférieur au coût ou variation de plus de 20 % |
| **Codes-barres invalides** | Longueur et chiffre de contrôle |
| **Doublons de SKU** | Comptage |
| **Produits actifs sans image ou sans stock suivi** | Filtre ou automatisation |

> [!definition] Chiffre de contrôle
> Le dernier chiffre d'un code-barres EAN ou GTIN, calculé à partir des autres. S'il ne correspond pas au calcul, le code est faux. Les outils de vérification en ligne et les formules de tableur peuvent le vérifier.

### Le tableau de contrôle hebdomadaire

| Indicateur | Cette semaine | Objectif |
| --- | --- | --- |
| Variantes sans code-barres | 2 % | Moins de 1 % |
| Valeurs de couleur hors liste | 0 | 0 |
| Produits refusés dans le flux Google | 3 % | Moins de 5 % |
| Produits actifs sans image | 0 | 0 |

## Sauvegardes et versions

| Pratique | Pourquoi |
| --- | --- |
| **Export complet avant chaque import important** | Pouvoir revenir en arrière |
| **Nom de fichier daté** | « catalogue_2026-10-13_avant-soldes.xlsx » |
| **Dossier d'archives** | Garder les versions des 3 à 6 derniers mois |
| **Journal des imports** | Date, fichier, nombre de lignes, résultat, personne |

> [!attention]
> Ne travaillez jamais directement sur le **seul exemplaire** d'un fichier fournisseur ou d'un export. Travaillez sur une copie et gardez l'original intact.

## Documenter les processus

```
Processus – Nouvelle collection (Lamba Studio)
1. Réception du fichier fournisseur dans le dossier « 01_Fournisseur ».
2. Normalisation avec la table (couleurs, tailles) dans « 02_Travail ».
3. Contrôles automatiques : 0 erreur bloquante.
4. Génération des SKU et renommage des images.
5. Import en brouillon (commande NEW), contrôle de 10 produits.
6. Validation par la gérante.
7. Passage en actif, vérification du flux Google sous 48 h.
8. Entrée dans le journal des imports.
```

> [!madagascar]
> Une documentation claire permet à un **remplaçant** de prendre le relais si vous êtes indisponible (coupure, maladie). Les clients étrangers sont rassurés quand ils voient que le travail ne dépend pas d'une seule personne.

> [!retenir]
> - Un dictionnaire de données : format, valeurs, obligation, responsable.
> - Une taxonomie et une table de normalisation partagées.
> - Des contrôles automatiques et un tableau hebdomadaire.
> - Sauvegardes datées, archives, journal des imports, travail sur copie.
> - Des processus écrits que d'autres peuvent suivre.

## Exercice pratique : la qualité dans la durée

> [!exercice] Exercice pratique · 3 heures 30
> 1. Rédigez le dictionnaire de données d'un catalogue de vêtements (10 champs).
> 2. Créez la table de normalisation des couleurs et des tailles.
> 3. Construisez dans le tableur 5 contrôles automatiques et le tableau hebdomadaire.
> 4. Rédigez le processus « Mise à jour des prix fournisseur ».
>
> **À livrer** : votre dictionnaire, votre table, votre fichier de contrôles et votre processus.
