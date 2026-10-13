Commander un repas, payer par Mobile Money, suivre une livraison, apprendre une langue, gérer une boutique : tout passe par des applications mobiles. Le développeur mobile crée ces applications pour Android et iOS. Avec des outils comme Flutter, une seule base de code suffit pour les deux systèmes. C'est un métier qui se fait entièrement à distance. Ce premier module vous le présente.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Expliquer ce que fait un développeur mobile.
> 2. Distinguer les approches native et multiplateforme.
> 3. Décrire le cycle de vie d'une application.
> 4. Repérer vos premiers clients possibles.
> 5. Préparer votre poste de travail et votre plan d'apprentissage.

## Le métier en une phrase

Un développeur mobile **conçoit, programme, teste et publie des applications pour téléphones et tablettes, en tenant compte des contraintes des appareils : petits écrans, connexion variable, batterie, mémoire**.

## Native ou multiplateforme

| Approche | Principe | Langages et outils | Avantages |
| --- | --- | --- | --- |
| **Native Android** | Une application spécifique à Android | Kotlin, Android Studio | Accès complet au système |
| **Native iOS** | Une application spécifique à l'iPhone | Swift, Xcode (sur Mac) | Accès complet au système |
| **Multiplateforme** | Une seule base de code pour Android et iOS | Flutter (Dart), React Native (JavaScript) | Moins de travail, une seule équipe |

> [!definition] Flutter
> Un outil gratuit créé par Google pour développer des applications Android, iOS, web et ordinateur à partir d'une seule base de code, avec le langage Dart. Il dessine lui-même l'interface, ce qui donne le même rendu sur tous les appareils.

> [!madagascar]
> Pour publier sur l'App Store d'Apple, il faut compiler l'application sur un **Mac**. Beaucoup de développeurs malgaches commencent donc par **Android**, très majoritaire à Madagascar, et utilisent plus tard un Mac, un service de compilation en ligne ou l'équipe du client pour la version iOS.

## Le cycle de vie d'une application

| N° | Étape | Ce qui se passe |
| --- | --- | --- |
| 1 | **Idée et besoins** | Qui utilise l'application, pour quoi faire |
| 2 | **Maquettes** | Écrans dessinés dans Figma par un designer |
| 3 | **Développement** | Interface, logique, connexion aux données |
| 4 | **Tests** | Sur plusieurs téléphones, connexions, tailles d'écran |
| 5 | **Publication** | Google Play et App Store, avec fiche et captures |
| 6 | **Suivi** | Bugs, avis, statistiques, mises à jour |

## Les tâches du développeur mobile

1. **Construire les écrans** à partir des maquettes.
2. **Gérer la navigation** entre les écrans.
3. **Connecter l'application aux données** : base de données, API, comptes.
4. **Gérer les cas réels** : pas de connexion, erreur, chargement.
5. **Utiliser les fonctions du téléphone** : appareil photo, localisation, notifications.
6. **Tester** sur de vrais appareils.
7. **Publier et mettre à jour**.

> [!attention]
> Une application mobile manipule souvent des **données personnelles** (nom, téléphone, localisation, photos). Demandez seulement les autorisations nécessaires, protégez les données et respectez les règles des magasins d'applications sur la confidentialité.

## Qui sont vos clients ?

### À Madagascar

1. **Commerces et restaurants** : commande, fidélité, livraison.
2. **Start-up** : services de paiement, transport, agriculture, éducation.
3. **ONG** : collecte de données sur le terrain, applications hors connexion.
4. **Écoles et organismes de formation**.

### À l'étranger

1. **Start-up** qui lancent une première version d'application.
2. **Agences** qui cherchent des développeurs Flutter.
3. **Entreprises** qui veulent maintenir et améliorer une application existante.

> [!madagascar] Votre avantage
> Les applications pour l'Afrique doivent fonctionner sur des **téléphones Android d'entrée de gamme** et avec une **connexion faible ou coupée**. Un développeur qui maîtrise ces contraintes (mode hors ligne, applications légères) est très recherché par les ONG et les start-up qui ciblent ces marchés.

## Votre poste de travail

| Élément | Minimum conseillé |
| --- | --- |
| **Ordinateur** | 8 Go de mémoire vive au minimum, 16 Go conseillé, SSD |
| **Système** | Windows, Linux ou macOS (macOS nécessaire pour compiler pour iOS) |
| **Logiciels gratuits** | Flutter, Android Studio (et son émulateur), VS Code |
| **Téléphone Android** | Pour tester en conditions réelles (mode développeur activé) |
| **Compte Firebase** | Gratuit pour commencer |
| **Git et GitHub** | Pour sauvegarder le code |

## Votre plan d'apprentissage

| Mois | Objectif |
| --- | --- |
| **1** | Bases de Dart et de Flutter : widgets, mise en page, navigation |
| **2** | Données : formulaires, listes, API, Firebase |
| **3** | Projet complet testé sur un vrai téléphone |
| **4** | Publication sur Google Play (test interne), portfolio |

> [!retenir]
> - Le développeur mobile crée, teste et publie des applications pour Android et iOS.
> - Native ou multiplateforme ; Flutter permet une seule base de code.
> - Idée, maquettes, développement, tests, publication, suivi.
> - Protéger les données et ne demander que les autorisations utiles.
> - Commencer par Android, avec Flutter, Android Studio et un vrai téléphone.

## Exercice pratique : préparer votre environnement

> [!exercice] Exercice pratique · 3 heures
> 1. Installez Flutter, Android Studio et VS Code avec l'extension Flutter.
> 2. Lancez la commande de diagnostic de Flutter et corrigez les problèmes signalés.
> 3. Créez le projet d'exemple et lancez-le sur l'émulateur puis sur votre téléphone.
> 4. Listez 5 applications que vous utilisez et notez ce qui se passe quand la connexion coupe.
>
> **À livrer** : une capture du diagnostic, une capture de l'application sur votre téléphone et votre liste.
