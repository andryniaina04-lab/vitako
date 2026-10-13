Dans ce module, vous mettez en production l'application d'un client sur un serveur VPS, comme le ferait un administrateur indépendant. Vous apprendrez à préparer le serveur, à déployer avec Docker, à configurer le nom de domaine et le HTTPS, à automatiser les mises en ligne, à surveiller et à sauvegarder.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Préparer et sécuriser un serveur de production.
> 2. Déployer une application avec Docker Compose et Nginx.
> 3. Configurer le nom de domaine et le HTTPS.
> 4. Automatiser le déploiement.
> 5. Mettre en place surveillance, sauvegardes et documentation.

## Le cas pratique : « Tsena Online »

> [!exemple] Votre client
> **Tsena Online** est une petite place de marché en ligne pour des producteurs de la région d'Antsirabe. Le développeur a terminé l'application (Node.js et PostgreSQL) et la fait tourner sur son ordinateur. Il vous confie la mise en production sur un VPS loué par le client, avec le nom de domaine tsena-online.mg (exemple), le HTTPS, les mises à jour automatiques et des sauvegardes.

## Étape 1 : préparer le serveur

| N° | Action |
| --- | --- |
| 1 | Créer le VPS au nom du client, avec votre accès |
| 2 | Mettre à jour le système |
| 3 | Créer un utilisateur administrateur, connexion SSH par clé |
| 4 | Désactiver la connexion root et par mot de passe (après test) |
| 5 | Activer le pare-feu : SSH, HTTP, HTTPS seulement |
| 6 | Activer les mises à jour de sécurité automatiques |
| 7 | Installer Docker et Docker Compose |

## Étape 2 : déployer

| Élément | Rôle |
| --- | --- |
| **Conteneur de l'application** | Le code du client |
| **Conteneur PostgreSQL** | La base de données, avec un volume |
| **Nginx** | Reçoit les requêtes et les transmet à l'application (proxy inverse) |
| **Fichier .env** sur le serveur | Mots de passe et paramètres, droits limités |

> [!definition] Proxy inverse
> Un serveur (ici Nginx) placé devant l'application. Il reçoit les visiteurs, gère le HTTPS, et transmet les requêtes à l'application qui tourne en interne.

```nginx
server {
    server_name tsena-online.mg www.tsena-online.mg;

    location / {
        proxy_pass http://127.0.0.1:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

## Étape 3 : nom de domaine et HTTPS

| Étape | Action |
| --- | --- |
| **DNS** | Enregistrement A du domaine vers l'adresse IP du serveur |
| **Attente** | La propagation peut prendre de quelques minutes à quelques heures |
| **Certificat** | Certificat gratuit avec Let's Encrypt (outil Certbot) |
| **Renouvellement** | Automatique, à vérifier |
| **Redirection** | Tout le trafic HTTP vers HTTPS |

```bash
sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d tsena-online.mg -d www.tsena-online.mg
sudo certbot renew --dry-run
```

## Étape 4 : automatiser le déploiement

| Étape du pipeline | Action |
| --- | --- |
| 1 | Le développeur envoie son code sur la branche principale |
| 2 | GitHub Actions lance les tests |
| 3 | Si les tests réussissent, l'image est construite et publiée dans un registre |
| 4 | Le serveur récupère la nouvelle image et redémarre le conteneur |
| 5 | Une vérification confirme que le site répond |

> [!attention]
> Prévoyez toujours un **retour arrière** : garder l'image précédente et savoir la relancer en une commande. Une mise en ligne qui casse le site doit pouvoir être annulée en quelques minutes.

## Étape 5 : surveillance, sauvegardes et documentation

### La surveillance

| Élément | Outil possible |
| --- | --- |
| Le site répond-il ? | Service gratuit de vérification de disponibilité avec alerte |
| Disque, mémoire, processeur | Outils de l'hébergeur ou agent de surveillance |
| Erreurs de l'application | Journaux des conteneurs |
| Certificat bientôt expiré | Alerte de renouvellement |

### Les sauvegardes

| Règle | Exemple |
| --- | --- |
| **Base de données chaque jour** | Export PostgreSQL automatique |
| **Copie hors du serveur** | Stockage externe (autre fournisseur ou autre région) |
| **Plusieurs versions** | 7 jours, 4 semaines, 3 mois |
| **Restauration testée** | Une fois par mois sur un serveur de test |

> [!madagascar]
> Pour un client malgache, rappelez que les **coupures de connexion** de ses utilisateurs ne viennent pas du serveur. Votre surveillance doit mesurer la disponibilité du serveur depuis l'extérieur, pour distinguer un vrai problème du serveur d'un problème de réseau local.

### La documentation livrée

```
Documentation – Tsena Online
1. Architecture : VPS, Docker Compose (app, PostgreSQL), Nginx, HTTPS
2. Accès : qui a accès, comment les retirer (sans mots de passe dans le document)
3. Déploiement : pipeline GitHub Actions, retour arrière
4. Sauvegardes : fréquence, emplacement, procédure de restauration
5. Surveillance : alertes et destinataires
6. Procédures d'urgence : site en panne, disque plein, certificat expiré
```

> [!retenir]
> - Serveur à jour, accès par clé, pare-feu, mises à jour de sécurité automatiques.
> - Application et base dans Docker Compose, Nginx en proxy inverse, secrets dans .env.
> - DNS vers le serveur, HTTPS gratuit avec renouvellement automatique.
> - Déploiement automatique avec tests et retour arrière possible.
> - Surveillance, sauvegardes testées hors du serveur et documentation complète.

## Exercice pratique : la mise en production de Tsena Online

> [!exercice] Exercice pratique · 10 heures (sur plusieurs jours)
> 1. Préparez et sécurisez un serveur (machine virtuelle ou petit VPS).
> 2. Déployez l'application du module 3 avec Docker Compose et Nginx.
> 3. Si vous avez un nom de domaine, configurez le HTTPS ; sinon, décrivez précisément les étapes.
> 4. Automatisez le déploiement et testez un retour arrière.
> 5. Mettez en place une sauvegarde quotidienne, testez une restauration et rédigez la documentation.
>
> **À livrer** : vos fichiers de configuration (sans secrets), des captures et la documentation. C'est votre projet de portfolio.
