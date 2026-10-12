Un designer avancé ne travaille pas « à l'inspiration » : il suit une **méthode** qui donne des résultats fiables, vite. Ce module vous donne les méthodes des équipes produit : cadrer avec des hypothèses, tester rapidement, rédiger les textes d'interface, vérifier l'accessibilité et collaborer efficacement avec les développeurs.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Cadrer un problème avec une hypothèse mesurable.
> 2. Mener des tests utilisateurs rapides à distance.
> 3. Rédiger les textes d'interface (UX writing).
> 4. Vérifier l'accessibilité selon les normes WCAG.
> 5. Travailler en cycles courts avec les développeurs.

## Cadrer avec une hypothèse

> [!definition] Hypothèse de design
> Une phrase qui relie un changement à un effet mesurable : « Nous pensons que [changement] pour [utilisateurs] produira [effet], ce que nous mesurerons avec [indicateur]. »

> [!exemple] Hypothèse
> « Nous pensons qu'afficher les frais de livraison dès la fiche produit, pour les clients sur téléphone, réduira les abandons de panier, ce que nous mesurerons avec le taux de passage du panier au paiement, actuellement de 38 %. »

### Le cycle

1. **Comprendre** : données, entretiens, audit.
2. **Formuler** l'hypothèse.
3. **Concevoir** la solution la plus simple qui la teste.
4. **Tester** avec des utilisateurs (prototype) puis en vrai (indicateur).
5. **Décider** : garder, améliorer ou abandonner.

## Les tests utilisateurs rapides à distance

### Le test modéré en visioconférence

| Étape | Conseil |
| --- | --- |
| **Recrutement** | 5 personnes proches du profil, avec un petit dédommagement (crédit téléphonique, bon d'achat) |
| **Préparation** | 3 à 5 tâches réalistes, un prototype prêt sur téléphone |
| **Pendant le test** | La personne partage son écran et pense à voix haute ; vous observez sans aider |
| **Questions** | Ouvertes, à la fin : « Qu'est-ce qui a été le plus difficile ? » |
| **Synthèse** | Problèmes, fréquence, gravité, recommandations, extraits vidéo |

> [!attention]
> Demandez toujours l'**accord écrit** de la personne avant d'enregistrer, expliquez à quoi servira l'enregistrement, et ne le partagez qu'avec l'équipe du projet.

### Les autres méthodes rapides

| Méthode | Usage |
| --- | --- |
| **Test des 5 secondes** | La personne voit l'écran 5 secondes : que retient-elle ? |
| **Tri de cartes** | Organiser les rubriques d'un menu selon la logique des utilisateurs |
| **Test de première impression** | Comparer 2 propositions visuelles |
| **Analyse des enregistrements de sessions** | Observer les vrais parcours (avec un outil adapté et le consentement prévu par le client) |

## Les textes d'interface (UX writing)

| Règle | À éviter | À préférer |
| --- | --- | --- |
| **Dire l'action** | « OK » | « Confirmer le paiement » |
| **Parler comme l'utilisateur** | « Échec de l'authentification » | « Le mot de passe est incorrect » |
| **Expliquer comment corriger** | « Erreur de saisie » | « Entrez un numéro à 10 chiffres, par exemple 034 12 345 67 » |
| **Être bref** | « Veuillez cliquer sur ce bouton afin de pouvoir continuer » | « Continuer » |
| **Rester cohérent** | « Panier », « Sac », « Commande » pour la même chose | Un seul mot partout |

> [!astuce]
> Écrivez les **vrais textes** dès les wireframes. Un design testé avec des textes factices cache souvent les vrais problèmes de compréhension.

## L'accessibilité selon les WCAG

> [!definition] WCAG
> Les règles internationales pour l'accessibilité des contenus web. Le niveau **AA** est celui demandé le plus souvent par les clients et par les lois de plusieurs pays.

| Point | Exigence courante (niveau AA) |
| --- | --- |
| **Contraste du texte** | Au moins 4,5:1 pour le texte normal, 3:1 pour le grand texte |
| **Contraste des éléments d'interface** | Au moins 3:1 (bordures de champs, icônes utiles) |
| **Focus visible** | Un indicateur clair pour la navigation au clavier |
| **Taille des cibles** | Zones tactiles suffisamment grandes et espacées |
| **Pas seulement la couleur** | Erreurs signalées aussi par un texte ou une icône |
| **Ordre logique** | L'ordre de lecture et de tabulation suit l'ordre visuel |

### La liste de contrôle du designer

1. Vérifier les contrastes avec une extension Figma.
2. Dessiner les états de **focus**.
3. Annoter l'**ordre de lecture** et les **textes alternatifs** des images.
4. Prévoir l'**agrandissement du texte** (200 %) sans perte de contenu.
5. Tester avec un **lecteur d'écran** sur une version développée.

## Travailler en cycles courts avec les développeurs

| Pratique | Pourquoi |
| --- | --- |
| **Revue technique** avant de finaliser | Le développeur signale ce qui est coûteux ou risqué |
| **Livraisons par petites parties** | Un parcours à la fois, pas 60 écrans d'un coup |
| **Revue de design** sur la version développée | Repérer les écarts avant la mise en ligne |
| **Liste des écarts** classés par gravité | Corriger l'essentiel, accepter les détails |
| **Disponibilité** pendant le développement | Répondre vite aux questions |

> [!madagascar]
> Avec une équipe en Europe, fixez **2 à 3 heures de chevauchement** par jour pour les échanges, et documentez vos décisions par écrit dans le fichier Figma ou l'outil de tickets. Un développeur qui travaille pendant votre délestage doit trouver ses réponses sans vous joindre.

> [!retenir]
> - Une hypothèse mesurable avant chaque projet.
> - 5 tests modérés, avec consentement, suffisent à trouver l'essentiel.
> - Des textes d'interface clairs, brefs, cohérents.
> - L'accessibilité au niveau AA des WCAG.
> - Des cycles courts et une revue de design de la version développée.

## Exercice pratique : un cycle complet

> [!exercice] Exercice pratique · 4 heures
> 1. Choisissez un problème de votre audit du module 1 et rédigez l'hypothèse.
> 2. Concevez 2 propositions et un prototype.
> 3. Faites 5 tests à distance (avec consentement) et un test des 5 secondes.
> 4. Réécrivez tous les textes de l'écran avec les règles d'UX writing.
> 5. Appliquez la liste de contrôle d'accessibilité et corrigez.
>
> **À livrer** : votre hypothèse, vos propositions, la synthèse des tests, vos textes et votre liste de contrôle.
