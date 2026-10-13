Dans ce module, vous intégrez un site complet à partir d'une maquette, comme le ferait un intégrateur pour une agence. Vous apprendrez à découper la maquette, à coder des composants réutilisables, à gérer les cas non prévus, à contrôler la qualité et à livrer un code propre et en ligne.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Découper une maquette en composants et en étapes.
> 2. Coder des composants réutilisables avec leurs états.
> 3. Gérer les contenus réels et les cas non prévus.
> 4. Contrôler la qualité avec une liste de vérification.
> 5. Mettre en ligne et livrer.

## Le cas pratique : « Lodge Tsara »

> [!exemple] Votre client
> Une agence web d'Antananarivo vous confie l'intégration du site du **Lodge Tsara** à Nosy Be. Le designer a livré une maquette Figma de 4 pages (accueil, chambres, activités, contact) en version mobile et ordinateur. Le site sera en français et en anglais. Délai : 2 semaines.

## Étape 1 : découper la maquette

| Composants | Pages concernées |
| --- | --- |
| En-tête avec menu (et menu mobile) | Toutes |
| Héro (grande image + titre + bouton) | Accueil, Chambres, Activités |
| Carte de chambre | Accueil, Chambres |
| Carte d'activité | Accueil, Activités |
| Bloc témoignage | Accueil |
| Formulaire de contact | Contact |
| Pied de page | Toutes |

### Le planning

| Jours | Travail |
| --- | --- |
| 1 | Structure du projet, variables, typographie, en-tête et pied de page |
| 2-3 | Composants : héro, cartes, témoignage, boutons et leurs états |
| 4-6 | Pages accueil et chambres |
| 7-8 | Pages activités et contact, formulaire |
| 9 | Version anglaise, textes longs, cas limites |
| 10 | Contrôle qualité, corrections, mise en ligne, livraison |

## Étape 2 : des composants réutilisables

```html
<article class="carte-chambre">
  <img src="img/bungalow-mer.webp" alt="Bungalow vue mer avec terrasse en bois" loading="lazy" width="600" height="400">
  <div class="carte-chambre__contenu">
    <h3 class="carte-chambre__titre">Bungalow vue mer</h3>
    <p class="carte-chambre__texte">Lit double, terrasse privée, à 20 mètres de la plage.</p>
    <a class="btn" href="contact.html">Demander un devis</a>
  </div>
</article>
```

> [!definition] Convention BEM
> Une façon de nommer les classes : le **bloc** (`carte-chambre`), ses **éléments** (`carte-chambre__titre`) et ses **variantes** (`carte-chambre--mise-en-avant`). Le CSS reste lisible et évite les conflits.

### Les états à coder

| Élément | États |
| --- | --- |
| **Bouton** | Normal, survol, focus clavier, actif, désactivé |
| **Lien** | Normal, survol, focus, visité si nécessaire |
| **Champ de formulaire** | Vide, rempli, focus, erreur, succès |
| **Menu mobile** | Fermé, ouvert |

## Étape 3 : les contenus réels et les cas limites

| Cas | Solution |
| --- | --- |
| **Titre beaucoup plus long** (version anglaise) | Le texte passe à la ligne sans casser la carte |
| **Image manquante ou de proportion différente** | `object-fit: cover` et proportions fixées |
| **Écran très petit** (320 pixels) | Vérifier qu'aucun élément ne dépasse |
| **Écran très large** | Largeur maximale du contenu |
| **Texte agrandi par l'utilisateur** | Unités relatives, pas de hauteurs fixes |

> [!madagascar]
> Testez aussi avec des **noms et textes malgaches** (souvent plus longs) si le site doit en contenir. Les mots longs comme « Antananarivo » ou « fanatanjahantena » peuvent dépasser des boutons ou des colonnes étroites.

## Étape 4 : le contrôle qualité

| N° | Vérification |
| --- | --- |
| 1 | Fidélité à la maquette (couleurs, polices, espacements) sur mobile et ordinateur |
| 2 | Toutes les tailles d'écran de 320 pixels à grand écran |
| 3 | Navigateurs : Chrome, Firefox, Safari si possible |
| 4 | Navigation complète au clavier, focus visible |
| 5 | Textes alternatifs, titres dans l'ordre, contrastes |
| 6 | Note Lighthouse (performance, accessibilité) |
| 7 | Validation du HTML (validateur du W3C) |
| 8 | Liens et formulaire fonctionnels |
| 9 | Version anglaise complète |
| 10 | Test sur un vrai téléphone |

> [!attention]
> Comparez votre page et la maquette **côte à côte**, à la même largeur. Les petites différences d'espacement sont celles que les designers remarquent en premier.

## Étape 5 : mettre en ligne et livrer

| Livrable | Contenu |
| --- | --- |
| **Code source** | Dépôt Git propre, avec un fichier README |
| **Version en ligne** | Hébergement statique (GitHub Pages, Netlify ou celui de l'agence) |
| **README** | Structure des dossiers, variables, composants, comment modifier un texte |
| **Rapport de tests** | Navigateurs, appareils, notes Lighthouse |
| **Points ouverts** | Questions au designer, éléments non fournis |

> [!retenir]
> - Découper la maquette en composants et planifier par étapes.
> - Composants avec convention BEM et tous leurs états.
> - Gérer textes longs, images différentes, petits et grands écrans, texte agrandi.
> - Une liste de contrôle en 10 points et une comparaison côte à côte.
> - Un dépôt propre, une version en ligne et un README.

## Exercice pratique : le site du Lodge Tsara

> [!exercice] Exercice pratique · 14 heures (sur plusieurs jours)
> 1. Choisissez une maquette Figma gratuite de site vitrine de 3 ou 4 pages.
> 2. Découpez-la en composants et faites votre planning.
> 3. Intégrez toutes les pages, mobile d'abord, avec les états.
> 4. Testez avec la liste de contrôle en 10 points.
> 5. Mettez le site en ligne et rédigez le README.
>
> **À livrer** : le lien du site en ligne, le dépôt GitHub, le README et le rapport de tests. C'est votre projet de portfolio.
