Au niveau Avancé, vous travaillez avec des outils qui accélèrent les professionnels : **WebStorm**, un éditeur complet, et **GitHub Copilot**, un assistant d'IA dans l'éditeur. Vous passez aussi à **TypeScript** et à **Next.js**, très demandés dans les offres. Ce module vous apprend à utiliser ces outils sans perdre la maîtrise de votre code.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Utiliser les fonctions avancées de WebStorm : refactorisation, débogage, inspections.
> 2. Utiliser GitHub Copilot de façon sûre et efficace.
> 3. Écrire des composants React en TypeScript.
> 4. Comprendre les bases de Next.js.
> 5. Gérer les données et l'état d'une application.

## WebStorm

> [!definition] WebStorm
> Un éditeur payant de JetBrains, spécialisé pour JavaScript et TypeScript. Il comprend la structure de votre projet et propose des outils intégrés de refactorisation, de débogage et de tests. Des licences gratuites existent pour les étudiants et certains projets libres : vérifiez les conditions sur le site officiel.

| Fonction | Utilité |
| --- | --- |
| **Refactorisation** | Renommer un composant ou extraire une fonction partout dans le projet, sans erreur |
| **Inspections** | Signale le code inutilisé, les erreurs de type, les mauvaises pratiques |
| **Débogueur** | Arrêter le code à une ligne, voir les valeurs des variables |
| **Lancement des tests** | Exécuter et relancer les tests depuis l'éditeur |
| **Intégration Git** | Voir les différences, résoudre les conflits visuellement |

> [!astuce]
> Apprenez 5 raccourcis par semaine. Dans WebStorm, « Rechercher partout » (deux fois Maj) et « Actions contextuelles » (Alt + Entrée) font gagner un temps considérable.

## GitHub Copilot

> [!definition] GitHub Copilot
> Un assistant d'IA payant (avec des offres gratuites limitées et des offres pour étudiants) qui propose du code pendant que vous écrivez, répond à des questions sur votre code dans une fenêtre de discussion, et peut aider à relire des modifications.

### Les bons usages

| Usage | Exemple |
| --- | --- |
| Code répétitif | Types TypeScript à partir d'un exemple de JSON, données de test |
| Tests | Proposer des cas de test pour une fonction existante |
| Explication | « Explique ce que fait ce hook » sur un code hérité |
| Documentation | Commentaires et README à partir du code |

### Les règles

1. **Comprenez chaque ligne** avant de l'accepter.
2. **Testez** le code proposé : il peut être faux, dépassé ou peu sûr.
3. **Ne collez jamais** de secrets (clés, mots de passe) dans la discussion.
4. **Vérifiez** que votre client autorise l'outil sur son code.
5. **Vérifiez les licences** si une proposition ressemble à un code existant connu.

> [!attention]
> Un développeur qui accepte sans comprendre devient incapable de corriger ses propres bugs. Les entretiens techniques testent votre compréhension, souvent sans assistant. Gardez l'habitude d'écrire vous-même les parties importantes.

## TypeScript

TypeScript ajoute des **types** à JavaScript : l'éditeur détecte beaucoup d'erreurs avant l'exécution.

```tsx
type Chambre = {
  id: number;
  nom: string;
  prix: number;
  capacite: number;
  vueMer: boolean;
};

type Props = {
  chambre: Chambre;
  onReserver: (id: number) => void;
};

export function CarteChambre({ chambre, onReserver }: Props) {
  return (
    <article className="carte">
      <h3>{chambre.nom}</h3>
      <p>{chambre.prix.toLocaleString('fr-FR')} Ar par nuit</p>
      <button onClick={() => onReserver(chambre.id)}>Réserver</button>
    </article>
  );
}
```

Si vous écrivez `chambre.pix` au lieu de `chambre.prix`, l'éditeur le signale immédiatement.

## Les bases de Next.js

> [!definition] Next.js
> Un framework construit sur React qui ajoute le routage par fichiers, le rendu côté serveur, la génération de pages statiques et l'optimisation des images. Il est très utilisé pour les sites qui doivent être rapides et bien référencés.

| Notion | Ce que c'est |
| --- | --- |
| **Routage par fichiers** | Un fichier `app/chambres/page.tsx` crée la page `/chambres` |
| **Composants serveur** | Des composants rendus sur le serveur, qui peuvent lire des données sans envoyer leur code au navigateur |
| **Composants client** | Des composants interactifs, marqués `'use client'` |
| **Images optimisées** | Le composant `Image` redimensionne et charge les images au bon moment |

```tsx
// app/chambres/page.tsx (composant serveur)
import { CarteChambreClient } from './CarteChambreClient';

export default async function PageChambres() {
  const res = await fetch('https://api.exemple.com/chambres', { next: { revalidate: 3600 } });
  const chambres = await res.json();
  return (
    <main>
      <h1>Nos chambres</h1>
      {chambres.map((c: any) => <CarteChambreClient key={c.id} chambre={c} />)}
    </main>
  );
}
```

## Les données et l'état

| Type d'état | Exemple | Outil courant |
| --- | --- | --- |
| **Local** | Un menu ouvert ou fermé | `useState` |
| **Partagé** | Le panier, l'utilisateur connecté | Contexte React ou une bibliothèque légère de gestion d'état |
| **Données du serveur** | Liste des produits, commandes | Une bibliothèque de requêtes avec cache (par exemple TanStack Query) |
| **Formulaires** | Champs, erreurs, envoi | Une bibliothèque de formulaires ou l'état local |
| **URL** | Filtres, page courante | Paramètres de l'adresse |

> [!astuce]
> Mettez les filtres et la pagination dans l'**URL** : l'utilisateur peut partager le lien, utiliser le bouton « retour » et retrouver exactement la même page.

> [!madagascar]
> Pour les utilisateurs avec une connexion lente ou instable, prévoyez toujours trois états visibles : **chargement**, **erreur avec bouton « Réessayer »**, et **résultat**. Mettez aussi les données en cache quand c'est possible : une page déjà visitée doit se réafficher sans attendre le réseau.

> [!retenir]
> - WebStorm : refactorisation, inspections, débogueur, tests et Git intégrés.
> - Copilot : utile pour le répétitif et les tests, à condition de comprendre et tester chaque ligne.
> - TypeScript détecte les erreurs avant l'exécution.
> - Next.js : routage par fichiers, composants serveur et client, images optimisées.
> - Choisissez l'outil d'état selon le type de données.

## Exercice pratique : passer au niveau professionnel

> [!exercice] Exercice pratique · 4 heures
> 1. Installez WebStorm (version d'essai ou licence étudiante) et apprenez 10 raccourcis.
> 2. Convertissez votre projet Villa Ravinala en TypeScript.
> 3. Recréez la liste des chambres dans un projet Next.js avec un composant serveur et un composant client.
> 4. Mettez le filtre « vue sur la mer » dans l'URL.
> 5. Utilisez Copilot (ou un autre assistant autorisé) pour proposer des tests, et notez ce que vous avez dû corriger.
>
> **À livrer** : le lien du dépôt, une capture du débogueur et votre note sur les corrections apportées aux propositions de l'IA.
