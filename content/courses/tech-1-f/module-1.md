Une application qui plante au moment du paiement, un bouton qui ne marche pas sur certains téléphones, un calcul faux sur une facture : ces erreurs coûtent cher aux entreprises. Le testeur logiciel les trouve **avant** les utilisateurs. C'est un métier rigoureux, très demandé, qui se fait entièrement à distance et qui est une excellente porte d'entrée dans l'informatique. Ce premier module vous le présente tel qu'il est vraiment.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Expliquer ce que fait un testeur logiciel (QA).
> 2. Distinguer les principaux types de tests.
> 3. Comprendre la place du test dans un projet.
> 4. Repérer vos premiers clients possibles.
> 5. Préparer votre poste de travail et votre plan d'apprentissage.

## Le métier en une phrase

Un testeur logiciel **vérifie qu'une application fait ce qu'elle doit faire, de façon fiable, sur les appareils des utilisateurs, et signale clairement les problèmes pour qu'ils soient corrigés**.

> [!definition] QA (Quality Assurance)
> L'assurance qualité : l'ensemble des actions qui garantissent la qualité d'un logiciel. Le mot « QA » désigne souvent aussi le testeur lui-même.

> [!definition] Bug (anomalie)
> Un écart entre ce que fait l'application et ce qu'elle devrait faire : une erreur, un plantage, un affichage cassé, un calcul faux.

## Les principaux types de tests

| Type | Question posée | Exemple |
| --- | --- | --- |
| **Fonctionnel** | La fonction fait-elle ce qui est prévu ? | Le panier calcule-t-il le bon total ? |
| **Régression** | Ce qui marchait marche-t-il encore après une modification ? | Le paiement fonctionne-t-il toujours après la mise à jour du panier ? |
| **Exploratoire** | Que se passe-t-il si j'utilise l'application de façon inattendue ? | Double-cliquer sur « Payer », revenir en arrière pendant le paiement |
| **Compatibilité** | L'application marche-t-elle sur tous les appareils et navigateurs ? | Android ancien, iPhone, Firefox, petit écran |
| **API** | Le serveur répond-il correctement ? | La route de création de commande renvoie-t-elle les bonnes données ? |
| **Utilisabilité** | Est-ce facile à utiliser ? | Un nouvel utilisateur trouve-t-il le bouton d'inscription ? |
| **Performance** (bases) | Est-ce assez rapide ? | La page se charge-t-elle en moins de 3 secondes ? |

### Manuel et automatisé

| Tests manuels | Tests automatisés |
| --- | --- |
| Réalisés par une personne qui suit des étapes | Réalisés par un programme qui rejoue les étapes |
| Idéals pour l'exploration et les nouvelles fonctions | Idéals pour les tests de régression répétés |
| Point de départ du métier | Évolution vers le métier d'automaticien (avec Playwright, par exemple) |

## La place du test dans un projet

```
Besoin → Conception → Développement → Tests → Correction → Nouveaux tests → Mise en ligne
                         ↑_____________________________________________|
```

1. Le testeur lit les **spécifications** (ce que l'application doit faire).
2. Il prépare des **cas de test**.
3. Il **exécute** les tests sur la version à tester.
4. Il **signale** les bugs avec précision.
5. Il **vérifie** les corrections et relance les tests de régression.

> [!astuce]
> Plus un bug est trouvé tôt, moins il coûte cher à corriger. Un bon testeur pose des questions dès la lecture des spécifications, avant même le développement.

## Les qualités du testeur

1. **Rigueur** : suivre les étapes, noter précisément.
2. **Curiosité** : essayer ce que personne n'a prévu.
3. **Communication écrite** : des rapports de bugs clairs et sans jugement.
4. **Patience** : refaire les mêmes vérifications plusieurs fois.
5. **Esprit utilisateur** : se mettre à la place de la personne qui utilise l'application.

## Qui sont vos clients ?

### À Madagascar

1. **Entreprises de services numériques** d'Antananarivo qui développent pour l'Europe et ont des équipes de test.
2. **Start-up** (paiement mobile, e-commerce, éducation).
3. **Agences web** qui veulent vérifier leurs sites avant la livraison.

### À l'étranger

1. **Éditeurs de logiciels et start-up** qui recrutent des testeurs à distance.
2. **Plateformes de test participatif** qui paient pour trouver des bugs sur de vrais appareils.
3. **Agences** qui sous-traitent les tests de leurs projets.

> [!madagascar] Votre avantage
> Les entreprises de services numériques malgaches recrutent régulièrement des testeurs, souvent en français, pour des clients européens. Votre connaissance des **téléphones d'entrée de gamme** et des **connexions lentes** est aussi précieuse : beaucoup d'applications sont testées seulement sur des appareils récents et une connexion rapide.

## Votre poste de travail et votre plan d'apprentissage

| Élément | Minimum conseillé |
| --- | --- |
| **Ordinateur** | 8 Go de mémoire vive, deux navigateurs (Chrome, Firefox) |
| **Téléphones** | Au moins un Android ; un iPhone si possible (ou outils de test en ligne) |
| **Logiciels** | Outils de capture d'écran et de vidéo, Postman, éditeur de code |
| **Comptes** | Jira (offre gratuite), GitHub |

1. **Les bases du test** (3 semaines) : cas de test, rapports de bugs.
2. **Le web** (2 semaines) : outils de développement du navigateur, notions de HTML.
3. **Les API** (2 semaines) : HTTP, Postman.
4. **L'automatisation** (4 à 6 semaines) : JavaScript de base, Playwright.
5. **Les projets** : un dossier de tests complet pour votre portfolio.

*(Durées données en exemple pour 2 à 3 heures de pratique par jour.)*

> [!retenir]
> - Le testeur vérifie que l'application fonctionne et signale clairement les problèmes.
> - Fonctionnel, régression, exploratoire, compatibilité, API, utilisabilité, performance.
> - Tests manuels pour explorer, tests automatisés pour répéter.
> - Plus un bug est trouvé tôt, moins il coûte.
> - Clients : entreprises de services numériques, start-up, éditeurs, agences, plateformes.

## Exercice pratique : votre premier regard de testeur

> [!exercice] Exercice pratique · 1 heure 30
> 1. Choisissez une application ou un site que vous utilisez.
> 2. Testez le parcours principal (inscription, achat ou réservation) sur ordinateur et sur téléphone.
> 3. Essayez 10 actions inattendues (champs vides, retour arrière, double clic, connexion coupée).
> 4. Notez chaque problème trouvé avec une capture.
> 5. Écrivez votre plan d'apprentissage sur 3 mois.
>
> **À livrer** : votre liste de problèmes avec captures et votre plan.
