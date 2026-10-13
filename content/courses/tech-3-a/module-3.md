Une infrastructure professionnelle se recrée en quelques minutes, change sans interruption et se répare vite. Ce module vous donne les méthodes des équipes expérimentées : infrastructure décrite en code, déploiements sans coupure, objectifs de fiabilité, gestion des incidents et plan de reprise après sinistre.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Décrire une infrastructure en code avec Terraform.
> 2. Configurer des serveurs avec Ansible.
> 3. Déployer sans coupure.
> 4. Définir des objectifs de fiabilité et gérer les incidents.
> 5. Préparer un plan de reprise après sinistre.

## L'infrastructure décrite en code

> [!definition] Infrastructure décrite en code
> Serveurs, réseaux, bases de données et règles d'accès sont décrits dans des fichiers texte versionnés avec Git. On peut relire chaque changement, le tester, le reproduire et revenir en arrière.

```hcl
resource "digitalocean_droplet" "web" {
  name   = "tsena-web-1"
  region = "fra1"
  size   = "s-1vcpu-2gb"
  image  = "ubuntu-24-04-x64"
  tags   = ["tsena", "production"]
}

resource "digitalocean_firewall" "web" {
  name        = "tsena-web"
  droplet_ids = [digitalocean_droplet.web.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
}
```

```bash
terraform init      # préparer le projet
terraform plan      # voir ce qui va changer, sans rien modifier
terraform apply     # appliquer après relecture
```

> [!attention]
> Relisez toujours le résultat de `terraform plan` avant d'appliquer. Une ligne indiquant qu'une base de données sera **détruite et recréée** doit vous arrêter immédiatement. Protégez aussi le fichier d'état de Terraform, qui peut contenir des informations sensibles : stockage distant chiffré, accès limité.

## Configurer les serveurs avec Ansible

| Élément | Rôle |
| --- | --- |
| **Inventaire** | Liste des serveurs et de leurs groupes |
| **Playbook** | Liste des tâches à appliquer (paquets, utilisateurs, fichiers, services) |
| **Rôles** | Ensembles de tâches réutilisables (Nginx, Docker, sécurité de base) |
| **Idempotence** | Lancer deux fois le même playbook donne le même résultat, sans casser |

## Déployer sans coupure

| Méthode | Principe |
| --- | --- |
| **Mise à jour progressive** | Remplacer les instances une par une |
| **Bleu et vert** | Préparer la nouvelle version à côté, puis basculer le trafic d'un coup |
| **Canari** | Envoyer d'abord une petite partie du trafic vers la nouvelle version |
| **Contrôles de santé** | L'équilibreur n'envoie du trafic qu'aux instances qui répondent bien |
| **Migrations de base compatibles** | La base fonctionne avec l'ancienne et la nouvelle version pendant la transition |

## Objectifs de fiabilité et incidents

> [!definition] Objectif de niveau de service (SLO)
> Un objectif mesurable de fiabilité, par exemple : « 99,5 % des requêtes réussies sur 30 jours ». Il permet de décider ensemble quand privilégier la stabilité plutôt que les nouvelles fonctions.

| Étape d'un incident | Action |
| --- | --- |
| **Détection** | Alerte ou signalement |
| **Qualification** | Gravité selon l'impact sur les utilisateurs |
| **Communication** | Prévenir le client et les personnes concernées, puis donner des nouvelles régulières |
| **Rétablissement** | Retour arrière, redémarrage, bascule, avant de chercher la cause profonde |
| **Analyse après incident** | Chronologie, causes, actions pour éviter la répétition, sans chercher de coupable |

> [!astuce]
> Rédigez des **procédures d'intervention** (runbooks) pour les incidents fréquents : disque plein, certificat expiré, base saturée, site indisponible. À 3 heures du matin, une liste d'étapes claires vaut mieux qu'une bonne mémoire.

## Le plan de reprise après sinistre

| Notion | Question |
| --- | --- |
| **RPO** (perte de données maximale) | Combien de minutes ou d'heures de données le client accepte-t-il de perdre ? |
| **RTO** (durée d'interruption maximale) | En combien de temps le service doit-il être rétabli ? |
| **Sauvegardes** | Fréquence adaptée au RPO, copies dans une autre région |
| **Infrastructure en code** | Recréer tout l'environnement rapidement |
| **Exercice de reprise** | Tester la reprise complète au moins une fois par an |

> [!madagascar]
> Pour des clients malgaches, choisissez la région du cloud en fonction des utilisateurs (souvent l'Europe ou l'Afrique du Sud) et des règles sur les données. Indiquez clairement dans le plan que vos propres **coupures d'électricité ou de connexion** n'empêchent pas l'infrastructure de fonctionner, et qui intervient si vous êtes injoignable.

> [!retenir]
> - Terraform : init, plan relu, apply ; état protégé.
> - Ansible : inventaire, playbooks, rôles, idempotence.
> - Déploiements progressifs, bleu et vert, canari, contrôles de santé.
> - SLO, gestion des incidents, analyse sans coupable, runbooks.
> - RPO, RTO, sauvegardes dans une autre région, exercice de reprise.

## Exercice pratique : une infrastructure reproductible

> [!exercice] Exercice pratique · 5 heures
> 1. Décrivez en Terraform un serveur, un pare-feu et un stockage, puis créez-les et détruisez-les.
> 2. Écrivez un playbook Ansible qui installe Docker et sécurise le serveur.
> 3. Définissez un SLO pour votre application et 3 runbooks.
> 4. Rédigez un plan de reprise avec RPO, RTO et procédure, puis testez une restauration.
>
> **À livrer** : le dépôt de code, vos SLO et runbooks, et le compte rendu du test de reprise.
