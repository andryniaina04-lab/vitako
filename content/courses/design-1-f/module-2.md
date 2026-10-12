Ce module vous donne les bases du design d'interface : comprendre les utilisateurs, organiser les parcours, dessiner des wireframes, puis appliquer les règles visuelles qui rendent une interface claire : typographie, couleurs, grilles et espacements.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Mener un entretien utilisateur simple et créer un profil d'utilisateur.
> 2. Dessiner un parcours utilisateur et une arborescence.
> 3. Réaliser des wireframes.
> 4. Appliquer les règles de typographie, de couleurs et d'espacement.
> 5. Respecter les bases de l'accessibilité.

## Comprendre les utilisateurs

### L'entretien utilisateur

1. **Préparez 6 à 8 questions** ouvertes sur les habitudes, pas sur les opinions.
2. **Interrogez 4 à 5 personnes** qui ressemblent aux futurs utilisateurs.
3. **Écoutez** plus que vous ne parlez.
4. **Notez** les faits, les difficultés, les mots qu'ils utilisent.

| Bonne question | Mauvaise question |
| --- | --- |
| « Racontez-moi la dernière fois que vous avez acheté un billet de taxi-brousse. » | « Aimeriez-vous une application pour acheter des billets ? » |
| « Qu'est-ce qui a été difficile ? » | « Est-ce que ce serait pratique ? » |

> [!definition] Persona (profil d'utilisateur)
> Une fiche qui décrit un utilisateur type à partir des entretiens : objectifs, difficultés, habitudes, contexte d'usage. Elle aide l'équipe à prendre des décisions pour de vraies personnes.

> [!exemple] Persona
> **Hanta, 27 ans, commerçante à Mahajanga.** Vend des vêtements sur Facebook. Utilise un téléphone Android d'entrée de gamme avec un forfait limité. **Objectif** : suivre ses commandes et ses paiements MVola sans tout noter dans un cahier. **Difficultés** : messages perdus, oublis de livraison, connexion lente. **Ce qu'elle attend** : une application légère, en français et en malgache, qui fonctionne même avec une mauvaise connexion.

## Organiser les parcours

### Le parcours utilisateur

Il décrit les étapes qu'une personne suit pour atteindre son objectif.

```
Objectif : réserver une place de taxi-brousse
1. Ouvrir l'application
2. Choisir le départ et l'arrivée (Antananarivo → Antsirabe)
3. Choisir la date et l'horaire
4. Choisir le nombre de places
5. Voir le prix total
6. Payer par Mobile Money
7. Recevoir le billet (écran + SMS)
```

### L'arborescence

Elle montre toutes les pages et leur organisation.

```
Accueil
├── Rechercher un trajet
│   └── Résultats → Détail du trajet → Paiement → Confirmation
├── Mes billets
├── Compte
│   ├── Profil
│   └── Moyens de paiement
└── Aide
```

> [!astuce]
> Comptez les étapes du parcours principal. Chaque étape supprimée réduit le nombre d'utilisateurs qui abandonnent. Demandez-vous toujours : « Cette étape est-elle vraiment nécessaire ? »

## Les wireframes

> [!definition] Wireframe
> Une maquette simplifiée, en noir et blanc, qui montre la structure d'un écran : où sont les titres, les boutons, les listes, les champs. Pas de couleurs ni d'images : on se concentre sur l'organisation.

### Les règles

1. **Commencez par le téléphone** : l'écran le plus petit oblige à choisir l'essentiel.
2. **Utilisez des blocs gris** pour les images et des lignes pour les textes.
3. **Écrivez les vrais textes** des boutons (« Payer 35 000 Ar », pas « Bouton »).
4. **Faites plusieurs versions** rapides avant d'en choisir une.

## Les règles visuelles

### La typographie

| Règle | Exemple |
| --- | --- |
| 1 ou 2 polices au maximum | Une police sans empattement lisible (Inter, Roboto…) |
| Une échelle de tailles | 12, 14, 16, 20, 24, 32 px |
| Texte courant d'au moins 14 à 16 px sur téléphone | Lisible sans zoomer |
| Interligne d'environ 1,4 à 1,6 fois la taille | Lecture confortable |

### Les couleurs

1. **Une couleur principale** pour les actions importantes (boutons principaux).
2. **Des couleurs neutres** (gris) pour les textes et les fonds.
3. **Des couleurs de signal** : vert pour le succès, rouge pour l'erreur, orange pour l'alerte.
4. **Ne jamais transmettre une information uniquement par la couleur** : ajoutez une icône ou un texte.

### La grille et les espacements

> [!definition] Système d'espacement de 8 points
> Utiliser des espacements multiples de 8 (8, 16, 24, 32, 48 px). Les écrans paraissent ordonnés et les développeurs reproduisent facilement les maquettes.

| Élément | Espacement courant |
| --- | --- |
| Marges latérales sur téléphone | 16 ou 24 px |
| Entre deux éléments liés | 8 px |
| Entre deux groupes | 24 ou 32 px |
| Zone tactile minimale d'un bouton | Environ 44 à 48 px de haut |

## Les bases de l'accessibilité

1. **Contraste** suffisant entre le texte et le fond (outil de vérification de contraste dans Figma).
2. **Zones tactiles** assez grandes pour les doigts.
3. **Textes clairs** sur les boutons : « Confirmer le paiement » plutôt que « OK ».
4. **Messages d'erreur** qui expliquent comment corriger.
5. **Pas d'information** donnée seulement par la couleur.

> [!madagascar]
> Beaucoup d'utilisateurs malgaches utilisent leur téléphone **en plein soleil**, avec une **luminosité réduite** pour économiser la batterie. Un bon contraste et des textes assez grands ne sont pas un luxe : c'est la condition pour que l'application soit utilisable.

> [!retenir]
> - Interrogez les utilisateurs sur leurs habitudes réelles et créez des personas.
> - Parcours et arborescence avant les écrans.
> - Wireframes en noir et blanc, téléphone d'abord, vrais textes.
> - 1 ou 2 polices, une couleur principale, des espacements multiples de 8.
> - Contraste, zones tactiles et textes clairs pour l'accessibilité.

## Exercice pratique : de l'entretien au wireframe

> [!exercice] Exercice pratique · 3 heures
> 1. Interrogez 3 personnes sur la façon dont elles paient leurs factures (Jirama, eau, téléphone).
> 2. Créez un persona à partir des entretiens.
> 3. Dessinez le parcours « payer une facture » et l'arborescence d'une application.
> 4. Réalisez les wireframes des 5 écrans principaux sur papier, puis dans Figma.
>
> **À livrer** : vos notes d'entretien, votre persona, votre parcours, votre arborescence et vos wireframes.
