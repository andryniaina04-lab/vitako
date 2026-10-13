Jitter et Blender permettent de débuter. Les agences et les marques travaillent cependant surtout avec **Adobe After Effects**, et beaucoup de projets 3D se font avec **Cinema 4D**. Ce module vous présente les fonctions professionnelles de ces deux logiciels et les livrables qu'on vous demandera.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Organiser un projet After Effects comme un professionnel.
> 2. Maîtriser l'éditeur de courbes et les calques de forme.
> 3. Utiliser quelques expressions simples.
> 4. Créer des modèles modifiables et des animations Lottie.
> 5. Comprendre l'apport de Cinema 4D et de ses outils MoGraph.

## After Effects : les fonctions essentielles

| Fonction | Usage |
| --- | --- |
| **Compositions et précompositions** | Organiser une animation en blocs réutilisables |
| **Calques de forme** | Formes vectorielles animables (icônes, illustrations) |
| **Éditeur de courbes** | Régler la vitesse et l'accélération des mouvements |
| **Masques et caches** | Révéler ou cacher une partie d'un calque |
| **Objets nuls et parentage** | Animer plusieurs éléments ensemble |
| **Effets** | Flous, dégradés, distorsions, particules simples |

> [!definition] Éditeur de courbes
> Une vue qui montre comment la vitesse d'un mouvement change dans le temps. Une courbe douce donne un mouvement naturel ; une courbe plate donne un mouvement mécanique. C'est l'outil qui distingue le plus un animateur débutant d'un professionnel.

## Quelques expressions simples

> [!definition] Expression
> Une petite ligne de code attachée à une propriété, qui calcule sa valeur automatiquement.

```javascript
// Tremblement léger : 2 fois par seconde, 10 pixels au maximum
wiggle(2, 10)

// Répéter en boucle les images clés d'une propriété
loopOut("cycle")

// Rotation continue : 90 degrés par seconde
time * 90
```

> [!astuce]
> Quelques expressions bien choisies font gagner des heures : boucles, tremblements, rotations, liens entre propriétés. Inutile de devenir programmeur ; gardez un fichier de vos expressions favorites, commentées en français.

## Modèles modifiables et animations Lottie

| Livrable | Usage |
| --- | --- |
| **Modèle de graphiques animés** (MOGRT) | Le monteur du client change textes et couleurs dans Premiere Pro |
| **Animation Lottie** | Animation légère pour une application ou un site, exportée avec une extension comme Bodymovin |
| **Vidéo avec transparence** | Logo ou titre à superposer sur d'autres vidéos |
| **Kit de transitions** | Transitions aux couleurs de la marque, prêtes à l'emploi |

> [!attention]
> Les animations Lottie ne prennent pas en charge tous les effets d'After Effects. Vérifiez la **liste des fonctions compatibles** avant de commencer et testez l'export régulièrement, sinon vous risquez de devoir tout refaire.

## Cinema 4D : la 3D pour le motion design

| Fonction | Usage |
| --- | --- |
| **MoGraph : cloneurs** | Dupliquer des objets en grille, en cercle ou le long d'un chemin |
| **MoGraph : effecteurs** | Animer tous les clones ensemble (vague, hasard, délai) |
| **Matériaux** | Métal, verre, plastique, tissu |
| **Lumières et caméras** | Mise en scène des objets |
| **Moteurs de rendu** | Rendu standard ou moteur avancé (par exemple Redshift) |
| **Lien avec After Effects** | Composer les rendus 3D avec le reste de l'animation |

> [!madagascar]
> Le rendu 3D demande un **ordinateur puissant** et beaucoup de temps. Avec des coupures d'électricité, il faut un onduleur et des rendus en séquence d'images (une image par fichier) : en cas de coupure, vous reprenez à la dernière image au lieu de tout recommencer.

## Choisir quand investir

| Outil | Modèle de prix | Investir quand… |
| --- | --- | --- |
| **After Effects** | Abonnement mensuel | Vos clients ou agences demandent des fichiers After Effects ou des MOGRT |
| **Cinema 4D** | Abonnement | Vous avez des commandes régulières en 3D |
| **Moteur de rendu avancé** | Abonnement | Vos rendus doivent être photoréalistes |

> [!madagascar]
> Ces logiciels se paient en dollars ou en euros par carte bancaire internationale. Profitez des **versions d'essai** et des **tarifs étudiants**, et commencez par After Effects : il couvre la majorité des commandes.

> [!retenir]
> - After Effects : compositions, calques de forme, éditeur de courbes, parentage.
> - Expressions simples : wiggle, loopOut, rotation continue.
> - Livrables : MOGRT, Lottie, vidéos avec transparence, kits de transitions.
> - Cinema 4D : cloneurs, effecteurs, matériaux, rendu ; séquences d'images contre les coupures.
> - Investir quand les commandes le justifient.

## Exercice pratique : un kit d'identité animée

> [!exercice] Exercice pratique · 5 heures
> 1. Avec une version d'essai, animez le logo d'une marque fictive en 3 secondes en travaillant les courbes.
> 2. Créez 2 transitions et un titre animé aux couleurs de la marque.
> 3. Exportez le titre en modèle modifiable et le logo en animation Lottie.
> 4. Bonus : créez une petite animation 3D avec un cloneur.
>
> **À livrer** : vos fichiers, vos exports et une vidéo de présentation du kit.
