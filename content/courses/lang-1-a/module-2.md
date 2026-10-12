Les agences de traduction travaillent presque toutes avec des outils de TAO professionnels, surtout **Trados Studio** et **memoQ**. Elles vous enverront des **paquets de projet** à ouvrir, traduire et renvoyer. Ce module vous apprend à les utiliser, à lire une analyse de projet, et à utiliser **DeepL Pro** de façon professionnelle.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Ouvrir, traduire et renvoyer un paquet de projet d'agence.
> 2. Utiliser mémoires de traduction et bases terminologiques dans Trados Studio et memoQ.
> 3. Lire une analyse de projet et comprendre les correspondances.
> 4. Lancer les contrôles qualité intégrés.
> 5. Utiliser DeepL Pro avec des glossaires, dans le respect de la confidentialité.

## Trados Studio et memoQ : le panorama

| Point | **Trados Studio** | **memoQ** |
| --- | --- | --- |
| Usage | Très répandu dans les agences, notamment en Europe | Très répandu aussi, apprécié pour sa terminologie et sa flexibilité |
| Paquets de projet | Paquets propres à Trados (envoi et retour) | Paquets propres à memoQ, et projets en ligne |
| Terminologie | Bases terminologiques (MultiTerm) | Bases terminologiques intégrées |
| Format d'échange | XLIFF (format standard), compatible avec d'autres outils dans une certaine mesure | XLIFF également |

> [!definition] XLIFF
> Un format de fichier standard pour les textes à traduire : chaque segment source y est stocké avec sa traduction. La plupart des outils de TAO savent l'ouvrir, ce qui permet de travailler avec des clients qui n'utilisent pas le même logiciel.

Les licences de ces logiciels sont payantes (achat ou abonnement selon les offres) : vérifiez les conditions sur les sites officiels. Les deux éditeurs proposent des **versions d'essai**, et certaines agences vous donnent un accès à leur outil en ligne.

## Le paquet de projet : du début à la fin

### Le circuit

1. **L'agence prépare** le projet : documents, mémoire de traduction, base terminologique, consignes.
2. **Elle vous envoie un paquet** (un seul fichier).
3. **Vous l'ouvrez** dans votre logiciel : tout est configuré automatiquement.
4. **Vous traduisez** en utilisant la mémoire et la terminologie.
5. **Vous lancez les contrôles qualité** et corrigez.
6. **Vous créez le paquet de retour** et l'envoyez à l'agence.

> [!attention]
> Ne modifiez **pas** les réglages du projet (langues, mémoires, filtres) sans l'accord de l'agence, et renvoyez **toujours** un paquet de retour, pas seulement le document traduit : l'agence doit mettre à jour sa mémoire.

### Les bons réflexes pendant la traduction

