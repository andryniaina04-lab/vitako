Les clients et les agences utilisent souvent les outils payants de l'écosystème : **Elementor Pro** pour concevoir des sites WordPress sur mesure sans tout coder, des **thèmes premium** pour WordPress et Shopify, et les **abonnements Shopify** avec leurs fonctions avancées. Ce module vous apprend à les maîtriser, et à aller un peu plus loin avec le code quand les outils ne suffisent pas.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Construire les modèles d'un site avec le Theme Builder d'Elementor Pro.
> 2. Afficher du contenu dynamique et créer des formulaires et des fenêtres surgissantes.
> 3. Choisir un thème premium fiable et le personnaliser proprement.
> 4. Utiliser les fonctions avancées de Shopify : métachamps, marchés, accès collaborateur.
> 5. Lire et modifier du code Liquid et PHP simple, sans casser le site.

## Elementor Pro : concevoir tout le site

> [!definition] Theme Builder
> L'outil d'Elementor Pro qui permet de créer les **modèles** du site : en-tête, pied de page, modèle d'article, modèle de page produit, page d'archive, page 404. Chaque modèle s'applique automatiquement à toutes les pages concernées.

### Construire les modèles en 6 étapes

1. **En-tête** : logo, menu, bouton d'action ; version adaptée au téléphone.
2. **Pied de page** : coordonnées, liens légaux, réseaux sociaux.
3. **Modèle d'article** : titre, image, contenu, auteur, articles liés.
4. **Modèle d'archive** : liste des articles d'une catégorie.
5. **Modèle de produit** (avec WooCommerce) : galerie, prix, variantes, bouton d'achat bien visible sur téléphone.
6. **Conditions d'affichage** : à quelles pages chaque modèle s'applique.

### Les fonctions avancées

| Fonction | Usage |
| --- | --- |
| **Contenu dynamique** | Afficher automatiquement des informations (titre, prix, champ personnalisé) au lieu de les taper sur chaque page |
| **Formulaires** | Contact, devis, inscription, avec envoi vers l'e-mail ou un outil de newsletter |
| **Fenêtres surgissantes** (*popups*) | Offre, inscription à la newsletter, annonce, avec des règles d'affichage |
| **Kit global** | Couleurs et typographies du site définies une fois, utilisées partout |

> [!astuce]
> Définissez **toujours** les couleurs et les polices dans le kit global avant de construire les pages. Si le client change sa couleur principale, une seule modification met à jour tout le site.

### Les limites à connaître

