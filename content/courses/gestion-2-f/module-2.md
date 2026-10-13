Ce module vous donne les bases du gestionnaire de catalogue : construire un fichier produits propre, nommer les SKU, gérer les variantes, maîtriser les fonctions essentielles du tableur, organiser les images et contrôler la qualité des données.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Construire un fichier produits avec une ligne par variante.
> 2. Créer une règle de nommage des SKU.
> 3. Utiliser les fonctions essentielles du tableur.
> 4. Nommer et organiser les images.
> 5. Contrôler la qualité des données.

## Le fichier produits

Dans la plupart des outils e-commerce, le fichier d'import contient **une ligne par variante**, regroupées par produit.

| Identifiant produit | Titre | Option 1 | Option 2 | SKU | Prix | Stock |
| --- | --- | --- | --- | --- | --- | --- |
| robe-lamba | Robe portefeuille en lamba | Indigo | S | RB-LAMBA-IND-S | 120000 | 5 |
| robe-lamba | | Indigo | M | RB-LAMBA-IND-M | 120000 | 12 |
| robe-lamba | | Rouge | S | RB-LAMBA-ROU-S | 120000 | 3 |
| robe-lamba | | Rouge | M | RB-LAMBA-ROU-M | 120000 | 0 |

> [!attention]
> Dans un fichier d'import, les **prix s'écrivent sans espace ni unité** (120000, pas « 120 000 Ar »), selon le format demandé par l'outil. Une seule cellule mal formatée peut faire échouer l'import ou créer un prix faux.

## La règle de nommage des SKU

| Partie | Signification | Exemple |
| --- | --- | --- |
| Type | Catégorie du produit | RB (robe) |
| Modèle | Nom court du modèle | LAMBA |
| Couleur | Code couleur | IND (indigo) |
| Taille | Taille | M |

**Résultat** : RB-LAMBA-IND-M

### Les bonnes pratiques

1. **Une règle écrite** et partagée avec le client.
2. **Lettres majuscules, chiffres et tirets** seulement (pas d'accents, pas d'espaces).
3. **Un SKU unique** par variante, jamais réutilisé.
4. **Ne jamais changer** un SKU existant sans accord : il peut être lié au stock, à la comptabilité ou à un entrepôt.

## Les fonctions essentielles du tableur

| Fonction | Usage | Exemple |
| --- | --- | --- |
| `CONCATENER` ou `&` | Construire un SKU ou un titre | `=A2&"-"&B2&"-"&C2` |
| `RECHERCHEV` ou `RECHERCHEX` | Récupérer une information dans un autre tableau | Le prix fournisseur à partir du SKU |
| `NB.SI` | Repérer les doublons | `=NB.SI(E:E;E2)>1` |
| `SI` | Appliquer une condition | Prix soldé si la collection est « Soldes » |
| `SUPPRESPACE` | Retirer les espaces en trop | Nettoyer des noms copiés |
| `MAJUSCULE` | Mettre en majuscules | Uniformiser les SKU |
| **Filtres et tri** | Trouver les lignes à problème | Produits sans prix |
| **Mise en forme conditionnelle** | Colorer les erreurs | Stock négatif en rouge |

> [!astuce]
> Les noms des fonctions et le séparateur (« ; » ou « , ») dépendent de la **langue du tableur**. Si une formule ne fonctionne pas, vérifiez d'abord ces deux points.

## Organiser les images

| Règle | Exemple |
| --- | --- |
| **Nom du fichier** basé sur le SKU | rb-lamba-ind-1.jpg, rb-lamba-ind-2.jpg |
| **Ordre** | 1 : face ; 2 : dos ; 3 : détail ; 4 : porté |
| **Format et poids** | JPEG ou WebP, poids raisonnable, même format carré pour toute la boutique |
| **Texte alternatif** | « Robe portefeuille en lamba bleu indigo, vue de face » |
| **Dossiers** | Un dossier par collection |

## Contrôler la qualité des données

| Contrôle | Comment le faire |
| --- | --- |
| SKU en double | `NB.SI` et mise en forme conditionnelle |
| Prix manquants ou à zéro | Filtre sur la colonne Prix |
| Prix barré inférieur au prix de vente | Formule de comparaison |
| Poids manquant | Filtre (le poids sert au calcul de la livraison) |
| Produits sans image | Filtre sur la colonne Images |
| Fautes dans les options | « Indigo », « indigo » et « Indigo » comptent comme 3 valeurs différentes |
| Stock négatif | Mise en forme conditionnelle |

> [!madagascar]
> Les fournisseurs malgaches envoient souvent leurs listes de produits sous des formes très variées (photos de cahiers, messages WhatsApp, tableurs incomplets). Votre première tâche sera souvent de **transformer ces informations en un fichier propre** : c'est une compétence très appréciée.

> [!retenir]
> - Une ligne par variante, avec des valeurs au format de l'outil.
> - Une règle de SKU écrite, unique, sans accents ni espaces.
> - Concaténer, rechercher, compter, nettoyer, filtrer, colorer.
> - Des images nommées, ordonnées, légères, avec texte alternatif.
> - Un contrôle qualité systématique avant chaque import.

## Exercice pratique : un fichier produits propre

> [!exercice] Exercice pratique · 2 heures 30
> 1. Créez un fichier pour 8 produits avec 2 options chacun (au moins 30 lignes de variantes).
> 2. Générez les SKU automatiquement avec une formule.
> 3. Ajoutez 5 erreurs volontaires (doublon, prix vide, stock négatif…) et les contrôles qui les détectent.
> 4. Rédigez votre règle de nommage des SKU et des images.
>
> **À livrer** : le lien de votre fichier et votre règle de nommage.
