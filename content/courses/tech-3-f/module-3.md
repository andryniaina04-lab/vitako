Ce module vous fait prendre en main les outils centraux du DevOps : **Docker** pour emballer les applications, **Docker Compose** pour lancer plusieurs services ensemble, **GitHub Actions** pour automatiser les tests et les mises en ligne. Vous découvrirez ensuite les services payants : **serveurs VPS ou cloud** (DigitalOcean, AWS) et la surveillance avec **Datadog**.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Comprendre et utiliser les conteneurs Docker.
> 2. Écrire un Dockerfile simple.
> 3. Lancer une application avec Docker Compose.
> 4. Créer un pipeline GitHub Actions.
> 5. Comprendre les offres VPS, cloud et de surveillance.

## Docker : les conteneurs

> [!definition] Conteneur
> Une application emballée avec tout ce dont elle a besoin (langage, bibliothèques, configuration). Elle fonctionne de la même façon sur l'ordinateur du développeur, sur le serveur de test et en production.

| Notion | Explication |
| --- | --- |
| **Image** | Le modèle de l'application (comme une recette) |
| **Conteneur** | Une image en cours d'exécution |
| **Dockerfile** | Le fichier qui décrit comment construire l'image |
| **Registre** | L'endroit où l'on stocke les images (Docker Hub, GitHub Container Registry) |
| **Volume** | Un espace pour garder les données quand le conteneur est recréé |

### Un Dockerfile simple

```dockerfile
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY . .
EXPOSE 3000
CMD ["node", "server.js"]
```

```bash
docker build -t mon-app .
docker run -d -p 3000:3000 --name mon-app mon-app
docker ps
docker logs mon-app
```

## Docker Compose : plusieurs services

```yaml
services:
  app:
    build: .
    ports:
      - "3000:3000"
    environment:
      DATABASE_URL: ${DATABASE_URL}
    depends_on:
      - db
  db:
    image: postgres:16
    environment:
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
    volumes:
      - donnees_db:/var/lib/postgresql/data
volumes:
  donnees_db:
```

```bash
docker compose up -d
docker compose ps
docker compose logs -f app
```

> [!attention]
> Les mots de passe ne s'écrivent **jamais** dans le fichier Compose ou dans le code. On les met dans un fichier `.env` qui n'est pas envoyé sur Git, ou dans un gestionnaire de secrets.

## GitHub Actions : automatiser

> [!definition] Intégration et déploiement continus (CI/CD)
> L'**intégration continue** lance automatiquement les tests à chaque modification du code. Le **déploiement continu** met automatiquement en ligne la nouvelle version quand les tests réussissent.

```yaml
name: Tests et construction
on:
  push:
    branches: [main]
  pull_request:
jobs:
  tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 20
      - run: npm ci
      - run: npm test
      - run: docker build -t mon-app .
```

| Bonne pratique | Pourquoi |
| --- | --- |
| **Secrets dans les paramètres du dépôt** | Jamais dans le fichier du workflow |
| **Tests avant le déploiement** | Ne pas mettre en ligne une version cassée |
| **Petites étapes** | Repérer facilement ce qui échoue |
| **Notifications** en cas d'échec | Réagir vite |

> [!madagascar]
> GitHub Actions s'exécute **sur les serveurs de GitHub**, pas sur votre ordinateur. Une coupure d'électricité ou de connexion chez vous n'empêche pas une mise en ligne automatique de se dérouler correctement.

## Les services payants

| Service | Ce qu'il apporte |
| --- | --- |
| **VPS** (DigitalOcean et autres hébergeurs) | Serveur virtuel simple, prix mensuel prévisible, idéal pour débuter et pour les petits projets |
| **Cloud** (AWS et autres grands fournisseurs) | Très nombreux services (serveurs, bases gérées, stockage, réseau) ; puissant mais plus complexe ; facturation à l'usage |
| **Datadog** | Surveillance complète : métriques, journaux, alertes, tableaux de bord |

> [!attention]
> Dans le cloud, une erreur de configuration peut coûter **très cher** (serveur oublié, trafic imprévu). Activez toujours des **alertes de budget** et éteignez les ressources de test après usage.

> [!madagascar]
> Ces services se paient en dollars par carte bancaire internationale, et c'est généralement **le client** qui paie l'hébergement à son nom. Pour vous former, utilisez les offres gratuites ou les crédits de départ des fournisseurs, en surveillant de près les limites.

> [!retenir]
> - Docker : image, conteneur, Dockerfile, registre, volume.
> - Docker Compose pour lancer application et base de données ensemble.
> - Aucun secret dans le code ni dans les fichiers versionnés.
> - GitHub Actions : tests et construction automatiques, secrets dans les paramètres.
> - VPS simple, cloud puissant mais à surveiller, Datadog pour la surveillance.

## Exercice pratique : une application conteneurisée

> [!exercice] Exercice pratique · 5 heures
> 1. Prenez une petite application web d'exemple (Node.js ou Python).
> 2. Écrivez son Dockerfile et lancez-la avec Docker.
> 3. Ajoutez une base de données avec Docker Compose et un fichier `.env` exclu de Git.
> 4. Créez un workflow GitHub Actions qui lance les tests et construit l'image.
>
> **À livrer** : le lien du dépôt et une capture d'une exécution réussie du workflow.
