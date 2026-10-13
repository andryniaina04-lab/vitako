Ce module vous fait prendre en main les outils du gestionnaire de catalogue : **Google Sheets** pour préparer les données et **Shopify** pour les publier. Vous apprendrez à créer des produits et des variantes, à organiser les collections, à importer un fichier CSV, puis vous découvrirez les outils payants utilisés pour les gros catalogues : les **offres payantes de Shopify** et l'application **Matrixify**.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Créer un produit avec ses variantes dans Shopify.
> 2. Organiser les collections manuelles et automatiques.
> 3. Importer et exporter des produits avec un fichier CSV.
> 4. Utiliser les métachamps pour des informations supplémentaires.
> 5. Comprendre ce qu'apportent les offres payantes de Shopify et Matrixify.

## Shopify : produits et variantes

| Champ | Contenu |
| --- | --- |
| **Titre et description** | Fournis par le rédacteur ou le client |
| **Médias** | Images dans l'ordre, avec texte alternatif |
| **Prix et prix barré** | Prix de vente et « comparer au prix » |
| **Inventaire** | SKU, code-barres, quantité, suivi du stock |
| **Expédition** | Poids, produit physique ou non |
| **Variantes** | Options (taille, couleur) et valeurs |
| **Organisation du produit** | Type, fournisseur, collections, étiquettes |
| **Statut** | Actif, brouillon ou archivé |

> [!attention]
> Le nombre d'options et de variantes par produit est **limité** par Shopify, et ces limites évoluent. Vérifiez les limites actuelles dans le centre d'aide officiel avant de structurer un produit avec beaucoup de tailles et de couleurs.

## Les collections

| Type | Principe | Exemple |
| --- | --- | --- |
| **Manuelle** | On ajoute les produits un par un | « Sélection de la fondatrice » |
| **Automatique** | Les produits entrent selon des conditions | Étiquette = « été » ; type = « Robe » ; prix inférieur à 50 000 Ar |

> [!astuce]
> Les collections automatiques font gagner beaucoup de temps : si les **étiquettes et les types** sont bien remplis, un nouveau produit apparaît tout seul dans les bonnes collections. D'où l'importance d'une liste d'étiquettes fixée et respectée.

### La liste des étiquettes

```
Étiquettes autorisées – Boutique Lamba Studio
Saison : ete, hiver
Matière : coton, lin, raphia, soie-sauvage
Origine : fabrique-a-madagascar
Promotion : soldes, nouveaute
(minuscules, sans accents, avec tirets)
```

## L'import et l'export CSV

> [!definition] Fichier CSV
> Un fichier tableur simple, où chaque valeur est séparée par une virgule (ou un point-virgule). Shopify fournit un **modèle de CSV** avec les colonnes attendues.

### La méthode d'import

1. **Téléchargez** le modèle CSV officiel ou exportez quelques produits existants.
2. **Remplissez** le fichier dans Google Sheets en respectant les noms de colonnes.
3. **Contrôlez** les données (module 2).
4. **Exportez** au format CSV (encodage UTF-8 pour garder les accents).
5. **Testez** d'abord l'import avec 2 ou 3 produits.
6. **Importez** le fichier complet et vérifiez le résultat dans la boutique.

> [!attention]
> Avant toute modification en masse, faites un **export complet** de sauvegarde. Si l'import écrase des données par erreur, vous pourrez revenir en arrière.

## Les métachamps

> [!definition] Métachamp (metafield)
> Un champ personnalisé ajouté aux produits pour stocker une information qui n'existe pas par défaut : guide d'entretien, pays de fabrication, composition, durée de conservation.

| Métachamp | Exemple |
| --- | --- |
| Composition | 100 % coton |
| Entretien | Lavage à la main à 30 °C |
| Origine | Antsirabe, Madagascar |
| Artisan | Coopérative Fanja |

## Les outils payants

| Outil | Ce qu'il apporte |
| --- | --- |
| **Offres payantes de Shopify** | Une boutique en ligne réelle (au-delà de l'essai), plus de comptes collaborateurs et de fonctions selon l'offre ; c'est le client qui paie l'abonnement |
| **Matrixify** (application Shopify) | Import et export très complets au format Excel ou CSV : produits, variantes, métachamps, collections, clients, redirections ; mises à jour planifiées ; idéal pour les gros catalogues et les migrations |

> [!madagascar]
> L'abonnement Shopify et Matrixify sont **payés par la boutique**. Pour vous former, utilisez une boutique d'essai ou une boutique de développement (avec un compte partenaire Shopify), et l'offre de démonstration de Matrixify si elle est proposée. Vérifiez les conditions sur les sites officiels.

> [!retenir]
> - Produits, variantes, inventaire, expédition, organisation et statut dans Shopify.
> - Vérifier les limites actuelles de variantes.
> - Collections automatiques basées sur des étiquettes fixées.
> - Import CSV : modèle, contrôle, UTF-8, test, sauvegarde avant.
> - Métachamps pour les informations en plus ; Matrixify pour les gros catalogues.

## Exercice pratique : un catalogue dans Shopify

> [!exercice] Exercice pratique · 3 heures 30
> 1. Ouvrez une boutique Shopify d'essai ou de développement.
> 2. Créez 2 produits à la main avec variantes, images et poids.
> 3. Importez 6 autres produits avec un fichier CSV préparé dans Google Sheets.
> 4. Créez 3 collections automatiques et 2 métachamps.
> 5. Faites un export complet et comparez-le avec votre fichier.
>
> **À livrer** : des captures de la boutique, votre fichier CSV et l'export.