1. Un constructeur ajoute du **poids** aux pages : surveillez la vitesse.
2. **Un seul constructeur** par site.
3. La **licence** est par site (selon l'offre) et doit être **au nom du client**.

## Les thèmes premium

### Choisir un thème fiable : 7 critères

1. **Mises à jour régulières** (date de la dernière mise à jour).
2. **Nombre de ventes** et **avis** des utilisateurs.
3. **Assistance** réactive (forum, tickets).
4. **Compatibilité** avec les extensions importantes (WooCommerce, traduction, constructeur).
5. **Vitesse** de la démonstration (testée dans PageSpeed Insights).
6. **Documentation** claire.
7. **Source officielle** : la boutique de l'éditeur ou une place de marché reconnue, **jamais** un site de téléchargement non officiel.

### Personnaliser proprement : le thème enfant (WordPress)

> [!definition] Thème enfant
> Un petit thème qui hérite de tout le thème principal (le « parent ») et contient seulement vos modifications. Quand le thème parent se met à jour, vos modifications ne sont pas effacées.

Règle : **ne modifiez jamais directement les fichiers du thème parent**. Utilisez le personnalisateur, les réglages du thème, un thème enfant, ou une extension d'extraits de code.

## Shopify : les fonctions avancées

### Les abonnements

Les formules Shopify diffèrent par leurs fonctions, le nombre de comptes d'équipe, les rapports et les frais. Le choix dépend du chiffre d'affaires et des besoins du client : comparez sur le site officiel, et conseillez **la formule adaptée à aujourd'hui**, pas la plus chère.

### Les fonctions à maîtriser

| Fonction | Usage |
| --- | --- |
| **Éditeur de thème et sections** | Construire les pages avec des blocs, sans code |
| **Métachamps** (*metafields*) | Ajouter des informations personnalisées aux produits (origine, mode d'emploi, composition) et les afficher dans le thème |
| **Marchés** (*Markets*) | Vendre dans plusieurs pays : langues, devises, domaines (selon la formule et les pays) |
| **Comptes d'équipe et accès collaborateur** | Travailler sur la boutique d'un client avec votre propre accès, depuis votre compte partenaire |
| **Applications** | Ajouter des fonctions ; en choisir peu, bien notées, et supprimer celles qui ne servent plus |

> [!exemple] Les métachamps pour une marque de vanille
> Champs ajoutés à chaque produit : « Région d'origine » (Sava), « Grade » (A, gourmet), « Longueur des gousses » (16-18 cm), « Conseils de conservation ». Le thème les affiche automatiquement dans un tableau sur chaque fiche produit.

### L'accès collaborateur

Depuis votre compte **Shopify Partners**, vous demandez un **accès collaborateur** à la boutique du client, avec les droits nécessaires. Le client garde le contrôle complet et peut retirer l'accès à tout moment. C'est la méthode professionnelle : pas de partage de mot de passe.

## Aller un peu plus loin avec le code

### Liquid (Shopify)

> [!definition] Liquid
> Le langage des thèmes Shopify. Il insère des données de la boutique dans les pages.

> [!exemple] Afficher un métachamp dans une fiche produit
> ```
> {% if product.metafields.custom.origine %}
>   <p>Origine : {{ product.metafields.custom.origine }}</p>
> {% endif %}
> ```
> Si le produit a une origine renseignée, elle s'affiche ; sinon, rien n'apparaît.

### PHP (WordPress)

> [!exemple] Un petit extrait dans le thème enfant ou une extension d'extraits
> ```
> // Changer le texte du bouton d'ajout au panier
> add_filter( 'woocommerce_product_single_add_to_cart_text', function () {
>     return 'Commander maintenant';
> } );
> ```

### Les règles de sécurité du code

1. **Jamais de modification directe** sur le site en ligne : testez d'abord sur une copie (module 3).
2. **Sauvegarde** avant toute modification.
3. **Duplication du thème** Shopify avant de modifier son code.
4. **Commentez** votre code : expliquez ce qu'il fait, pour vous et pour le développeur suivant.

> [!madagascar]
> Les licences et abonnements se paient en devises, au nom du client. Pour un client malgache sans carte bancaire internationale, préparez avec lui une solution de paiement **avant** de choisir des outils payants, ou privilégiez des solutions gratuites solides.

> [!retenir]
> - Elementor Pro : Theme Builder, contenu dynamique, formulaires, popups, kit global.
> - Un thème premium se choisit sur 7 critères, et se personnalise par un thème enfant.
> - Shopify : sections, métachamps, marchés, accès collaborateur, peu d'applications.
> - Un peu de Liquid et de PHP, toujours testés sur une copie après sauvegarde.

## Exercice pratique : un site sur mesure

> [!exercice] Exercice pratique · 4 heures
> 1. Avec Elementor (version d'essai de Pro si possible, sinon la version gratuite), construisez en-tête, pied de page, modèle d'article et une popup d'inscription, avec un kit global.
> 2. Créez un thème enfant et ajoutez l'extrait PHP du bouton d'achat sur votre site local WooCommerce.
> 3. Dans votre boutique de développement Shopify, créez 3 métachamps pour des produits malgaches et affichez-les dans la fiche produit.
> 4. Évaluez 2 thèmes premium avec les 7 critères.
>
> **À livrer** : des captures de chaque étape, votre code commenté et votre tableau d'évaluation des thèmes.
