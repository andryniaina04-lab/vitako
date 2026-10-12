Dans ce module, vous réalisez une API complète pour une petite entreprise : comptes utilisateurs, commandes, paiement par Mobile Money vérifié manuellement, tests et mise en ligne sur un serveur. C'est le type de projet qui deviendra votre premier projet de portfolio back-end.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Concevoir une API à partir d'un besoin.
> 2. Gérer l'inscription, la connexion et les droits.
> 3. Gérer un circuit de commande et de paiement.
> 4. Écrire des tests automatiques d'API.
> 5. Déployer une API sur un serveur avec HTTPS.

## Le cas pratique : « Mofo Express »

> [!exemple] Votre client
> **Mofo Express** est une petite boulangerie d'Antsirabe qui veut prendre des commandes en ligne (pain, mofo gasy, gâteaux) pour retrait en boutique. Les clients paient par Mobile Money et saisissent la référence de la transaction ; le gérant vérifie le paiement dans son application et valide la commande. Une développeuse front-end prépare le site ; vous construisez l'API.

## Étape 1 : concevoir l'API

### Les tables

| Table | Colonnes principales |
| --- | --- |
| **utilisateurs** | id, nom, telephone, email, mot_de_passe_hash, role (client ou gerant) |
| **produits** | id, nom, prix, disponible |
| **commandes** | id, utilisateur_id, statut, total, retrait_le, cree_le |
| **lignes_commande** | id, commande_id, produit_id, quantite, prix_unitaire |
| **paiements** | id, commande_id, moyen, reference, statut, verifie_par, verifie_le |

### Les routes

| Route | Qui | Action |
| --- | --- | --- |
| `POST /api/inscription` | Tous | Créer un compte |
| `POST /api/connexion` | Tous | Se connecter, recevoir un jeton |
| `GET /api/produits` | Tous | Lister les produits disponibles |
| `POST /api/commandes` | Client | Créer une commande |
| `POST /api/commandes/:id/paiement` | Client | Saisir la référence Mobile Money |
| `GET /api/mes-commandes` | Client | Voir ses commandes |
| `GET /api/gerant/paiements` | Gérant | Voir les paiements à vérifier |
| `POST /api/gerant/paiements/:id/valider` | Gérant | Valider ou refuser |

> [!attention]
> Le **prix** d'une commande doit être calculé **par le serveur**, à partir des prix de la base. Ne faites jamais confiance au total envoyé par le navigateur : un utilisateur peut le modifier.

## Étape 2 : comptes, connexion et droits

```js
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

// Inscription : le mot de passe est haché, jamais stocké en clair
const hash = await bcrypt.hash(motDePasse, 12);
await db.query(
  'INSERT INTO utilisateurs (nom, telephone, mot_de_passe_hash, role) VALUES ($1, $2, $3, $4)',
  [nom, telephone, hash, 'client']
);

// Connexion : on compare, puis on signe un jeton
const ok = await bcrypt.compare(motDePasse, utilisateur.mot_de_passe_hash);
if (!ok) return res.status(401).json({ erreur: 'Identifiants incorrects' });
const jeton = jwt.sign({ id: utilisateur.id, role: utilisateur.role }, process.env.JWT_SECRET, { expiresIn: '7d' });

// Vérifier le jeton et le rôle avant les routes protégées
function exigeRole(role) {
  return (req, res, next) => {
    try {
      const donnees = jwt.verify((req.headers.authorization || '').replace('Bearer ', ''), process.env.JWT_SECRET);
      if (role && donnees.role !== role) return res.status(403).json({ erreur: 'Accès interdit' });
      req.utilisateur = donnees;
      next();
    } catch {
      res.status(401).json({ erreur: 'Connexion requise' });
    }
  };
}
app.get('/api/gerant/paiements', exigeRole('gerant'), listerPaiements);
```

> [!definition] Jeton (JWT)
> Un texte signé par le serveur, qui prouve l'identité de l'utilisateur à chaque requête. Le serveur vérifie la signature avec un secret que lui seul connaît.

> [!astuce]
> Message d'erreur de connexion : dites toujours « Identifiants incorrects », sans préciser si c'est le téléphone ou le mot de passe qui est faux. Vous ne donnez pas d'indice à quelqu'un qui essaie de deviner les comptes.

