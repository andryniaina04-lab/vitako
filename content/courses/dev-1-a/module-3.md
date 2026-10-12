Une application professionnelle doit rester rapide quand les données grossissent, ne pas perdre de données en cas de panne, et pouvoir évoluer chaque semaine sans régression. Ce module vous donne les méthodes des équipes back-end : tests à plusieurs niveaux, intégration continue, performance des bases de données, traitements en arrière-plan, journaux et surveillance.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Construire une stratégie de tests et l'intégration continue.
> 2. Diagnostiquer une requête lente et créer les bons index.
> 3. Utiliser le cache et les files d'attente.
> 4. Rendre les traitements fiables face aux doublons et aux pannes.
> 5. Mettre en place journaux, surveillance et alertes.

## Les tests et l'intégration continue

| Niveau | Ce qu'il vérifie | Exemple |
| --- | --- | --- |
| **Unitaire** | Une fonction ou une classe seule | Calcul du total d'une commande |
| **Intégration** | Le code avec la vraie base de données | Création d'une commande et de ses lignes |
| **Fonctionnel (API)** | Une route complète, avec authentification | POST /api/commandes renvoie 201 et le bon total |
| **Contrat** | Le format échangé avec un autre service | Le webhook de paiement est bien compris |

```yaml
# .github/workflows/ci.yml
name: CI
on: [push, pull_request]
jobs:
  tests:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:16
        env: { POSTGRES_PASSWORD: test }
        ports: ["5432:5432"]
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: 22 }
      - run: npm ci
      - run: npm run lint
      - run: npm test
        env: { DATABASE_URL: postgres://postgres:test@localhost:5432/postgres }
```

> [!astuce]
> Quand vous corrigez un bug, écrivez d'abord le **test qui le reproduit**, puis la correction. Le bug ne reviendra pas sans que l'intégration continue le signale.

## La performance des bases de données

### Diagnostiquer une requête lente

```sql
EXPLAIN ANALYZE
SELECT * FROM commandes WHERE utilisateur_id = 4821 ORDER BY cree_le DESC LIMIT 20;
-- Résultat : "Seq Scan on commandes" sur 1 200 000 lignes, 2 400 ms

CREATE INDEX idx_commandes_utilisateur_date ON commandes (utilisateur_id, cree_le DESC);
-- Nouveau résultat : "Index Scan", 3 ms
```

> [!definition] Index
> Une structure qui permet à la base de trouver rapidement les lignes, comme l'index d'un livre. Il accélère les lectures, mais ralentit un peu les écritures et prend de la place : on crée les index utiles, pas tous les index possibles.

### Les problèmes fréquents

| Problème | Symptôme | Solution |
| --- | --- | --- |
| **Requêtes N+1** | 1 requête pour la liste + 1 requête par élément | Chargement groupé (eager loading, jointure) |
| **Absence d'index** | Parcours complet de la table | Index sur les colonnes de filtre et de tri |
| `SELECT *` sur de grosses tables | Données inutiles transférées | Sélectionner seulement les colonnes utiles |
| **Pagination par OFFSET** sur de très grandes tables | Pages lointaines lentes | Pagination par curseur |

## Le cache et les files d'attente

| Outil | Usage | Exemple |
| --- | --- | --- |
| **Cache** (Redis, mémoire) | Garder un résultat coûteux pendant un temps | Liste des produits mise en cache 5 minutes |
| **File d'attente** | Faire un traitement long en arrière-plan | Envoi d'e-mails, génération de PDF, appels à un service lent |

> [!attention]
> Le cache crée un risque de **données périmées**. Définissez pour chaque cache une **durée** et un moyen de l'**invalider** (par exemple quand un produit est modifié).

## La fiabilité : doublons et pannes

> [!definition] Idempotence
> Une opération est idempotente si l'exécuter plusieurs fois donne le même résultat qu'une seule fois. C'est indispensable pour les paiements et les webhooks, qui peuvent être envoyés plusieurs fois.

### Les règles pour les paiements et les webhooks

1. **Vérifier la signature** de chaque webhook reçu.
2. **Enregistrer l'identifiant** de l'événement avec une contrainte d'unicité : un événement déjà traité est ignoré.
3. **Utiliser une transaction** pour mettre à jour paiement et commande ensemble.
4. **Répondre vite** au webhook et faire le travail long dans une file d'attente.
5. **Réconcilier** chaque jour : comparer les paiements reçus par le fournisseur et ceux enregistrés.

> [!madagascar]
> Avec les API de paiement mobile, les confirmations peuvent arriver **en retard** ou **plusieurs fois**, et les connexions des utilisateurs peuvent se couper pendant le paiement. Prévoyez des statuts intermédiaires (« en attente de confirmation »), une vérification de statut auprès du fournisseur, et une réconciliation quotidienne.

## Journaux, surveillance et alertes

| Élément | Bonne pratique |
| --- | --- |
| **Journaux structurés** | Format JSON avec date, niveau, identifiant de requête, message |
| **Pas de données sensibles** dans les journaux | Pas de mots de passe, jetons, numéros complets |
| **Surveillance de disponibilité** | Un service externe appelle une route de santé chaque minute |
| **Indicateurs** | Temps de réponse, erreurs, utilisation du disque et de la mémoire |
| **Alertes** | Seulement sur ce qui demande une action, envoyées à la bonne personne |
| **Procédures d'incident** | Que faire, qui prévenir, comment revenir à la version précédente |

> [!retenir]
> - Des tests à plusieurs niveaux, un test pour chaque bug corrigé, l'intégration continue.
> - EXPLAIN pour diagnostiquer, des index utiles, pas de N+1.
> - Cache avec durée et invalidation, files d'attente pour les traitements longs.
> - Idempotence, signatures, transactions et réconciliation pour les paiements.
> - Journaux sans données sensibles, surveillance et alertes utiles.

## Exercice pratique : un service fiable

> [!exercice] Exercice pratique · 5 heures
> 1. Ajoutez des tests d'intégration et un workflow d'intégration continue à votre projet.
> 2. Générez 1 million de lignes de commandes de test, trouvez une requête lente avec EXPLAIN et corrigez-la.
> 3. Ajoutez un cache avec invalidation sur la liste des produits.
> 4. Simulez un webhook de paiement envoyé 3 fois et prouvez par un test qu'il n'est traité qu'une fois.
> 5. Ajoutez des journaux structurés et une route de santé surveillée.
>
> **À livrer** : le lien du dépôt, le résultat d'EXPLAIN avant et après, et vos tests.