1. **Regardez le pourcentage de correspondance** de chaque proposition de la mémoire.
2. **Vérifiez les correspondances à 100 %** dans leur contexte : une phrase identique peut demander une traduction différente selon le document (sauf consigne contraire de l'agence).
3. **Utilisez la terminologie** proposée : l'outil signale les termes de la base dans chaque segment.
4. **Confirmez** chaque segment pour qu'il entre dans la mémoire.
5. **Respectez les balises** (mise en forme, variables, liens).

## Lire une analyse de projet

L'agence vous envoie souvent une **analyse** avec la commande. Elle montre combien de mots sont déjà dans la mémoire, et à quel point.

| Catégorie | Signification | Mots (exemple) |
| --- | --- | --- |
| **Contexte / 101 %** | Phrase identique, dans le même contexte | 400 |
| **100 %** | Phrase identique déjà traduite | 1 200 |
| **Répétitions** | Phrases qui se répètent dans le document | 600 |
| **95 – 99 %** | Presque identique (ponctuation, un chiffre) | 300 |
| **85 – 94 %** | Assez proche | 500 |
| **75 – 84 %** | Partiellement proche | 400 |
| **Pas de correspondance** | Nouveau texte | 4 600 |
| **Total** | | **8 000** |

> [!definition] Correspondance partielle (fuzzy match)
> Une phrase de la mémoire qui ressemble à la nouvelle phrase, sans être identique. Plus le pourcentage est élevé, moins il y a à modifier.

Beaucoup d'agences paient les répétitions et les correspondances **moins cher** que les mots nouveaux, selon une **grille de pondération**. Le module 4 vous apprend à négocier cette grille.

## Les contrôles qualité intégrés

Avant chaque livraison, lancez les vérifications automatiques de l'outil.

| Contrôle | Ce qu'il détecte |
| --- | --- |
| **Segments non traduits** | Segments vides ou non confirmés |
| **Chiffres** | Nombres différents entre source et cible |
| **Balises** | Balises manquantes ou déplacées |
| **Terminologie** | Termes de la base non respectés |
| **Ponctuation et espaces** | Doubles espaces, ponctuation finale différente, espaces avant les signes doubles en français |
| **Cohérence** | Même segment source traduit de deux façons différentes |
| **Longueur** | Traduction beaucoup plus longue que la source (important en localisation) |

Lisez chaque alerte : certaines sont de **fausses alertes** (un chiffre écrit en lettres volontairement, par exemple). Corrigez les vraies, ignorez les fausses en connaissance de cause.

> [!astuce]
> Des outils de contrôle qualité spécialisés (comme Xbench) vérifient en plus la cohérence sur plusieurs fichiers et toute la mémoire. Très utiles sur les gros projets.

## DeepL Pro : un usage professionnel

### Ce qu'apporte la version professionnelle

1. **Des conditions de confidentialité** adaptées aux professionnels (les offres professionnelles prévoient en général que les textes ne sont pas conservés : vérifiez les conditions de l'offre que vous choisissez).
2. **Des glossaires** : vous imposez la traduction de certains termes.
3. **La traduction de documents entiers** en gardant la mise en forme.
4. **Une connexion avec les outils de TAO** (selon les outils et les offres).

### Les règles

1. **Accord du client** : la traduction automatique doit être autorisée par écrit.
2. **Glossaire chargé** avant de commencer.
3. **Post-édition au niveau demandé** (module 1).
4. **Jamais de texte confidentiel** dans une version gratuite.

## Quels outils acheter, et quand ?

| Situation | Conseil |
| --- | --- |
| Vous débutez avec les agences | Versions d'essai, Matecat, outils en ligne fournis par les agences |
| Des agences vous envoient régulièrement des paquets Trados | Une licence Trados Studio devient rentable |
| Vos clients utilisent memoQ | Une licence memoQ |
| Vous faites beaucoup de post-édition autorisée | DeepL Pro |

> [!madagascar]
> Ces licences coûtent cher et se paient en devises. Avant d'acheter, calculez combien de projets réguliers l'exigent. Surveillez les offres promotionnelles des éditeurs, et vérifiez si votre agence principale peut vous fournir un accès.

> [!retenir]
> - Trados Studio et memoQ : les outils des agences, avec des paquets de projet.
> - Toujours renvoyer un paquet de retour, sans modifier les réglages.
> - L'analyse de projet classe les mots par correspondance ; les agences paient selon une grille.
> - Les contrôles qualité intégrés avant chaque livraison, alertes lues une par une.
> - DeepL Pro avec glossaires, accord du client et niveau de post-édition clair.

## Exercice pratique : un projet d'agence

> [!exercice] Exercice pratique · 3 heures
> 1. Installez la version d'essai de Trados Studio ou de memoQ.
> 2. Créez un projet avec un document Word de 800 mots, une mémoire de traduction et une base terminologique de 20 termes (votre glossaire du module 1).
> 3. Traduisez la moitié du document, puis importez une version légèrement modifiée du document et observez les correspondances.
> 4. Générez l'analyse du projet et commentez-la.
> 5. Lancez les contrôles qualité, corrigez et créez un paquet ou un fichier de retour.
>
> **À livrer** : des captures du projet, l'analyse commentée, le rapport de contrôle qualité et le document final.
