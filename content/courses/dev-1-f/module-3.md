Ce module vous fait écrire votre première API avec **Node.js** et **Express**, connectée à **PostgreSQL**, puis vous montre l'équivalent en **PHP**. Vous apprendrez à tester une API, à gérer les erreurs et à utiliser Git. Vous découvrirez enfin les outils payants : **PhpStorm**, **GitHub Copilot** et l'**hébergement VPS**.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Créer une API simple avec Node.js et Express.
> 2. Vous connecter à PostgreSQL avec des requêtes préparées.
> 3. Valider les données et renvoyer les bons codes d'erreur.
> 4. Tester une API avec Postman ou un outil équivalent.
> 5. Comprendre ce qu'apportent PhpStorm, Copilot et un VPS.

## Les outils gratuits

| N° | Outil | À quoi il sert |
| --- | --- | --- |
| 1 | **Node.js** et **npm** | Exécuter du JavaScript côté serveur, installer des bibliothèques |
| 2 | **Express** | Créer des routes d'API simplement |
| 3 | **PHP** | Langage serveur, avec Composer pour les bibliothèques |
| 4 | **PostgreSQL** ou **MySQL** | Bases de données |
| 5 | **Postman** ou **Insomnia** | Tester les API |
| 6 | **Git** et **GitHub** | Historique et partage du code |

## Une API avec Node.js et Express

### Créer le projet

```bash
mkdir api-ravinala && cd api-ravinala
npm init -y
npm install express pg dotenv
```

### Le fichier de configuration (jamais publié)

```bash
# .env  (à ajouter dans .gitignore)
DATABASE_URL=postgres://utilisateur:motdepasse@localhost:5432/ravinala
PORT=3000
```

### Le serveur

```js
// server.js
require('dotenv').config();
const express = require('express');
const { Pool } = require('pg');

const app = express();
app.use(express.json());
const db = new Pool({ connectionString: process.env.DATABASE_URL });

// Lister les chambres
app.get('/api/chambres', async (req, res) => {
  const { rows } = await db.query('SELECT id, nom, capacite, prix_nuit FROM chambres ORDER BY prix_nuit');
  res.json(rows);
});

// Voir une chambre
app.get('/api/chambres/:id', async (req, res) => {
  const id = Number(req.params.id);
  if (!Number.isInteger(id)) return res.status(400).json({ erreur: 'Identifiant invalide' });
  const { rows } = await db.query('SELECT * FROM chambres WHERE id = $1', [id]);
  if (rows.length === 0) return res.status(404).json({ erreur: 'Chambre introuvable' });
  res.json(rows[0]);
});

app.listen(process.env.PORT, () => console.log('API sur le port ' + process.env.PORT));
```

> [!definition] Requête préparée
> Dans `WHERE id = $1`, la valeur est envoyée **à part** (`[id]`). La base la traite toujours comme une donnée, jamais comme du code : c'est la protection contre l'injection SQL.

## Valider les données et gérer les erreurs

```js
app.post('/api/reservations', async (req, res) => {
  const { client_id, chambre_id, arrivee, depart } = req.body;
  if (!client_id || !chambre_id || !arrivee || !depart) {
    return res.status(400).json({ erreur: 'Champs manquants' });
  }
  if (new Date(depart) <= new Date(arrivee)) {
    return res.status(400).json({ erreur: 'La date de départ doit être après la date d\'arrivée' });
  }
  try {
    const { rows: conflits } = await db.query(
      `SELECT 1 FROM reservations
       WHERE chambre_id = $1 AND statut <> 'annulee' AND arrivee < $3 AND depart > $2`,
      [chambre_id, arrivee, depart]
    );
    if (conflits.length > 0) return res.status(409).json({ erreur: 'Chambre déjà réservée' });

    const { rows } = await db.query(
      `INSERT INTO reservations (client_id, chambre_id, arrivee, depart)
       VALUES ($1, $2, $3, $4) RETURNING id, statut`,
      [client_id, chambre_id, arrivee, depart]
    );
    res.status(201).json(rows[0]);
  } catch (e) {
    console.error(e);
    res.status(500).json({ erreur: 'Erreur interne' });
  }
});
```

