Dans ce module, vous réalisez une application complète pour un client, du cadrage à la publication, comme le ferait un développeur mobile indépendant. Vous apprendrez à définir une première version réaliste, à organiser le développement, à tester sur des appareils variés et à publier sur Google Play.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Définir une première version réaliste avec le client.
> 2. Organiser le code et le développement par étapes.
> 3. Gérer les états de chargement, d'erreur et hors connexion.
> 4. Tester sur plusieurs appareils et conditions réelles.
> 5. Publier sur Google Play et livrer.

## Le cas pratique : « Mofo Gasy Express »

> [!exemple] Votre client
> **Mofo Gasy Express** livre des repas à Antananarivo. Aujourd'hui, les commandes arrivent par appels et messages Facebook, et beaucoup se perdent. Le gérant, M. Fidy, veut une application Android simple : voir le menu, commander, choisir le quartier de livraison, payer à la livraison ou par Mobile Money (référence de transaction), et suivre l'état de la commande.

## Étape 1 : une première version réaliste

| Dans la première version | Pour plus tard |
| --- | --- |
| Menu avec photos et prix | Programme de fidélité |
| Panier et commande | Paiement intégré automatique |
| Choix du quartier et repère | Suivi du livreur sur une carte |
| Paiement à la livraison ou référence Mobile Money | Application iOS |
| Suivi du statut (reçue, en préparation, en route, livrée) | Avis et notes |
| Écran d'administration simple pour le gérant | Statistiques avancées |

> [!definition] Première version (MVP)
> La version la plus simple qui apporte une vraie valeur aux utilisateurs. On la publie vite, on observe, puis on ajoute des fonctions selon les besoins réels.

> [!attention]
> Un paiement Mobile Money **automatique** demande une intégration officielle avec l'opérateur ou un prestataire agréé, avec un contrat. Dans la première version, l'application enregistre seulement la **référence de transaction**, vérifiée par le gérant. Ne promettez pas une intégration de paiement sans avoir vérifié les conditions.

## Étape 2 : organiser le code et le travail

```
lib/
  main.dart
  modeles/      plat.dart, commande.dart
  services/     auth_service.dart, commande_service.dart
  ecrans/       menu.dart, panier.dart, commande.dart, suivi.dart, admin.dart
  widgets/      carte_plat.dart, bouton_principal.dart
```

| Semaine | Travail |
| --- | --- |
| 1 | Structure, modèles, menu et panier |
| 2 | Comptes, commande, Firestore, règles de sécurité |
| 3 | Suivi du statut, écran du gérant, notifications |
| 4 | États d'erreur et hors connexion, tests, publication en test interne |
| 5 | Corrections, publication, formation du gérant |

## Étape 3 : les états de l'interface

| État | Ce que voit l'utilisateur |
| --- | --- |
| **Chargement** | Indicateur de chargement ou squelette de la page |
| **Contenu** | Le menu, la commande |
| **Vide** | « Votre panier est vide » avec un bouton vers le menu |
| **Erreur** | Message clair et bouton « Réessayer » |
| **Hors connexion** | Bandeau « Hors connexion : votre commande sera envoyée dès le retour du réseau » |

> [!astuce]
> Les **états vides et d'erreur** sont souvent oubliés dans les maquettes. Proposez-les au designer ou au client : ils font une grande différence pour les utilisateurs.

## Étape 4 : tester en conditions réelles

| Test | Pourquoi |
| --- | --- |
| **Téléphone Android d'entrée de gamme** | La plupart des clients en ont un |
| **Petit écran et grand écran** | Mise en page adaptée |
| **Connexion lente et mode avion** | Comportement hors connexion |
| **Taille de texte agrandie** dans les réglages | Accessibilité |
| **Interruption** (appel, mise en arrière-plan) | L'application reprend correctement |
| **Testeurs réels** (5 clients du restaurant) | Retours sur la simplicité |

> [!madagascar]
> Surveillez la **taille de l'application** : beaucoup d'utilisateurs ont un téléphone avec peu de stockage et des données mobiles limitées. Compressez les images, évitez les paquets inutiles, et chargez les photos du menu à la demande.

## Étape 5 : publier et livrer

| Étape | Action |
| --- | --- |
| **Compte Google Play** | Au nom de Mofo Gasy Express, vous ajouté comme utilisateur |
| **Fichier de publication** | App bundle signé |
| **Fiche** | Description en français et en malgache, captures, icône |
| **Politique de confidentialité** | Page en ligne |
| **Test interne puis fermé** | Avec des testeurs, selon les règles de Google Play |
| **Publication** | Après validation par Google |
| **Livraison** | Code source, accès, documentation, formation du gérant |

> [!retenir]
> - Une première version réaliste ; le paiement automatique demande une intégration officielle.
> - Un code organisé en modèles, services, écrans et widgets ; un planning par semaine.
> - Chargement, contenu, vide, erreur et hors connexion prévus.
> - Tests sur téléphone d'entrée de gamme, connexion lente, texte agrandi, testeurs réels.
> - Publication au nom du client, avec fiche, confidentialité, tests et livraison complète.

## Exercice pratique : l'application de Mofo Gasy Express

> [!exercice] Exercice pratique · 20 heures (sur plusieurs semaines)
> 1. Définissez la première version et le planning.
> 2. Développez le menu, le panier, la commande, le suivi et l'écran du gérant avec Firebase.
> 3. Ajoutez tous les états, dont le hors connexion.
> 4. Testez avec au moins 3 personnes sur des téléphones différents.
> 5. Préparez la fiche Google Play et publiez en test interne si vous avez un compte.
>
> **À livrer** : le dépôt GitHub, une vidéo de démonstration, votre rapport de tests et la fiche. C'est votre projet de portfolio.
