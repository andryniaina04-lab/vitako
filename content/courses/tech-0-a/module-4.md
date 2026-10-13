Start-up, agences et entreprises d'Europe, d'Amérique du Nord et d'Afrique recrutent des développeurs mobiles à distance. Ce module vous prépare à travailler avec eux : échanges en anglais, traduction de l'application, règles des paiements dans les applications, protection des données, accessibilité et contrats.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Échanger avec une équipe en anglais.
> 2. Traduire et adapter une application à plusieurs pays.
> 3. Respecter les règles de paiement des magasins.
> 4. Protéger les données et rendre l'application accessible.
> 5. Négocier vos conditions avec un client étranger.

## Échanger en anglais

| Situation | Formule utile |
| --- | --- |
| Estimer | « I estimate five days for the booking flow, including tests on Android and iOS. » |
| Signaler un risque | « The new store requirement means we need to update the target SDK before August. » |
| Livrer en test | « Build 1.4.0 (42) is available on TestFlight and in the Play internal track. » |
| Rapport de bug | « The crash only happens on Android 10 devices with less than 3 GB of RAM. » |
| Revue de code | « I've split the widget into smaller components, as you suggested. » |

## Traduire et adapter l'application

| Élément | Bonne pratique |
| --- | --- |
| **Textes** | Fichiers de traduction (ARB) avec le paquet d'internationalisation de Flutter |
| **Formats** | Dates, nombres et monnaies selon la langue et le pays |
| **Longueur des textes** | Les traductions peuvent être plus longues : écrans qui s'adaptent |
| **Sens d'écriture** | Prévoir les langues de droite à gauche si nécessaire |
| **Fiche du magasin** | Traduite pour chaque pays visé |

> [!madagascar]
> Proposez systématiquement une version **en malgache** aux clients locaux et aux ONG : peu d'applications le font, et c'est un vrai avantage pour toucher les utilisateurs hors des grandes villes.

## Les règles de paiement des magasins

| Ce qui est vendu | Règle générale |
| --- | --- |
| **Contenu ou service numérique utilisé dans l'application** (abonnement, niveaux, contenu premium) | Souvent obligatoire de passer par le système de paiement du magasin, qui prend une commission |
| **Biens physiques** (repas, vêtements) | Paiement possible par d'autres moyens (carte, Mobile Money) |
| **Services rendus hors de l'application** (transport, réservation) | Paiement possible par d'autres moyens |

> [!attention]
> Les règles de paiement des magasins sont **complexes et changent selon les pays** (des exceptions existent dans certaines régions). Avant de développer un système de paiement, lisez les règles actuelles de Google Play et de l'App Store pour le type de produit et les pays du client, et faites-les valider par le client.

## Données et accessibilité

| Domaine | En pratique |
| --- | --- |
| **RGPD** pour les utilisateurs européens | Consentement, droit d'accès et de suppression, données minimales |
| **Stockage sécurisé** | Jetons et données sensibles dans un stockage chiffré de l'appareil |
| **Règles Firebase** | Chaque utilisateur ne lit que ses propres données |
| **Accessibilité** | Libellés pour les lecteurs d'écran (Semantics), contrastes, tailles de texte agrandies |
| **Tests** | TalkBack sur Android, VoiceOver sur iPhone |

## Vos conditions avec un client étranger

| Point | Exemple |
| --- | --- |
| **Prix** | Par projet, par sprint ou par jour |
| **Propriété** | Code, comptes des magasins et projets Firebase au nom du client |
| **Appareils de test** | Liste des appareils et versions pris en charge |
| **Garantie** | Correction gratuite des bugs pendant une période après livraison |
| **Maintenance** | Contrat séparé pour les mises à jour obligatoires des magasins |
| **Paiement** | Acompte, puis par étape ou par sprint |

> [!retenir]
> - En anglais : estimer, signaler un risque, livrer en test, décrire un bug.
> - Traduction avec ARB, formats locaux, écrans adaptables, fiche traduite.
> - Paiements : système du magasin pour les contenus numériques, règles à vérifier par pays.
> - RGPD, stockage sécurisé, règles Firebase, accessibilité testée.
> - Conditions : propriété au client, appareils, garantie, maintenance séparée.

## Exercice pratique : une mission internationale

> [!exercice] Exercice pratique · 3 heures
> 1. Traduisez votre application en anglais et en malgache avec des fichiers ARB.
> 2. Ajoutez des libellés d'accessibilité et testez avec TalkBack ou VoiceOver.
> 3. Décrivez, pour 3 types de produits, si le paiement doit passer par le magasin et pourquoi.
> 4. Rédigez vos conditions en 6 points en anglais.
>
> **À livrer** : des captures dans les 3 langues, votre test d'accessibilité, votre analyse et vos conditions.