## Étape 3 : commande et paiement

### Les statuts d'une commande

```
en_attente_paiement → paiement_a_verifier → confirmee → prete → retiree
                                        ↘ refusee
```

### Les règles

1. Une **référence de transaction** ne peut être utilisée qu'**une seule fois** (contrainte `UNIQUE` dans la base).
2. Seul le **gérant** peut valider un paiement, et la validation enregistre **qui** et **quand**.
3. Le passage d'un statut à l'autre suit l'ordre prévu : une commande refusée ne peut pas devenir « prête ».
4. La validation d'un paiement et le changement de statut de la commande se font dans **une même transaction** de base de données.

> [!definition] Transaction
> Un groupe d'opérations exécutées « tout ou rien » : si une étape échoue, aucune modification n'est enregistrée. Elle évite par exemple un paiement validé dont la commande serait restée « en attente ».

## Étape 4 : les tests automatiques

```js
// commandes.test.js (avec Vitest et Supertest)
import { describe, it, expect } from 'vitest';
import request from 'supertest';
import { app } from './app.js';

describe('POST /api/commandes', () => {
  it('refuse une commande sans connexion', async () => {
    const res = await request(app).post('/api/commandes').send({ lignes: [] });
    expect(res.status).toBe(401);
  });
  it('calcule le total côté serveur', async () => {
    const res = await request(app)
      .post('/api/commandes')
      .set('Authorization', 'Bearer ' + jetonClientTest)
      .send({ lignes: [{ produit_id: 1, quantite: 10 }], total: 1 });
    expect(res.status).toBe(201);
    expect(res.body.total).toBe(10 * 500); // le total envoyé (1) est ignoré
  });
});
```

| Cas à tester | Résultat attendu |
| --- | --- |
| Commande sans connexion | 401 |
| Client qui appelle une route du gérant | 403 |
| Référence Mobile Money déjà utilisée | 409 |
| Total modifié par le navigateur | Ignoré, recalculé |
| Validation par le gérant | Commande « confirmee », trace de qui et quand |

## Étape 5 : déployer

1. **Louez** un petit VPS Linux (ou utilisez une plateforme d'hébergement d'applications).
2. **Installez** Node.js, PostgreSQL et un serveur web (Nginx) en proxy.
3. **Configurez** les variables d'environnement sur le serveur.
4. **Lancez** l'application avec un gestionnaire de processus (PM2 ou systemd) pour qu'elle redémarre en cas de panne.
5. **Activez HTTPS** avec un certificat gratuit (Let's Encrypt).
6. **Programmez** une sauvegarde quotidienne de la base de données, et testez une restauration.

> [!madagascar]
> Prévoyez des réponses **légères** (seulement les champs utiles) et des messages d'erreur clairs : beaucoup d'utilisateurs auront une connexion lente. Côté gérant, pensez à une notification (SMS ou e-mail) quand un paiement attend sa vérification, pour que les clients ne patientent pas.

> [!retenir]
> - Concevez tables et routes avant de coder ; le serveur calcule les prix.
> - Mots de passe hachés, jetons signés, rôles vérifiés.
> - Statuts de commande contrôlés, référence unique, transactions.
> - Tests automatiques des cas d'erreur et de sécurité.
> - Déploiement avec variables d'environnement, HTTPS et sauvegardes testées.

## Exercice pratique : l'API Mofo Express

> [!exercice] Exercice pratique · 10 heures (sur plusieurs jours)
> 1. Créez les tables avec leurs contraintes (dont la référence de paiement unique).
> 2. Codez les 8 routes avec la validation et les rôles.
> 3. Écrivez au moins 8 tests automatiques, dont les 5 cas du tableau.
> 4. Documentez l'API dans le README (routes, exemples de requêtes et de réponses).
> 5. Déployez sur un serveur avec HTTPS, ou préparez un guide de déploiement précis si vous n'avez pas encore de serveur.
>
> **À livrer** : le lien du dépôt, le README et l'adresse de l'API en ligne (ou le guide). C'est votre projet de portfolio.
