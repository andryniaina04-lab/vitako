Dans ce module, vous réalisez un projet complet de développeur front-end : intégrer la maquette du site d'une maison d'hôtes, le rendre adaptatif, afficher les chambres depuis un fichier de données, ajouter un formulaire de réservation, vérifier la qualité et le mettre en ligne.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Analyser une maquette et la découper en composants.
> 2. Construire les composants avec React.
> 3. Charger et afficher des données.
> 4. Gérer un formulaire avec vérification des champs.
> 5. Contrôler la qualité et mettre le site en ligne.

## Le cas pratique : « Villa Ravinala »

> [!exemple] Votre client
> **Villa Ravinala** est une maison d'hôtes de 6 chambres à Nosy Be. La designer de l'agence a préparé une maquette Figma (version téléphone et version ordinateur). On vous demande de développer le site : page d'accueil, liste des chambres avec filtre, formulaire de demande de réservation. Le formulaire envoie les demandes à un service déjà en place, développé par l'équipe back-end.

## Étape 1 : analyser la maquette

1. **Relevez les styles** : couleurs, polices, tailles de texte, espacements, arrondis.
2. **Repérez les éléments répétés** : ce seront vos composants.
3. **Comparez** la version téléphone et la version ordinateur : qu'est-ce qui change ?
4. **Listez vos questions** pour la designer (états au survol, messages d'erreur, page vide).

### Le découpage en composants

| Composant | Où il apparaît | Props |
| --- | --- | --- |
| `EnTete` | Toutes les pages | — |
| `Hero` | Accueil | `titre`, `image` |
| `CarteChambre` | Liste des chambres | `nom`, `prix`, `capacite`, `photo` |
| `FiltreChambres` | Liste des chambres | `valeur`, `onChange` |
| `FormulaireReservation` | Page réservation | — |
| `PiedDePage` | Toutes les pages | — |

> [!astuce]
> Placez les couleurs et les espacements de la maquette dans des **variables CSS** au début de votre feuille de style. Si la designer change une couleur, vous ne la modifiez qu'à un seul endroit.

```css
:root {
  --vert: #1f6f50;
  --sable: #f5ead7;
  --texte: #1f2937;
  --arrondi: 12px;
  --espace: 16px;
}
```

## Étape 2 : les données des chambres

```json
[
  { "id": 1, "nom": "Chambre Baobab", "prix": 180000, "capacite": 2, "vueMer": true, "photo": "baobab.jpg" },
  { "id": 2, "nom": "Chambre Ylang", "prix": 150000, "capacite": 2, "vueMer": false, "photo": "ylang.jpg" },
  { "id": 3, "nom": "Suite Lémurien", "prix": 260000, "capacite": 4, "vueMer": true, "photo": "lemurien.jpg" }
]
```

### Afficher et filtrer

```jsx
import { useEffect, useState } from 'react';

export default function ListeChambres() {
  const [chambres, setChambres] = useState([]);
  const [vueMerSeulement, setVueMerSeulement] = useState(false);
  const [erreur, setErreur] = useState('');

  useEffect(() => {
    fetch('/chambres.json')
      .then(r => r.json())
      .then(setChambres)
      .catch(() => setErreur('Impossible de charger les chambres.'));
  }, []);

  const visibles = vueMerSeulement ? chambres.filter(c => c.vueMer) : chambres;

  if (erreur) return <p role="alert">{erreur}</p>;
  return (
    <section>
      <label>
        <input type="checkbox" checked={vueMerSeulement}
               onChange={e => setVueMerSeulement(e.target.checked)} />
        Vue sur la mer uniquement
      </label>
      <div className="grille">
        {visibles.map(c => <CarteChambre key={c.id} {...c} />)}
      </div>
    </section>
  );
}
```

> [!definition] API
> Une adresse qu'un programme appelle pour obtenir ou envoyer des données. Ici, le fichier `chambres.json` joue le rôle d'une API simple ; dans un vrai projet, l'équipe back-end vous donne l'adresse et le format des données.

## Étape 3 : le formulaire de réservation

### Les champs

Nom, e-mail, téléphone, chambre, date d'arrivée, date de départ, nombre de personnes, message.

### Les règles de vérification

| Champ | Règle | Message d'erreur |
| --- | --- | --- |
| Nom | Obligatoire | « Indiquez votre nom. » |
| E-mail | Format valide | « Adresse e-mail invalide. » |
| Dates | Départ après l'arrivée | « La date de départ doit être après la date d'arrivée. » |
| Personnes | Pas plus que la capacité de la chambre | « Cette chambre accueille 2 personnes au maximum. » |

### Les 4 états d'un envoi

1. **Saisie** : l'utilisateur remplit le formulaire.
2. **Envoi en cours** : le bouton est désactivé et affiche « Envoi… ».
3. **Succès** : message de confirmation clair.
4. **Erreur** : message compréhensible, données conservées, possibilité de réessayer.

> [!attention]
> Un formulaire qui efface tout en cas d'erreur réseau fait fuir les clients. Gardez toujours les données saisies et proposez de réessayer, surtout pour des visiteurs qui ont une connexion instable.

## Étape 4 : contrôler la qualité

### La liste de contrôle

| Domaine | Vérification |
| --- | --- |
| **Fidélité** | Couleurs, polices, espacements conformes à la maquette |
| **Adaptatif** | Affichage correct à 360 px, 768 px et 1280 px de large |
| **Navigateurs** | Testé sur Chrome et Firefox (et Safari si possible) |
| **Accessibilité** | Textes `alt`, `label` sur les champs, navigation au clavier, contraste suffisant |
| **Performance** | Images compressées et redimensionnées, page testée avec Lighthouse |
| **Erreurs** | Aucune erreur dans la console |
| **Contenu** | Pas de faute, liens qui fonctionnent |

> [!definition] Lighthouse
> Un outil intégré à Chrome (onglet Lighthouse des outils de développement) qui note une page sur la performance, l'accessibilité, les bonnes pratiques et le référencement, et donne des conseils pour l'améliorer.

## Étape 5 : mettre en ligne et livrer

1. **Construisez** la version de production : `npm run build`.
2. **Déployez** sur un hébergeur gratuit pour la démonstration (Vercel, Netlify ou GitHub Pages).
3. **Envoyez** au client le lien de démonstration et la liste des points à valider.
4. **Corrigez** selon les retours (le nombre d'allers-retours est fixé dans le devis).
5. **Livrez** : dépôt Git à jour, README avec les instructions, accès transférés.

> [!madagascar]
> Testez votre site avec le **mode appareil** du navigateur réglé sur une connexion lente (« 3G lente »). C'est ce que vivront de nombreux visiteurs à Madagascar, et beaucoup de touristes qui consultent le site depuis leur téléphone en voyage.

> [!retenir]
> - Analysez la maquette et découpez-la en composants avant de coder.
> - Variables CSS pour les couleurs et espacements de la maquette.
> - Chargez les données avec `fetch`, gérez le chargement et les erreurs.
> - Un formulaire vérifie les champs et gère 4 états.
> - Contrôle qualité, déploiement, puis livraison documentée.

## Exercice pratique : le site de Villa Ravinala

> [!exercice] Exercice pratique · 6 heures
> 1. Dessinez (ou trouvez une maquette gratuite) les pages accueil, chambres et réservation, en version téléphone et ordinateur.
> 2. Découpez-les en composants et créez le projet React.
> 3. Affichez 6 chambres depuis un fichier JSON, avec un filtre.
> 4. Construisez le formulaire avec les 4 règles de vérification et les 4 états (simulez l'envoi avec un délai).
> 5. Passez la liste de contrôle qualité et faites un rapport Lighthouse.
> 6. Déployez le site et écrivez le README.
>
> **À livrer** : le lien du site, le lien du dépôt et votre rapport Lighthouse. C'est votre projet de portfolio.
