Ce module vous donne les bases du back-end : le protocole HTTP, les API REST, la conception d'une base de données relationnelle, le SQL, et les règles de sécurité qu'aucun développeur ne peut ignorer.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Expliquer les méthodes et les codes de réponse HTTP.
> 2. Concevoir des routes d'API REST.
> 3. Concevoir une base de données avec des tables reliées.
> 4. Écrire les requêtes SQL essentielles.
> 5. Appliquer 6 règles de sécurité de base.

## HTTP : le langage du web

### Les méthodes

| Méthode | Usage | Exemple |
| --- | --- | --- |
| **GET** | Lire | Lire la liste des chambres |
| **POST** | Créer | Créer une réservation |
| **PUT** ou **PATCH** | Modifier | Changer les dates d'une réservation |
| **DELETE** | Supprimer | Annuler une réservation |

### Les codes de réponse

| Code | Signification | Exemple |
| --- | --- | --- |
| **200** | Succès | La liste est renvoyée |
| **201** | Créé | La réservation est enregistrée |
| **400** | Requête invalide | Date de départ avant la date d'arrivée |
| **401** | Non authentifié | Utilisateur non connecté |
| **403** | Interdit | Un client essaie de voir la réservation d'un autre |
| **404** | Introuvable | Chambre inexistante |
| **409** | Conflit | La chambre est déjà réservée |
| **500** | Erreur du serveur | Bug dans le programme |

## Les API REST

> [!definition] API REST
> Une façon d'organiser une API autour de **ressources** (chambres, réservations, clients) avec des adresses claires et les méthodes HTTP. Les données sont souvent échangées au format **JSON**.

| Méthode et adresse | Action |
| --- | --- |
| `GET /api/chambres` | Lister les chambres |
| `GET /api/chambres/3` | Voir la chambre 3 |
| `POST /api/reservations` | Créer une réservation |
| `GET /api/reservations/4821` | Voir une réservation |
| `DELETE /api/reservations/4821` | Annuler une réservation |

```json
{
  "chambre_id": 3,
  "arrivee": "2026-07-12",
  "depart": "2026-07-15",
  "personnes": 2
}
```

## Concevoir une base de données

> [!definition] Base de données relationnelle
> Des données rangées dans des **tables** (comme des feuilles de calcul), reliées entre elles par des **clés**. PostgreSQL et MySQL sont les plus utilisées.

### Les tables d'une maison d'hôtes

| Table | Colonnes principales |
| --- | --- |
| **clients** | id, nom, email, telephone, cree_le |
| **chambres** | id, nom, capacite, prix_nuit |
| **reservations** | id, client_id, chambre_id, arrivee, depart, statut, cree_le |
| **paiements** | id, reservation_id, montant, moyen, reference, statut |

```sql
CREATE TABLE chambres (
  id SERIAL PRIMARY KEY,
  nom TEXT NOT NULL,
  capacite INTEGER NOT NULL CHECK (capacite > 0),
  prix_nuit INTEGER NOT NULL CHECK (prix_nuit >= 0)
);

CREATE TABLE reservations (
  id SERIAL PRIMARY KEY,
  client_id INTEGER NOT NULL REFERENCES clients(id),
  chambre_id INTEGER NOT NULL REFERENCES chambres(id),
  arrivee DATE NOT NULL,
  depart DATE NOT NULL CHECK (depart > arrivee),
  statut TEXT NOT NULL DEFAULT 'en_attente',
  cree_le TIMESTAMP NOT NULL DEFAULT now()
);
```

> [!definition] Clé primaire et clé étrangère
> La **clé primaire** (`id`) identifie chaque ligne de façon unique. La **clé étrangère** (`client_id`) relie une ligne à une ligne d'une autre table. La base refuse une réservation pour un client qui n'existe pas.

## Le SQL essentiel

```sql
-- Ajouter une chambre
INSERT INTO chambres (nom, capacite, prix_nuit) VALUES ('Baobab', 2, 180000);

-- Chambres pour 2 personnes ou plus, de la moins chère à la plus chère
SELECT nom, prix_nuit FROM chambres WHERE capacite >= 2 ORDER BY prix_nuit;

-- La chambre 3 est-elle libre du 12 au 15 juillet ?
SELECT COUNT(*) FROM reservations
WHERE chambre_id = 3
  AND statut <> 'annulee'
  AND arrivee < '2026-07-15'
  AND depart > '2026-07-12';

-- Modifier le statut d'une réservation
UPDATE reservations SET statut = 'confirmee' WHERE id = 4821;
```

> [!attention]
> Un `UPDATE` ou un `DELETE` **sans** `WHERE` modifie ou supprime **toutes** les lignes de la table. Relisez toujours ces requêtes avant de les exécuter, et travaillez d'abord sur une base de test.

## Les 6 règles de sécurité de base

| N° | Règle | Pourquoi |
| --- | --- | --- |
| 1 | **Ne jamais faire confiance aux données reçues** : tout vérifier côté serveur | Le front-end peut être contourné |
| 2 | **Requêtes préparées** (paramètres), jamais de SQL construit avec du texte de l'utilisateur | Éviter l'injection SQL |
| 3 | **Mots de passe hachés** avec un algorithme adapté (bcrypt, Argon2), jamais en clair | Une fuite de base ne révèle pas les mots de passe |
| 4 | **Vérifier les droits** à chaque requête | Un client ne doit pas voir les données d'un autre |
| 5 | **Secrets hors du code** (variables d'environnement) | Une clé publiée sur GitHub peut être volée en quelques minutes |
| 6 | **HTTPS** partout | Les données ne circulent pas en clair |

> [!exemple] L'injection SQL
> Si un programme construit `"SELECT * FROM clients WHERE email = '" + email + "'"`, un attaquant peut envoyer un texte spécial qui transforme la requête et lit toute la table. Avec une requête préparée (`WHERE email = $1`), la valeur est toujours traitée comme une donnée, jamais comme du code.

> [!madagascar]
> Les applications malgaches manipulent souvent des **numéros de téléphone** et des **références de paiement Mobile Money**. Ce sont des données personnelles et financières : protégez-les comme des mots de passe (accès limité, journaux sans données sensibles en clair).

> [!retenir]
> - GET lit, POST crée, PUT ou PATCH modifie, DELETE supprime.
> - Des codes de réponse précis : 200, 201, 400, 401, 403, 404, 409, 500.
> - Des tables reliées par des clés, avec des contraintes.
> - SELECT, INSERT, UPDATE et DELETE, toujours avec WHERE pour modifier.
> - 6 règles de sécurité, dès la première ligne de code.

## Exercice pratique : concevoir une API

> [!exercice] Exercice pratique · 3 heures
> 1. Concevez les tables d'une petite boutique (produits, clients, commandes, lignes de commande) et dessinez leurs relations.
> 2. Écrivez les requêtes CREATE TABLE avec clés et contraintes, et exécutez-les dans PostgreSQL ou MySQL.
> 3. Insérez des données de test et écrivez 10 requêtes SELECT, dont 2 avec jointure.
> 4. Listez les routes REST de la boutique avec la méthode, l'adresse, les données envoyées et les codes de réponse possibles.
>
> **À livrer** : votre schéma, votre fichier SQL et votre liste de routes.
