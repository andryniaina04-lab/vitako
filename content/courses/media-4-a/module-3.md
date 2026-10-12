Les diffuseurs et les plateformes rejettent des fichiers entiers pour quelques sous-titres trop rapides ou mal synchronisés. Ce module vous donne les **normes techniques** des professionnels, les règles des **sous-titres pour sourds et malentendants**, et une **liste de contrôle qualité** pour livrer du premier coup.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Appliquer les normes de durée, de vitesse et de longueur.
> 2. Synchroniser avec la voix et les changements de plan.
> 3. Rédiger des sous-titres pour sourds et malentendants.
> 4. Respecter la typographie française dans les sous-titres.
> 5. Contrôler un fichier complet avant livraison.

## Les normes techniques

| Paramètre | Valeur courante | Pourquoi |
| --- | --- | --- |
| **Lignes par sous-titre** | 2 au maximum | Laisser voir l'image |
| **Caractères par ligne** | 37 à 42 selon les guides | Lire d'un seul coup d'œil |
| **Vitesse de lecture** | Souvent 15 à 20 caractères par seconde selon le public et le guide | Laisser le temps de lire |
| **Durée minimale** | Environ 1 seconde (souvent 5/6 de seconde) | Éviter les clignotements |
| **Durée maximale** | Environ 6 à 7 secondes | Ne pas laisser un texte trop longtemps |
| **Écart entre deux sous-titres** | Quelques images (souvent 2) | Que l'œil voie le changement |

*(Valeurs données en exemple : chaque client ou plateforme a son guide de style, qui passe avant ces repères.)*

> [!definition] Caractères par seconde (CPS)
> Le nombre de caractères du sous-titre (espaces compris) divisé par sa durée en secondes. Un sous-titre de 60 caractères affiché 3 secondes a une vitesse de 20 CPS.

## La synchronisation

### Les règles

1. **Entrée** : au début de la voix (ou très légèrement avant).
2. **Sortie** : à la fin de la voix, prolongée si nécessaire pour la lecture, sans dépasser les normes.
3. **Changements de plan** : caler l'entrée ou la sortie sur la coupe, ou s'en écarter d'au moins une demi-seconde environ.
4. **Dialogues rapides** : regrouper deux répliques courtes dans un même sous-titre, avec un tiret par intervenant.

```
00:04:12,320 --> 00:04:14,100
- Tu viens au marché ?
- Pas aujourd'hui.
```

> [!astuce]
> Affichez la **forme d'onde** et les **changements de plan** dans Subtitle Edit : vous voyez où commence la voix et où coupe l'image, et vous synchronisez beaucoup plus vite qu'à l'oreille.

## Les sous-titres pour sourds et malentendants (SME)

### Ce qu'il faut ajouter

| Élément | Exemple |
| --- | --- |
| **Intervenant hors champ ou non identifiable** | `RAKOTO : On part demain.` |
| **Sons importants** | `[pluie battante]`, `[coup de feu]`, `[téléphone vibre]` |
| **Musique** | `[musique douce]` ou `♪ paroles de la chanson ♪` |
| **Ton de la voix** | `[en chuchotant] Ne dis rien.` |
| **Langue étrangère** | `[en malgache]` puis la traduction, si le spectateur doit la comprendre |

### Les règles

1. Décrivez les sons **utiles à la compréhension**, pas tous les bruits.
2. Utilisez une **forme cohérente** (crochets, majuscules ou couleurs selon le guide).
3. Ne décrivez pas ce que l'image montre déjà clairement.
4. Suivez la **convention du pays** : en France, certaines chaînes utilisent des couleurs pour les intervenants et les sons ; d'autres guides utilisent des crochets.

> [!madagascar]
> Pour un documentaire tourné à Madagascar, prévoyez dans le glossaire les noms de lieux, d'espèces (lémuriens, baobabs), de fêtes (famadihana) et d'objets, avec leur orthographe et, si nécessaire, une courte explication validée par le client. Un sous-titre n'est pas une note de bas de page : l'explication doit rester très courte ou passer par une autre solution choisie avec le client.

## La typographie française

| Règle | Exemple |
| --- | --- |
| Espace avant `? ! : ;` (souvent insécable, ou selon le guide) | « Tu viens ? » |
| Guillemets français | « Bonjour » |
| Points de suspension en un seul caractère ou trois points, selon le guide | « Je pensais… » |
| Majuscules accentuées | « À demain », « État » |
| Pas de point en fin de sous-titre si la phrase continue | Ligne suivante sans majuscule |
| Nombres | Suivre le guide (souvent en lettres de un à dix) |

## La liste de contrôle qualité

| N° | Vérification |
| --- | --- |
| 1 | Tout le texte relu en regardant la vidéo |
| 2 | Aucun sous-titre au-dessus de la vitesse maximale |
| 3 | Aucune ligne trop longue, pas plus de 2 lignes |
| 4 | Durées minimales et maximales respectées |
| 5 | Aucun chevauchement entre sous-titres |
| 6 | Changements de plan respectés |
| 7 | Noms propres conformes au glossaire |
| 8 | Typographie et ponctuation conformes |
| 9 | Textes à l'écran importants traduits (panneaux, titres) si demandé |
| 10 | Bon format, bon encodage (UTF-8), bonne cadence d'images |

> [!attention]
> Les vérifications automatiques de Subtitle Edit ne remplacent pas un **visionnage complet**. Elles trouvent les problèmes techniques, pas les contresens ni les sous-titres mal placés sur une incrustation à l'écran.

> [!retenir]
> - 2 lignes, longueur et vitesse limitées, durées minimales et maximales.
> - Synchronisation sur la voix et sur les changements de plan.
> - SME : intervenants, sons utiles, musique, ton, langues.
> - Typographie française soignée, selon le guide du client.
> - Une liste de contrôle en 10 points et un visionnage complet avant livraison.

## Exercice pratique : un fichier conforme

> [!exercice] Exercice pratique · 3 heures
> 1. Sous-titrez 5 minutes d'un film ou d'un documentaire libre de droits en respectant les normes du tableau.
> 2. Créez une version SME de ces 5 minutes.
> 3. Calculez la vitesse de lecture de 5 sous-titres à la main et vérifiez avec Subtitle Edit.
> 4. Appliquez la liste de contrôle en 10 points et corrigez.
>
> **À livrer** : vos deux fichiers, vos calculs et votre liste de contrôle remplie.
