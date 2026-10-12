Quand vous payez par Mobile Money, réservez une chambre ou vous connectez à un compte, un programme invisible enregistre les données, vérifie vos droits et répond à votre application. Ce programme, c'est le **back-end**. Le développeur back-end le conçoit et le fait fonctionner de façon fiable et sûre. C'est un métier très demandé, qui se fait entièrement à distance. Ce premier module vous présente le métier tel qu'il est vraiment.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Expliquer ce que fait un développeur back-end.
> 2. Décrire le trajet d'une requête entre le navigateur et le serveur.
> 3. Citer les langages et outils de base : PHP, Node.js, SQL.
> 4. Repérer vos premiers clients possibles.
> 5. Préparer votre poste de travail et votre plan d'apprentissage.

## Le métier en une phrase

Un développeur back-end **construit la partie serveur d'une application : les données, les règles, la sécurité et les API qui permettent au front-end et aux autres services de fonctionner**.

> [!definition] API
> Une « porte d'entrée » d'un programme : une liste d'adresses et de règles qui permettent à d'autres programmes (une application mobile, un site, un partenaire) de demander ou d'envoyer des données. Exemple : `GET /api/chambres` renvoie la liste des chambres.

## Le trajet d'une requête

| Étape | Ce qui se passe | Exemple |
| --- | --- | --- |
| **1. Le client envoie une requête** | Le navigateur ou l'application appelle une adresse | « Réserver la chambre 3 du 12 au 15 juillet » |
| **2. Le serveur reçoit** | Le programme back-end lit la demande | Vérifie que l'utilisateur est connecté |
| **3. Les règles s'appliquent** | Le programme vérifie les données et les droits | La chambre est-elle libre ? Les dates sont-elles valides ? |
| **4. La base de données** | Lecture et écriture des données | Enregistre la réservation |
| **5. La réponse** | Le serveur renvoie un résultat | « Réservation confirmée, numéro 4821 » |

## Front-end, back-end, full-stack

| Rôle | Où s'exécute son code | Exemple de travail |
| --- | --- | --- |
| **Front-end** | Dans le navigateur | Le formulaire de réservation |
| **Back-end** | Sur le serveur | L'enregistrement de la réservation, les règles, les e-mails de confirmation |
| **Full-stack** | Les deux | L'application complète |

## Les langages et outils de base

| Outil | Rôle | Pourquoi l'apprendre |
| --- | --- | --- |
| **SQL** | Interroger et modifier une base de données | Presque toutes les applications utilisent une base de données |
| **PHP** | Langage serveur très répandu | WordPress, Laravel et beaucoup de sites existants l'utilisent |
| **Node.js** | JavaScript côté serveur | Même langage que le front-end, très utilisé pour les API |
| **Git** | Historique du code | Indispensable pour travailler en équipe |
| **HTTP** | Le protocole du web | Méthodes, codes de réponse, en-têtes |
| **Linux** (bases) | Système des serveurs | Déployer et dépanner |

> [!astuce]
> Choisissez **un** langage pour commencer (PHP ou Node.js), et apprenez SQL en parallèle. Changer de langage plus tard est beaucoup plus facile quand on maîtrise bien le premier.

## Les tâches courantes

| N° | Tâche | Exemple |
| --- | --- | --- |
| 1 | **Concevoir la base de données** | Tables clients, réservations, paiements |
| 2 | **Créer des API** | Liste des produits, création d'une commande |
| 3 | **Gérer les comptes** | Inscription, connexion, mot de passe oublié |
| 4 | **Connecter des services** | Paiement, envoi d'e-mails et de SMS |
| 5 | **Sécuriser** | Mots de passe protégés, droits d'accès, validation des données |
| 6 | **Déployer et surveiller** | Mettre en ligne, sauvegarder, corriger les pannes |

## Qui sont vos clients ?

### À Madagascar

1. **Entreprises de services numériques** d'Antananarivo qui travaillent pour l'Europe.
2. **Start-up** (paiement, livraison, éducation, agriculture).
3. **Agences web** qui ont besoin de fonctions sur mesure.
4. **Entreprises et ONG** qui veulent un outil de gestion interne.

### À l'étranger

1. **Agences et start-up francophones** qui recrutent des développeurs à distance.
2. **Entreprises** qui ont des applications PHP ou Node.js à maintenir.

> [!madagascar] Votre avantage
> Les entreprises de services numériques malgaches recrutent régulièrement des développeurs back-end pour des clients européens. Les intégrations locales (Mobile Money, SMS, connexions lentes) sont aussi une compétence recherchée par les start-up qui visent le marché malgache.

## Votre poste de travail

| Élément | Minimum conseillé |
| --- | --- |
| **Ordinateur** | 8 Go de mémoire vive (16 Go conseillés), Windows avec WSL, macOS ou Linux |
| **Éditeur** | Visual Studio Code |
| **Logiciels** | Git, Node.js, PHP, une base de données (PostgreSQL ou MySQL) |
| **Outil de test d'API** | Postman, Insomnia ou l'extension REST Client |
| **Connexion et énergie** | Stables, avec une solution de secours |

## Votre plan d'apprentissage

1. **Bases de programmation** dans le langage choisi (4 à 6 semaines).
2. **SQL et conception de bases de données** (3 à 4 semaines).
3. **HTTP et API REST** (2 à 3 semaines).
4. **Sécurité de base** (en continu).
5. **Déploiement et Linux** (2 à 3 semaines).
6. **Projets** : 2 à 3 API complètes pour votre portfolio.

*(Durées données en exemple pour 2 à 3 heures de pratique par jour.)*

> [!retenir]
> - Le back-end gère les données, les règles, la sécurité et les API.
> - Une requête : envoi, réception, règles, base de données, réponse.
> - SQL + un langage (PHP ou Node.js) + Git + HTTP + bases de Linux.
> - Clients : entreprises de services numériques, start-up, agences, entreprises étrangères.

## Exercice pratique : votre point de départ

> [!exercice] Exercice pratique · 1 heure 30
> 1. Installez Visual Studio Code, Git, Node.js (ou PHP) et PostgreSQL (ou MySQL).
> 2. Ouvrez les outils de développement de votre navigateur (onglet Réseau) sur un site que vous utilisez et observez 5 requêtes : adresse, méthode, code de réponse.
> 3. Pour une application que vous connaissez, listez 5 tables de base de données probables et 5 API.
> 4. Écrivez votre plan d'apprentissage sur 6 mois.
>
> **À livrer** : vos captures d'installation, vos 5 requêtes analysées, vos tables et API, votre plan.
