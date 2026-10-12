Dans ce module, vous menez une campagne de tests complète sur une application de réservation, comme le ferait un testeur dans une équipe : analyse, plan de test, cas de test, exécution sur plusieurs appareils, rapports de bugs, retests et bilan. C'est le type de projet qui deviendra votre portfolio.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Rédiger un plan de test.
> 2. Construire une matrice de couverture.
> 3. Exécuter une campagne sur plusieurs appareils.
> 4. Gérer les bugs jusqu'à leur fermeture.
> 5. Rédiger un bilan de recette avec une recommandation.

## Le cas pratique : « Taxi-be Réservation »

> [!exemple] Votre mission
> Une start-up d'Antananarivo lance une application web de **réservation de places de taxi-brousse** : recherche de trajet, choix de la date et du nombre de places, paiement par Mobile Money, billet avec un code. La version 1.0 sort dans 2 semaines. Vous êtes le testeur de l'équipe.

## Étape 1 : le plan de test

| Rubrique | Contenu |
| --- | --- |
| **Objectif** | Vérifier que la version 1.0 peut être mise en ligne |
| **Périmètre** | Recherche, réservation, paiement, billet, compte utilisateur |
| **Hors périmètre** | Espace administrateur, statistiques |
| **Types de tests** | Fonctionnels, exploratoires, compatibilité, API, régression |
| **Appareils** | Android d'entrée de gamme, Android récent, iPhone, ordinateur (Chrome, Firefox) |
| **Conditions** | Connexion normale et connexion lente |
| **Critères de sortie** | Aucun bug bloquant ou majeur ouvert ; 95 % des cas de test réussis |
| **Planning** | Semaine 1 : tests ; semaine 2 : retests et régression |

## Étape 2 : la matrice de couverture

> [!definition] Matrice de couverture
> Un tableau qui relie chaque exigence aux cas de test qui la vérifient. Elle montre qu'aucune exigence n'a été oubliée.

| Exigence | Cas de test | Statut |
| --- | --- | --- |
| E1 – Rechercher un trajet par ville de départ, d'arrivée et date | CT-01 à CT-05 | À exécuter |
| E2 – Réserver de 1 à 4 places | CT-06 à CT-10 | À exécuter |
| E3 – Payer par Mobile Money | CT-11 à CT-16 | À exécuter |
| E4 – Recevoir un billet avec code | CT-17 à CT-19 | À exécuter |
| E5 – Annuler jusqu'à 24 heures avant le départ | CT-20 à CT-23 | À exécuter |

### Des cas importants à ne pas oublier

| Cas | Pourquoi |
| --- | --- |
| Réserver la dernière place disponible en même temps qu'un autre utilisateur | Risque de double réservation |
| Fermer l'application pendant le paiement | Paiement fait mais billet absent ? |
| Paiement refusé (solde insuffisant) | Message clair, place libérée |
| Annuler à 23 h 59 avant le départ, puis à 24 h 01 | Valeurs limites |
| Connexion coupée après le clic sur « Payer » | Pas de double paiement |

## Étape 3 : exécuter la campagne

### Le suivi d'exécution

| Cas | Android entrée de gamme | Android récent | iPhone | Chrome PC | Firefox PC |
| --- | --- | --- | --- | --- | --- |
| CT-01 | Réussi | Réussi | Réussi | Réussi | Réussi |
| CT-11 | Échoué (BUG-07) | Réussi | Réussi | Réussi | Réussi |
| CT-14 | Bloqué (BUG-07) | Réussi | Réussi | Réussi | Réussi |

> [!astuce]
> Réservez du temps pour des **sessions exploratoires** de 60 à 90 minutes, avec une mission précise (« explorer le paiement avec une connexion lente »). Elles trouvent souvent les bugs que les cas de test écrits n'avaient pas prévus.

## Étape 4 : gérer les bugs jusqu'à leur fermeture

1. **Créez** chaque bug dans Jira avec toutes les informations.
2. **Participez** au point quotidien des bugs avec le chef de projet et les développeurs.
3. **Retestez** chaque correction dès qu'elle est disponible.
4. **Lancez la régression** sur les fonctions voisines.
5. **Fermez** ou **réouvrez** avec un commentaire précis.

## Étape 5 : le bilan de recette

| Indicateur | Résultat (exemple) |
| --- | --- |
| Cas de test exécutés | 46 sur 46 |
| Cas réussis | 44 (96 %) |
| Bugs trouvés | 19 (2 bloquants, 5 majeurs, 8 mineurs, 4 cosmétiques) |
| Bugs corrigés et vérifiés | 17 |
| Bugs ouverts | 2 mineurs |

> [!exemple] Recommandation
> « Les 2 bugs bloquants (double réservation de la dernière place, billet absent après fermeture de l'application pendant le paiement) sont corrigés et vérifiés sur tous les appareils. Restent 2 bugs mineurs d'affichage sur Android d'entrée de gamme, sans effet sur la réservation. Les critères de sortie sont atteints : **mise en ligne recommandée**, avec correction des 2 bugs mineurs dans la version 1.0.1. »

> [!madagascar]
> Pour une application de paiement mobile à Madagascar, testez les **cas réels** : solde insuffisant, délai de confirmation du paiement, message reçu par SMS en retard, numéro saisi avec ou sans indicatif +261. Ce sont les situations que vivront les utilisateurs.

> [!retenir]
> - Un plan de test avec périmètre, appareils, critères de sortie et planning.
> - Une matrice de couverture qui relie exigences et cas de test.
> - Une exécution sur plusieurs appareils, avec des sessions exploratoires.
> - Un suivi des bugs jusqu'à leur fermeture, avec régression.
> - Un bilan chiffré et une recommandation claire.

## Exercice pratique : la campagne Taxi-be Réservation

> [!exercice] Exercice pratique · 8 heures (sur plusieurs jours)
> 1. Choisissez une application web réelle de réservation ou de commerce (ou un site de démonstration prévu pour l'entraînement).
> 2. Rédigez le plan de test et la matrice de couverture (au moins 25 cas).
> 3. Exécutez la campagne sur au moins 3 appareils ou navigateurs, dont un téléphone.
> 4. Faites 2 sessions exploratoires et notez vos découvertes.
> 5. Rédigez les rapports de bugs dans Jira et le bilan de recette.
>
> **À livrer** : votre plan, votre matrice, votre suivi d'exécution, vos bugs et votre bilan. C'est votre projet de portfolio.
