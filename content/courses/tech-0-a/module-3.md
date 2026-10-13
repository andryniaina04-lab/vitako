Une application professionnelle se maintient pendant des années : nouvelles fonctions, mises à jour de Flutter et des magasins, corrections rapides. Ce module vous donne les méthodes qui permettent de livrer vite sans tout casser : architecture claire, environnements séparés, tests, intégration continue, performance et mode hors connexion.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Organiser le code d'une application qui grandit.
> 2. Séparer les environnements de développement et de production.
> 3. Écrire des tests utiles.
> 4. Automatiser la compilation et la publication.
> 5. Optimiser la performance et le fonctionnement hors connexion.

## Une architecture claire

| Couche | Rôle | Exemple |
| --- | --- | --- |
| **Présentation** | Écrans et widgets | `ecran_commande.dart` |
| **État** | Gestion de l'état avec une solution choisie par l'équipe (Provider, Riverpod, Bloc) | `commande_controller.dart` |
| **Domaine** | Règles métier, modèles | `commande.dart` |
| **Données** | Accès à Firebase, à l'API et au stockage local | `commande_repository.dart` |

> [!astuce]
> Choisissez **une** solution de gestion d'état et tenez-vous-y dans tout le projet. Une application qui mélange trois approches devient très difficile à reprendre, pour vous comme pour un autre développeur.

## Des environnements séparés

| Environnement | Usage |
| --- | --- |
| **Développement** | Vos essais, avec un projet Firebase de développement |
| **Recette** | Tests par le client avant publication |
| **Production** | Les vrais utilisateurs et leurs vraies données |

Avec les **variantes de compilation** (flavors), chaque environnement a son nom, son icône et son projet Firebase. Vous ne risquez plus d'écrire des données de test chez les vrais clients.

## Des tests utiles

| Type de test | Ce qu'il vérifie | Exemple |
| --- | --- | --- |
| **Unitaire** | Une fonction ou une règle | Le calcul du total d'une commande |
| **De widget** | Un écran ou un composant | Le bouton « Commander » est désactivé si le panier est vide |
| **D'intégration** | Un parcours complet sur un appareil | Ajouter au panier, commander, voir la confirmation |

```dart
test('le total inclut la livraison', () {
  final commande = Commande(articles: [Article(prix: 5000, quantite: 2)]);
  expect(commande.total(fraisLivraison: 2000), 12000);
});
```

## Automatiser compilation et publication

| Outil | Usage |
| --- | --- |
| **GitHub Actions** | Lancer l'analyse et les tests à chaque modification |
| **Services de compilation mobile** (par exemple Codemagic) | Compiler Android et iOS dans le cloud, sans Mac sur place |
| **fastlane** | Automatiser signature, captures et envoi vers les magasins |
| **Numéros de version** | Augmentés automatiquement à chaque publication |

```yaml
name: Analyse et tests
on: [push, pull_request]
jobs:
  tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
        with:
          channel: stable
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test
```

> [!attention]
> Les clés de signature, les fichiers de configuration Firebase de production et les mots de passe des comptes vont dans les **secrets** du service d'intégration continue, jamais dans le dépôt de code.

## Performance et téléphones d'entrée de gamme

| Action | Effet |
| --- | --- |
| **Images redimensionnées et mises en cache** | Moins de mémoire, moins de données mobiles |
| **Listes construites à la demande** (`ListView.builder`) | Défilement fluide même avec des centaines d'éléments |
| **Outils de profilage** (Flutter DevTools) | Repérer les images saccadées et la mémoire excessive |
| **Taille de l'application réduite** | Paquets séparés par architecture, ressources inutiles supprimées |
| **Tests sur un vrai téléphone d'entrée de gamme** | Voir ce que vivent la plupart des utilisateurs |

## Le fonctionnement hors connexion

| Élément | Solution possible |
| --- | --- |
| **Lecture hors connexion** | Cache local de Firestore, ou base locale |
| **Saisie hors connexion** | File d'attente des modifications, envoi au retour du réseau |
| **Conflits** | Règle claire : la dernière modification gagne, ou fusion |
| **Information de l'utilisateur** | Indicateur « hors connexion » et « en attente d'envoi » |

> [!madagascar]
> Testez votre application en **mode avion**, puis en réactivant le réseau au milieu d'une action. Pour une application utilisée en brousse ou dans les quartiers où le réseau coupe souvent, ce test vaut plus que tous les autres.

> [!retenir]
> - Couches présentation, état, domaine, données ; une seule solution d'état.
> - Environnements séparés avec des variantes de compilation.
> - Tests unitaires, de widget et d'intégration.
> - Intégration continue, compilation dans le cloud, secrets protégés.
> - Performance sur téléphone d'entrée de gamme et mode hors connexion testé.

## Exercice pratique : une application maintenable

> [!exercice] Exercice pratique · 5 heures
> 1. Réorganisez votre application en 4 couches.
> 2. Créez deux variantes de compilation (développement et production).
> 3. Écrivez 3 tests unitaires et 2 tests de widget.
> 4. Ajoutez un workflow GitHub Actions et rendez une fonction utilisable hors connexion.
>
> **À livrer** : le lien du dépôt, une capture du workflow réussi et une vidéo du mode hors connexion.
