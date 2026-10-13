Derrière chaque site, chaque application et chaque service en ligne, il y a des serveurs qui doivent fonctionner jour et nuit, être sécurisés, sauvegardés et mis à jour. L'administrateur systèmes s'en occupe ; le DevOps automatise en plus la mise en ligne des nouvelles versions. Ces métiers se font en grande partie à distance. Ce premier module vous les présente.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Expliquer ce que font un administrateur systèmes et un DevOps.
> 2. Comprendre ce qu'est un serveur et où il se trouve.
> 3. Décrire le chemin d'une requête sur Internet.
> 4. Connaître les responsabilités et les règles de sécurité du métier.
> 5. Préparer votre laboratoire et votre plan d'apprentissage.

## Les métiers en une phrase

Un **administrateur systèmes** installe, configure, sécurise, surveille et sauvegarde des serveurs. Un **ingénieur DevOps** automatise en plus la construction, les tests et la mise en ligne des applications, pour livrer plus souvent et avec moins d'erreurs.

> [!definition] DevOps
> Une façon de travailler qui rapproche le développement (Dev) et l'exploitation des serveurs (Ops) : automatisation, livraisons fréquentes, surveillance, collaboration. On parle aussi d'ingénieur DevOps pour la personne qui met en place ces pratiques.

## Qu'est-ce qu'un serveur ?

| Type | Principe | Exemple |
| --- | --- | --- |
| **Serveur physique** | Un ordinateur dans une salle de serveurs | Serveur d'une entreprise dans ses locaux |
| **Serveur virtuel (VPS)** | Une partie d'un gros serveur, louée chez un hébergeur | Petit serveur loué pour un site |
| **Cloud** | Ressources louées à la demande chez un grand fournisseur | Serveurs, bases de données, stockage |
| **Conteneur** | Application emballée avec tout ce dont elle a besoin | Application lancée avec Docker |

> [!madagascar]
> Vous pouvez administrer un serveur situé en **Europe ou aux États-Unis** depuis Antananarivo : tout se fait par une connexion sécurisée (SSH). La qualité de votre connexion compte, mais les serveurs eux-mêmes ont une connexion très rapide. Prévoyez une connexion de secours pour les interventions urgentes.

## Le chemin d'une requête

| Étape | Ce qui se passe |
| --- | --- |
| 1 | L'utilisateur tape l'adresse d'un site |
| 2 | Le **DNS** traduit le nom en adresse IP du serveur |
| 3 | La requête arrive sur le serveur, passe le **pare-feu** |
| 4 | Le **serveur web** (par exemple Nginx) la reçoit |
| 5 | Il la transmet à l'**application** (souvent dans un conteneur) |
| 6 | L'application interroge la **base de données** |
| 7 | La réponse repart vers l'utilisateur, chiffrée en **HTTPS** |

## Les tâches du métier

| Tâche | Exemple |
| --- | --- |
| **Installer et configurer** | Préparer un serveur Linux pour une application |
| **Sécuriser** | Mises à jour, pare-feu, accès par clé, comptes limités |
| **Déployer** | Mettre en ligne une nouvelle version |
| **Automatiser** | Scripts, pipelines d'intégration et de déploiement continus |
| **Surveiller** | Disponibilité, mémoire, disque, erreurs |
| **Sauvegarder et restaurer** | Copies régulières et testées |
| **Réagir aux incidents** | Site en panne, disque plein, attaque |
| **Documenter** | Procédures, architecture, accès |

## Responsabilités et règles de sécurité

| Règle | Pourquoi |
| --- | --- |
| **Accès minimum** | Chacun n'a que les droits nécessaires |
| **Aucun mot de passe en clair** dans le code ou les messages | Éviter les vols d'accès |
| **Changements préparés** et réversibles | Une erreur peut arrêter un service pour tous les clients |
| **Sauvegardes testées** | Une sauvegarde jamais restaurée n'est pas fiable |
| **Traçabilité** | Noter qui a fait quoi et quand |
| **Confidentialité** | Vous avez accès à des données sensibles |

> [!attention]
> Un administrateur a des **pouvoirs étendus** : une seule commande mal tapée peut effacer des données ou arrêter un service. Travaillez avec méthode, relisez avant d'appuyer sur Entrée, et testez toujours sur un serveur de test avant la production.

## Qui sont vos clients ?

| Client | Besoins |
| --- | --- |
| **Agences web et développeurs** | Serveurs pour les sites de leurs clients, mises en ligne |
| **Start-up** | Infrastructure, déploiement automatique, surveillance |
| **PME** à Madagascar | Serveur de fichiers, messagerie, site, sauvegardes |
| **Prestataires étrangers** | Techniciens Linux et DevOps à distance |
| **ONG** | Hébergement de plateformes de collecte de données |

## Votre laboratoire et votre plan d'apprentissage

| Élément | Usage |
| --- | --- |
| **Machine virtuelle Linux** (Ubuntu Server) | S'entraîner sans risque |
| **Compte GitHub** | Code, scripts, GitHub Actions |
| **Docker** | Conteneurs |
| **Petit VPS** (plus tard) | Pratique sur un vrai serveur en ligne |

| Mois | Objectif |
| --- | --- |
| **1** | Linux : commandes, fichiers, utilisateurs, droits, SSH |
| **2** | Réseau, serveur web, sécurité, sauvegardes |
| **3** | Docker, Docker Compose, GitHub Actions |
| **4** | Projet complet sur un VPS, documentation, portfolio |

> [!retenir]
> - L'administrateur gère des serveurs ; le DevOps automatise aussi les mises en ligne.
> - Serveur physique, VPS, cloud, conteneur.
> - DNS, pare-feu, serveur web, application, base de données, HTTPS.
> - Accès minimum, aucun secret en clair, changements réversibles, sauvegardes testées.
> - Un laboratoire Linux et un plan sur 4 mois.

## Exercice pratique : votre laboratoire

> [!exercice] Exercice pratique · 3 heures
> 1. Installez VirtualBox et créez une machine virtuelle Ubuntu Server.
> 2. Connectez-vous et notez la version du système, la mémoire et l'espace disque.
> 3. Dessinez le chemin d'une requête vers un site que vous utilisez.
> 4. Rédigez vos 5 règles personnelles de prudence en administration.
>
> **À livrer** : des captures de votre machine virtuelle, votre schéma et vos règles.
