Ce module vous fait prendre en main les outils du développeur mobile : **Flutter** avec ses outils de développement, **Firebase** pour les comptes et les données, et la préparation de la publication. Vous découvrirez aussi les comptes payants indispensables pour publier : **Google Play Console** et **Apple Developer Program**.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Utiliser les outils de développement de Flutter.
> 2. Connecter une application à Firebase.
> 3. Gérer les comptes utilisateurs et les données avec Firebase.
> 4. Protéger les données avec des règles de sécurité.
> 5. Comprendre les comptes de publication et leurs coûts.

## Les outils de Flutter

| Outil | Usage |
| --- | --- |
| **Rechargement à chaud** (hot reload) | Voir les changements en moins d'une seconde, sans redémarrer l'application |
| **Flutter DevTools** | Inspecter les widgets, la mémoire, les performances |
| **Émulateur Android** | Tester sans téléphone |
| **Téléphone réel** en mode développeur | Tester en conditions réelles |
| **pub.dev** | Bibliothèque de paquets (cartes, appareil photo, stockage) |
| **flutter analyze** | Repérer les erreurs et mauvaises pratiques |

> [!attention]
> Avant d'ajouter un paquet de pub.dev, vérifiez sa **popularité**, sa date de mise à jour et sa compatibilité. Un paquet abandonné peut bloquer votre application lors d'une future mise à jour.

## Firebase : les services utiles

> [!definition] Firebase
> Une plateforme de Google qui fournit des services prêts à l'emploi pour les applications : comptes, base de données, stockage de fichiers, notifications, statistiques. Elle propose une offre gratuite avec des limites, puis un paiement à l'usage.

| Service | Usage |
| --- | --- |
| **Authentication** | Comptes : e-mail, téléphone, Google |
| **Cloud Firestore** | Base de données en temps réel, avec fonctionnement hors connexion |
| **Storage** | Photos et fichiers |
| **Cloud Messaging** | Notifications |
| **Crashlytics** | Rapports de plantage |
| **Analytics** | Statistiques d'utilisation |

### Lire et écrire des données

```dart
final db = FirebaseFirestore.instance;

// Ajouter une commande
await db.collection('commandes').add({
  'clientId': utilisateur.uid,
  'plats': ['Romazava', 'Mofo gasy'],
  'total': 12500,
  'statut': 'en_attente',
  'date': FieldValue.serverTimestamp(),
});

// Écouter les commandes du client en temps réel
db.collection('commandes')
  .where('clientId', isEqualTo: utilisateur.uid)
  .snapshots()
  .listen((resultat) {
    // mettre à jour l'écran
  });
```

> [!madagascar]
> Cloud Firestore garde une **copie locale** des données sur le téléphone : l'application continue de fonctionner quand la connexion coupe, et les modifications sont envoyées au retour du réseau. C'est un grand avantage pour les utilisateurs à Madagascar. Testez toujours votre application en **mode avion**.

## Les règles de sécurité

Sans règles, n'importe qui pourrait lire ou modifier les données de votre base. Les règles de Firestore définissent qui peut faire quoi.

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /commandes/{commandeId} {
      allow read: if request.auth != null
                  && resource.data.clientId == request.auth.uid;
      allow create: if request.auth != null
                    && request.resource.data.clientId == request.auth.uid;
    }
  }
}
```

> [!attention]
> Ne laissez **jamais** une base en « mode test » ouvert à tous une fois l'application publiée. Testez vos règles avec l'outil de simulation de la console Firebase avant chaque mise en ligne.

## Préparer la publication

| Élément | Contenu |
| --- | --- |
| **Identifiant de l'application** | Unique, par exemple com.mivoatra.epargne |
| **Icône et nom** | Aux formats demandés par chaque magasin |
| **Version** | Numéro de version et de build, augmentés à chaque publication |
| **Signature** | Clé de signature conservée en lieu sûr |
| **Fiche** | Description, captures d'écran, catégorie |
| **Politique de confidentialité** | Page en ligne expliquant l'usage des données |
| **Déclarations** | Données collectées, public visé, contenu |

> [!attention]
> La **clé de signature** de l'application doit être sauvegardée en lieu sûr et ne jamais être publiée dans un dépôt de code public. Sans elle, ou si elle est volée, la gestion des mises à jour devient très compliquée.

## Les comptes de publication

| Compte | Coût et conditions (à vérifier sur les sites officiels) |
| --- | --- |
| **Google Play Console** | Frais d'inscription unique ; vérification d'identité ; règles de test avant publication pour certains nouveaux comptes personnels |
| **Apple Developer Program** | Abonnement annuel ; Mac nécessaire pour compiler et envoyer l'application |

> [!madagascar]
> Ces frais se paient en dollars par carte bancaire internationale. Le plus souvent, **le client ouvre son propre compte** de publication et vous ajoute comme utilisateur : l'application lui appartient. Pour votre propre portfolio, un compte Google Play suffit pour commencer.

> [!retenir]
> - Rechargement à chaud, DevTools, émulateur, téléphone réel, pub.dev, analyse.
> - Firebase : comptes, Firestore, stockage, notifications, plantages, statistiques.
> - Firestore fonctionne hors connexion : tester en mode avion.
> - Des règles de sécurité testées ; jamais de base ouverte à tous.
> - Préparer identifiant, icône, version, signature, fiche et politique de confidentialité ; comptes au nom du client.

## Exercice pratique : une application connectée

> [!exercice] Exercice pratique · 5 heures
> 1. Créez un projet Firebase et connectez-le à votre application du module 2.
> 2. Ajoutez la connexion par e-mail.
> 3. Enregistrez les commandes dans Firestore et affichez celles du client connecté.
> 4. Écrivez les règles de sécurité et testez-les dans le simulateur.
> 5. Testez l'application en mode avion puis au retour du réseau.
>
> **À livrer** : le lien du dépôt (sans clés secrètes), une capture des règles testées et une vidéo du test hors connexion.
