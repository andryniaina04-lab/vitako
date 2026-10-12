Un développeur avancé ne casse jamais un site en ligne. Il travaille sur une copie, garde un historique de ses modifications, mesure la vitesse, sécurise et vérifie avant chaque mise en production. Ce module vous donne la méthode professionnelle pour livrer vite et sans risque, et pour entretenir de nombreux sites efficacement.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Travailler avec 3 environnements : local, préproduction, production.
> 2. Garder un historique de vos modifications avec Git.
> 3. Optimiser la vitesse d'un site avec une méthode en 6 étapes.
> 4. Sécuriser un site WordPress avec 10 mesures.
> 5. Faire valider un site par le client avec une recette.
> 6. Entretenir plusieurs sites depuis un seul tableau de bord.

## Les 3 environnements

| Environnement | Où | À quoi il sert |
| --- | --- | --- |
| **Local** | Votre ordinateur (LocalWP) | Développer et tester sans risque |
| **Préproduction** (*staging*) | Une copie du site en ligne, non visible du public | Faire valider par le client, tester avec de vraies conditions |
| **Production** | Le vrai site | Ce que voient les visiteurs |

> [!definition] Préproduction
> Une copie exacte du site, sur le même type d'hébergement, protégée (mot de passe, non indexée par Google). Beaucoup d'hébergeurs proposent une préproduction en un clic. Sur Shopify, on travaille sur un **thème dupliqué non publié**, que l'on prévisualise avant de le publier.

### Le circuit d'une modification

1. **Sauvegarde** de la production.
2. **Développement** en local ou en préproduction.
3. **Tests** (grille de recette).
4. **Validation** du client sur la préproduction.
5. **Mise en production**, à un moment de faible trafic.
6. **Vérification** immédiate du site en ligne.

## Git : l'historique de vos modifications

> [!definition] Git
> Un logiciel de gestion de versions : il enregistre chaque modification de vos fichiers de code (thème enfant, extensions maison, thème Shopify) avec un message. On peut revenir à n'importe quelle version précédente. On le combine souvent avec un service en ligne comme GitHub.

### Les commandes de base

```
git init                         # créer l'historique dans le dossier du thème
git add .                        # préparer les fichiers modifiés
git commit -m "Bouton d'achat"   # enregistrer une version avec un message
git log                          # voir l'historique
```

Shopify propose une **intégration avec GitHub** pour les thèmes : chaque modification du thème est enregistrée, et l'on peut revenir en arrière facilement.

> [!astuce]
> Écrivez des messages de version **clairs** : « Ajout du tableau d'origine sur la fiche produit » plutôt que « modif ». Dans 6 mois, quand le client vous demandera ce qui a changé, vous trouverez la réponse en quelques secondes.

## Optimiser la vitesse : la méthode en 6 étapes

| N° | Étape | Actions |
| --- | --- | --- |
| 1 | **Mesurer** | PageSpeed Insights sur 3 pages types (accueil, produit, article), sur téléphone ; notez les chiffres |
| 2 | **Images** | Compresser, redimensionner, format moderne (WebP), chargement différé des images sous l'écran |
| 3 | **Extensions et applications** | Supprimer celles qui ne servent pas ; remplacer les plus lourdes |
| 4 | **Cache et compression** | Extension de cache (WordPress), compression du code, réseau de diffusion de contenu si utile |
| 5 | **Polices et scripts** | Limiter le nombre de polices, retarder les scripts non essentiels (chat, statistiques) |
| 6 | **Hébergement** | Si tout le reste est fait et que le serveur reste lent, conseiller un hébergement plus performant |

Mesurez **après chaque étape** pour savoir ce qui a réellement amélioré la vitesse. Présentez au client un tableau **avant / après**.

> [!definition] Réseau de diffusion de contenu (CDN)
> Un réseau de serveurs répartis dans le monde qui gardent une copie des fichiers du site (images, scripts) et les envoient depuis le serveur le plus proche du visiteur. Utile pour un site qui a des visiteurs dans plusieurs pays.

