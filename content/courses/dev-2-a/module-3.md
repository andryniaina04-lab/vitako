Un intégrateur professionnel livre un code propre, accessible, rapide et facile à reprendre par une autre personne. Ce module vous donne les méthodes qui permettent d'aller vite sans baisser la qualité : architecture CSS, composants, outils de vérification automatique, tests d'accessibilité et de performance, et contrôle avant livraison.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Organiser votre CSS pour un projet qui grandit.
> 2. Construire des composants réutilisables.
> 3. Automatiser la mise en forme et la vérification du code.
> 4. Tester l'accessibilité et la performance.
> 5. Contrôler une intégration avant livraison.

## Une architecture CSS claire

| Méthode | Principe |
| --- | --- |
| **Variables** | Toutes les valeurs de design au même endroit |
| **Nommage BEM** | Bloc, élément, modificateur : `.carte`, `.carte__titre`, `.carte--mise-en-avant` |
| **Fichiers par composant** | Un fichier pour chaque composant |
| **Classes utilitaires limitées** | Quelques classes d'aide (masquer visuellement, espacements) |
| **Mobile d'abord** | Styles pour petit écran, puis requêtes média pour les plus grands |

```css
.carte {
  display: grid;
  gap: var(--espace-2);
  padding: var(--espace-4);
  border-radius: 12px;
}

.carte__titre {
  font-size: 1.25rem;
}

.carte--mise-en-avant {
  border: 2px solid var(--couleur-primaire);
}

@media (min-width: 48em) {
  .carte {
    grid-template-columns: 200px 1fr;
  }
}
```

## Des composants réutilisables

| Composant | États à prévoir |
| --- | --- |
| **Bouton** | Normal, survol, focus visible, appuyé, désactivé, chargement |
| **Champ de formulaire** | Vide, rempli, erreur avec message, désactivé |
| **Carte** | Avec ou sans image, texte court ou long |
| **Menu** | Ouvert, fermé, élément actif, navigation au clavier |
| **Fenêtre modale** | Ouverture, focus piégé à l'intérieur, fermeture par Échap |

> [!astuce]
> Créez une **page de démonstration** qui affiche tous les composants avec tous leurs états. Vous testez tout d'un coup d'œil, et l'équipe du client sait ce qui existe déjà.

## Automatiser la vérification

| Outil | Rôle |
| --- | --- |
| **Prettier** | Met en forme le code automatiquement, toujours de la même façon |
| **Stylelint** | Signale les erreurs et les mauvaises pratiques CSS |
| **ESLint** | Fait de même pour le JavaScript |
| **Validateur HTML** | Vérifie la structure du HTML |
| **Vérifications avant validation Git** | Lancent ces outils automatiquement avant chaque commit |

## Tester l'accessibilité

| Test | Comment |
| --- | --- |
| **Automatique** | Lighthouse ou une extension d'audit d'accessibilité |
| **Clavier** | Parcourir toute la page avec Tab, Maj+Tab, Entrée, Espace, Échap |
| **Lecteur d'écran** | NVDA (gratuit, Windows) ou VoiceOver (Mac, iPhone) |
| **Contrastes** | Outil de mesure des contrastes |
| **Zoom** | Page lisible à 200 % sans défilement horizontal |
| **Mouvement réduit** | Animations réduites si l'utilisateur l'a demandé |

```css
@media (prefers-reduced-motion: reduce) {
  * {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}
```

> [!attention]
> Les tests automatiques ne trouvent qu'**une partie** des problèmes d'accessibilité. Un score de 100 dans Lighthouse ne garantit pas qu'une page est accessible : les tests au clavier et au lecteur d'écran restent indispensables.

## Tester la performance

| Action | Effet |
| --- | --- |
| **Images en WebP ou AVIF**, aux bonnes tailles | Pages beaucoup plus légères |
| **Chargement différé** des images hors écran | Affichage plus rapide |
| **Polices limitées** et préchargées | Moins de fichiers, texte visible rapidement |
| **CSS et JavaScript minifiés** | Fichiers plus petits |
| **Dimensions des images indiquées** | Pas de décalage de la mise en page |

> [!madagascar]
> Testez toujours en **simulant une connexion mobile lente** dans les outils du navigateur, puis sur un vrai téléphone d'entrée de gamme avec une connexion locale. C'est le meilleur argument face aux clients : vous savez ce que vivent leurs visiteurs.

## Le contrôle avant livraison

| Point | Vérification |
| --- | --- |
| **Fidélité à la maquette** | Espacements, couleurs, typographie |
| **Responsive** | De 320 pixels au grand écran |
| **Navigateurs** | Ceux prévus au contrat |
| **Accessibilité** | Clavier, lecteur d'écran, contrastes, zoom |
| **Performance** | Mesure dans les conditions convenues |
| **Code** | Aucune erreur des outils de vérification |
| **Documentation** | README : installation, structure, composants |

> [!retenir]
> - Variables, BEM, fichiers par composant, mobile d'abord.
> - Composants avec tous leurs états et une page de démonstration.
> - Prettier, Stylelint, ESLint et validateur, lancés automatiquement.
> - Accessibilité : outils, clavier, lecteur d'écran, contrastes, zoom, mouvement réduit.
> - Performance : images, chargement différé, polices, minification, dimensions.

## Exercice pratique : un kit de composants

> [!exercice] Exercice pratique · 5 heures
> 1. Créez 5 composants (bouton, champ, carte, menu, modale) avec tous leurs états.
> 2. Rassemblez-les sur une page de démonstration.
> 3. Configurez Prettier et Stylelint, et corrigez toutes les alertes.
> 4. Testez la page au clavier, au lecteur d'écran et sur connexion lente, et notez vos résultats.
>
> **À livrer** : le lien du dépôt, la page de démonstration et votre rapport de tests.
