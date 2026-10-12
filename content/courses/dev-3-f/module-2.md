Avant de construire un site, il faut comprendre comment Internet l'affiche, et comment WordPress et Shopify sont organisés. Ce module vous donne ces bases : nom de domaine, hébergement, sécurité, structure d'un site, et les notions de HTML et de CSS qui vous serviront tous les jours.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Expliquer le rôle du nom de domaine, de l'hébergement et du HTTPS.
> 2. Décrire l'organisation de WordPress : thèmes, extensions, pages, articles, menus.
> 3. Décrire l'organisation de Shopify : thèmes, applications, produits, collections.
> 4. Construire l'arborescence d'un site.
> 5. Lire et modifier du HTML et du CSS simples.

## Comment un site arrive à l'écran

| Élément | Comparaison | Rôle |
| --- | --- | --- |
| **Nom de domaine** | L'adresse de la maison | Le nom que l'on tape : `hotel-baobab.com` |
| **Hébergement** | Le terrain où la maison est construite | L'ordinateur (serveur) qui garde les fichiers du site et les envoie aux visiteurs |
| **DNS** | L'annuaire | Le système qui relie le nom de domaine au bon serveur |
| **HTTPS** (certificat SSL) | Le cadenas de la porte | Chiffre les échanges ; le navigateur affiche « non sécurisé » sans lui |

> [!definition] Serveur
> Un ordinateur allumé en permanence, relié à Internet, qui envoie les pages du site à chaque visiteur.

### Ce que le client doit posséder

1. Le **nom de domaine** doit être **au nom du client**, sur son compte. Jamais sur le vôtre.
2. L'**hébergement** aussi, de préférence. Vous recevez un accès.
3. Vous gardez les **accès** dans un gestionnaire de mots de passe, et vous les rendez à la fin de la mission.

> [!attention]
> Si le domaine est à votre nom et que vous disparaissez (maladie, changement de métier), le client perd son site. C'est une source fréquente de conflits : faites toujours enregistrer le domaine au nom du client.

## L'organisation de WordPress

| Élément | Ce que c'est | Exemple |
| --- | --- | --- |
| **Tableau de bord** | L'espace d'administration (`/wp-admin`) | Là où tout se gère |
| **Thème** | L'apparence générale du site | Astra, Kadence, GeneratePress (thèmes gratuits populaires) |
| **Extensions** (*plugins*) | Des fonctions ajoutées | Formulaire de contact, référencement, sécurité, boutique (WooCommerce) |
| **Pages** | Contenus fixes | Accueil, À propos, Services, Contact |
| **Articles** | Contenus datés, classés par catégories | Actualités, blog |
| **Médias** | Images, PDF, vidéos | Photos des chambres |
| **Menus** | La navigation du site | Accueil · Chambres · Activités · Contact |
| **Utilisateurs** | Les comptes, avec des rôles | Administrateur, Éditeur, Auteur |

> [!astuce] La règle des extensions
> Chaque extension ajoute du poids et un risque de sécurité. Avant d'en installer une : est-elle **vraiment nécessaire** ? Est-elle **mise à jour récemment** ? A-t-elle **beaucoup d'installations et de bons avis** ? Si une réponse est non, cherchez une autre solution.

## L'organisation de Shopify

| Élément | Ce que c'est |
| --- | --- |
| **Thème** | L'apparence de la boutique (Dawn est le thème gratuit de base) |
| **Applications** | Des fonctions ajoutées (avis clients, traduction, e-mails) |
| **Produits** | Chaque article vendu, avec photos, prix, variantes (taille, couleur), stock |
| **Collections** | Des groupes de produits (« Robes », « Nouveautés », « Promotions ») |
| **Pages** | Contenus fixes (À propos, Livraison, Contact) |
| **Navigation** | Menus du haut et du bas de page |
| **Paramètres** | Paiements, livraison, taxes, langues |

## Construire l'arborescence d'un site

