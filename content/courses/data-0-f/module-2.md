Un annotateur est jugé sur une seule chose : la **qualité** de ses annotations. Elle dépend de trois savoir-faire : lire et appliquer des consignes, maîtriser les règles de chaque type d'annotation, et gérer les cas difficiles. Ce module vous les enseigne avec des règles précises et des exemples.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Lire des consignes d'annotation avec une méthode en 5 étapes.
> 2. Dessiner des cadres de délimitation selon les 6 règles de base.
> 3. Classer des textes et marquer des entités nommées.
> 4. Traiter les cas limites sans deviner.
> 5. Comprendre comment votre qualité est mesurée.

## Lire les consignes : la méthode en 5 étapes

Chaque projet a ses **consignes** (en anglais *guidelines*). Elles disent exactement quoi annoter, comment, et que faire dans les cas difficiles. Deux projets qui se ressemblent peuvent avoir des règles opposées.

1. **Lisez tout une première fois**, sans rien annoter, pour comprendre le but du projet.
2. **Faites la liste des catégories** (les étiquettes possibles) avec leur définition.
3. **Étudiez les exemples** : ceux marqués « correct » et surtout ceux marqués « incorrect ».
4. **Notez les cas limites** : ce qu'il faut faire quand on hésite.
5. **Relisez les consignes** après vos 20 premières annotations : vous comprendrez des détails qui vous avaient échappé.

> [!astuce]
> Gardez une **fiche mémo** d'une page par projet, à côté de votre écran : les catégories, les 5 règles les plus importantes et les cas limites. Vous gagnerez du temps sans perdre en qualité.

## Les cadres de délimitation : 6 règles de base

> [!definition] Cadre de délimitation
> Un rectangle dessiné autour d'un objet sur une image. En anglais : *bounding box*. Le cadre doit contenir l'objet entier, le plus serré possible.

| N° | Règle | Pourquoi |
| --- | --- | --- |
| 1 | **Serré** : les bords du cadre touchent les bords de l'objet | Un cadre trop large apprend à l'IA que le fond fait partie de l'objet |
| 2 | **Complet** : tout l'objet visible est dans le cadre (rétroviseurs, bras, queue…) | Un cadre coupé apprend une forme fausse |
| 3 | **Un cadre par objet** : 5 personnes = 5 cadres | L'IA doit apprendre à compter et séparer |
| 4 | **Objets partiellement cachés** : on encadre la partie **visible** seulement, sauf consigne contraire | On n'invente pas ce qu'on ne voit pas |
| 5 | **Objets coupés par le bord de l'image** : on encadre jusqu'au bord | Même logique |
| 6 | **Bonne étiquette** pour chaque cadre | Un piéton étiqueté « voiture » est une grave erreur |

> [!exemple] Une photo de l'avenue de l'Indépendance
> Sur la photo, on voit 3 voitures, dont une à moitié cachée par un bus, 1 bus, 6 piétons dont 2 coupés par le bord de l'image, et un vélo. Annotation correcte : **11 cadres**, chacun serré autour de la partie visible, avec l'étiquette exacte (voiture, bus, piéton, vélo). Le cycliste est-il un « piéton » ? Ce sont les consignes qui le disent, pas vous.

## La segmentation

Pour la segmentation, on suit le contour de l'objet point par point (polygone) ou on « colorie » les pixels.

1. **Zoomez** pour placer les points sur le bord exact.
2. Placez **plus de points dans les courbes**, moins dans les lignes droites.
3. Ne laissez **ni trou ni débordement** entre deux objets voisins.

## L'annotation de texte

### Classer un texte

On choisit une catégorie pour un texte entier : sentiment (positif, négatif, neutre), sujet (livraison, prix, qualité), intention (question, plainte, remerciement).

| Texte | Sentiment | Pourquoi |
| --- | --- | --- |
| « Livraison rapide, produit conforme, merci ! » | Positif | Satisfaction claire |
| « Le colis est arrivé. » | Neutre | Simple constat |
| « Deuxième fois que la commande est en retard… » | Négatif | Plainte, même polie |
| « Super, encore une panne. Bravo. » | Négatif | **Ironie** : les mots sont positifs, le sens est négatif |

