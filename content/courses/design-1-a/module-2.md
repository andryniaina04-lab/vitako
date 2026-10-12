Au niveau Avancé, vous travaillez avec les fonctions professionnelles de **Figma (offre payante)** : bibliothèques partagées, variables, modes, mode développeur, et avec **Framer** pour publier de vrais sites. Ce module vous apprend à construire des fichiers qui tiennent dans le temps et dans une équipe.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Utiliser les variables et les modes de Figma.
> 2. Construire des composants avancés avec propriétés.
> 3. Publier et maintenir une bibliothèque d'équipe.
> 4. Préparer la livraison avec le mode développeur.
> 5. Publier un site avec Framer.

## Ce qu'apporte l'offre payante de Figma

| Fonction | Utilité |
| --- | --- |
| **Bibliothèques d'équipe** | Partager composants, styles et variables entre fichiers |
| **Projets et fichiers illimités** | Organiser le travail de plusieurs clients |
| **Historique des versions plus long** | Revenir à une version validée |
| **Mode développeur** (selon l'offre) | Les développeurs inspectent les mesures, le code et les ressources |
| **Modes de variables plus nombreux** | Thèmes, langues, marques |

*(Les offres et les fonctions incluses changent : vérifiez sur le site officiel de Figma.)*

## Les variables et les modes

> [!definition] Variables
> Des valeurs enregistrées et réutilisables : couleurs, espacements, tailles, textes. Elles peuvent avoir plusieurs **modes** (par exemple clair et sombre) : on change de mode, et tout l'écran s'adapte.

### L'organisation en 2 niveaux

| Niveau | Exemple | Rôle |
| --- | --- | --- |
| **Primitives** | `vert/600 = #1F6F50`, `gris/100 = #F3F4F6` | Toutes les valeurs disponibles |
| **Sémantiques** | `fond/principal`, `texte/secondaire`, `action/principale` | Le sens d'usage, relié à une primitive |

| Variable sémantique | Mode clair | Mode sombre |
| --- | --- | --- |
| `fond/principal` | gris/50 | gris/900 |
| `texte/principal` | gris/900 | gris/50 |
| `action/principale` | vert/600 | vert/400 |

> [!astuce]
> Les composants utilisent **seulement les variables sémantiques**. Si la marque change de vert, vous modifiez une primitive, et tout le produit suit sans toucher aux écrans.

> [!madagascar]
> Utilisez aussi les modes pour les **langues** : un mode français et un mode malgache pour les textes courts (boutons, titres). Vous voyez immédiatement si un libellé malgache, souvent plus long, casse la mise en page.

## Les composants avancés

| Propriété de composant | Exemple |
| --- | --- |
| **Variante** | Type : principal, secondaire, danger |
| **Booléenne** | Afficher une icône : oui ou non |
| **Texte** | Libellé du bouton modifiable sans détacher |
| **Échange d'instance** | Choisir l'icône dans la bibliothèque |

### Les règles

1. **Un composant = un usage clair**, avec une description.
2. **Auto-layout partout**, pour que le composant s'adapte au contenu.
3. **Tous les états** : normal, survol, focus, désactivé, chargement, erreur.
4. **Pas de détachement** : si une instance doit être détachée, le composant est incomplet.

## Publier et maintenir une bibliothèque

1. **Créez** un fichier dédié « Bibliothèque » séparé des projets.
2. **Publiez** les composants, styles et variables.
3. **Rédigez** un journal des modifications à chaque publication (« v1.4 : ajout du champ de recherche, correction du contraste du bouton secondaire »).
4. **Prévenez** l'équipe des changements importants.
5. **Vérifiez** l'utilisation : les composants peu utilisés ou souvent détachés doivent être améliorés.

## Le mode développeur et la livraison

| Élément à préparer | Pourquoi |
| --- | --- |
| **Sections prêtes pour le développement** | Le développeur sait quels écrans sont validés |
| **Noms de calques et composants clairs** | Il retrouve les éléments dans le code |
| **Annotations** des comportements | Clic, chargement, erreur, animations |
| **Variables nommées comme dans le code** | `action/principale` correspond à une variable CSS |
| **Ressources exportables** | Icônes en SVG, images optimisées |

> [!attention]
> Le code proposé par le mode développeur est une **aide**, pas un code à copier tel quel. Le développeur choisit la meilleure façon de l'écrire dans son projet. Votre rôle est d'être clair sur l'intention.

## Framer : publier un vrai site

> [!definition] Framer
> Un outil payant (avec une offre gratuite limitée) qui permet de concevoir et publier des sites web réactifs, animés, avec un gestionnaire de contenu, sans coder. On peut y coller des éléments copiés depuis Figma.

### Le flux de travail

1. **Concevez** la page (dans Figma ou directement dans Framer).
2. **Construisez** les sections avec des piles (équivalent de l'auto-layout).
3. **Réglez** les points de rupture : ordinateur, tablette, téléphone.
4. **Ajoutez** les animations avec modération.
5. **Configurez** le référencement : titre, description, image de partage.
6. **Publiez** sur un domaine personnalisé (offre payante du client).

> [!madagascar]
> Les abonnements Figma et Framer sont facturés en dollars. La pratique courante : le client paie son espace et son site, et vous invite comme collaborateur. Vérifiez les prix à jour sur les sites officiels, et les offres pour étudiants si vous êtes encore en formation.

> [!retenir]
> - Variables primitives et sémantiques, avec des modes (thèmes, langues).
> - Des composants avec propriétés, auto-layout et tous les états.
> - Une bibliothèque publiée, versionnée et suivie.
> - Une livraison claire avec le mode développeur, sans imposer le code.
> - Framer pour publier des sites sans coder.

## Exercice pratique : votre bibliothèque professionnelle

> [!exercice] Exercice pratique · 4 heures
> 1. Créez les variables primitives et sémantiques d'une marque, avec un mode clair et un mode sombre.
> 2. Créez 6 composants avec propriétés et tous leurs états : bouton, champ, case à cocher, carte, onglets, alerte.
> 3. Publiez la bibliothèque (ou simulez-la dans un fichier dédié) avec un journal des modifications.
> 4. Construisez 3 écrans avec cette bibliothèque, en clair et en sombre.
> 5. Publiez une page de présentation simple avec Framer (offre gratuite).
>
> **À livrer** : le lien de votre bibliothèque, vos 3 écrans et le lien de votre page Framer.
