Ce module vous fait prendre en main l'administration d'une boutique **Shopify** et d'une boutique **WooCommerce** : produits, commandes, clients, réductions, statistiques, et l'import de nombreux produits avec un tableur. Vous découvrez aussi les abonnements et applications payants, et quand ils valent la peine.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Obtenir un accès d'équipe à la boutique d'un client.
> 2. Gérer produits, commandes, clients et réductions dans Shopify.
> 3. Faire les mêmes opérations dans WooCommerce.
> 4. Importer et modifier des dizaines de produits avec un fichier CSV.
> 5. Lire les statistiques de la boutique.
> 6. Savoir quand une application payante est utile.

## Les outils

| N° | Outil | À quoi il sert |
| --- | --- | --- |
| 1 | **Administration Shopify** | Gérer produits, stocks, commandes, clients, réductions, statistiques |
| 2 | **Administration WooCommerce** (tableau de bord WordPress) | Les mêmes fonctions pour une boutique WordPress |
| 3 | **Application mobile** de la plateforme | Suivre les commandes en déplacement |
| 4 | **Google Sheets** | Imports, exports, suivis, rapports |
| 5 | **Canva** ou **Photopea** | Recadrer et uniformiser les photos produits |

Pour vous entraîner sur Shopify, créez une **boutique de développement** gratuite avec le programme Shopify Partners. Pour WooCommerce, utilisez **LocalWP** sur votre ordinateur.

## L'accès d'équipe

1. **Shopify** : le commerçant vous ajoute comme **membre de l'équipe** (ou comme collaborateur depuis un compte partenaire), avec **seulement les droits nécessaires** : produits, commandes, clients, réductions. Pas d'accès aux paiements ni aux réglages sensibles si ce n'est pas utile.
2. **WooCommerce** : le commerçant crée un compte avec le rôle **Gestionnaire de la boutique** (*Shop manager*), et non administrateur.

> [!attention]
> Ne demandez jamais le mot de passe du propriétaire. Un compte personnel avec des droits limités protège le commerçant… et vous.

## Shopify : les opérations du quotidien

### Les produits

