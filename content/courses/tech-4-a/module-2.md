Ce module vous apprend à administrer **Microsoft 365** au quotidien depuis le Centre d'administration : choisir les offres, créer les utilisateurs, attribuer les licences, configurer le domaine et la messagerie, organiser Teams, SharePoint et OneDrive, et activer les protections de base.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Choisir les offres Microsoft 365 adaptées au client.
> 2. Gérer utilisateurs, groupes et licences.
> 3. Ajouter un domaine et configurer la messagerie.
> 4. Organiser le partage des fichiers avec Teams, SharePoint et OneDrive.
> 5. Activer la double authentification et limiter les comptes administrateurs.

## Choisir les offres

| Offre (entreprise) | Contenu principal | Pour qui |
| --- | --- | --- |
| **Business Basic** | Messagerie, Teams, OneDrive, SharePoint, Office en ligne | Équipes qui travaillent surtout dans le navigateur |
| **Business Standard** | Basic, plus les logiciels Office sur ordinateur | Utilisateurs de Word et Excel au quotidien |
| **Business Premium** | Standard, plus des protections avancées des comptes et des appareils | Organisations avec des données sensibles |

> [!astuce]
> On peut **mélanger les offres** : Business Standard pour les comptables, Business Basic pour les agents de terrain. Ce simple réglage fait souvent économiser beaucoup au client. Les noms, contenus et prix des offres changent régulièrement : vérifiez toujours la page officielle avant de conseiller.

> [!madagascar]
> Microsoft propose des **offres pour les associations** (dons ou réductions) aux organisations éligibles. Pour une ONG malgache, vérifiez l'éligibilité sur le site de Microsoft pour les associations et préparez les documents demandés (statuts, récépissé). Le paiement des licences se fait généralement par carte bancaire internationale ou via un revendeur.

## Utilisateurs, groupes et licences

| Tâche | Où |
| --- | --- |
| **Créer un utilisateur** et lui attribuer une licence | Utilisateurs, puis Utilisateurs actifs |
| **Créer plusieurs utilisateurs** d'un coup | Import à partir d'un fichier CSV |
| **Groupes Microsoft 365** | Équipe avec messagerie, calendrier et fichiers communs |
| **Boîte aux lettres partagée** | Adresse commune (par exemple contact@) sans licence supplémentaire, dans les limites prévues |
| **Départ d'un employé** | Bloquer la connexion, transférer les e-mails et les fichiers à un responsable, puis retirer la licence |

> [!attention]
> Quand un employé part, ne supprimez pas son compte tout de suite : **bloquez la connexion**, confiez ses e-mails et ses fichiers à un responsable, et gardez une trace. Une suppression trop rapide peut faire perdre des documents importants au client.

## Domaine et messagerie

| Enregistrement DNS | Rôle |
| --- | --- |
| **TXT de vérification** | Prouver que l'organisation possède le domaine |
| **MX** | Diriger les e-mails vers Microsoft 365 |
| **SPF** (TXT) | Indiquer quels serveurs peuvent envoyer au nom du domaine |
| **DKIM** (CNAME) | Signer les e-mails envoyés |
| **DMARC** (TXT) | Dire aux destinataires quoi faire des e-mails qui ne passent pas les contrôles |
| **Autodiscover** (CNAME) | Configurer automatiquement Outlook |

> [!definition] SPF, DKIM et DMARC
> Trois réglages du nom de domaine qui aident les messageries des destinataires à reconnaître les vrais e-mails de l'organisation. Sans eux, les e-mails du client arrivent plus souvent dans les indésirables, et des escrocs peuvent plus facilement envoyer de faux messages en son nom.

## Teams, SharePoint et OneDrive

| Outil | Usage conseillé |
| --- | --- |
| **OneDrive** | Fichiers personnels de travail |
| **Équipes Teams** | Une équipe par service ou par projet, avec des canaux |
| **SharePoint** | Les fichiers des équipes (chaque équipe Teams a son site SharePoint) |
| **Partage externe** | Autorisé seulement vers les partenaires, avec des liens limités |

> [!astuce]
> Proposez une règle simple au client : « Ce qui concerne l'équipe va dans Teams ou SharePoint, jamais dans le OneDrive d'une seule personne. » Ainsi, les fichiers restent à l'organisation quand quelqu'un part.

## Les protections de base

| Réglage | Effet |
| --- | --- |
| **Double authentification pour tous** | Un mot de passe volé ne suffit plus |
| **Valeurs de sécurité par défaut** ou règles d'accès conditionnel (selon l'offre) | Protections recommandées activées pour tout le monde |
| **Deux comptes administrateurs au maximum**, séparés des comptes de travail | Moins de risques en cas de vol d'un compte |
| **Compte d'urgence** | Un accès administrateur de secours, protégé et conservé en lieu sûr |
| **Alertes** | Être prévenu des activités inhabituelles |

> [!retenir]
> - Choisir et mélanger les offres selon les usages ; vérifier les offres pour associations.
> - Utilisateurs, groupes, boîtes partagées, départs gérés sans perte.
> - Domaine : vérification, MX, SPF, DKIM, DMARC, Autodiscover.
> - Fichiers d'équipe dans Teams et SharePoint, partage externe limité.
> - Double authentification, peu d'administrateurs, compte d'urgence, alertes.

## Exercice pratique : un locataire Microsoft 365 de test

> [!exercice] Exercice pratique · 4 heures
> 1. Ouvrez un essai gratuit de Microsoft 365 (ou un environnement de démonstration) pour une entreprise fictive.
> 2. Créez 5 utilisateurs par import CSV, 2 groupes et une boîte partagée.
> 3. Créez une équipe Teams par projet et testez le partage d'un fichier avec un compte externe.
> 4. Activez la double authentification et simulez le départ d'un employé.
>
> **À livrer** : des captures de chaque étape et votre procédure de départ d'un employé.
