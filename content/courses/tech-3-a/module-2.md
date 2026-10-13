Un petit VPS suffit pour les premiers projets. Les clients plus importants utilisent des fournisseurs de cloud et des outils de surveillance professionnels. Ce module vous présente les services clés de **DigitalOcean** et d'**AWS**, et la surveillance complète avec **Datadog**, avec un objectif constant : sécurité et maîtrise des coûts.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Utiliser les services principaux de DigitalOcean.
> 2. Comprendre les services de base d'AWS.
> 3. Sécuriser les identités et les accès dans le cloud.
> 4. Surveiller une infrastructure avec Datadog.
> 5. Maîtriser les coûts du cloud et de la surveillance.

## DigitalOcean : simple et prévisible

| Service | Usage |
| --- | --- |
| **Droplets** | Serveurs virtuels |
| **Bases de données gérées** | PostgreSQL, MySQL, Redis, avec sauvegardes automatiques |
| **Spaces** | Stockage de fichiers compatible avec S3 |
| **App Platform** | Déployer une application sans gérer de serveur |
| **Pare-feu cloud** | Règles réseau appliquées à plusieurs serveurs |
| **Instantanés et sauvegardes** | Copies des serveurs |
| **Équilibreurs de charge** | Répartir le trafic entre plusieurs serveurs |

## AWS : les services de base

| Service | Usage |
| --- | --- |
| **IAM** | Utilisateurs, rôles et droits |
| **EC2** | Serveurs virtuels |
| **S3** | Stockage de fichiers |
| **RDS** | Bases de données gérées |
| **VPC et groupes de sécurité** | Réseau privé et règles d'accès |
| **CloudWatch** | Métriques, journaux et alarmes |
| **AWS Budgets** | Alertes quand la facture dépasse un montant |

> [!definition] Région et zone de disponibilité
> Une **région** est un ensemble de centres de données dans une zone géographique (par exemple en Europe ou en Afrique du Sud). Chaque région contient plusieurs **zones de disponibilité** séparées. Répartir une application sur deux zones lui permet de continuer à fonctionner si un centre de données tombe en panne.

## Sécuriser les identités et les accès

| Règle | En pratique |
| --- | --- |
| **Compte principal protégé** | Double authentification, jamais utilisé au quotidien |
| **Un utilisateur par personne** | Pas de compte partagé |
| **Droits minimum** | Rôles limités à ce qui est nécessaire |
| **Rôles pour les applications** | Pas de clés d'accès écrites dans le code |
| **Journal des actions** | Activé et conservé (par exemple CloudTrail sur AWS) |
| **Revue régulière** | Retirer les accès inutiles chaque trimestre |

> [!attention]
> Une clé d'accès cloud publiée par erreur sur GitHub peut être trouvée et utilisée par des robots en **quelques minutes**, par exemple pour créer des serveurs de minage aux frais du client. Ne mettez jamais de clé dans le code, activez les alertes de budget et désactivez immédiatement toute clé exposée.

## Datadog : surveiller l'infrastructure

| Fonction | Usage |
| --- | --- |
| **Agent** | Installé sur les serveurs ou dans Kubernetes, il envoie les données |
| **Métriques d'infrastructure** | Processeur, mémoire, disque, réseau |
| **Journaux** | Centralisés, filtrables, avec recherche |
| **APM (traces)** | Suivre une requête à travers l'application et trouver ce qui ralentit |
| **Moniteurs** | Alertes selon des seuils ou des anomalies |
| **Tableaux de bord** | Vue d'ensemble pour l'équipe et le client |
| **Tests synthétiques** | Vérifier depuis plusieurs pays que le site répond |

> [!astuce]
> Une bonne alerte est **utile et rare**. Alertez sur ce qui touche les utilisateurs (site indisponible, erreurs en hausse, lenteur) plutôt que sur chaque pic de processeur. Trop d'alertes inutiles, et l'équipe finit par les ignorer.

## Maîtriser les coûts

| Action | Effet |
| --- | --- |
| **Étiquettes (tags)** sur chaque ressource | Savoir quel projet coûte quoi |
| **Alertes de budget** | Être prévenu avant la mauvaise surprise |
| **Arrêt des ressources de test** | Plus de serveurs oubliés |
| **Bon dimensionnement** | Serveurs adaptés à l'usage réel |
| **Réservations ou engagements** | Réductions pour les ressources utilisées en continu |
| **Coût de la surveillance** | Datadog facture selon les hôtes, les journaux et les fonctions : choisir ce qui est vraiment utile |

> [!madagascar]
> Ces services se paient en dollars par carte bancaire internationale, généralement **par le client et à son nom**. Pour vous former, utilisez les offres gratuites et les crédits de départ, avec des alertes de budget très basses, et supprimez tout après chaque exercice.

> [!retenir]
> - DigitalOcean : Droplets, bases gérées, Spaces, App Platform, pare-feu.
> - AWS : IAM, EC2, S3, RDS, VPC, CloudWatch, Budgets ; régions et zones.
> - Identités : compte principal protégé, utilisateurs nominatifs, droits minimum, rôles, journal.
> - Datadog : agent, métriques, journaux, traces, moniteurs, tableaux de bord.
> - Coûts : étiquettes, budgets, arrêts, dimensionnement, réservations.

## Exercice pratique : une infrastructure cloud surveillée

> [!exercice] Exercice pratique · 5 heures
> 1. Avec une offre gratuite, créez un compte avec double authentification et une alerte de budget basse.
> 2. Créez un utilisateur avec des droits limités et déployez votre application sur un serveur.
> 3. Installez l'agent d'un outil de surveillance (version d'essai) et créez 3 moniteurs utiles.
> 4. Étiquetez toutes les ressources, puis supprimez-les à la fin de l'exercice.
>
> **À livrer** : des captures de chaque étape, la liste de vos moniteurs et la preuve de suppression.
