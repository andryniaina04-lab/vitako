Ce module vous apprend à administrer **Google Workspace** depuis la Console d'administration : choisir les éditions, organiser les utilisateurs en unités, configurer Gmail et le domaine, organiser les Drive partagés, maîtriser le partage externe et protéger les comptes.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Choisir l'édition Google Workspace adaptée.
> 2. Organiser utilisateurs, unités organisationnelles et groupes.
> 3. Configurer Gmail et le domaine.
> 4. Organiser les fichiers avec les Drive partagés.
> 5. Activer la validation en deux étapes et les contrôles de base.

## Choisir l'édition

| Édition (entreprise) | Contenu principal | Pour qui |
| --- | --- | --- |
| **Business Starter** | Gmail, Drive, Meet, Docs, stockage limité | Petites équipes |
| **Business Standard** | Plus de stockage, enregistrement des réunions, fonctions avancées | Équipes qui collaborent beaucoup |
| **Business Plus** | Plus de contrôles et d'archivage (Vault) | Organisations avec des obligations de conservation |

> [!madagascar]
> Google propose **Google pour les associations**, avec une édition gratuite ou à prix réduit pour les organisations éligibles. Vérifiez l'éligibilité de l'ONG cliente sur le site officiel et les documents demandés. Comme pour Microsoft, les offres et les prix changent : vérifiez toujours avant de conseiller.

## Utilisateurs, unités et groupes

| Élément | Usage |
| --- | --- |
| **Utilisateurs** | Création un par un ou par import CSV |
| **Unités organisationnelles** | Appliquer des réglages différents (par exemple Direction, Terrain, Volontaires) |
| **Groupes** | Adresses de diffusion (equipe@), boîtes collaboratives, partage de fichiers à un groupe |
| **Rôles d'administration** | Donner des droits limités (par exemple réinitialiser les mots de passe) sans donner tous les droits |

> [!astuce]
> Partagez les fichiers et les agendas avec des **groupes**, pas avec des personnes une par une. Quand quelqu'un arrive ou part, il suffit de l'ajouter ou de le retirer du groupe.

## Gmail et le domaine

| Réglage | Rôle |
| --- | --- |
| **Vérification du domaine** | Prouver que l'organisation possède le domaine |
| **Enregistrements MX** | Diriger les e-mails vers Gmail |
| **SPF, DKIM, DMARC** | Faire reconnaître les vrais e-mails de l'organisation |
| **Alias** | Plusieurs adresses pour un même utilisateur (par exemple direction@) |
| **Groupes de diffusion** | Une adresse pour une équipe |
| **Signature commune** | Signature identique pour tous, gérée par l'administrateur ou un outil dédié |

> [!attention]
> Avant de changer les enregistrements **MX**, préparez la bascule : comptes créés, utilisateurs prévenus, heure choisie en dehors des heures de travail. Une erreur sur les MX peut faire perdre ou retarder des e-mails pendant plusieurs heures.

## Les Drive partagés

| Règle | Pourquoi |
| --- | --- |
| **Un Drive partagé par service ou par projet** | Les fichiers appartiennent à l'organisation, pas à une personne |
| **Accès donnés à des groupes** | Gestion simple des arrivées et départs |
| **Niveaux d'accès** | Lecteur, commentateur, contributeur, gestionnaire de contenu, gestionnaire |
| **Partage externe contrôlé** | Autorisé seulement vers les partenaires, ou avec avertissement |
| **Nommage clair** | Par exemple : « Projet Eau Analamanga 2026 » |

> [!exemple] Organisation proposée à une ONG
> Drive partagés : « Direction », « Finances », « Ressources humaines », « Projet Eau Analamanga », « Communication ». Les finances et les ressources humaines sont accessibles seulement à leurs groupes. Les volontaires sont dans une unité organisationnelle à part, sans partage externe.

## Protéger les comptes

| Réglage | Effet |
| --- | --- |
| **Validation en deux étapes obligatoire** (après une période d'inscription) | Un mot de passe volé ne suffit plus |
| **Super-administrateurs limités** à 2 comptes séparés | Moins de risques |
| **Règles de mot de passe** | Longueur minimale, pas de réutilisation |
| **Alertes de la console** | Connexions suspectes, changements importants |
| **Appareils mobiles** | Gestion de base : verrouillage, effacement des données de l'organisation si le téléphone est perdu |

> [!madagascar]
> Beaucoup d'utilisateurs n'ont qu'un téléphone, parfois partagé. Pour la validation en deux étapes, proposez l'**application Google Authenticator** ou les invites sur le téléphone plutôt que les SMS, qui arrivent parfois en retard selon le réseau, et fournissez des **codes de secours** imprimés et rangés en lieu sûr.

> [!retenir]
> - Choisir l'édition selon les besoins ; vérifier l'offre pour associations.
> - Unités organisationnelles pour les réglages, groupes pour le partage.
> - Domaine, MX préparés, SPF, DKIM, DMARC, alias, groupes.
> - Drive partagés par service ou projet, accès par groupes, partage externe contrôlé.
> - Validation en deux étapes, peu de super-administrateurs, alertes, appareils.

## Exercice pratique : un environnement Google Workspace de test

> [!exercice] Exercice pratique · 4 heures
> 1. Ouvrez un essai gratuit de Google Workspace pour une organisation fictive.
> 2. Créez 3 unités organisationnelles, 6 utilisateurs et 3 groupes.
> 3. Créez 4 Drive partagés avec des accès par groupe, et testez un partage externe.
> 4. Rendez la validation en deux étapes obligatoire et rédigez le guide d'activation pour les utilisateurs.
>
> **À livrer** : des captures, votre schéma d'organisation et votre guide d'activation.