> [!definition] Arborescence
> Le plan du site : la liste des pages et la façon dont elles sont reliées. On la fait **avant** de construire, et on la fait valider par le client.

> [!exemple] Arborescence du site d'un hôtel
> ```
> Accueil
> ├── Chambres
> │   ├── Bungalow vue mer
> │   └── Chambre jardin
> ├── Restaurant
> ├── Activités
> ├── Galerie
> └── Contact et réservation
> ```
> En bas de chaque page : mentions légales, politique de confidentialité, réseaux sociaux.

### Les 5 règles d'une bonne arborescence

1. Chaque information importante est accessible en **3 clics maximum**.
2. **6 à 7 éléments** maximum dans le menu principal.
3. Des noms de pages **simples** : « Chambres » plutôt que « Nos espaces de repos ».
4. Une page **Contact** visible partout.
5. Sur téléphone, le bouton principal (« Réserver », « Commander », « Appeler ») toujours facile à toucher.

## Les bases du HTML et du CSS

Vous n'avez pas besoin d'être programmeur, mais savoir lire un peu de code vous sauvera souvent.

> [!definition] HTML et CSS
> Le **HTML** décrit le contenu d'une page (titres, paragraphes, images, liens). Le **CSS** décrit son apparence (couleurs, tailles, espacements).

### Le HTML à connaître

```
<h1>Bienvenue au Baobab Lodge</h1>
<h2>Nos chambres</h2>
<p>Six bungalows face à la mer.</p>
<a href="/contact">Réserver</a>
<img src="bungalow.jpg" alt="Bungalow face à la mer">
```

| Balise | Rôle |
| --- | --- |
| `<h1>` à `<h3>` | Titres (un seul `h1` par page) |
| `<p>` | Paragraphe |
| `<a href="…">` | Lien |
| `<img src="…" alt="…">` | Image, avec une description (`alt`) pour l'accessibilité et Google |

### Le CSS à connaître

```
.bouton-reserver {
  background-color: #0B7A55;
  color: white;
  padding: 12px 24px;
  border-radius: 8px;
}
```

Cette règle donne un fond vert, un texte blanc, de l'espace intérieur et des coins arrondis à tous les éléments qui ont la classe `bouton-reserver`.

> [!astuce] Les outils de développement du navigateur
> Dans Chrome ou Firefox, faites un **clic droit → Inspecter** sur n'importe quel élément d'une page : vous voyez son HTML et son CSS, et vous pouvez les modifier pour essayer (les changements disparaissent quand vous rechargez). C'est le meilleur moyen d'apprendre.

> [!madagascar]
> Beaucoup de visiteurs malgaches naviguent sur téléphone avec une connexion mobile. Pensez **léger** dès le départ : peu d'extensions, images compressées, pas de vidéo qui démarre seule en arrière-plan.

> [!retenir]
> - Domaine, hébergement, DNS, HTTPS : le domaine toujours au nom du client.
> - WordPress : thème, extensions, pages, articles, menus, utilisateurs.
> - Shopify : thème, applications, produits, collections, paramètres.
> - Une arborescence validée avant de construire.
> - Un peu de HTML et de CSS, et l'outil « Inspecter » du navigateur.

## Exercice pratique : préparer un site

> [!exercice] Exercice pratique · 1 heure
> 1. Choisissez un des 5 sites analysés au module 1 et dessinez la nouvelle arborescence que vous proposeriez.
> 2. Sur une page de ce site, utilisez « Inspecter » pour trouver le `h1`, un lien et une image, et notez leur code.
> 3. Toujours avec « Inspecter », changez la couleur d'un bouton et le texte d'un titre ; faites une capture d'écran.
> 4. Écrivez une petite page HTML (un titre, deux paragraphes, une image, un lien) dans un fichier `test.html` et ouvrez-la dans votre navigateur.
>
> **À livrer** : votre arborescence, vos notes de code, la capture modifiée et votre fichier `test.html`.