1. **Produits → Ajouter un produit** : titre, description, médias, prix, prix barré (« prix avant réduction »), coût par article, stock, SKU, poids, variantes.
2. **Coût par article** : indiquez le coût d'achat ; Shopify calcule alors la **marge**.
3. **Statut** : brouillon tant que la fiche n'est pas complète, puis actif.
4. **Collections** : manuelles (vous choisissez les produits) ou automatiques (selon des règles : « tous les produits avec l'étiquette raphia »).
5. **Modification en masse** : sélectionnez plusieurs produits pour changer en une fois le stock, le prix ou les étiquettes.

### Les commandes

1. **Commandes** : la liste avec le statut de paiement et de traitement.
2. Ouvrez une commande pour voir : articles, client, adresse, notes, niveau de risque de fraude.
3. **Traiter** la commande (*fulfill*) : ajoutez le transporteur et le **numéro de suivi** ; le client reçoit automatiquement un e-mail.
4. **Rembourser** : bouton de remboursement, partiel ou total, avec remise en stock si l'article revient.
5. **Brouillons de commande** : créer une commande pour un client qui a commandé par téléphone ou message.

### Les clients

La fiche client montre l'historique des commandes, le total dépensé et les notes. Respectez la **confidentialité** : ces données ne servent qu'à la gestion de la boutique.

### Les réductions

**Réductions → Créer une réduction** : code ou automatique ; pourcentage, montant fixe, livraison offerte, « achetez X, obtenez Y » ; conditions (montant minimum, produits concernés, nombre d'utilisations) ; **dates de début et de fin**.

### Les statistiques

Le tableau de bord **Statistiques** (*Analytics*) montre : ventes, sessions, taux de conversion, panier moyen, produits les plus vendus, sources de trafic. Des rapports plus détaillés sont disponibles selon l'abonnement.

## WooCommerce : les mêmes opérations

| Opération | Où |
| --- | --- |
| Produits, variantes, stocks | **Produits → Ajouter** ; onglet « Inventaire » pour le SKU et le stock ; type « Produit variable » pour les variantes |
| Commandes | **WooCommerce → Commandes** ; changer le statut (en attente, en cours, terminée, remboursée) ; ajouter une note au client |
| Clients | **WooCommerce → Clients** |
| Codes de réduction | **Marketing → Codes promo** |
| Statistiques | **Analytics** (ou **Rapports** selon la version) |

> [!astuce]
> Dans WooCommerce, une commande « En cours » signifie en général que le paiement est reçu et qu'elle doit être préparée. Passez-la à « Terminée » une fois expédiée. Ajoutez le numéro de suivi en **note au client** si aucune extension de suivi n'est installée.

## Importer des produits avec un fichier CSV

Ajouter 100 produits un par un prend des heures. Avec un **fichier CSV**, on les importe en quelques minutes.

### La méthode en 6 étapes

1. **Exportez** quelques produits existants : vous obtenez un fichier avec les **bonnes colonnes** (le format attendu par la plateforme).
2. **Ouvrez-le** dans Google Sheets.
3. **Remplissez** une ligne par produit (et par variante), en respectant exactement les colonnes : titre, description, prix, SKU, stock, poids, images (liens), etc.
4. **Vérifiez** : pas de cellule vide obligatoire, prix avec un point ou une virgule selon le format attendu, SKU uniques.
5. **Importez d'abord 3 produits** pour tester, puis vérifiez-les sur la boutique.
6. **Importez le reste**, puis vérifiez un échantillon de fiches.

> [!definition] CSV
> Un fichier texte où chaque ligne est un enregistrement et où les colonnes sont séparées par une virgule ou un point-virgule. Les plateformes l'utilisent pour importer et exporter des produits, des clients ou des commandes.

> [!attention]
> Un import peut **remplacer** des informations existantes. Faites toujours un **export de sauvegarde** avant un import qui modifie des produits existants.

## Les abonnements et applications payants

| Élément payant | Ce qu'il apporte | Qui décide et paie |
| --- | --- | --- |
| **Abonnement Shopify** | La boutique elle-même, avec des fonctions qui varient selon la formule (comptes d'équipe, rapports) | Le commerçant |
| **Applications Shopify payantes** | Avis clients, e-mails automatiques, programme de fidélité, traduction, imports avancés | Le commerçant, sur vos conseils |
| **Extensions WooCommerce payantes** | Suivi des colis, abonnements, réservations, fonctions avancées | Le commerçant |

### Conseiller une application : 5 questions

1. Quel **problème** règle-t-elle, et combien ce problème coûte-t-il aujourd'hui ?
2. Existe-t-il une **solution gratuite** ou intégrée ?
3. L'application est-elle **bien notée** et **mise à jour** ?
4. Ralentit-elle la boutique ?
5. Quel est son **coût mensuel**, comparé au gain espéré ?

Les prix changent : vérifiez-les sur les sites officiels. Trop d'applications ralentissent la boutique et coûtent cher : conseillez-en **peu**, et supprimez celles qui ne servent plus.

> [!madagascar]
> L'abonnement Shopify et les applications se paient en devises par carte bancaire internationale. Pour un commerçant malgache sans carte, WooCommerce avec un hébergement local ou des solutions gratuites peut être plus adapté : vérifiez avec lui avant de recommander une plateforme.

> [!retenir]
> - Un accès d'équipe avec des droits limités, jamais le mot de passe du propriétaire.
> - Shopify : produits et coûts, collections, commandes et suivi, remboursements, réductions datées, statistiques.
> - WooCommerce : les mêmes opérations, avec les statuts de commande.
> - Les imports CSV pour les gros volumes, toujours après sauvegarde et test.
> - Peu d'applications, choisies avec 5 questions.

## Exercice pratique : votre boutique d'entraînement

> [!exercice] Exercice pratique · 3 heures
> 1. Créez une boutique de développement Shopify (ou une boutique WooCommerce locale).
> 2. Ajoutez 5 produits complets à la main, dont 2 avec variantes, avec SKU et coût par article.
> 3. Exportez-les, ajoutez 15 produits dans le fichier CSV, puis importez-les (3 d'abord, puis le reste).
> 4. Créez 2 collections (une manuelle, une automatique) et 2 réductions datées.
> 5. Passez 3 commandes de test, traitez-en une avec un numéro de suivi, remboursez-en une.
>
> **À livrer** : des captures de vos produits, du fichier CSV, des collections, des réductions et des commandes traitées.
