Ce module vous fait prendre en main les outils de l'intégrateur : **Figma** pour lire une maquette et récupérer les mesures, **VS Code** pour écrire le code, les **outils du navigateur** pour tester et corriger, et **Git** pour sauvegarder. Vous découvrirez aussi les outils payants : **Figma** en offre payante (avec le mode développeur) et **WebStorm**.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Lire une maquette Figma et en extraire les informations.
> 2. Exporter les images et les icônes.
> 3. Travailler efficacement dans VS Code.
> 4. Tester et corriger avec les outils du navigateur.
> 5. Comprendre ce qu'apportent les outils payants.

## Lire une maquette Figma

| Information | Où la trouver |
| --- | --- |
| **Couleurs** | Styles de couleur ou variables de la maquette |
| **Polices et tailles** | Styles de texte ; sélectionner un texte pour voir ses propriétés |
| **Espacements** | Sélectionner un élément et survoler un autre avec la touche Alt (Option sur Mac) pour voir la distance |
| **Mise en page automatique** (Auto Layout) | Indique souvent l'équivalent d'un Flexbox (direction, espacement, marges) |
| **Composants** | Éléments réutilisables : boutons, cartes, champs |
| **Versions** | Maquettes pour mobile, tablette et ordinateur, si le designer les a faites |

> [!astuce]
> Commencez par **parcourir toute la maquette** et faites la liste des composants qui se répètent (boutons, cartes, titres de section). Vous les coderez une seule fois, puis les réutiliserez.

### Les questions à poser au designer

1. Quelles maquettes existent pour le mobile et la tablette ?
2. Quels sont les états des boutons et des champs (survol, actif, erreur, désactivé) ?
3. Que se passe-t-il si un texte est plus long ?
4. Quelles polices et quelles licences ?
5. Les animations sont-elles prévues ?

## Exporter les images et icônes

| Élément | Format d'export |
| --- | --- |
| **Icônes, logos** | SVG |
| **Photos** | JPEG ou WebP, en 1x et 2x pour les écrans haute densité |
| **Illustrations simples** | SVG |
| **Images avec transparence** | PNG ou WebP |

## VS Code : travailler efficacement

| Fonction | Usage |
| --- | --- |
| **Emmet** | Écrire du HTML très vite (par exemple `ul>li*3>a` crée une liste de 3 liens) |
| **Extension Live Server** | Recharger la page automatiquement à chaque sauvegarde |
| **Prettier** | Formater le code automatiquement |
| **Recherche dans tout le projet** | Retrouver une classe ou une couleur |
| **Terminal intégré** | Lancer Git |

## Les outils du navigateur

| Outil | Usage |
| --- | --- |
| **Inspecteur** | Voir et modifier le HTML et le CSS en direct |
| **Mode appareil** | Simuler des tailles d'écran de téléphone et de tablette |
| **Affichage Flexbox et Grid** | Voir les zones et les espacements |
| **Simulation de réseau lent** | Tester la vitesse avec une connexion faible |
| **Lighthouse** | Note de performance, d'accessibilité et de bonnes pratiques |

> [!attention]
> Le mode appareil du navigateur est une **simulation**. Testez toujours sur au moins un **vrai téléphone**, car certains comportements (clavier, zoom, barre d'adresse) ne se voient qu'en réel.

## Git : sauvegarder et partager

```bash
git init
git add .
git commit -m "Intégration de l'en-tête et du héro"
git branch -M main
git remote add origin https://github.com/votre-compte/lodge-tsara.git
git push -u origin main
```

> [!astuce]
> Faites un **commit** à chaque étape terminée (en-tête, héro, section chambres). Si quelque chose casse, vous pouvez revenir à la version précédente.

## Les outils payants

| Outil | Ce qu'il apporte |
| --- | --- |
| **Figma** (offre payante avec mode développeur) | Inspection plus complète, code CSS proposé pour les éléments, suivi des changements de la maquette, annotations du designer |
| **WebStorm** | Éditeur professionnel de JetBrains : analyse du code, refactorisation, outils intégrés (une licence gratuite existe pour certains usages non commerciaux et pour les étudiants, selon les conditions) |

> [!madagascar]
> Souvent, c'est **l'agence ou le client** qui vous donne accès à son espace Figma payant. Pour débuter, la version gratuite de Figma et VS Code suffisent largement. Vérifiez les conditions des licences gratuites sur les sites officiels.

> [!retenir]
> - Figma : couleurs, polices, espacements, mise en page automatique, composants.
> - Poser les bonnes questions au designer sur le mobile, les états et les textes longs.
> - Exporter en SVG pour les icônes, en JPEG ou WebP en 1x et 2x pour les photos.
> - VS Code avec Emmet, Live Server, Prettier ; tester avec les outils du navigateur et un vrai téléphone.
> - Git à chaque étape ; Figma payant et WebStorm pour aller plus loin.

## Exercice pratique : de Figma au code

> [!exercice] Exercice pratique · 4 heures
> 1. Ouvrez une maquette gratuite de la communauté Figma (page d'accueil simple).
> 2. Listez les couleurs, polices, espacements et composants.
> 3. Exportez les icônes en SVG et les photos en WebP.
> 4. Intégrez l'en-tête et la première section, testez avec Lighthouse et sur un vrai téléphone.
> 5. Publiez le code sur GitHub avec au moins 4 commits.
>
> **À livrer** : votre liste, le lien du dépôt GitHub, vos captures Lighthouse et téléphone.
