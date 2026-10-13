Les catalogues professionnels se gèrent avec les **fonctions avancées de Shopify** (marchés, métaobjets, automatisations) et avec **Matrixify** pour les imports, exports, mises à jour en masse et migrations. Ce module vous apprend à les utiliser en sécurité sur des milliers de produits.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Utiliser les fonctions avancées de Shopify pour les données produits.
> 2. Exporter et importer tout un catalogue avec Matrixify.
> 3. Mettre à jour en masse par SKU sans écraser d'autres données.
> 4. Planifier des imports automatiques depuis un fichier fournisseur.
> 5. Préparer une migration de plateforme.

## Shopify : les fonctions avancées

| Fonction (selon l'offre, à vérifier) | Usage pour le catalogue |
| --- | --- |
| **Éditeur en masse** | Modifier de nombreux produits et variantes dans un tableau |
| **Métachamps** | Informations supplémentaires (composition, entretien, origine) |
| **Métaobjets** | Données structurées réutilisables (fiche d'un artisan, guide des tailles) liées à plusieurs produits |
| **Marchés** (Markets) | Prix, devises, langues et disponibilités par pays |
| **Automatisations** (Shopify Flow, selon l'offre) | Étiqueter les produits en rupture, masquer les produits sans image, alerter |
| **Canaux de vente** | Google et YouTube, Facebook et Instagram, places de marché |

> [!exemple] Une automatisation utile
> Quand le stock d'une variante passe à 0, ajouter l'étiquette « rupture » ; quand toutes les variantes d'un produit sont à 0, retirer le produit de la collection « Nouveautés » et prévenir la gérante.

## Matrixify : export et import complets

> [!definition] Matrixify
> Une application Shopify payante qui exporte et importe presque toutes les données de la boutique (produits, variantes, images, métachamps, collections, clients, commandes, redirections) dans des fichiers Excel ou CSV.

| Fonction | Usage |
| --- | --- |
| **Export complet** | Sauvegarde et base de travail |
| **Import avec commande** (création, mise à jour, remplacement, suppression) | Contrôler précisément ce qui change |
| **Mise à jour par SKU ou par identifiant** | Modifier les prix ou stocks seulement |
| **Imports planifiés** | Lire chaque semaine un fichier fournisseur à une adresse ou un serveur |
| **Migration** | Importer des données exportées d'une autre plateforme |
| **Redirections** | Garder le référencement des anciennes adresses |

### La colonne « Command »

| Commande (selon la documentation officielle) | Effet |
| --- | --- |
| **NEW** | Créer seulement si l'élément n'existe pas |
| **UPDATE** | Modifier seulement si l'élément existe |
| **MERGE** | Créer ou modifier |
| **REPLACE** | Supprimer et recréer (attention : perte possible de données liées) |
| **DELETE** | Supprimer |

> [!attention]
> **REPLACE** et **DELETE** sont dangereux sur une boutique en ligne. Faites toujours un **export complet de sauvegarde** avant un import, testez sur quelques lignes, et vérifiez dans la documentation officielle le comportement exact de chaque commande.

## Mettre à jour par SKU

1. **Exportez** les variantes avec leur SKU et les colonnes à modifier.
2. **Calculez** les nouvelles valeurs dans le tableur (nouveau prix fournisseur × coefficient).
3. **Gardez** uniquement les colonnes nécessaires (identifiant, SKU, prix).
4. **Importez** avec la commande de mise à jour.
5. **Contrôlez** un échantillon et le rapport de résultats de Matrixify.

## L'import planifié depuis un fournisseur

| Étape | Exemple |
| --- | --- |
| **Fichier fournisseur** | Le fournisseur publie chaque lundi un fichier : référence, prix, stock |
| **Correspondance** | Sa référence est reliée à votre SKU (colonne dédiée ou métachamp) |
| **Transformation** | Calcul du prix de vente, arrondi, limitation des stocks |
| **Planification** | Import automatique chaque lundi à 6 h |
| **Contrôles** | Alerte si un prix change de plus de 20 % ou si un stock est négatif |

> [!astuce]
> Ajoutez toujours des **garde-fous** : un fichier fournisseur erroné (prix à 0, colonne décalée) importé automatiquement peut casser toute la boutique en quelques minutes. Un contrôle avant import vaut mieux qu'une correction après.

## Préparer une migration

| Étape | Contenu |
| --- | --- |
| **Inventaire** | Produits, variantes, images, catégories, clients, commandes, pages, adresses |
| **Correspondance des champs** | Ancienne plateforme → Shopify |
| **Transformation** | Nettoyage, normalisation, nouvelles collections |
| **Import test** | Sur une boutique de développement |
| **Redirections** | Chaque ancienne adresse vers la nouvelle |
| **Recette** | Vérification par échantillon et par le client |
| **Bascule** | Import final, vérifications, mise en ligne |

> [!madagascar]
> Shopify et Matrixify sont **payés par la boutique**, en dollars. Pour vous former, utilisez une boutique de développement (avec un compte partenaire Shopify) et l'offre de démonstration de Matrixify si elle existe. Une migration réussie documentée est une excellente référence pour votre portfolio.

> [!retenir]
> - Shopify avancé : éditeur en masse, métachamps, métaobjets, marchés, automatisations.
> - Matrixify : export complet, commandes d'import, mise à jour par SKU, planification, migration, redirections.
> - Sauvegarde, test sur quelques lignes et documentation officielle avant tout import.
> - Des garde-fous sur les imports automatiques.
> - Une migration en 7 étapes, avec redirections et recette.

## Exercice pratique : des imports professionnels

> [!exercice] Exercice pratique · 4 heures
> 1. Faites un export complet de votre boutique de test (avec Matrixify en démonstration ou l'export CSV de Shopify).
> 2. Simulez une hausse de prix fournisseur de 8 % et préparez un fichier de mise à jour par SKU.
> 3. Rédigez les règles de contrôle d'un import planifié (5 garde-fous).
> 4. Rédigez le plan de migration d'une boutique WooCommerce de 300 produits.
>
> **À livrer** : vos fichiers, vos garde-fous et votre plan de migration.
