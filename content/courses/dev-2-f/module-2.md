Ce module vous donne les bases techniques de l'intégration : un HTML sémantique, l'organisation du CSS, les variables, Flexbox et Grid, le responsive mobile d'abord, les images et l'accessibilité.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Structurer une page avec un HTML sémantique.
> 2. Organiser votre CSS avec des variables.
> 3. Mettre en page avec Flexbox et Grid.
> 4. Rendre une page responsive, mobile d'abord.
> 5. Intégrer des images et vérifier l'accessibilité.

## Un HTML sémantique

```html
<header class="site-header">
  <a href="/" class="logo">Lodge Tsara</a>
  <nav aria-label="Navigation principale">
    <ul>
      <li><a href="#chambres">Chambres</a></li>
      <li><a href="#activites">Activités</a></li>
      <li><a href="#contact">Contact</a></li>
    </ul>
  </nav>
</header>
<main>
  <section class="hero">
    <h1>Un lodge face à la mer, à Nosy Be</h1>
    <p>Dix bungalows, une plage calme et une cuisine de saison.</p>
    <a class="btn" href="#contact">Réserver</a>
  </section>
</main>
<footer>…</footer>
```

| Balise | Usage |
| --- | --- |
| `header`, `nav`, `main`, `footer` | Grandes zones de la page |
| `section`, `article` | Parties de contenu |
| `h1` à `h6` | Titres, dans l'ordre, un seul `h1` par page |
| `a` | Lien vers une autre page ou une ancre |
| `button` | Action (ouvrir un menu, envoyer) |
| `img` avec `alt` | Image avec texte alternatif |

> [!attention]
> Utilisez un **lien** pour aller ailleurs et un **bouton** pour une action. Un `div` cliquable n'est pas accessible au clavier ni aux lecteurs d'écran.

## Organiser le CSS avec des variables

```css
:root {
  --couleur-principale: #0f6b5c;
  --couleur-texte: #1d2a2f;
  --fond: #fdfaf4;
  --police-titre: "Merriweather", serif;
  --police-texte: "Inter", sans-serif;
  --espace-s: 8px;
  --espace-m: 16px;
  --espace-l: 32px;
  --rayon: 12px;
}

.btn {
  background: var(--couleur-principale);
  color: #fff;
  padding: var(--espace-s) var(--espace-m);
  border-radius: var(--rayon);
}
```

> [!astuce]
> Reprenez les **couleurs, polices et espacements** de la maquette dans des variables CSS. Si le designer change une couleur, vous ne la modifiez qu'à un seul endroit.

## Flexbox et Grid

| Outil | Usage | Exemple |
| --- | --- | --- |
| **Flexbox** | Alignement sur une ligne ou une colonne | Menu, barre de boutons, carte avec image et texte |
| **Grid** | Mise en page en lignes et colonnes | Grille de chambres, galerie, page en plusieurs zones |

```css
.site-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.chambres {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
  gap: var(--espace-l);
}
```

## Le responsive, mobile d'abord

> [!definition] Mobile d'abord (mobile first)
> Écrire d'abord le CSS pour les petits écrans, puis ajouter des règles pour les écrans plus grands avec des media queries. Le site est ainsi plus léger et mieux adapté au téléphone.

```css
.hero h1 {
  font-size: 1.75rem;
}

@media (min-width: 768px) {
  .hero h1 {
    font-size: 2.5rem;
  }
}

@media (min-width: 1200px) {
  .hero h1 {
    font-size: 3.25rem;
  }
}
```

| Bonne pratique | Pourquoi |
| --- | --- |
| Balise viewport dans le `head` | Sans elle, le téléphone affiche la page en petit |
| Unités relatives (`rem`, `%`) | Le texte et les blocs s'adaptent |
| Points de rupture selon le **contenu** | On ajoute une règle quand le design « casse », pas seulement pour des tailles d'appareils |
| Zones tactiles d'au moins 44 pixels | Faciles à toucher avec le doigt |

## Images et accessibilité

| Point | Bonne pratique |
| --- | --- |
| **Format** | WebP ou AVIF quand c'est possible, JPEG pour les photos, SVG pour les icônes et logos |
| **Taille** | Images redimensionnées à la taille d'affichage |
| **Chargement différé** | `loading="lazy"` pour les images sous la ligne de flottaison |
| **Texte alternatif** | Description utile ; `alt=""` pour une image décorative |
| **Contraste** | Texte bien lisible sur le fond |
| **Focus visible** | On voit où l'on est quand on navigue au clavier |

> [!madagascar]
> Beaucoup d'internautes malgaches utilisent des **données mobiles coûteuses**. Des images bien compressées et un code léger rendent le site plus rapide et moins cher à consulter. Testez avec la simulation de connexion lente des outils du navigateur.

> [!retenir]
> - Un HTML sémantique : zones, titres dans l'ordre, liens et boutons corrects, images avec `alt`.
> - Des variables CSS reprises de la maquette.
> - Flexbox pour aligner, Grid pour les grilles.
> - Mobile d'abord avec des media queries placées selon le contenu.
> - Images légères, chargement différé, contraste et focus visible.

## Exercice pratique : une page de base

> [!exercice] Exercice pratique · 4 heures
> 1. Écrivez le HTML sémantique d'une page d'accueil de lodge (en-tête, héro, chambres, contact, pied de page).
> 2. Créez les variables CSS (couleurs, polices, espacements).
> 3. Mettez en page l'en-tête avec Flexbox et les chambres avec Grid.
> 4. Rendez la page responsive, mobile d'abord, et testez sur 3 tailles d'écran.
>
> **À livrer** : vos fichiers HTML et CSS et des captures sur 3 tailles d'écran.
