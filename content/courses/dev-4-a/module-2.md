Les projets professionnels se construisent sur les **offres payantes** de Webflow et de Bubble : domaine personnalisé, CMS plus large, collaboration, environnement de test, tâches côté serveur et plus de capacité. Ce module vous apprend à choisir la bonne offre, à travailler en équipe sur un projet et à utiliser les fonctions avancées.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Choisir une offre Webflow adaptée au projet du client.
> 2. Organiser un site Webflow professionnel avec composants et CMS.
> 3. Choisir une offre Bubble et suivre sa consommation.
> 4. Utiliser les fonctions avancées de Bubble : workflows côté serveur, API, versions.
> 5. Organiser la propriété des comptes et la facturation.

## Webflow : les offres payantes

> [!definition] Offre de site et offre d'espace de travail
> Webflow distingue l'offre du **site** (domaine, CMS, trafic, formulaires) et l'offre de l'**espace de travail** (nombre de collaborateurs, nombre de projets). Les noms, limites et prix évoluent : vérifiez-les sur le site officiel avant chaque devis.

| Besoin du client | Ce qu'il faut vérifier dans l'offre |
| --- | --- |
| Site vitrine simple | Domaine personnalisé, formulaires, nombre de pages |
| Blog ou catalogue | Nombre d'éléments du CMS et de collections |
| Site en plusieurs langues | Option de localisation et son coût |
| Équipe qui modifie les textes | Nombre de places d'éditeurs |
| Site à fort trafic | Bande passante et limites de trafic |

### Organiser un site professionnel

| Élément | Bonne pratique |
| --- | --- |
| **Classes** | Un système de noms clair (par exemple « btn-primary », « section-hero ») |
| **Variables** | Couleurs, tailles de texte et espacements définis une fois |
| **Composants** | En-tête, pied de page, cartes, appels à l'action réutilisables |
| **CMS** | Collections reliées (articles et auteurs, produits et catégories) |
| **Pages modèles** | Une page de collection bien conçue pour tous les éléments |
| **Référencement** | Titres et descriptions dynamiques depuis le CMS |

> [!astuce]
> Préparez le site pour que le client puisse **modifier les textes et ajouter des articles seul** grâce à l'éditeur, sans toucher au design. C'est l'un des grands avantages de Webflow.

## Bubble : les offres payantes

> [!definition] Unités de charge (workload units)
> Bubble mesure le travail du serveur (recherches, workflows, appels d'API) en unités de charge. Chaque offre inclut une quantité ; au-delà, des frais s'ajoutent ou l'application ralentit selon les réglages. Vérifiez le fonctionnement actuel sur le site officiel.

| Besoin du client | Ce qu'il faut vérifier dans l'offre |
| --- | --- |
| Mise en ligne avec un domaine | Domaine personnalisé |
| Tâches planifiées ou automatiques | Workflows côté serveur |
| Plusieurs développeurs | Nombre de collaborateurs |
| Projet qui évolue | Historique et branches de versions |
| Beaucoup d'utilisateurs | Unités de charge incluses, journaux, capacité |

### Les fonctions avancées

| Fonction | Usage |
| --- | --- |
| **Workflows côté serveur** (backend workflows) | Tâches planifiées, traitements de listes, webhooks reçus |
| **API Connector** | Appeler un service externe (paiement, e-mail, cartes) |
| **API de l'application** | Permettre à d'autres outils de lire ou créer des données |
| **Option sets** | Listes fixes (statuts, catégories) rapides et économes |
| **Éléments réutilisables** | Composants partagés entre pages |
| **Versions et branches** | Travailler sur une nouvelle fonction sans casser la version en ligne |
| **Journaux et outil de suivi de la charge** | Repérer ce qui consomme le plus |

> [!exemple] Réduire la consommation
> Une page affichait toutes les réservations puis les filtrait dans la page : 3 000 réservations chargées à chaque visite. Le filtre a été déplacé **dans la recherche** et la liste paginée par 20. La consommation de la page a fortement baissé.

## La propriété des comptes

> [!attention]
> Le compte, le domaine et l'abonnement doivent appartenir **au client**, qui vous invite comme collaborateur. Si c'est vous qui payez, le client dépend de vous et la fin de la relation devient compliquée. Si vous payez pour lui, refacturez-le clairement et prévoyez le transfert du projet.

| Élément | Propriétaire conseillé |
| --- | --- |
| Compte Webflow ou Bubble et abonnement | Le client |
| Nom de domaine | Le client |
| Comptes des services reliés (paiement, e-mail) | Le client |
| Votre accès | Collaborateur, retiré à la fin si plus de maintenance |

> [!madagascar]
> Les abonnements sont facturés en dollars par carte bancaire internationale. Beaucoup de clients malgaches n'en ont pas : expliquez dès le devis le **coût mensuel** de la plateforme et la façon de le payer (carte du client, carte prépayée internationale, ou refacturation avec accord écrit).

> [!retenir]
> - Webflow : offre de site et offre d'espace de travail, à vérifier avant chaque devis.
> - Classes, variables, composants et CMS bien organisés.
> - Bubble : unités de charge, workflows côté serveur, API, versions.
> - Réduire la consommation avec des recherches filtrées.
> - Comptes, domaine et abonnement au nom du client.

## Exercice pratique : un projet professionnel

> [!exercice] Exercice pratique · 4 heures
> 1. Comparez les offres actuelles de Webflow et de Bubble pour deux projets fictifs (blog de 300 articles, application de réservation).
> 2. Organisez un site Webflow avec variables, 4 composants et une collection CMS.
> 3. Dans Bubble, créez un workflow côté serveur (sur un projet d'essai ou en le décrivant précisément) et un appel avec l'API Connector.
> 4. Rédigez une note pour le client sur la propriété des comptes et les coûts mensuels.
>
> **À livrer** : votre comparatif, des captures et votre note au client.
