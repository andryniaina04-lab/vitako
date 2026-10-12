Dans ce module, vous réalisez un projet complet pour un client : une application de commandes et de suivi pour une petite entreprise, construite avec Bubble, avec un site vitrine Webflow. C'est le type de projet qui deviendra votre première étude de cas.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Cadrer un projet no-code avec un client.
> 2. Construire une application complète par étapes.
> 3. Tester avec une liste de contrôle.
> 4. Livrer, former et documenter.
> 5. Prévoir la maintenance.

## Le cas pratique : « Mofo Gasy Express »

> [!exemple] Votre client
> **Mofo Gasy Express** est une petite boulangerie d'Antsirabe qui reçoit ses commandes par téléphone et Messenger, et les note sur un cahier. La gérante, Mme Voahirana, veut : un site simple qui présente ses produits, une application où les clients commandent pour un retrait à une heure choisie, et un écran pour voir et préparer les commandes du jour. Les clients paient au retrait ou par Mobile Money (vérifié par la gérante).

## Étape 1 : cadrer

| Élément | Décision |
| --- | --- |
| **Fonctions indispensables** | Catalogue, commande avec heure de retrait, écran des commandes du jour, statuts |
| **Plus tard** | Programme de fidélité, notifications SMS, paiement en ligne automatisé |
| **Outils** | Webflow pour le site vitrine, Bubble pour l'application |
| **Comptes** | Au nom de la cliente, qui paie les abonnements |
| **Délai** | 4 semaines |
| **Langues** | Français et malgache pour les textes principaux |

## Étape 2 : construire par étapes

| Semaine | Livrable | Validation |
| --- | --- | --- |
| 1 | Données, catalogue, comptes | La gérante ajoute ses produits elle-même |
| 2 | Commande et heure de retrait | Test d'une commande complète |
| 3 | Écran gérant, statuts, e-mails | Test sur une journée réelle |
| 4 | Site Webflow, finitions, formation | Mise en ligne |

### Les règles de la commande

1. Les produits non disponibles n'apparaissent pas.
2. L'heure de retrait doit être dans les horaires d'ouverture et au moins 2 heures après la commande.
3. Le total est calculé à partir des prix enregistrés, pas modifiable par le client.
4. Un client ne voit que ses propres commandes.
5. La gérante peut passer une commande de « en attente » à « prête » puis « retirée ».

> [!astuce]
> Montrez chaque semaine une version qui **fonctionne**, même incomplète. La cliente voit l'avancement, et vous corrigez tôt les malentendus.

## Étape 3 : tester

### La liste de contrôle

| N° | Test |
| --- | --- |
| 1 | Une commande complète du début à la fin, sur téléphone |
| 2 | Heure de retrait en dehors des horaires : refusée avec un message clair |
| 3 | Un client ne peut pas voir les commandes d'un autre (test avec 2 comptes) |
| 4 | Un produit marqué indisponible disparaît du catalogue |
| 5 | Les e-mails partent et arrivent (vérifier les spams) |
| 6 | L'écran gérant affiche les commandes du jour dans l'ordre des heures |
| 7 | Les pages sont lisibles et rapides sur un téléphone d'entrée de gamme |
| 8 | Les textes en malgache et en français sont relus |

## Étape 4 : livrer, former, documenter

### La formation de la cliente (1 heure)

1. Ajouter, modifier ou masquer un produit.
2. Voir et préparer les commandes du jour.
3. Changer les horaires d'ouverture.
4. Que faire si un client appelle pour modifier une commande.

### Le guide d'utilisation (2 à 3 pages)

Des captures d'écran et des étapes numérotées pour chaque tâche courante.

### La documentation technique

| Élément | Contenu |
| --- | --- |
| **Comptes** | Plateformes utilisées, propriétaire, abonnements |
| **Données** | Types, champs, règles de confidentialité |
| **Workflows** | Liste des règles importantes |
| **Limites** | Ce que l'application ne fait pas |
| **Sauvegardes** | Comment exporter les données |

> [!madagascar]
> Pour une petite entreprise malgache, prévoyez un **plan B** en cas de coupure d'Internet : par exemple, la gérante exporte chaque matin la liste des commandes du jour (ou la consulte sur son téléphone avec les données mobiles). Les clients doivent toujours pouvoir appeler.

## Étape 5 : prévoir la maintenance

| Formule (exemple) | Contenu |
| --- | --- |
| **Garantie** (30 jours inclus) | Correction des bugs |
| **Maintenance mensuelle** | Vérifications, petites modifications, assistance |
| **Évolutions** | Nouvelles fonctions sur devis |

> [!retenir]
> - Un cadrage écrit : indispensable, plus tard, outils, comptes, délai.
> - Une construction par semaines, validée à chaque étape.
> - Une liste de contrôle de 8 tests, dont la confidentialité.
> - Formation, guide d'utilisation et documentation technique.
> - Une garantie et une maintenance proposées.

## Exercice pratique : le projet Mofo Gasy Express

> [!exercice] Exercice pratique · 12 heures (sur plusieurs semaines)
> 1. Rédigez le cadrage du projet.
> 2. Construisez l'application Bubble avec les 5 règles de commande.
> 3. Construisez le site vitrine Webflow avec le catalogue.
> 4. Passez la liste de contrôle en 8 tests.
> 5. Rédigez le guide d'utilisation et la documentation technique.
>
> **À livrer** : les liens du site et de l'application, la liste de contrôle remplie et vos documents. C'est votre projet de portfolio.
