Ce module vous fait prendre en main les trois outils principaux du développeur no-code : **Webflow** pour les sites, **Glide** pour les applications à partir de données, et **Bubble** pour les applications web complètes. Vous découvrirez aussi ce qu'apportent les **offres payantes** de Webflow et de Bubble.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Construire une page responsive et un gestionnaire de contenu dans Webflow.
> 2. Créer une application à partir d'un tableur avec Glide.
> 3. Créer une petite application avec base de données et workflows dans Bubble.
> 4. Choisir le bon outil pour un projet.
> 5. Comprendre ce qu'apportent les offres payantes.

## Webflow : des sites professionnels

### Les éléments essentiels

| Élément | Rôle |
| --- | --- |
| **Navigateur d'éléments** | La structure de la page (sections, conteneurs, textes) |
| **Panneau de style** | Mise en page, couleurs, typographie, avec des classes |
| **Points de rupture** | Réglages pour tablette et téléphone |
| **CMS (collections)** | Contenus répétés : articles, circuits, produits |
| **Interactions** | Animations au défilement ou au survol |

### Créer une collection

1. Créez une collection « Circuits » avec les champs : nom, prix, durée, photo, description.
2. Ajoutez 6 circuits.
3. Créez une **liste dynamique** sur la page d'accueil qui affiche les circuits.
4. Configurez la **page modèle** de circuit : chaque circuit a automatiquement sa page.

> [!astuce]
> Nommez vos classes de façon cohérente (par exemple `carte-circuit`, `carte-circuit-titre`) : un site bien nommé est facile à reprendre par vous ou par un autre développeur.

## Glide : une application à partir de données

### Créer une application de suivi des livraisons

1. Préparez un tableur (Google Sheets) : livraisons (client, adresse, livreur, statut, heure).
2. Créez une application Glide à partir de ce tableur.
3. Ajoutez un écran **liste** des livraisons, filtré par livreur connecté.
4. Ajoutez un écran **détail** avec un bouton « Livrée » qui change le statut.
5. Testez sur votre téléphone.

| Fonction de Glide | Usage |
| --- | --- |
| **Composants** | Listes, formulaires, boutons, cartes |
| **Actions** | Modifier une ligne, envoyer une notification, ouvrir un lien |
| **Visibilité** | Afficher un élément selon le rôle ou une condition |
| **Colonnes calculées** | Totaux, conditions, dates |

## Bubble : une application web complète

### Les 3 onglets principaux

| Onglet | Rôle |
| --- | --- |
| **Design** | Construire les pages et les éléments |
| **Workflow** | Créer la logique (quand, si, alors) |
| **Data** | Créer les types de données, les champs, les règles de confidentialité |

### Une première application : prise de rendez-vous

1. **Data** : créez les types « Service » et « Rendez-vous » (service, date, client, statut).
2. **Design** : page d'accueil avec la liste des services, formulaire de réservation.
3. **Workflow** : au clic sur « Réserver », créer un rendez-vous lié à l'utilisateur connecté.
4. **Data → Privacy** : un utilisateur ne voit que ses propres rendez-vous.
5. **Prévisualisez** et testez avec 2 comptes différents.

> [!attention]
> Testez toujours avec **plusieurs comptes** (un client, un autre client, un administrateur) pour vérifier que chacun ne voit que ce qu'il doit voir.

## Choisir le bon outil

| Besoin | Outil conseillé |
| --- | --- |
| Site vitrine, blog, pages de vente soignées | Webflow |
| Outil interne simple pour une équipe, sur téléphone | Glide |
| Application avec comptes, paiements, règles complexes | Bubble |
| Formulaire et automatisation simple | Outils de formulaire + Make ou Zapier |

## Les offres payantes

| Outil | Ce qu'apporte l'offre payante |
| --- | --- |
| **Webflow** | Nom de domaine personnalisé, plus de pages et d'éléments de CMS, formulaires, hébergement professionnel (offres « site ») ; fonctions d'équipe (offres « espace de travail ») |
| **Bubble** | Nom de domaine personnalisé, plus de capacité de calcul et d'utilisation, versions de développement et de production, collaborateurs |
| **Glide** | Plus d'utilisateurs, de lignes de données et de fonctions selon l'offre |

> [!madagascar]
> Ces abonnements sont facturés en dollars. La bonne pratique : le **client** paie l'abonnement de son site ou de son application, à son nom, et vous ajoute comme collaborateur. Apprenez avec les offres gratuites, et vérifiez les prix et les limites à jour sur les sites officiels avant chaque devis.

> [!retenir]
> - Webflow : structure, classes, points de rupture, collections CMS.
> - Glide : applications à partir d'un tableur, avec actions et visibilité.
> - Bubble : design, workflows, données et règles de confidentialité.
> - Testez avec plusieurs comptes.
> - Le client paie les abonnements de ses projets.

## Exercice pratique : vos trois premiers projets

> [!exercice] Exercice pratique · 6 heures
> 1. Construisez dans Webflow une page d'accueil responsive avec une collection de 6 éléments.
> 2. Construisez dans Glide l'application de suivi des livraisons.
> 3. Construisez dans Bubble l'application de prise de rendez-vous avec règles de confidentialité.
> 4. Testez chaque projet sur téléphone et avec plusieurs comptes.
>
> **À livrer** : les liens de vos 3 projets et une capture de vos règles de confidentialité Bubble.
