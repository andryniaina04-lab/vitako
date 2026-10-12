Les équipes professionnelles ne livrent pas du code « qui marche sur ma machine ». Elles **testent**, **vérifient automatiquement** chaque modification, **mesurent** la performance et l'accessibilité, et **relisent** le code. Ce module vous donne ces méthodes pour livrer vite sans casser ce qui existe.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Écrire des tests unitaires, de composants et de bout en bout.
> 2. Mettre en place une intégration continue avec GitHub Actions.
> 3. Améliorer la performance d'une application React.
> 4. Corriger les problèmes d'accessibilité les plus fréquents.
> 5. Relire et faire relire du code avec des pull requests.

## Les 3 niveaux de tests

| Niveau | Ce qu'il vérifie | Outils courants | Quantité |
| --- | --- | --- | --- |
| **Unitaire** | Une fonction seule | Vitest ou Jest | Beaucoup |
| **Composant** | Un composant affiché et utilisé comme par un utilisateur | Testing Library | Assez |
| **Bout en bout** | Un parcours complet dans un vrai navigateur | Playwright | Quelques-uns, sur les parcours importants |

### Un test unitaire

```ts
// prix.ts
export function totalSejour(prixNuit: number, nuits: number, remise = 0) {
  if (nuits <= 0) throw new Error('Nombre de nuits invalide');
  return Math.round(prixNuit * nuits * (1 - remise));
}

// prix.test.ts
import { describe, it, expect } from 'vitest';
import { totalSejour } from './prix';

describe('totalSejour', () => {
  it('calcule le total sans remise', () => {
    expect(totalSejour(180000, 3)).toBe(540000);
  });
  it('applique une remise de 10 %', () => {
    expect(totalSejour(180000, 3, 0.1)).toBe(486000);
  });
  it('refuse 0 nuit', () => {
    expect(() => totalSejour(180000, 0)).toThrow();
  });
});
```

### Un test de composant

```tsx
import { it, expect, vi } from 'vitest';
import { render, screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { CarteChambre } from './CarteChambre';

it('appelle onReserver avec l\'identifiant de la chambre', async () => {
  const onReserver = vi.fn();
  render(<CarteChambre chambre={{ id: 7, nom: 'Baobab', prix: 180000, capacite: 2, vueMer: true }} onReserver={onReserver} />);
  await userEvent.click(screen.getByRole('button', { name: 'Réserver' }));
  expect(onReserver).toHaveBeenCalledWith(7);
});
```

> [!astuce]
> Testez **ce que voit et fait l'utilisateur** (un bouton nommé « Réserver », un message d'erreur), pas les détails internes du composant. Vos tests résisteront mieux aux réorganisations du code.

## L'intégration continue

> [!definition] Intégration continue (CI)
> Un service qui lance automatiquement les vérifications (types, lint, tests, build) à chaque envoi de code ou pull request. Une modification qui casse quelque chose est détectée avant d'arriver en production.

```yaml
# .github/workflows/ci.yml
name: CI
on: [push, pull_request]
jobs:
  verifier:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 22
      - run: npm ci
      - run: npm run lint
      - run: npx tsc --noEmit
      - run: npm test -- --run
      - run: npm run build
```

## La performance d'une application React

| Problème | Solution |
| --- | --- |
| Images lourdes | Formats modernes (WebP, AVIF), bonnes dimensions, chargement différé hors de l'écran |
| Bundle JavaScript trop gros | Chargement à la demande (`import()` dynamique, `React.lazy`), suppression des bibliothèques inutiles |
| Rendus inutiles | Découper les composants, éviter de recréer des objets à chaque rendu, mesurer avant d'optimiser |
| Longues listes | Pagination ou affichage virtualisé |
| Décalages de mise en page (CLS) | Réserver la place des images et des blocs qui se chargent |
| Polices | Charger seulement les graisses utilisées, `font-display: swap` |

> [!attention]
> Mesurez **avant** et **après** chaque optimisation (Lighthouse, onglet Performance, React DevTools Profiler). Une optimisation qui ne change pas les chiffres ajoute de la complexité pour rien.

## L'accessibilité : les corrections les plus fréquentes

| Problème | Correction |
| --- | --- |
| Bouton sans nom (icône seule) | `aria-label="Fermer"` ou texte masqué visuellement |
| `div` cliquable | Utiliser un vrai `button` |
| Champ sans étiquette | `label` relié au champ |
| Contraste insuffisant | Couleurs au moins 4,5:1 pour le texte normal (WCAG niveau AA) |
| Focus invisible | Style `:focus-visible` clair |
| Fenêtre de dialogue | Focus piégé dans la fenêtre, fermeture avec Échap, retour du focus au bouton d'origine |
| Messages d'erreur | Liés au champ et annoncés aux lecteurs d'écran |

> [!definition] WCAG
> Les règles internationales pour l'accessibilité des contenus web. Le niveau **AA** est celui demandé le plus souvent par les clients et par les lois de plusieurs pays.

## La relecture de code

### Une bonne pull request

1. **Petite** : une seule fonction ou correction.
2. **Un titre clair** et une description : quoi, pourquoi, comment tester, captures si visuel.
3. **Les vérifications automatiques** au vert.
4. **Aucun code commenté** ou fichier de test oublié.

### Relire le code des autres

| À vérifier | Exemple de commentaire constructif |
| --- | --- |
| Exactitude | « Que se passe-t-il si la liste est vide ? » |
| Lisibilité | « Je propose de renommer `d` en `dateArrivee` pour la clarté. » |
| Tests | « Peux-tu ajouter un test pour le cas d'erreur réseau ? » |
| Accessibilité | « Ce bouton icône n'a pas de nom accessible. » |

> [!madagascar]
> Les pull requests et l'intégration continue permettent de travailler **en asynchrone** avec une équipe à l'étranger : votre code est vérifié automatiquement et relu même pendant une coupure de courant chez vous. Rédigez des descriptions complètes pour que le relecteur n'ait pas besoin de vous joindre.

> [!retenir]
> - Beaucoup de tests unitaires, assez de tests de composants, quelques tests de bout en bout.
> - L'intégration continue vérifie chaque modification : lint, types, tests, build.
> - Mesurez avant d'optimiser la performance.
> - Corrigez les problèmes d'accessibilité fréquents, visez le niveau AA des WCAG.
> - De petites pull requests bien décrites et des relectures constructives.

## Exercice pratique : un projet professionnel

> [!exercice] Exercice pratique · 5 heures
> 1. Ajoutez 6 tests unitaires, 3 tests de composants et 1 test Playwright à votre projet.
> 2. Mettez en place le workflow GitHub Actions et obtenez une exécution verte.
> 3. Mesurez la performance, faites 3 optimisations, mesurez à nouveau.
> 4. Corrigez au moins 5 problèmes d'accessibilité repérés avec Lighthouse et un test au clavier.
> 5. Faites toutes ces modifications par des pull requests décrites.
>
> **À livrer** : le lien du dépôt, la capture du workflow vert et votre tableau avant et après.
