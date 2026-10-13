Ce module vous donne les bases de Linux pour l'administration : se déplacer et gérer les fichiers, les utilisateurs et les droits, les paquets et les services, les journaux, la connexion SSH par clé et le pare-feu.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Utiliser les commandes essentielles de Linux.
> 2. Gérer utilisateurs, groupes et droits.
> 3. Installer des logiciels et gérer des services.
> 4. Lire les journaux pour comprendre un problème.
> 5. Sécuriser l'accès avec SSH et un pare-feu.

## Les commandes essentielles

```bash
pwd                      # où suis-je ?
ls -la                   # lister les fichiers, y compris cachés
cd /var/www              # changer de dossier
mkdir sauvegardes        # créer un dossier
cp fichier.txt copie.txt # copier
mv ancien.txt nouveau.txt # déplacer ou renommer
rm fichier.txt           # supprimer (sans corbeille !)
cat config.txt           # afficher un fichier
nano config.txt          # modifier un fichier
df -h                    # espace disque
free -h                  # mémoire
top                      # processus en cours
```

> [!attention]
> Sous Linux, `rm` supprime **définitivement**, sans corbeille. Vérifiez toujours le dossier où vous êtes (`pwd`) et le nom des fichiers avant de supprimer, surtout avec des options récursives.

## Utilisateurs, groupes et droits

| Commande | Usage |
| --- | --- |
| `sudo adduser fara` | Créer un utilisateur |
| `sudo usermod -aG sudo fara` | Donner les droits d'administration |
| `sudo chown www-data:www-data site/` | Changer le propriétaire |
| `chmod 640 config.env` | Changer les droits d'un fichier |

> [!definition] Droits Linux
> Chaque fichier a des droits de lecture (r), écriture (w) et exécution (x) pour son propriétaire, son groupe et les autres. `chmod 640` signifie : lecture et écriture pour le propriétaire, lecture pour le groupe, rien pour les autres.

## Paquets et services

```bash
sudo apt update                 # mettre à jour la liste des paquets
sudo apt upgrade                # installer les mises à jour
sudo apt install nginx          # installer un logiciel
sudo systemctl status nginx     # voir l'état d'un service
sudo systemctl restart nginx    # redémarrer un service
sudo systemctl enable nginx     # le lancer au démarrage
```

## Les journaux

| Commande | Usage |
| --- | --- |
| `sudo journalctl -u nginx --since "1 hour ago"` | Journal d'un service sur la dernière heure |
| `sudo tail -f /var/log/nginx/error.log` | Suivre les erreurs en direct |
| `grep "error" fichier.log` | Chercher un mot dans un journal |

> [!astuce]
> Face à un problème, **lisez d'abord les journaux**. Ils indiquent presque toujours la cause : fichier introuvable, port déjà utilisé, droit refusé, disque plein.

## SSH : se connecter de façon sécurisée

```bash
# Sur votre ordinateur : créer une paire de clés
ssh-keygen -t ed25519 -C "fara@portable"

# Copier la clé publique sur le serveur
ssh-copy-id fara@203.0.113.10

# Se connecter
ssh fara@203.0.113.10
```

| Bonne pratique | Pourquoi |
| --- | --- |
| **Connexion par clé** plutôt que par mot de passe | Bien plus difficile à pirater |
| **Désactiver la connexion directe de root** | Limiter les attaques |
| **Désactiver la connexion par mot de passe** une fois la clé testée | Bloquer les essais automatiques |
| **Clé privée protégée** par une phrase de passe | Si l'ordinateur est volé |

> [!attention]
> Avant de désactiver la connexion par mot de passe, **testez la connexion par clé dans une deuxième fenêtre**. Sinon, vous risquez de vous enfermer dehors de votre propre serveur.

## Le pare-feu

```bash
sudo ufw default deny incoming   # tout bloquer en entrée par défaut
sudo ufw allow OpenSSH           # autoriser SSH
sudo ufw allow 'Nginx Full'      # autoriser le web (HTTP et HTTPS)
sudo ufw enable                  # activer le pare-feu
sudo ufw status                  # vérifier
```

> [!definition] Pare-feu
> Un filtre qui autorise ou bloque les connexions selon des règles. Le principe de base : tout bloquer, puis n'ouvrir que ce qui est nécessaire.

> [!madagascar]
> Une coupure de connexion pendant une modification de pare-feu ou de SSH peut vous empêcher de vous reconnecter. Vérifiez que l'hébergeur propose une **console de secours** (accès par son site web) avant de toucher à ces réglages.

> [!retenir]
> - Commandes de base, prudence avec `rm`.
> - Utilisateurs, groupes, propriétaires et droits.
> - apt pour les paquets, systemctl pour les services.
> - Lire les journaux d'abord en cas de problème.
> - SSH par clé, root et mots de passe désactivés après test, pare-feu fermé par défaut.

## Exercice pratique : un serveur de base sécurisé

> [!exercice] Exercice pratique · 4 heures
> 1. Dans votre machine virtuelle, créez un utilisateur administrateur.
> 2. Configurez la connexion SSH par clé depuis votre ordinateur, puis désactivez la connexion par mot de passe.
> 3. Installez Nginx, activez le pare-feu et vérifiez que la page par défaut s'affiche.
> 4. Provoquez une erreur (arrêtez Nginx) et retrouvez-la dans les journaux.
>
> **À livrer** : vos commandes commentées et des captures de chaque étape.
