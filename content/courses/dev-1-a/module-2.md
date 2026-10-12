Au niveau Avancé, vous travaillez avec des outils qui accélèrent les professionnels : **PhpStorm**, **GitHub Copilot**, et un **hébergement VPS** que vous savez configurer et sécuriser vous-même. Vous adoptez aussi un **framework** et **Docker**, très demandés dans les offres. Ce module vous apprend à les utiliser sans perdre la maîtrise de votre système.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Utiliser les fonctions avancées de PhpStorm.
> 2. Utiliser GitHub Copilot de façon sûre.
> 3. Structurer une application avec un framework (exemple : Laravel).
> 4. Conteneuriser une application avec Docker.
> 5. Préparer et sécuriser un VPS de production.

## PhpStorm

> [!definition] PhpStorm
> Un éditeur payant de JetBrains spécialisé pour PHP, qui comprend les frameworks (Laravel, Symfony), les bases de données et les outils de test. Des licences gratuites existent pour les étudiants et certains projets libres : vérifiez sur le site officiel.

| Fonction | Utilité |
| --- | --- |
| **Refactorisation sûre** | Renommer une classe ou une méthode dans tout le projet |
| **Inspections** | Erreurs de type, code mort, failles probables |
| **Débogueur (Xdebug)** | Arrêter le code, inspecter les variables d'une requête réelle |
| **Base de données intégrée** | Écrire et tester des requêtes, voir les tables |
| **Client HTTP** | Fichiers de requêtes versionnés avec le projet |
| **Tests** | Lancer PHPUnit ou Pest et voir les résultats |

## GitHub Copilot : les bons usages

| Bon usage | Mauvais usage |
| --- | --- |
| Générer des données et des tests à partir d'un exemple | Accepter du code de sécurité (authentification, droits) sans le comprendre |
| Expliquer un vieux code PHP | Coller des secrets ou des données de clients dans la discussion |
| Écrire du code répétitif (migrations, validations) | Remplacer la lecture de la documentation officielle |
| Proposer des cas de test oubliés | Ignorer les licences de code proposé ressemblant à un projet connu |

> [!attention]
> Vérifiez que votre client **autorise** l'usage d'un assistant d'IA sur son code. Certains contrats l'interdisent ou l'encadrent. Et relisez chaque ligne : une requête SQL ou une vérification de droits générée peut contenir une faille.

## Structurer avec un framework

> [!exemple] Une route Laravel avec validation et autorisation
> ```php
> // routes/api.php
> Route::middleware('auth:sanctum')->post('/commandes', [CommandeController::class, 'store']);
>
> // app/Http/Controllers/CommandeController.php
> public function store(StoreCommandeRequest $request)
> {
>     $commande = DB::transaction(function () use ($request) {
>         $commande = $request->user()->commandes()->create(['statut' => 'en_attente_paiement']);
>         foreach ($request->validated('lignes') as $ligne) {
>             $produit = Produit::where('disponible', true)->findOrFail($ligne['produit_id']);
>             $commande->lignes()->create([
>                 'produit_id' => $produit->id,
>                 'quantite' => $ligne['quantite'],
>                 'prix_unitaire' => $produit->prix,
>             ]);
>         }
>         $commande->update(['total' => $commande->lignes->sum(fn ($l) => $l->quantite * $l->prix_unitaire)]);
>         return $commande;
>     });
>     return response()->json($commande, 201);
> }
> ```

| Élément du framework | Rôle |
| --- | --- |
| **Routes et middlewares** | Adresses, authentification, limites |
| **Requêtes de formulaire** (validation) | Règles de validation en un seul endroit |
| **Modèles et relations** (ORM) | Accès aux données, protégé contre l'injection |
| **Migrations** | Évolution du schéma de la base, versionnée |
| **Files d'attente** | Traitements longs en arrière-plan (e-mails, PDF) |
| **Tests** | Tests de fonctionnalités intégrés |

> [!astuce]
> Que vous choisissiez Laravel, Symfony ou NestJS, apprenez **un** framework à fond : sa documentation officielle, ses conventions et ses outils de test. Les principes se transposent ensuite facilement.

## Docker : la même application partout

> [!definition] Docker
> Un outil qui emballe l'application et tout ce dont elle a besoin (langage, bibliothèques, configuration) dans un **conteneur**. Elle fonctionne de la même façon sur votre ordinateur, sur le serveur de test et en production.

```yaml
# compose.yaml (développement)
services:
  api:
    build: .
    ports: ["3000:3000"]
    env_file: .env
    depends_on: [db]
  db:
    image: postgres:16
    environment:
      POSTGRES_PASSWORD: ${DB_PASSWORD}
    volumes: ["pgdata:/var/lib/postgresql/data"]
volumes:
  pgdata:
```

## Préparer et sécuriser un VPS

### La liste de contrôle

| N° | Action |
| --- | --- |
| 1 | Mises à jour du système, et mises à jour de sécurité automatiques |
| 2 | Utilisateur personnel avec sudo ; connexion root directe désactivée |
| 3 | Connexion SSH par clé uniquement (mot de passe désactivé) |
| 4 | Pare-feu : seulement les ports nécessaires (22, 80, 443) |
| 5 | Protection contre les tentatives répétées (par exemple Fail2ban) |
| 6 | Base de données non exposée sur Internet |
| 7 | HTTPS avec renouvellement automatique du certificat |
| 8 | Secrets dans des variables d'environnement, fichiers protégés |
| 9 | Sauvegardes automatiques **hors du serveur**, restauration testée |
| 10 | Surveillance : disponibilité, disque, mémoire, erreurs |

> [!madagascar]
> Choisissez un hébergeur avec des serveurs proches de vos utilisateurs (Europe, Afrique du Sud, océan Indien selon les offres) et un moyen de paiement que vous pouvez utiliser. Pour un client, **le serveur est à son nom** et à ses frais ; vous recevez un accès personnel. Vérifiez les prix sur les sites officiels.

> [!retenir]
> - PhpStorm : refactorisation, débogage, base de données et tests intégrés.
> - Copilot : utile pour le répétitif, jamais sans relecture, avec l'accord du client.
> - Un framework maîtrisé à fond : routes, validation, ORM, migrations, files, tests.
> - Docker pour une application identique partout.
> - Un VPS sécurisé en 10 points, avec sauvegardes hors serveur testées.

## Exercice pratique : un environnement professionnel

> [!exercice] Exercice pratique · 5 heures
> 1. Réécrivez 3 routes de votre API Mofo Express avec un framework (Laravel, Symfony ou NestJS), avec validation et autorisation.
> 2. Ajoutez une migration et un test de fonctionnalité par route.
> 3. Conteneurisez l'application et sa base avec Docker Compose.
> 4. Préparez un VPS (ou une machine virtuelle locale) avec la liste de contrôle en 10 points.
> 5. Déployez l'application et testez une restauration de sauvegarde.
>
> **À livrer** : le lien du dépôt, votre fichier compose et votre liste de contrôle remplie.