> [!attention]
> Ne renvoyez jamais le détail d'une erreur technique au client (message de la base, chemin des fichiers) : il peut aider un attaquant. Enregistrez-le dans vos journaux, et renvoyez un message simple.

## L'équivalent en PHP

```php
<?php
// chambre.php?id=3
$pdo = new PDO(getenv('DATABASE_DSN'), getenv('DB_USER'), getenv('DB_PASS'));
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);
header('Content-Type: application/json');
if ($id === false || $id === null) { http_response_code(400); echo json_encode(['erreur' => 'Identifiant invalide']); exit; }

$stmt = $pdo->prepare('SELECT id, nom, capacite, prix_nuit FROM chambres WHERE id = ?');
$stmt->execute([$id]);
$chambre = $stmt->fetch(PDO::FETCH_ASSOC);
if (!$chambre) { http_response_code(404); echo json_encode(['erreur' => 'Chambre introuvable']); exit; }
echo json_encode($chambre);
```

Dans les vrais projets PHP, on utilise souvent un framework comme **Laravel** ou **Symfony**, qui organise les routes, la base de données et la sécurité.

## Tester une API

1. **Lancez** le serveur : `node server.js`.
2. **Dans Postman** (ou Insomnia), créez une requête `GET http://localhost:3000/api/chambres`.
3. **Testez** les cas d'erreur : identifiant invalide, chambre inexistante, dates inversées, chambre déjà réservée.
4. **Enregistrez** vos requêtes dans une collection pour les rejouer à chaque modification.

> [!astuce]
> Pour chaque route, testez au moins **un cas qui marche** et **deux cas d'erreur**. La plupart des bugs se cachent dans les cas d'erreur.

## Les outils payants

| Outil | Ce qu'il apporte |
| --- | --- |
| **PhpStorm** | Éditeur complet de JetBrains pour PHP : refactorisation, débogage, base de données intégrée, compréhension de Laravel et Symfony |
| **GitHub Copilot** | Assistant d'IA dans l'éditeur : propose du code et des tests, explique du code existant |
| **Hébergement VPS** | Un serveur virtuel à vous (Linux) pour déployer vos API et vos bases de données |

> [!definition] VPS (serveur privé virtuel)
> Une partie d'un serveur physique louée chez un hébergeur, avec son propre système Linux. Vous y installez Node.js, PHP, PostgreSQL et votre application. Les offres d'entrée de gamme coûtent quelques dollars ou euros par mois.

> [!madagascar]
> Ces outils sont facturés en dollars ou en euros : PhpStorm et Copilot proposent des offres gratuites pour les étudiants, et Copilot a une offre gratuite limitée. Pour apprendre le déploiement, un petit VPS ou les offres gratuites de certains hébergeurs suffisent. Choisissez un serveur proche de vos utilisateurs (Europe, Afrique du Sud ou océan Indien) pour réduire les temps de réponse. Vérifiez les prix sur les sites officiels.

> [!retenir]
> - Express crée des routes ; `pg` se connecte à PostgreSQL avec des requêtes préparées.
> - Validez les données, renvoyez les bons codes, cachez les détails techniques.
> - PHP avec PDO suit les mêmes principes ; Laravel et Symfony organisent les gros projets.
> - Testez chaque route avec un cas réussi et des cas d'erreur.
> - PhpStorm, Copilot et un VPS quand vous travaillez sur de vrais projets.

## Exercice pratique : votre première API

> [!exercice] Exercice pratique · 4 heures
> 1. Créez la base de données de la maison d'hôtes (chambres, clients, réservations).
> 2. Créez l'API Express avec les routes : lister les chambres, voir une chambre, créer une réservation, annuler une réservation.
> 3. Ajoutez la validation et les codes d'erreur.
> 4. Testez toutes les routes dans Postman et enregistrez la collection.
> 5. Publiez le code sur GitHub, sans le fichier `.env`.
>
> **À livrer** : le lien de votre dépôt et l'export de votre collection Postman.
