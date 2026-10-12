Dans ce module, vous réalisez un projet complet de designer UI/UX pour une petite application, de la compréhension du besoin jusqu'à la livraison aux développeurs. C'est le type de projet qui deviendra votre première **étude de cas** de portfolio.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Cadrer un projet avec un client.
> 2. Concevoir les parcours et les écrans d'une application.
> 3. Tester un prototype avec de vrais utilisateurs.
> 4. Améliorer le design à partir des résultats.
> 5. Livrer un fichier propre aux développeurs.

## Le cas pratique : « Tsena »

> [!exemple] Votre client
> **Tsena** est une jeune entreprise d'Antananarivo qui veut lancer une application de **commande de légumes frais** auprès de producteurs de la région d'Analamanga, avec livraison à domicile et paiement par Mobile Money ou à la livraison. Le fondateur, M. Andry, a besoin de maquettes et d'un prototype pour convaincre des investisseurs et briefer son développeur.

## Étape 1 : cadrer le projet

### Les questions au client

| Thème | Question |
| --- | --- |
| **Objectif** | Que doit permettre la première version ? |
| **Utilisateurs** | Qui va commander ? Avec quel téléphone ? |
| **Contraintes** | Délai, budget, développeur prévu, langues |
| **Concurrence** | Qui fait déjà quelque chose de proche ? |
| **Succès** | Comment saura-t-on que l'application marche ? |

### Le périmètre de la première version

1. Parcourir les légumes par catégorie.
2. Ajouter au panier.
3. Choisir un créneau de livraison.
4. Payer (Mobile Money ou à la livraison).
5. Suivre la commande.

Tout le reste (programme de fidélité, avis, abonnements) est noté pour **plus tard**.

## Étape 2 : comprendre les utilisateurs

1. **Interrogez 5 personnes** qui achètent des légumes chaque semaine.
2. **Créez 2 personas** : par exemple une mère de famille qui travaille et un jeune couple.
3. **Notez leurs difficultés** : temps de trajet au marché, fraîcheur, prix changeants.

## Étape 3 : parcours et wireframes

1. **Dessinez le parcours principal** : de l'ouverture à la confirmation.
2. **Faites l'arborescence**.
3. **Réalisez les wireframes** des écrans principaux.

| Écran | Contenu essentiel |
| --- | --- |
| Accueil | Recherche, catégories, produits de saison |
| Catégorie | Liste des produits avec prix au kilo et bouton d'ajout |
| Produit | Photo, origine du producteur, prix, quantité |
| Panier | Produits, total, frais de livraison |
| Livraison | Adresse, créneau |
| Paiement | Mobile Money ou à la livraison, récapitulatif |
| Confirmation et suivi | Numéro de commande, étapes de livraison |

## Étape 4 : maquettes et prototype

1. **Définissez le style** avec le client : couleurs (par exemple un vert frais), police, ton des textes.
2. **Créez les composants** : bouton, carte produit, sélecteur de quantité, étapes de suivi.
3. **Réalisez les maquettes** de tous les écrans, y compris les **états** : panier vide, chargement, erreur de paiement, produit épuisé.
4. **Reliez-les en prototype**.

> [!attention]
> Les débutants oublient souvent les **états vides et d'erreur**. Que voit l'utilisateur si son panier est vide ? Si le paiement échoue ? Si aucun créneau n'est disponible ? Un développeur qui ne reçoit pas ces écrans devra les inventer.

## Étape 5 : tester le prototype

### Le test en 5 étapes

1. **Recrutez 5 personnes** proches des personas.
2. **Donnez une tâche** : « Commandez 2 kg de tomates et 1 botte de brèdes pour demain matin. »
3. **Observez sans aider** : notez où elles hésitent ou se trompent.
4. **Demandez à la fin** ce qui a été difficile.
5. **Regroupez les observations** par problème et par gravité.

| Problème observé | Nombre de personnes | Gravité | Correction |
| --- | --- | --- | --- |
| Ne trouvent pas comment changer la quantité | 3 sur 5 | Forte | Sélecteur + et − plus visible |
| Ne comprennent pas « créneau » | 2 sur 5 | Moyenne | Remplacer par « Heure de livraison » |
| Frais de livraison vus trop tard | 4 sur 5 | Forte | Afficher les frais dès le panier |

> [!madagascar]
> Testez le prototype sur des **téléphones d'entrée de gamme**, et pas seulement sur votre ordinateur. Vérifiez aussi que les textes restent compréhensibles pour des utilisateurs qui préfèrent le malgache : le client voudra peut-être une version bilingue.

## Étape 6 : livrer aux développeurs

1. **Organisez** le fichier : pages claires, écrans nommés et dans l'ordre.
2. **Annotez** les comportements : que se passe-t-il au clic, au chargement, en cas d'erreur ?
3. **Vérifiez** que tous les éléments utilisent les composants et les styles.
4. **Exportez** les icônes et images nécessaires.
5. **Présentez** le fichier au développeur lors d'un appel et répondez à ses questions.

> [!retenir]
> - Cadrez la première version et notez le reste pour plus tard.
> - Entretiens, personas, parcours et wireframes avant les maquettes.
> - N'oubliez pas les états vides, de chargement et d'erreur.
> - Testez avec 5 personnes, regroupez et corrigez par gravité.
> - Livrez un fichier organisé et annoté.

## Exercice pratique : le projet Tsena

> [!exercice] Exercice pratique · 8 heures (sur plusieurs jours)
> 1. Rédigez la fiche de cadrage du projet.
> 2. Interrogez 5 personnes et créez 2 personas.
> 3. Réalisez parcours, arborescence et wireframes.
> 4. Créez les maquettes de 7 écrans et leurs états, puis le prototype.
> 5. Testez avec 5 personnes et corrigez.
> 6. Préparez le fichier pour un développeur.
>
> **À livrer** : votre fichier Figma, le prototype, le tableau des tests et une étude de cas de 1 page. C'est votre projet de portfolio.
