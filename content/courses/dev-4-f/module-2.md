Ce module vous donne les bases communes à tous les outils no-code : décrire un besoin, concevoir une base de données, comprendre la mise en page web, écrire la logique d'une application et gérer les droits des utilisateurs.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Transformer un besoin en liste de fonctions et d'écrans.
> 2. Concevoir des tables reliées entre elles.
> 3. Comprendre la mise en page web (boîtes, Flexbox, adaptation au téléphone).
> 4. Décrire la logique : événements, conditions, actions.
> 5. Définir les droits d'accès.

## Du besoin aux fonctions

### Les histoires d'utilisateur

> [!definition] Histoire d'utilisateur
> Une phrase simple qui décrit un besoin : « En tant que [type d'utilisateur], je veux [action] afin de [bénéfice]. »

| N° | Histoire d'utilisateur | Priorité |
| --- | --- | --- |
| 1 | En tant que client, je veux voir les produits disponibles afin de choisir ma commande | Indispensable |
| 2 | En tant que client, je veux commander et choisir l'heure de retrait | Indispensable |
| 3 | En tant que gérant, je veux voir les commandes du jour afin de les préparer | Indispensable |
| 4 | En tant que client, je veux recevoir un SMS quand ma commande est prête | Plus tard |

> [!astuce]
> Construisez d'abord les fonctions **indispensables**. Une première version simple et fiable vaut mieux qu'une application complète qui n'est jamais terminée.

## Concevoir les données

| Table | Champs | Relation |
| --- | --- | --- |
| **Produits** | Nom, prix, photo, disponible (oui ou non), catégorie | — |
| **Clients** | Nom, téléphone, e-mail | — |
| **Commandes** | Client, date, heure de retrait, statut, total | Liée à un client |
| **Lignes de commande** | Commande, produit, quantité, prix | Liée à une commande et à un produit |

### Les types de champs

| Type | Exemple |
| --- | --- |
| Texte | Nom |
| Nombre | Prix, quantité |
| Date et heure | Heure de retrait |
| Oui ou non | Disponible |
| Liste de choix | Statut : en attente, prête, retirée |
| Image | Photo du produit |
| Lien vers une autre table | Client de la commande |

> [!attention]
> Ne stockez pas la même information à deux endroits (par exemple le nom du client recopié dans chaque commande). Utilisez un **lien** vers la table Clients : si le nom change, il change partout.

## La mise en page web

| Notion | Ce que c'est |
| --- | --- |
| **Boîtes** | Chaque élément est une boîte avec des marges intérieures et extérieures |
| **Flexbox** | Aligner des éléments en ligne ou en colonne |
| **Grille** | Organiser en lignes et colonnes |
| **Points de rupture** | Adapter la mise en page à l'ordinateur, la tablette et le téléphone |
| **Classes** (Webflow) | Styles réutilisables appliqués à plusieurs éléments |

> [!madagascar]
> Concevez toujours pour le **téléphone** d'abord : la majorité des utilisateurs malgaches se connectent depuis un smartphone, souvent avec une connexion limitée. Des images légères et des pages simples font une vraie différence.

## La logique : événements, conditions, actions

> [!definition] Workflow (logique)
> Une règle qui dit : **quand** un événement se produit, **si** une condition est vraie, **alors** faire des actions. Bubble les appelle « workflows », Glide « actions ».

| Quand | Si | Alors |
| --- | --- | --- |
| Le client clique sur « Commander » | Le panier n'est pas vide | Créer la commande, créer les lignes, vider le panier, afficher la confirmation |
| Le gérant clique sur « Prête » | La commande est « en attente » | Changer le statut, envoyer un e-mail au client |
| Une page s'ouvre | L'utilisateur n'est pas connecté | Rediriger vers la page de connexion |

## Les droits d'accès

| Utilisateur | Peut voir | Peut modifier |
| --- | --- | --- |
| **Visiteur** | Produits disponibles | Rien |
| **Client** | Ses propres commandes | Ses commandes en attente, son profil |
| **Gérant** | Toutes les commandes | Statuts, produits |

> [!attention]
> Cacher un bouton ne suffit pas à protéger des données. Dans Bubble, configurez les **règles de confidentialité** (privacy rules) de chaque table ; dans Glide, les règles de visibilité des lignes. Sinon, un utilisateur averti peut parfois accéder aux données des autres.

> [!retenir]
> - Des histoires d'utilisateur, et d'abord les fonctions indispensables.
> - Des tables reliées, sans information recopiée.
> - Une mise en page en boîtes, Flexbox et points de rupture, téléphone d'abord.
> - Une logique : quand, si, alors.
> - Des droits d'accès configurés au niveau des données, pas seulement des boutons.

## Exercice pratique : concevoir une application

> [!exercice] Exercice pratique · 2 heures 30
> 1. Rédigez 10 histoires d'utilisateur pour une application de commande de repas d'une gargote, et classez-les par priorité.
> 2. Concevez les tables, les champs et les liens.
> 3. Dessinez sur papier les 5 écrans principaux, version téléphone.
> 4. Écrivez 6 règles de logique (quand, si, alors).
> 5. Remplissez le tableau des droits d'accès.
>
> **À livrer** : vos histoires, vos tables, vos écrans, vos règles et vos droits.
