Pour publier une application, il faut des comptes développeurs payants : **Google Play Console** pour Android et l'**Apple Developer Program** pour iPhone. Ce module vous apprend à les utiliser comme un professionnel : comptes au nom du client, pistes de test, signature, publication progressive, déclarations de confidentialité et suivi de la qualité.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Créer et organiser les comptes développeurs avec le client.
> 2. Utiliser les pistes de test et la publication progressive sur Google Play.
> 3. Préparer une publication sur l'App Store avec TestFlight.
> 4. Remplir les déclarations de confidentialité.
> 5. Suivre la qualité de l'application après publication.

## Les comptes développeurs

| Point | Google Play Console | Apple Developer Program |
| --- | --- | --- |
| **Prix** | Frais d'inscription payés une fois | Abonnement annuel |
| **Compte d'organisation** | Possible, avec vérification de l'entreprise | Possible, avec un numéro D-U-N-S de l'entreprise |
| **Vérification** | Identité et coordonnées du développeur | Identité, et entreprise pour une organisation |
| **Matériel** | Un ordinateur suffit | Un Mac avec Xcode, ou un service de compilation dans le cloud |

> [!attention]
> Les comptes développeurs doivent être **au nom du client**, qui vous ajoute comme utilisateur avec les droits nécessaires. Si le compte est à votre nom et que vous arrêtez de travailler ensemble, le client risque de perdre son application.

> [!madagascar]
> Les frais se paient en dollars par carte bancaire internationale, et la vérification d'une organisation demande des documents d'entreprise. Prévoyez **plusieurs semaines** dans le planning du projet pour la création et la vérification des comptes, surtout pour une entreprise malgache.

## Google Play Console

| Fonction | Usage |
| --- | --- |
| **Pistes de test** | Test interne, test fermé, test ouvert, puis production |
| **Signature des applications par Google Play** | Google conserve la clé de signature finale ; vous gardez la clé d'importation en sécurité |
| **Publication progressive** | Publier pour 5 %, puis 20 %, puis 100 % des utilisateurs |
| **Android vitals** | Plantages, blocages, démarrage lent, batterie |
| **Fiche du magasin** | Titre, descriptions, captures, vidéo, traductions |
| **Version cible d'Android** | Exigence minimale imposée chaque année par Google |

> [!astuce]
> Pour les **nouveaux comptes personnels**, Google Play peut exiger un test fermé avec un nombre minimal de testeurs pendant une durée minimale avant d'ouvrir la production. Vérifiez la règle actuelle dans la console et recrutez vos testeurs dès le début du projet.

## App Store Connect et TestFlight

| Étape | Action |
| --- | --- |
| 1 | Créer l'identifiant de l'application et la fiche dans App Store Connect |
| 2 | Gérer les certificats et profils (Xcode peut le faire automatiquement) |
| 3 | Compiler et envoyer la version depuis Xcode ou un service de compilation |
| 4 | Tester avec **TestFlight** : testeurs internes, puis externes après une vérification d'Apple |
| 5 | Remplir la fiche, les captures et les informations de confidentialité |
| 6 | Soumettre à la **revue d'Apple** et répondre à ses éventuelles questions |

> [!definition] Revue des applications
> Apple vérifie chaque application avant publication selon ses règles (fonctionnement, contenu, confidentialité, paiements). Une application peut être refusée ; il faut alors corriger et soumettre de nouveau. Lisez les règles avant de commencer le développement.

## Les déclarations de confidentialité

| Magasin | Déclaration |
| --- | --- |
| **Google Play** | Section « Sécurité des données » : données collectées, partagées, chiffrées, supprimables |
| **App Store** | Informations de confidentialité affichées sur la fiche, et fichier de confidentialité requis pour certaines fonctions |
| **Les deux** | Politique de confidentialité en ligne, suppression du compte possible depuis l'application si elle permet d'en créer un |

> [!attention]
> Les déclarations doivent correspondre à **ce que fait réellement l'application**, y compris les bibliothèques tierces (statistiques, publicité, plantages). Une déclaration fausse peut entraîner la suppression de l'application.

## Suivre la qualité après publication

| Outil | Usage |
| --- | --- |
| **Firebase Crashlytics** | Plantages détaillés par appareil et par version |
| **Android vitals et statistiques d'App Store Connect** | Qualité technique vue par les magasins |
| **Avis des utilisateurs** | Répondre poliment, repérer les problèmes fréquents |
| **Firebase Analytics** | Écrans utilisés, parcours, abandon |

> [!retenir]
> - Comptes au nom du client, vérification prévue dans le planning.
> - Google Play : pistes de test, signature, publication progressive, vitals, version cible.
> - App Store : certificats, TestFlight, revue d'Apple, Mac ou service cloud.
> - Déclarations de confidentialité exactes, bibliothèques comprises.
> - Crashlytics, statistiques des magasins, avis et Analytics.

## Exercice pratique : un plan de publication

> [!exercice] Exercice pratique · 4 heures
> 1. Rédigez la liste des documents et des étapes pour créer les deux comptes au nom d'un client.
> 2. Préparez la fiche complète de votre application (textes, captures, catégorie) en français et en anglais.
> 3. Remplissez sur papier la section « Sécurité des données » pour votre application.
> 4. Ajoutez Crashlytics à votre application et provoquez un plantage de test.
>
> **À livrer** : votre liste, la fiche, la déclaration et une capture de Crashlytics.
