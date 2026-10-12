Les entreprises étrangères et les entreprises de services numériques qui travaillent pour l'Europe offrent les missions back-end les mieux payées. Elles attendent des standards de sécurité reconnus, le respect de la protection des données, une communication technique claire en anglais et la capacité à concevoir un système, pas seulement du code. Ce module vous y prépare.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Appliquer les risques de l'OWASP Top 10 à votre code.
> 2. Concevoir une application conforme aux principes de protection des données.
> 3. Rédiger une documentation d'API et une décision d'architecture.
> 4. Communiquer en anglais dans une équipe asynchrone.
> 5. Réussir un entretien de conception de système.

## Les risques de sécurité les plus courants

> [!definition] OWASP Top 10
> Une liste de référence, publiée par la fondation OWASP, des risques de sécurité les plus critiques des applications web. Elle est mise à jour régulièrement et sert de base à beaucoup d'exigences de clients.

| Risque (exemples de la liste) | Exemple | Protection |
| --- | --- | --- |
| **Contrôle d'accès défaillant** | Un client lit la commande d'un autre en changeant l'identifiant dans l'URL | Vérifier les droits sur chaque ressource, côté serveur |
| **Défaillances cryptographiques** | Mots de passe en MD5, données sensibles en clair | Algorithmes adaptés, HTTPS, chiffrement des données sensibles |
| **Injection** | Injection SQL | Requêtes préparées, ORM, validation |
| **Mauvaise configuration** | Mode débogage actif en production | Configuration de production revue |
| **Composants vulnérables** | Bibliothèque non mise à jour | Mises à jour régulières, audit des dépendances |
| **Authentification défaillante** | Pas de limite de tentatives | Limitation, double authentification, sessions sûres |
| **Journalisation insuffisante** | Attaque non détectée | Journaux de sécurité et alertes |

> [!attention]
> Ne testez jamais la sécurité d'un système **sans autorisation écrite** de son propriétaire. Pour vous entraîner, utilisez vos propres applications ou des environnements d'entraînement prévus pour cela.

## La protection des données dès la conception

| Principe | Application |
| --- | --- |
| **Minimisation** | Ne collecter que les champs nécessaires |
| **Limitation de la conservation** | Supprimer ou anonymiser les données après une durée définie |
| **Sécurité** | Chiffrement, accès limités, journaux d'accès |
| **Droits des personnes** | Pouvoir exporter, corriger et supprimer les données d'un utilisateur |
| **Sous-traitants** | Savoir où sont hébergées les données et par qui (hébergeur, e-mails, SMS) |

Le RGPD s'applique dès qu'une application traite les données de personnes en Europe ; Madagascar a sa propre loi sur la protection des données personnelles. Les choix juridiques reviennent au client et à ses conseillers ; votre rôle est de rendre la conformité **techniquement possible**.

## La documentation professionnelle

### La documentation d'API (OpenAPI)

```yaml
paths:
  /api/commandes:
    post:
      summary: Créer une commande
      security: [{ bearerAuth: [] }]
      requestBody:
        content:
          application/json:
            schema:
              type: object
              required: [lignes]
              properties:
                lignes:
                  type: array
                  items: { type: object, properties: { produit_id: { type: integer }, quantite: { type: integer, minimum: 1 } } }
      responses:
        "201": { description: Commande créée }
        "401": { description: Connexion requise }
        "422": { description: Données invalides }
```

### La décision d'architecture

> [!definition] ADR (Architecture Decision Record)
> Une courte note qui garde la trace d'une décision technique : le contexte, la décision, les options écartées et les conséquences. Elle évite de refaire les mêmes débats et aide les nouveaux arrivants.

```
ADR 007 – Utiliser une file d'attente pour les webhooks de paiement
Contexte : les webhooks arrivent en double et certains traitements prennent 5 secondes.
Décision : répondre immédiatement au webhook, enregistrer l'événement (identifiant unique), traiter dans une file.
Options écartées : traitement direct (lent, risque d'expiration).
Conséquences : besoin de Redis en production ; surveillance de la file à ajouter.
```

## Communiquer en anglais

| Situation | Anglais |
| --- | --- |
| Point quotidien | "Yesterday I added idempotency to the payment webhook. Today I'm adding the daily reconciliation job. No blockers." |
| Description de pull request | "This PR fixes an N+1 query on /orders (from 41 queries to 2). Tested with 10k orders." |
| Incident | "Heads-up: the API returned 500 errors from 10:12 to 10:19 UTC due to a full disk. Logs rotated, disk alert added. Post-mortem to follow." |
| Question | "Should orders be soft-deleted or hard-deleted when a user deletes their account?" |

> [!madagascar]
> Indiquez les heures d'incident en **UTC** dans vos messages à une équipe internationale : chacun les convertit dans son fuseau, et il n'y a pas de confusion entre l'heure d'Antananarivo, de Paris ou de Montréal.

## L'entretien de conception de système

### La méthode en 6 étapes

1. **Clarifier les besoins** : fonctions, nombre d'utilisateurs, volumes, contraintes.
2. **Estimer** les ordres de grandeur : requêtes par seconde, taille des données.
3. **Proposer une architecture simple** : API, base de données, cache, file d'attente.
4. **Détailler** le modèle de données et les routes principales.
5. **Discuter des points difficiles** : pics de charge, pannes, sécurité, cohérence.
6. **Expliquer les compromis** : pourquoi ce choix plutôt qu'un autre.

> [!astuce]
> Commencez **simple** et faites évoluer la conception quand l'interlocuteur ajoute des contraintes. Les recruteurs évaluent votre raisonnement et vos compromis, pas une architecture compliquée dès la première minute.

> [!retenir]
> - L'OWASP Top 10 comme liste de contrôle, et jamais de test sans autorisation.
> - Une application qui rend la protection des données techniquement possible.
> - Une documentation OpenAPI et des ADR pour les décisions.
> - Des messages en anglais clairs, avec les heures en UTC.
> - La conception de système en 6 étapes, simple puis détaillée.

## Exercice pratique : prêt pour l'international

> [!exercice] Exercice pratique · 4 heures
> 1. Vérifiez votre projet avec les 7 risques du tableau et corrigez ce qui doit l'être.
> 2. Ajoutez l'export et la suppression des données d'un utilisateur.
> 3. Rédigez la documentation OpenAPI de 5 routes et 2 ADR.
> 4. Rédigez en anglais 3 descriptions de pull request et un message d'incident.
> 5. Entraînez-vous à concevoir à voix haute « un service de réservation de taxi-brousse » en 45 minutes.
>
> **À livrer** : vos corrections, votre documentation, vos ADR, vos textes en anglais et votre schéma de conception.
