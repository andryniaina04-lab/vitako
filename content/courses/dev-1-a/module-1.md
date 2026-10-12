Écrire une API qui fonctionne ouvre les premières missions. Les développeurs back-end les mieux payés construisent des systèmes **fiables, rapides et sûrs** qui tiennent quand le nombre d'utilisateurs augmente, savent **reprendre du code existant** sans tout casser, et expliquent leurs choix techniques. Ce module vous aide à choisir votre spécialité et à vendre cette expertise.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Comparer les 6 spécialités avancées du back-end.
> 2. Choisir la vôtre selon vos forces et le marché.
> 3. Mener un audit technique d'une application back-end.
> 4. Mesurer la fiabilité et la performance d'un service.
> 5. Construire des offres à plus forte valeur.

## Les 6 spécialités avancées

| N° | Spécialité | Problème réglé | Ce qu'il faut maîtriser |
| --- | --- | --- | --- |
| 1 | **Frameworks et applications métier** | Applications complètes à développer vite et proprement | Laravel ou Symfony (PHP), NestJS ou Express (Node.js), architecture |
| 2 | **Intégrations et paiements** | Relier l'application à des services externes | API de paiement (dont Mobile Money), webhooks, idempotence, e-mails, SMS |
| 3 | **Bases de données et performance** | Applications lentes quand les données grossissent | Index, plans d'exécution, cache, files de traitement |
| 4 | **Sécurité applicative** | Failles, fuites de données | OWASP Top 10, authentification, droits, journaux |
| 5 | **Reprise de code existant** | Vieilles applications PHP difficiles à faire évoluer | Lecture de code, tests de caractérisation, refactorisation progressive |
| 6 | **Déploiement et exploitation** | Mises en ligne risquées, pannes non détectées | Linux, Docker, intégration continue, surveillance, sauvegardes |

> [!madagascar] Des spécialités où vous avez un avantage
> - **Intégrations de paiement mobile** et de SMS pour les services destinés à Madagascar et à l'Afrique : peu de développeurs étrangers les connaissent.
> - **Maintenance d'applications PHP** pour des agences et entreprises francophones, un travail régulier très demandé.
> - **Applications métier** pour les entreprises de services numériques d'Antananarivo et leurs clients européens.

## L'audit technique d'une application back-end

### Les 7 domaines

| Domaine | Ce que vous vérifiez |
| --- | --- |
| **1. Architecture** | Organisation du code, séparation des responsabilités, dépendances |
| **2. Sécurité** | Authentification, droits, validation, secrets, dépendances vulnérables |
| **3. Base de données** | Schéma, contraintes, index, requêtes lentes, sauvegardes |
| **4. Performance** | Temps de réponse, requêtes répétées, mise en cache |
| **5. Fiabilité** | Gestion des erreurs, transactions, reprises, journaux |
| **6. Tests et déploiement** | Tests automatiques, intégration continue, procédure de mise en ligne |
| **7. Exploitation** | Surveillance, alertes, documentation, restauration testée |

> [!exemple] Extrait de résumé d'audit
> « Les mots de passe sont hachés en MD5, un algorithme qui n'est plus sûr. Les requêtes de la page "commandes" sont construites par concaténation de texte : risque d'injection SQL. La table des commandes (1,2 million de lignes) n'a pas d'index sur la colonne client, ce qui explique les 6 secondes de chargement. Aucune sauvegarde n'a été testée. Priorités : sécurité cette semaine, index et sauvegardes ensuite. »

### Prioriser

| Priorité | Exemple |
| --- | --- |
| **Critique** (immédiat) | Faille de sécurité exploitable, absence de sauvegarde |
| **Élevée** | Lenteurs qui font perdre des clients, erreurs fréquentes |
| **Moyenne** | Dette technique qui ralentit les évolutions |
| **Faible** | Améliorations de confort |

## Mesurer la fiabilité et la performance

| Indicateur | Ce qu'il mesure | Exemple d'objectif |
| --- | --- | --- |
| **Disponibilité** | Part du temps où le service répond | 99,5 % par mois |
| **Temps de réponse** (médiane et 95e centile) | Rapidité pour la plupart et pour les plus lents | 95 % des requêtes en moins de 500 ms |
| **Taux d'erreur** | Réponses en erreur serveur | Moins de 0,5 % |
| **Délai de rétablissement** | Temps pour réparer une panne | Moins d'une heure |
| **Fréquence des mises en ligne** | Capacité à livrer souvent sans risque | Plusieurs fois par semaine |

> [!definition] 95e centile (p95)
> La valeur sous laquelle se trouvent 95 % des mesures. Un temps de réponse p95 de 800 ms signifie que 5 % des utilisateurs attendent plus de 800 ms. La moyenne cache souvent ces utilisateurs mécontents.

## Les offres à plus forte valeur

| Offre | Contenu |
| --- | --- |
| **Audit technique** | 7 domaines, priorités, plan d'action |
| **Correction de sécurité** | Failles critiques corrigées et vérifiées |
| **Optimisation de performance** | Mesures avant et après, index, cache |
| **Intégration de paiement** | Paiement, webhooks, réconciliation, tests |
| **Maintenance mensuelle** | Mises à jour, surveillance, corrections, petites évolutions |
| **Reprise d'une application** | Documentation, tests, modernisation progressive |

> [!retenir]
> - Spécialisez-vous : frameworks, intégrations, performance, sécurité, reprise de code ou exploitation.
> - Un audit en 7 domaines, avec des priorités du critique au faible.
> - Mesurez disponibilité, temps de réponse p95, erreurs et délai de rétablissement.
> - Vendez de la fiabilité et de la sécurité, pas des lignes de code.

## Exercice pratique : votre spécialité et votre audit

> [!exercice] Exercice pratique · 3 heures
> 1. Choisissez votre spécialité et justifiez votre choix en 5 lignes.
> 2. Auditez une application back-end open source ou votre projet Mofo Express sur les 7 domaines.
> 3. Classez au moins 10 constats par priorité.
> 4. Rédigez le résumé de l'audit et un plan d'action chiffré en jours.
>
> **À livrer** : votre choix, votre audit, vos priorités et votre plan.
