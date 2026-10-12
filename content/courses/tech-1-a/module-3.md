Des tests automatiques utiles doivent être **fiables, lisibles et rapides**, et s'exécuter seuls à chaque modification du code. Ce module vous donne les méthodes des meilleures équipes : organisation du code de test, sélecteurs robustes, données de test, intégration continue, tests instables et indicateurs.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Organiser des tests Playwright avec le modèle Page Object.
> 2. Choisir des sélecteurs robustes.
> 3. Gérer les données de test.
> 4. Exécuter les tests automatiquement dans l'intégration continue.
> 5. Traiter les tests instables et suivre les bons indicateurs.

## Organiser le code de test

> [!definition] Page Object
> Une façon d'organiser les tests : chaque page de l'application a un fichier qui décrit ses éléments et ses actions. Les tests appellent ces actions au lieu de répéter les sélecteurs.

```javascript
// pages/login-page.js
export class LoginPage {
  constructor(page) {
    this.page = page;
    this.email = page.getByLabel('E-mail');
    this.password = page.getByLabel('Mot de passe');
    this.submit = page.getByRole('button', { name: 'Se connecter' });
  }
  async login(email, password) {
    await this.email.fill(email);
    await this.password.fill(password);
    await this.submit.click();
  }
}
```

```javascript
// tests/login.spec.js
import { test, expect } from '@playwright/test';
import { LoginPage } from '../pages/login-page.js';

test('un client se connecte', async ({ page }) => {
  await page.goto('/connexion');
  await new LoginPage(page).login('client@test.mg', process.env.TEST_PASSWORD);
  await expect(page.getByRole('heading', { name: 'Mes commandes' })).toBeVisible();
});
```

> [!astuce]
> Si l'écran de connexion change, vous ne modifiez **qu'un seul fichier** : la page. Tous les tests qui l'utilisent continuent de fonctionner.

## Des sélecteurs robustes

| Sélecteur | Fiabilité |
| --- | --- |
| Rôle et nom visible (`getByRole`) | Très bonne, proche de l'utilisateur |
| Libellé (`getByLabel`) | Très bonne pour les formulaires |
| Attribut dédié aux tests (`data-testid`) | Très bonne, demandé aux développeurs |
| Texte (`getByText`) | Bonne, sauf si le texte change souvent |
| Classe CSS ou chemin long | Mauvaise : casse au moindre changement de design |

## Les données de test

| Pratique | Pourquoi |
| --- | --- |
| **Créer les données par l'API** avant le test | Plus rapide que par l'interface |
| **Un jeu de données par test** | Les tests ne dépendent pas les uns des autres |
| **Nettoyer** après le test | L'environnement reste propre |
| **Jamais de données réelles de clients** | Confidentialité |
| **Comptes de test** pour chaque rôle | Tester les droits |

## L'intégration continue

> [!definition] Intégration continue
> L'exécution automatique des tests à chaque modification envoyée sur le dépôt de code, avant que la nouvelle version soit acceptée.

```yaml
# .github/workflows/tests.yml
name: Tests de bout en bout
on: [push, pull_request]
jobs:
  e2e:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20
      - run: npm ci
      - run: npx playwright install --with-deps
      - run: npx playwright test
        env:
          TEST_PASSWORD: ${{ secrets.TEST_PASSWORD }}
      - uses: actions/upload-artifact@v4
        if: always()
        with:
          name: rapport-playwright
          path: playwright-report/
```

> [!madagascar]
> L'intégration continue s'exécute **sur les serveurs** du service (ici GitHub Actions), pas sur votre ordinateur. Une connexion lente ou une coupure de courant à Madagascar n'empêche donc pas les tests de tourner.

## Les tests instables

> [!definition] Test instable (flaky)
> Un test qui réussit ou échoue sans changement du code. Il fait perdre confiance dans toute la suite de tests.

| Cause fréquente | Solution |
| --- | --- |
| Attentes fixes (« attendre 3 secondes ») | Assertions qui attendent automatiquement un état |
| Tests qui dépendent les uns des autres | Données propres à chaque test |
| Sélecteurs fragiles | Rôles, libellés, `data-testid` |
| Environnement de test instable | Signaler, isoler, simuler les services externes |

> [!attention]
> Ne désactivez pas un test instable sans le dire. Mettez-le **en quarantaine**, créez un ticket et corrigez-le rapidement.

## Les indicateurs

| Indicateur | Ce qu'il montre |
| --- | --- |
| Bugs trouvés après la mise en ligne | L'efficacité réelle des tests |
| Durée de la suite automatique | La rapidité du retour aux développeurs |
| Taux de tests instables | La fiabilité de l'automatisation |
| Couverture des parcours critiques | Ce qui est protégé |
| Délai de vérification des corrections | La réactivité du testeur |

> [!retenir]
> - Page Object pour des tests lisibles et faciles à maintenir.
> - Sélecteurs par rôle, libellé ou attribut de test.
> - Données créées par l'API, propres à chaque test, jamais réelles.
> - Tests exécutés automatiquement à chaque modification.
> - Tests instables en quarantaine et corrigés vite.

## Exercice pratique : une suite automatique professionnelle

> [!exercice] Exercice pratique · 4 heures
> 1. Sur une application de démonstration publique, écrivez 5 tests Playwright avec 2 Page Objects.
> 2. Remplacez tous les sélecteurs fragiles.
> 3. Ajoutez un workflow d'intégration continue qui exécute les tests et garde le rapport.
> 4. Provoquez un test instable, puis corrigez-le en expliquant la cause.
>
> **À livrer** : le lien de votre dépôt, une capture d'une exécution réussie et votre explication.
