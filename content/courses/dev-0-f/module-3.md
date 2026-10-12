Ce module vous fait prendre en main les outils du développeur front-end : **Visual Studio Code**, les **outils de développement** du navigateur, **Git et GitHub** pour sauvegarder et partager votre code, puis **React** pour construire des interfaces en composants. Vous découvrirez aussi les outils payants : **WebStorm** et **GitHub Copilot**.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Travailler efficacement dans Visual Studio Code.
> 2. Déboguer une page avec les outils de développement.
> 3. Sauvegarder votre code avec Git et le publier sur GitHub.
> 4. Créer un projet React et vos premiers composants.
> 5. Comprendre ce qu'apportent WebStorm et GitHub Copilot.

## Les outils gratuits

| N° | Outil | À quoi il sert |
| --- | --- | --- |
| 1 | **Visual Studio Code** | Éditeur de code, avec extensions |
| 2 | **Outils de développement** (Chrome, Firefox) | Inspecter le HTML et le CSS, lire les erreurs, tester sur mobile |
| 3 | **Git** | Garder l'historique de votre code |
| 4 | **GitHub** | Héberger votre code en ligne, collaborer, publier un site (GitHub Pages) |
| 5 | **Node.js** et **npm** | Installer des outils et des bibliothèques, lancer un projet React |
| 6 | **Vite** | Créer et lancer rapidement un projet React |

## Visual Studio Code

### Les extensions utiles

1. **Prettier** : met en forme votre code automatiquement.
2. **ESLint** : signale les erreurs probables en JavaScript.
3. **Live Server** : recharge la page à chaque enregistrement.

### Les raccourcis à connaître

| Action | Windows / Linux | macOS |
| --- | --- | --- |
| Ouvrir un fichier par son nom | Ctrl + P | Cmd + P |
| Palette de commandes | Ctrl + Maj + P | Cmd + Maj + P |
| Commenter une ligne | Ctrl + / | Cmd + / |
| Sélectionner l'occurrence suivante | Ctrl + D | Cmd + D |
| Ouvrir le terminal intégré | Menu Affichage → Terminal | Menu Affichage → Terminal |

## Les outils de développement du navigateur

Ouvrez-les avec **F12** ou clic droit → **Inspecter**.

| Onglet | Ce que vous y faites |
| --- | --- |
| **Éléments** | Voir le HTML, modifier le CSS en direct, visualiser le modèle des boîtes |
| **Console** | Lire les erreurs JavaScript, tester une ligne de code |
| **Réseau** | Voir les fichiers chargés, leur poids et leur durée |
| **Mode appareil** | Simuler un téléphone et une connexion lente |

> [!astuce]
> Quand quelque chose ne marche pas, ouvrez **d'abord la console** : le message d'erreur indique souvent le fichier et la ligne du problème.

## Git et GitHub

> [!definition] Git
> Un logiciel qui enregistre l'historique de votre code par étapes appelées **commits**. Vous pouvez revenir à une version précédente, travailler à plusieurs et voir qui a changé quoi.

### Le cycle de base

```bash
git init                         # créer un dépôt dans le dossier
git add .                        # préparer tous les fichiers modifiés
git commit -m "Page d'accueil"   # enregistrer une étape
git remote add origin https://github.com/votre-nom/soa-cafe.git
git push -u origin main          # envoyer sur GitHub
```

### Les bonnes pratiques

1. Un commit = **une étape claire**, avec un message qui dit ce qui a changé.
2. Faites des commits **souvent** (plusieurs fois par jour).
3. Ne mettez **jamais** de mots de passe ou de clés secrètes dans le dépôt.
4. Ajoutez un fichier **README** qui explique le projet et comment le lancer.

> [!madagascar]
> Avec une connexion instable, Git est votre assurance : votre travail est enregistré localement à chaque commit, et il suffit de faire `git push` quand la connexion revient. Pensez aussi à **GitHub Pages** pour publier gratuitement vos projets de portfolio.

## React : construire en composants

> [!definition] Composant
> Un morceau d'interface réutilisable (un bouton, une carte produit, un menu) écrit comme une fonction JavaScript qui renvoie ce qu'il faut afficher.

### Créer un projet

```bash
npm create vite@latest soa-cafe -- --template react
cd soa-cafe
npm install
npm run dev
```

### Un premier composant

```jsx
function CarteProduit({ nom, prix }) {
  return (
    <div className="carte">
      <h3>{nom}</h3>
      <p>{prix.toLocaleString('fr-FR')} Ar</p>
    </div>
  );
}

export default function App() {
  const produits = [
    { id: 1, nom: 'Café', prix: 3000 },
    { id: 2, nom: 'Thé', prix: 2000 },
    { id: 3, nom: 'Mofo gasy', prix: 500 },
  ];
  return (
    <main>
      <h1>Soa Café</h1>
      {produits.map(p => <CarteProduit key={p.id} nom={p.nom} prix={p.prix} />)}
    </main>
  );
}
```

### Les 3 notions clés

| Notion | Ce que c'est | Exemple |
| --- | --- | --- |
| **JSX** | Une écriture proche du HTML dans JavaScript | `<h3>{nom}</h3>` |
| **Props** | Les informations transmises à un composant | `nom` et `prix` |
| **State** (état) | Une valeur qui change et met à jour l'affichage | Le contenu d'un panier |

```jsx
import { useState } from 'react';

function Compteur() {
  const [quantite, setQuantite] = useState(0);
  return (
    <button onClick={() => setQuantite(quantite + 1)}>
      Ajouter au panier ({quantite})
    </button>
  );
}
```

## Les outils payants

| Outil | Ce qu'il apporte | Quand l'utiliser |
| --- | --- | --- |
| **WebStorm** | Éditeur complet de JetBrains : refactorisation avancée, débogage intégré, aide très précise pour JavaScript, TypeScript et React | Quand vous travaillez sur de gros projets ; certaines agences le fournissent |
| **GitHub Copilot** | Assistant d'IA dans l'éditeur : propose des lignes ou des fonctions entières, explique du code | Pour gagner du temps sur le code répétitif, une fois les bases solides |

> [!attention]
> N'utilisez pas un assistant d'IA pour apprendre les bases à votre place. Il propose parfois du code faux, dépassé ou peu sûr : vous devez **comprendre** chaque ligne avant de l'accepter. Vérifiez aussi que votre client accepte l'utilisation de ces outils sur son code. Les prix et les offres (dont les offres gratuites pour étudiants) changent : vérifiez-les sur les sites officiels.

> [!retenir]
> - Visual Studio Code avec Prettier, ESLint et Live Server.
> - La console du navigateur d'abord quand quelque chose ne marche pas.
> - Git pour l'historique, GitHub pour partager et publier ; jamais de secrets dans le dépôt.
> - React : composants, JSX, props et state.
> - WebStorm et Copilot accélèrent, mais ne remplacent pas la compréhension.

## Exercice pratique : votre première application React

> [!exercice] Exercice pratique · 3 heures
> 1. Installez Node.js, Git et les 3 extensions de Visual Studio Code.
> 2. Mettez la page Soa Café du module 2 dans un dépôt Git et publiez-la sur GitHub Pages.
> 3. Créez un projet React avec Vite.
> 4. Créez un composant `CarteProduit` et affichez 6 produits à partir d'un tableau.
> 5. Ajoutez un bouton « Ajouter au panier » qui compte les articles avec `useState`.
> 6. Faites au moins 5 commits avec des messages clairs et publiez le dépôt.
>
> **À livrer** : le lien de votre page GitHub Pages et le lien de votre dépôt React.