## Sécuriser un site WordPress : 10 mesures

| N° | Mesure |
| --- | --- |
| 1 | Mises à jour régulières de WordPress, du thème et des extensions |
| 2 | Suppression des extensions et thèmes inutilisés |
| 3 | Comptes administrateurs limités, identifiants uniques, mots de passe longs |
| 4 | Double authentification pour les administrateurs |
| 5 | Limitation des tentatives de connexion |
| 6 | Sauvegardes automatiques, stockées hors du serveur, **testées** |
| 7 | HTTPS sur tout le site |
| 8 | Extension de sécurité (pare-feu, analyse des fichiers) |
| 9 | Droits des fichiers et accès au serveur limités |
| 10 | Surveillance : alerte si le site tombe ou si des fichiers changent |

> [!attention]
> Une sauvegarde **jamais testée** n'est pas une sauvegarde. Une fois par trimestre, restaurez la sauvegarde d'un site sur une copie locale pour vérifier qu'elle fonctionne.

## La recette : faire valider le site

> [!definition] Recette
> La phase où le client vérifie que le site correspond au cahier des charges, avant la mise en ligne ou le paiement final. On utilise une liste de tests, et chaque problème est noté et corrigé.

### Le cahier de recette

| N° | Test | Résultat attendu | Résultat | Commentaire |
| --- | --- | --- | --- | --- |
| 1 | Réserver une chambre pour 2 personnes | E-mail de confirmation reçu par le client et l'hôtel | OK | |
| 2 | Changer de langue sur la page Chambres | La page s'affiche en anglais | KO | Le menu reste en français |
| 3 | Payer une commande de test | Commande enregistrée, stock mis à jour | OK | |

Fixez une **durée de recette** (par exemple 5 jours ouvrés) et précisez que, sans retour dans ce délai, le site est considéré comme validé. Après la validation, les nouvelles demandes sont des **évolutions**, à chiffrer séparément.

## Entretenir plusieurs sites efficacement

Avec 10 ou 20 sites en maintenance, il faut un système.

1. **Un tableau de bord central** (outils comme MainWP ou ManageWP pour WordPress) : mises à jour, sauvegardes et surveillance de tous les sites depuis un seul endroit.
2. **Un jour fixe** par mois pour les mises à jour, toujours après une sauvegarde, en commençant par une préproduction pour les sites importants.
3. **Une surveillance** de disponibilité qui vous alerte si un site tombe.
4. **Un rapport mensuel automatique**, complété par vos commentaires.
5. **Une fiche par site** : accès, extensions, particularités, historique des interventions.

> [!madagascar]
> Les mises à jour et interventions lourdes se font idéalement quand les visiteurs du site sont peu nombreux. Pour un site européen, votre matinée correspond à la fin de nuit ou au petit matin en Europe : c'est un bon moment pour travailler sans gêner les visiteurs.

> [!retenir]
> - Local, préproduction, production : jamais de modification directe en ligne.
> - Git garde l'historique de chaque modification de code.
> - Vitesse : mesurer, images, extensions, cache, polices et scripts, hébergement.
> - 10 mesures de sécurité, dont des sauvegardes testées.
> - Une recette écrite avec un délai, et un système pour entretenir plusieurs sites.

## Exercice pratique : un circuit professionnel

> [!exercice] Exercice pratique · 4 heures
> 1. Créez une copie de préproduction de votre site local (ou utilisez un clonage dans LocalWP).
> 2. Initialisez Git dans votre thème enfant et enregistrez 3 versions avec des messages clairs.
> 3. Optimisez la vitesse de votre site d'exercice avec les 6 étapes et présentez un tableau avant / après.
> 4. Appliquez les 10 mesures de sécurité et testez la restauration d'une sauvegarde.
> 5. Rédigez un cahier de recette de 15 tests pour votre site « Chez Lalao » (niveau Fondamentaux).
>
> **À livrer** : des captures de la préproduction et de l'historique Git, le tableau de vitesse, votre liste de sécurité cochée et le cahier de recette.