### Marquer des entités nommées

> [!definition] Entité nommée
> Un mot ou groupe de mots qui désigne une chose précise : une personne, un lieu, une organisation, une date, un montant. En anglais : *named entity*.

> [!exemple]
> « **Rasoa** [PERSONNE] a envoyé **50 000 Ar** [MONTANT] à **Toamasina** [LIEU] le **3 mars** [DATE] par **MVola** [ORGANISATION]. »

Règles habituelles : surligner le groupe de mots **entier** (« Banque centrale de Madagascar », pas seulement « Banque »), sans espace ni ponctuation en trop.

## Les cas limites : ne jamais deviner

Un **cas limite** est un exemple où les consignes ne disent pas clairement quoi faire. Ce sont eux qui font la différence entre un bon et un mauvais annotateur.

### Que faire face à un cas limite

1. **Relisez** les consignes et les exemples : la réponse y est souvent.
2. Cherchez dans la **foire aux questions** ou le forum du projet.
3. Si la plateforme le permet, utilisez l'option **« Je ne sais pas » / « Signaler »** plutôt que de deviner.
4. **Posez la question** au responsable du projet, avec l'exemple précis.
5. **Notez la réponse** dans votre fiche mémo, pour la prochaine fois.

> [!attention]
> Une réponse au hasard est **pire** qu'un signalement. Le signalement aide le projet à améliorer ses consignes ; l'erreur, elle, est apprise par l'IA.

## Comment votre qualité est mesurée

| Méthode | Comment ça marche |
| --- | --- |
| **Questions de contrôle** | Des exemples dont la bonne réponse est connue sont glissés parmi vos tâches, sans que vous le sachiez |
| **Consensus** | Plusieurs annotateurs font la même tâche ; on compare leurs réponses |
| **Relecture** | Un contrôleur qualité vérifie un échantillon de votre travail |
| **Mesure de recouvrement** (pour les cadres) | On compare la surface de votre cadre à celle du cadre de référence |

> [!definition] Taux de précision
> La part de vos annotations jugées correctes. Exemple : 188 bonnes réponses sur 200 contrôlées = 188 ÷ 200 × 100 = **94 %**. Beaucoup de projets exigent un taux élevé (souvent 90 % ou plus) pour rester sur le projet.

> [!madagascar]
> Pour les projets en malagasy, notez les variantes régionales (mots différents entre Antananarivo, Toamasina ou le Sud) et demandez aux consignes quelle forme utiliser. C'est souvent un vrai cas limite, et votre connaissance est précieuse.

> [!retenir]
> - Lisez toutes les consignes avant d'annoter, et relisez-les après 20 tâches.
> - Cadres : serrés, complets, un par objet, bonne étiquette.
> - Texte : attention à l'ironie ; entités surlignées en entier.
> - Face à un cas limite : chercher, signaler, demander, jamais deviner.
> - Votre qualité est contrôlée en permanence, souvent sans que vous le sachiez.

## Exercice pratique : appliquer des consignes

> [!exercice] Exercice pratique · 1 heure
> 1. Rédigez des consignes d'une page pour un projet fictif : « Repérer les véhicules sur des photos de rues malgaches » (catégories : voiture, taxi-be, moto, vélo, charrette à zébus, autre). Ajoutez 3 cas limites et leur règle.
> 2. Imprimez ou affichez 5 photos de rue et dessinez les cadres à la main (ou dans un logiciel de dessin), en suivant **vos** consignes.
> 3. Marquez les entités nommées dans 5 phrases d'un article de presse malgache.
> 4. Classez 10 commentaires Facebook réels (sentiment), en signalant ceux qui sont ironiques.
>
> **À livrer** : vos consignes, vos 5 photos annotées, vos 5 phrases et votre tableau de 10 commentaires.
