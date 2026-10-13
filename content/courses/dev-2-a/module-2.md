Figma gratuit et VS Code suffisent pour débuter. Dans les agences et les équipes produit, deux outils payants reviennent souvent : **Figma en offre payante**, avec son mode développeur, et **WebStorm**, un éditeur de code très complet. Ce module vous apprend à les utiliser pour passer de la maquette au code plus vite et avec moins d'erreurs.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Inspecter une maquette avec le mode développeur de Figma.
> 2. Transformer les variables Figma en variables CSS.
> 3. Utiliser les fonctions avancées de WebStorm.
> 4. Travailler avec Git depuis l'éditeur.
> 5. Choisir quand investir dans ces outils.

## Figma en offre payante : le mode développeur

| Fonction | Usage |
| --- | --- |
| **Inspection** | Mesures, espacements, couleurs, polices, exactement comme dans la maquette |
| **Variables** | Couleurs, espacements et tailles nommés par le designer |
| **Statut « prêt pour le développement »** | Savoir quelles pages sont validées |
| **Annotations** | Comportements, états et règles notés par le designer |
| **Comparaison des versions** | Voir ce qui a changé depuis la dernière intégration |
| **Export des ressources** | Icônes en SVG, images aux bonnes tailles |

> [!attention]
> Le code proposé par l'outil d'inspection est un **point de départ**, pas un code prêt à livrer : positions absolues, tailles fixes, noms peu clairs. Réécrivez-le avec un HTML sémantique et un CSS responsive.

## Des variables Figma aux variables CSS

> [!definition] Jeton de design (design token)
> Une valeur de design nommée et partagée entre la maquette et le code : une couleur, un espacement, une taille de police. Quand le designer modifie un jeton, le code peut être mis à jour au même endroit.

```css
:root {
  /* Couleurs */
  --couleur-primaire: #0e7c66;
  --couleur-texte: #1d2321;
  --couleur-fond: #ffffff;

  /* Espacements */
  --espace-1: 4px;
  --espace-2: 8px;
  --espace-4: 16px;
  --espace-8: 32px;

  /* Typographie */
  --police-titre: "Poppins", sans-serif;
  --taille-texte: 1rem;
  --taille-titre-1: clamp(2rem, 5vw, 3rem);
}

.bouton {
  background: var(--couleur-primaire);
  padding: var(--espace-2) var(--espace-4);
}
```

> [!astuce]
> Demandez au designer de **nommer les variables** dans Figma avec les mêmes noms que dans votre CSS. Une réunion de 30 minutes au début du projet évite des centaines de valeurs recopiées à la main.

## WebStorm : un éditeur complet

| Fonction | Usage |
| --- | --- |
| **Complétion intelligente** | HTML, CSS, JavaScript et frameworks courants |
| **Inspections** | Erreurs, sélecteurs inutilisés, problèmes d'accessibilité signalés |
| **Refactorisation** | Renommer une classe ou une variable partout sans erreur |
| **Modèles de code** | Vos blocs fréquents insérés en quelques lettres |
| **Débogueur** | Arrêter le JavaScript à une ligne et inspecter les valeurs |
| **Historique local** | Retrouver une version d'un fichier même sans Git |

## Git dans l'éditeur

| Action | Usage |
| --- | --- |
| **Branches** | Une branche par fonctionnalité ou correction |
| **Comparaison visuelle** | Voir les changements avant de valider |
| **Résolution des conflits** | Fusionner deux versions avec un outil en trois colonnes |
| **Demandes de fusion** | Faire relire son code par l'équipe |

```bash
git switch -c correction/formulaire-reservation
git add .
git commit -m "Formulaire : libellés associés et navigation au clavier"
git push -u origin correction/formulaire-reservation
```

## Choisir quand investir

| Outil | Modèle de prix | Investir quand… |
| --- | --- | --- |
| **Figma en offre payante** | Abonnement par personne, souvent payé par l'équipe du client | Vous travaillez régulièrement dans les fichiers d'une agence |
| **WebStorm** | Abonnement, avec des offres gratuites pour certains usages (étudiants, usage non commercial selon les conditions) | Vous travaillez sur de gros projets et le gain de temps est réel |

> [!madagascar]
> Ces abonnements se paient en dollars ou en euros par carte bancaire internationale. Souvent, **l'agence vous ajoute à son équipe Figma** : vous n'avez rien à payer. Vérifiez les conditions actuelles des offres gratuites et étudiantes de chaque éditeur.

> [!retenir]
> - Mode développeur de Figma : inspection, variables, statut, annotations, versions.
> - Le code proposé n'est qu'un point de départ.
> - Jetons de design partagés entre Figma et le CSS, avec les mêmes noms.
> - WebStorm : inspections, refactorisation, modèles, débogueur, historique local.
> - Git : branches, comparaison, conflits, demandes de fusion.

## Exercice pratique : de la maquette au code avec des jetons

> [!exercice] Exercice pratique · 4 heures
> 1. Dans une maquette Figma (communautaire ou la vôtre), relevez toutes les couleurs, espacements et tailles.
> 2. Créez le fichier de variables CSS correspondant.
> 3. Intégrez un composant (carte ou bouton avec ses états) en utilisant uniquement ces variables.
> 4. Travaillez sur une branche Git et ouvrez une demande de fusion sur votre dépôt.
>
> **À livrer** : votre fichier de variables, le composant et le lien de la demande de fusion.
