Les prestataires et services informatiques professionnels utilisent les versions payantes de **TeamViewer** pour gérer un parc d'appareils, et de **Zendesk** pour organiser le support selon des processus clairs. Ce module vous apprend leurs fonctions avancées et les consoles d'administration que vous utiliserez chaque jour.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Organiser un parc d'appareils et l'accès sans surveillance dans TeamViewer.
> 2. Sécuriser les accès à distance.
> 3. Organiser le support avec les types de tickets, les SLA et les vues de Zendesk.
> 4. Relier incidents et problèmes.
> 5. Réaliser les tâches courantes dans une console d'administration.

## TeamViewer : gérer un parc

| Fonction (selon l'offre, à vérifier sur le site officiel) | Usage |
| --- | --- |
| **Liste d'ordinateurs et groupes** | Organiser les appareils par client, site ou service |
| **Accès sans surveillance** | Se connecter à un poste sans présence de l'utilisateur, selon une politique autorisée |
| **Déploiement en masse** | Installer et attribuer le logiciel sur de nombreux postes |
| **Politiques de paramètres** | Imposer des réglages identiques à tous les postes |
| **Gestion des utilisateurs et des droits** | Chaque technicien n'accède qu'à ses clients |
| **Journaux et enregistrement des sessions** | Traçabilité : qui s'est connecté, quand, pourquoi |
| **Surveillance et gestion des actifs** (modules complémentaires) | Alertes, inventaire, correctifs |
| **Intégrations** | Lancer une session depuis un ticket du helpdesk |

### Sécuriser les accès à distance

1. **Double authentification** obligatoire pour tous les techniciens.
2. **Comptes nominatifs** : jamais un compte partagé.
3. **Accès sans surveillance** seulement sur les postes autorisés par le client.
4. **Liste d'autorisation** : seuls les comptes de votre entreprise peuvent se connecter.
5. **Journaux** conservés et consultables par le client.
6. **Désactivation immédiate** des accès d'un technicien qui quitte l'équipe.

> [!attention]
> Un outil d'accès à distance mal sécurisé est une **porte d'entrée pour les pirates** vers tous vos clients à la fois. La sécurité de vos propres comptes est votre première responsabilité.

## Zendesk : organiser le support informatique

### Les types de tickets

| Type | Usage |
| --- | --- |
| **Question** | Demande d'information |
| **Incident** | Quelque chose ne fonctionne plus pour un utilisateur |
| **Problème** | La cause commune de plusieurs incidents |
| **Tâche** | Un travail planifié (préparer le poste d'un nouvel employé) |

> [!definition] Incident et problème
> Un **incident** est une panne vécue par un utilisateur. Un **problème** est la cause racine, qui peut provoquer plusieurs incidents. Dans Zendesk, on relie les incidents à un ticket de type problème : en résolvant le problème, on peut informer tous les utilisateurs concernés.

> [!exemple] Problème et incidents liés
> Ticket problème #3100 : « Le serveur de messagerie refuse les connexions depuis 8 h 40. » 12 tickets incidents d'utilisateurs y sont liés. À la résolution, un message unique informe les 12 utilisateurs.

### Les réglages avancés

| Réglage | Usage |
| --- | --- |
| **Formulaires de tickets** | Champs différents selon la demande (matériel, accès, logiciel) |
| **Organisations** | Un client = une organisation, avec ses SLA |
| **SLA par client et par priorité** | Délais contractuels suivis automatiquement |
| **Vues** | « Urgents », « SLA bientôt dépassé », « En attente d'un tiers » |
| **Déclencheurs et automatisations** | Notifications, relances, fermeture automatique |
| **Centre d'aide par client** | Articles et procédures propres à chaque client |
| **Rapports** | Volume, délais, résolution au premier contact, satisfaction |

## Les consoles d'administration

| Tâche courante | Où (exemple Microsoft 365) |
| --- | --- |
| Créer un utilisateur et lui attribuer une licence | Centre d'administration Microsoft 365 |
| Réinitialiser un mot de passe, débloquer un compte | Centre d'administration ou Entra ID |
| Exiger la double authentification | Entra ID (paramètres de sécurité ou accès conditionnel selon l'offre) |
| Créer une boîte partagée | Centre d'administration Exchange |
| Donner accès à un dossier partagé | SharePoint ou Teams |
| Bloquer un compte compromis | Entra ID : bloquer la connexion, révoquer les sessions |

> [!astuce]
> Créez votre propre **environnement d'essai** (Microsoft et Google proposent des versions d'essai ou des programmes pour les développeurs selon les périodes) pour pratiquer sans risque sur des comptes fictifs.

> [!madagascar]
> Les licences TeamViewer, Zendesk et Microsoft 365 sont payées **par l'entreprise cliente ou par le prestataire qui vous emploie**. Votre valeur, c'est de savoir les configurer et les sécuriser. Documentez dans votre portfolio ce que vous avez configuré dans vos environnements d'essai.

> [!retenir]
> - TeamViewer : groupes, accès sans surveillance, politiques, droits, journaux.
> - Sécuriser vos propres accès en premier : double authentification, comptes nominatifs.
> - Zendesk : types de tickets, problèmes reliés aux incidents, SLA par client.
> - Les tâches courantes dans les consoles d'administration.
> - S'entraîner dans un environnement d'essai.

## Exercice pratique : un environnement professionnel

> [!exercice] Exercice pratique · 4 heures
> 1. Créez dans TeamViewer (gratuit ou essai) deux groupes d'appareils et décrivez la politique de sécurité que vous appliqueriez.
> 2. Dans Zendesk (essai), créez 2 organisations, des SLA, 3 vues et un formulaire de ticket.
> 3. Créez un ticket problème et reliez-y 3 incidents.
> 4. Dans un environnement d'essai Microsoft 365 ou Google Workspace, créez 3 utilisateurs, un groupe et activez la double authentification.
>
> **À livrer** : des captures de chaque étape et votre politique de sécurité.
