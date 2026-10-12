Ce module vous donne les bases du front-end : écrire du HTML clair et accessible, mettre en forme avec CSS, construire des mises en page avec Flexbox et Grid, adapter le site au téléphone, puis ajouter de l'interactivité avec JavaScript.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Écrire une page HTML structurée avec les bonnes balises.
> 2. Mettre en forme une page avec CSS et le modèle des boîtes.
> 3. Construire une mise en page avec Flexbox et Grid.
> 4. Rendre une page adaptative avec les media queries.
> 5. Réagir à un clic et vérifier un formulaire avec JavaScript.

## HTML : la structure

Une page HTML est faite de **balises** qui décrivent le rôle de chaque contenu.

```html
<!doctype html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Soa Café – Antsirabe</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <header>
    <h1>Soa Café</h1>
    <nav><a href="#menu">Menu</a> <a href="#contact">Contact</a></nav>
  </header>
  <main>
    <section id="menu">
      <h2>Notre menu</h2>
      <img src="cafe.jpg" alt="Tasse de café sur une table en bois">
    </section>
  </main>
  <footer>© 2026 Soa Café</footer>
</body>
</html>
```

### Les balises à connaître

| Balise | Rôle |
| --- | --- |
| `header`, `nav`, `main`, `section`, `footer` | Les grandes zones de la page |
| `h1` à `h6` | Les titres, dans l'ordre (un seul `h1` par page) |
| `p`, `ul`, `ol`, `li` | Paragraphes et listes |
| `a` | Lien |
| `img` | Image, toujours avec un texte `alt` |
| `button` | Bouton d'action |
| `form`, `label`, `input` | Formulaire et champs |

> [!definition] Accessibilité
> Le fait qu'un site soit utilisable par tous, y compris les personnes malvoyantes qui utilisent un lecteur d'écran ou celles qui naviguent au clavier. Les bonnes balises, les textes `alt` et les `label` de formulaire en sont la base.

## CSS : l'apparence

```css
body {
  font-family: system-ui, sans-serif;
  color: #1f2937;
  margin: 0;
}
h1 {
  color: #7c2d12;
  font-size: 2rem;
}
.bouton {
  background: #7c2d12;
  color: white;
  padding: 12px 20px;
  border-radius: 8px;
}
```

Une règle CSS = un **sélecteur** (`h1`, `.bouton`) + des **propriétés** et leurs **valeurs**.

### Le modèle des boîtes

Chaque élément est une boîte composée de 4 couches, de l'intérieur vers l'extérieur :

1. **content** : le contenu.
2. **padding** : l'espace intérieur.
3. **border** : la bordure.
4. **margin** : l'espace extérieur.

> [!astuce]
> Ajoutez `* { box-sizing: border-box; }` au début de votre CSS : la largeur d'un élément inclut alors son padding et sa bordure, ce qui rend les calculs beaucoup plus simples.

## Flexbox et Grid : la mise en page

| Outil | Pour quoi | Exemple |
| --- | --- | --- |
| **Flexbox** | Aligner des éléments sur une ligne ou une colonne | Un menu horizontal, un bouton centré |
| **Grid** | Organiser une grille en lignes et colonnes | Une galerie de produits |

```css
nav {
  display: flex;
  gap: 16px;
  justify-content: space-between;
  align-items: center;
}
.produits {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  gap: 20px;
}
```

La grille `.produits` crée automatiquement autant de colonnes que l'écran le permet, chacune d'au moins 220 pixels.

## Le site adaptatif

> [!definition] Site adaptatif (responsive)
> Un site dont la mise en page s'adapte à la taille de l'écran : une colonne sur téléphone, plusieurs sur ordinateur.

### La méthode « mobile d'abord »

1. Écrivez d'abord le CSS pour le **téléphone** (une colonne).
2. Ajoutez des **media queries** pour les écrans plus larges.

```css
.contenu { padding: 16px; }

@media (min-width: 768px) {
  .contenu {
    padding: 32px;
    display: grid;
    grid-template-columns: 2fr 1fr;
  }
}
```

> [!madagascar]
> Une grande partie des internautes malgaches se connectent depuis un **téléphone**, souvent avec une connexion mobile limitée. Pensez « mobile d'abord », compressez vos images et évitez les fichiers inutiles : un site léger se charge plus vite et coûte moins de données à vos visiteurs.

## JavaScript : l'interactivité

### Réagir à un clic

```html
<button id="btn-menu">Afficher le menu</button>
<ul id="menu" hidden>
  <li>Café – 3 000 Ar</li>
  <li>Thé – 2 000 Ar</li>
</ul>
```

```js
const bouton = document.querySelector('#btn-menu');
const menu = document.querySelector('#menu');

bouton.addEventListener('click', () => {
  menu.hidden = !menu.hidden;
});
```

### Les notions de base

| Notion | Exemple | Rôle |
| --- | --- | --- |
| Variable | `const prix = 3000;` | Garder une valeur |
| Fonction | `function total(a, b) { return a + b; }` | Regrouper des instructions |
| Condition | `if (age >= 18) { ... }` | Choisir selon une situation |
| Tableau | `const cafes = ['Café', 'Thé'];` | Une liste de valeurs |
| Boucle | `cafes.forEach(c => console.log(c));` | Répéter pour chaque élément |
| Événement | `addEventListener('click', ...)` | Réagir à l'utilisateur |

### Vérifier un formulaire

```js
const form = document.querySelector('#contact');
form.addEventListener('submit', (e) => {
  const email = form.querySelector('#email').value;
  if (!email.includes('@')) {
    e.preventDefault();
    alert('Adresse e-mail invalide');
  }
});
```

> [!attention]
> La vérification en JavaScript aide l'utilisateur, mais **ne protège pas** le serveur : un utilisateur peut la contourner. Le back-end doit toujours vérifier les données à nouveau.

> [!retenir]
> - HTML : des balises qui décrivent le rôle du contenu, avec `alt` et `label`.
> - CSS : sélecteurs, propriétés, modèle des boîtes, `box-sizing: border-box`.
> - Flexbox pour aligner, Grid pour les grilles.
> - Mobile d'abord, puis media queries.
> - JavaScript : variables, fonctions, conditions, tableaux, événements.

## Exercice pratique : la page de Soa Café

> [!exercice] Exercice pratique · 3 heures
> 1. Créez la page HTML de Soa Café : en-tête, menu de navigation, section menu, section contact, pied de page.
> 2. Mettez-la en forme avec CSS : couleurs, polices, boutons.
> 3. Affichez 6 produits dans une grille adaptative.
> 4. Ajoutez un bouton qui affiche ou masque les horaires d'ouverture.
> 5. Ajoutez un formulaire de contact qui vérifie l'e-mail.
> 6. Testez la page sur votre téléphone ou avec le mode appareil mobile du navigateur.
>
> **À livrer** : vos fichiers HTML, CSS et JavaScript, et deux captures (téléphone et ordinateur).
