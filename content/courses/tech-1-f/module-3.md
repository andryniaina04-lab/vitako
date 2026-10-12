Ce module vous fait prendre en main les outils du testeur : **Jira** pour suivre les bugs et les tâches, les **outils de développement du navigateur**, **Postman** pour tester les API, et **Playwright** pour automatiser vos premiers tests. Vous découvrirez aussi les outils payants : **BrowserStack** et les **offres payantes de Jira**.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Créer et suivre des bugs dans Jira.
> 2. Utiliser les outils de développement du navigateur pour enquêter.
> 3. Tester une API avec Postman.
> 4. Écrire un premier test automatisé avec Playwright.
> 5. Comprendre ce qu'apportent BrowserStack et Jira payant.

## Jira : suivre les bugs

| Élément | Rôle |
| --- | --- |
| **Projet** | L'espace d'une application ou d'une équipe |
| **Ticket (issue)** | Un bug, une tâche, une histoire d'utilisateur |
| **Champs** | Titre, description, gravité, priorité, version, environnement, pièces jointes |
| **Statuts (workflow)** | À faire → En cours → À tester → Terminé (ou Réouvert) |
| **Filtres et tableaux** | Bugs ouverts par gravité, bugs à retester |

### Le cycle de vie d'un bug

```
Nouveau → Confirmé → En correction → À tester → Fermé
                                         ↘ Réouvert (si le bug persiste)
```

> [!astuce]
> Avant de créer un bug, **cherchez** s'il existe déjà. Un doublon fait perdre du temps à toute l'équipe.

## Les outils de développement du navigateur

Ouvrez-les avec **F12** ou clic droit → **Inspecter**.

| Onglet | Ce que le testeur y cherche |
| --- | --- |
| **Console** | Erreurs JavaScript (en rouge) au moment du bug |
| **Réseau** | Requêtes en erreur (codes 400, 500), réponses lentes, données envoyées |
| **Éléments** | Le texte ou le bouton exact concerné |
| **Mode appareil** | Simuler un téléphone et une connexion lente |
| **Application** | Données enregistrées (cookies, stockage local) |

> [!exemple] Une enquête rapide
> En cliquant sur « Payer », rien ne se passe. Dans l'onglet Réseau, la requête `POST /api/paiements` renvoie **500**. Dans la Console, une erreur apparaît. Vous joignez au rapport de bug une capture de la requête et de l'erreur : le développeur sait immédiatement où chercher.

## Postman : tester une API

1. Créez une **collection** « API Boutique ».
2. Ajoutez une requête `GET https://api.exemple.com/produits`.
3. Envoyez-la et vérifiez le **code** (200), le **temps** et les **données**.
4. Ajoutez des **tests** automatiques dans l'onglet Tests :

```js
pm.test("Code 200", () => pm.response.to.have.status(200));
pm.test("Liste non vide", () => {
  const produits = pm.response.json();
  pm.expect(produits.length).to.be.above(0);
});
pm.test("Chaque produit a un prix positif", () => {
  pm.response.json().forEach(p => pm.expect(p.prix).to.be.above(0));
});
```

5. Testez aussi les **cas d'erreur** : produit inexistant (404), données invalides (400), sans connexion (401).

## Playwright : un premier test automatisé

> [!definition] Playwright
> Un outil gratuit et libre qui pilote de vrais navigateurs (Chromium, Firefox, WebKit) pour rejouer automatiquement un parcours et vérifier les résultats.

```bash
npm init playwright@latest
```

```js
// tests/panier.spec.js
import { test, expect } from '@playwright/test';

test('livraison offerte à partir de 50 000 Ar', async ({ page }) => {
  await page.goto('https://boutique-demo.exemple.com');
  await page.getByRole('link', { name: 'Panier de fruits' }).click();
  await page.getByRole('button', { name: 'Ajouter au panier' }).click();
  await page.getByRole('link', { name: 'Panier' }).click();
  await expect(page.getByTestId('frais-livraison')).toHaveText('0 Ar');
});
```

```bash
npx playwright test          # lancer les tests
npx playwright show-report   # voir le rapport
```

> [!attention]
> N'automatisez que des tests **stables** et **répétés souvent** (régression). Un test automatisé mal écrit qui échoue au hasard fait perdre plus de temps qu'il n'en fait gagner. Testez seulement des sites dont vous avez l'autorisation (vos projets, des sites de démonstration prévus pour cela).

## Les outils payants

| Outil | Ce qu'il apporte |
| --- | --- |
| **BrowserStack** | Tester sur des milliers de vrais téléphones et navigateurs à distance, sans les acheter ; lancer les tests Playwright sur ces appareils |
| **Jira (offres payantes)** | Plus d'utilisateurs, droits avancés, automatisations, extensions de gestion des tests (cas de test, campagnes, rapports) |

> [!madagascar]
> Ces outils sont facturés en dollars et généralement **payés par l'entreprise**, qui vous donne un accès. Pour apprendre, utilisez l'offre gratuite de Jira, les essais de BrowserStack, et vos propres téléphones. Vérifiez les prix à jour sur les sites officiels.

> [!retenir]
> - Jira : tickets, statuts, filtres ; chercher les doublons avant de créer un bug.
> - Les outils du navigateur pour enquêter : Console et Réseau.
> - Postman pour tester les API, avec des tests automatiques.
> - Playwright pour automatiser les tests de régression stables.
> - BrowserStack et Jira payant, fournis par l'entreprise.

## Exercice pratique : votre boîte à outils

> [!exercice] Exercice pratique · 4 heures
> 1. Créez un projet Jira gratuit et saisissez vos rapports de bugs du module 2.
> 2. Enquêtez sur un problème d'un site (Console et Réseau) et faites des captures.
> 3. Testez une API publique de démonstration avec Postman : 5 requêtes et 6 tests.
> 4. Installez Playwright et écrivez 3 tests sur un site de démonstration prévu pour l'entraînement.
>
> **À livrer** : captures de Jira, votre enquête, votre collection Postman exportée et votre dépôt Playwright.
