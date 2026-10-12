Une automatisation qui marche lors de la démonstration mais échoue un mois plus tard détruit la confiance du client. Ce module vous donne les méthodes professionnelles : tester l'IA avec des jeux de données, garder un humain là où il faut, versionner, surveiller et maîtriser les coûts dans la durée.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Évaluer la qualité d'une étape d'IA avec un jeu de test.
> 2. Placer le contrôle humain aux bons endroits.
> 3. Versionner et documenter scénarios et consignes.
> 4. Surveiller la santé et les coûts d'un système.
> 5. Livrer de façon progressive et sûre.

## Évaluer une étape d'IA

### Le jeu de test

1. **Rassemblez** 50 à 100 exemples réels (anonymisés si besoin), avec la **bonne réponse** attendue.
2. **Incluez** des cas difficiles : textes ambigus, fautes, langues mélangées, documents de mauvaise qualité.
3. **Lancez** la consigne sur tout le jeu.
4. **Mesurez** les résultats.

| Mesure | Définition | Exemple |
| --- | --- | --- |
| **Exactitude** | Réponses correctes ÷ total | 92 % |
| **Taux de « je ne sais pas »** | Cas renvoyés à un humain | 6 % |
| **Erreurs graves** | Erreurs avec un coût réel (mauvais montant, mauvais client) | 1 cas sur 100 |
| **Format valide** | Réponses lisibles par l'étape suivante | 100 % |

> [!astuce]
> Gardez ce jeu de test et relancez-le **à chaque modification** de la consigne ou de modèle. Une amélioration sur un cas peut créer une erreur ailleurs : seul le jeu complet le montre.

### Améliorer une consigne

| Problème observé | Amélioration |
| --- | --- |
| Erreurs sur les dates | Préciser le format et donner 2 exemples |
| Catégories confondues | Définir chaque catégorie avec un exemple et un contre-exemple |
| Invention d'informations | Interdire explicitement, exiger « null » si absent |
| Réponses trop longues | Imposer un schéma JSON strict |

## Placer le contrôle humain

> [!definition] Humain dans la boucle
> Une organisation où l'IA ou l'automatisation prépare le travail, et un humain valide les cas importants ou incertains avant l'action.

| Niveau de risque | Organisation |
| --- | --- |
| **Faible** (classement interne) | Automatique, contrôle par échantillon chaque semaine |
| **Moyen** (brouillon de réponse client) | Validation humaine avant envoi |
| **Élevé** (montant financier, décision sur une personne) | Validation humaine obligatoire, double contrôle au-delà d'un seuil |
| **Incertain** (confiance basse) | Toujours vers un humain |

> [!exemple] Seuils pour des factures
> - Confiance « haute » et montant inférieur à 500 000 Ar : saisie automatique, contrôle par échantillon.
> - Confiance « moyenne » ou montant supérieur : validation par l'aide-comptable.
> - Confiance « basse » ou fournisseur inconnu : traitement manuel.

## Versionner et documenter

| Élément | Bonne pratique |
| --- | --- |
| **Scénarios** | Export régulier (Make et Zapier permettent d'exporter ou de copier les scénarios), nommé avec la version |
| **Consignes d'IA** | Fichier texte versionné avec date, modèle et résultats du jeu de test |
| **Environnement de test** | Scénario copié sur des données de test avant de modifier la production |
| **Journal des modifications** | Date, changement, raison, auteur, résultat |
| **Fiche de chaque scénario** | Objet, déclencheur, étapes, données, contacts, procédure de panne |

## Surveiller la santé et les coûts

### Le tableau de bord d'exploitation

| Indicateur | Seuil d'alerte (exemple) |
| --- | --- |
| Exécutions en erreur | Plus de 2 % sur une journée |
| Éléments en attente de traitement humain | Plus de 20 depuis plus de 24 heures |
| Consommation d'opérations ou de tâches | Plus de 80 % du forfait avant le 20 du mois |
| Coût de l'IA | Plus de 80 % du plafond mensuel |
| Dernière exécution réussie | Plus de 2 heures pour un scénario horaire |

> [!attention]
> Les services externes changent : une API modifie un champ, un connecteur est mis à jour, une connexion expire. Prévoyez une **vérification mensuelle** de chaque scénario, même quand aucune alerte n'est remontée.

## Livrer de façon progressive

1. **Mode observation** : le scénario tourne, mais n'agit pas ; on compare ses décisions à celles des humains.
2. **Mode assisté** : il prépare, un humain valide tout.
3. **Mode automatique partiel** : les cas simples sont automatiques, les autres validés.
4. **Mesure** après un mois, puis ajustement des seuils.

> [!madagascar]
> Pendant le mode observation, impliquez les personnes qui faisaient le travail à la main : elles repèrent les erreurs que vous ne verriez pas (noms de fournisseurs locaux, abréviations, habitudes). Leur adhésion est la clé du succès.

> [!retenir]
> - Un jeu de test de 50 à 100 exemples, relancé à chaque modification.
> - Le contrôle humain placé selon le risque et la confiance.
> - Scénarios et consignes versionnés, testés, documentés.
> - Un tableau de bord d'exploitation et une vérification mensuelle.
> - Une livraison en 4 étapes, avec les équipes.

## Exercice pratique : fiabiliser un système

> [!exercice] Exercice pratique · 4 heures
> 1. Construisez un jeu de test de 50 exemples pour votre extraction de factures ou votre classement de messages.
> 2. Mesurez l'exactitude, améliorez la consigne 2 fois et mesurez à nouveau.
> 3. Définissez les seuils de contrôle humain.
> 4. Rédigez la fiche, le journal des modifications et le tableau de bord d'exploitation.
> 5. Rédigez le plan de livraison en 4 étapes.
>
> **À livrer** : votre jeu de test, vos mesures, vos seuils, vos documents et votre plan.
