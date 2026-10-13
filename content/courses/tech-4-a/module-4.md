Dans ce module, vous menez un projet complet comme un administrateur indépendant : faire passer une association de comptes Gmail personnels à un environnement professionnel, sans perdre d'e-mails ni de fichiers. Vous apprendrez à planifier, préparer le domaine, migrer, basculer, former et documenter, puis à mettre en place les sauvegardes.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Planifier une migration étape par étape.
> 2. Préparer le domaine et les comptes.
> 3. Migrer les e-mails et les fichiers.
> 4. Réussir la bascule et former les utilisateurs.
> 5. Mettre en place les sauvegardes et la documentation.

## Le cas pratique : « Tanora Mandroso »

> [!exemple] Votre client
> **Tanora Mandroso** est une association de formation des jeunes, avec 14 personnes à Antananarivo, Fianarantsoa et Mahajanga. Chacun utilise son adresse Gmail personnelle. Les fichiers des projets sont dispersés dans les Drive personnels, dont ceux de trois anciens volontaires. L'association a choisi Google Workspace (offre pour associations) et possède le domaine tanoramandroso.org (exemple).

## Étape 1 : le plan de migration

| N° | Étape | Durée indicative |
| --- | --- | --- |
| 1 | Inventaire : personnes, adresses, fichiers importants, partenaires | 2 jours |
| 2 | Ouverture de l'environnement et vérification du domaine | 1 à 3 jours |
| 3 | Création des comptes, groupes, Drive partagés | 1 jour |
| 4 | Migration des e-mails et des fichiers | 2 à 5 jours |
| 5 | Bascule des MX et contrôles | 1 soirée |
| 6 | Formation et assistance renforcée | 1 à 2 semaines |
| 7 | Documentation et passation | 1 jour |

> [!attention]
> Faites valider le plan **par écrit** par la direction, avec la date de bascule. Prévenez les utilisateurs une semaine avant, puis la veille. Une migration surprise crée de la panique et des pertes.

## Étape 2 : préparer le domaine et les comptes

| Action | Détail |
| --- | --- |
| **Accès au domaine** | Obtenir l'accès au gestionnaire DNS, au nom de l'association |
| **Vérification** | Enregistrement TXT de vérification |
| **Comptes** | prénom.nom@tanoramandroso.org, mot de passe temporaire, validation en deux étapes à activer à la première connexion |
| **Groupes** | equipe@, direction@, contact@ |
| **Drive partagés** | Un par projet et un par service |

> [!madagascar]
> Le nom de domaine en .mg s'achète auprès d'un bureau d'enregistrement agréé ; d'autres extensions (.org, .com) s'achètent auprès de bureaux internationaux, souvent par carte bancaire. Vérifiez que le domaine est bien **au nom de l'association**, avec une adresse de contact qui ne dépend pas d'une seule personne.

## Étape 3 : migrer les e-mails et les fichiers

| Élément | Méthode |
| --- | --- |
| **E-mails des anciens comptes Gmail** | Outil de migration des données de la console, avec l'accord de chaque utilisateur |
| **Contacts et agendas** | Export et import, ou outil de migration |
| **Fichiers** | Chaque personne déplace ses fichiers de travail dans le bon Drive partagé, avec votre aide |
| **Fichiers des anciens volontaires** | Demander poliment le transfert ou le partage ; ne jamais essayer d'accéder à leurs comptes |

> [!attention]
> Vous ne touchez **jamais** aux comptes personnels sans l'accord et la présence de leur propriétaire. Les e-mails et fichiers privés d'un employé ne concernent pas l'association : chacun choisit ce qu'il transfère.

## Étape 4 : la bascule et la formation

| Moment | Action |
| --- | --- |
| **Avant** | Réduire la durée de vie des enregistrements DNS (TTL) quelques jours avant |
| **Le soir de la bascule** | Changer les MX, ajouter SPF et DKIM, puis DMARC en mode surveillance |
| **Contrôles** | Envoyer et recevoir des e-mails de test depuis plusieurs messageries |
| **Le lendemain** | Permanence d'assistance, réponses rapides |
| **Formation** | Atelier de 2 heures : Gmail, Drive partagés, Meet, validation en deux étapes |
| **Supports** | Guide court en français et en malgache, avec captures |

> [!astuce]
> Avec des équipes dans plusieurs villes et des connexions inégales, enregistrez l'atelier et préparez des **fiches d'une page** : « Se connecter et activer la validation en deux étapes », « Où ranger mes fichiers », « Partager un fichier avec un partenaire ».

## Étape 5 : sauvegardes et documentation

> [!definition] Responsabilité partagée
> Microsoft et Google assurent le fonctionnement de leurs services, mais pas la récupération de **tout** ce que les utilisateurs suppriment ou écrasent au-delà des délais de la corbeille et de conservation. C'est à l'organisation de prévoir une sauvegarde adaptée.

| Solution | Principe |
| --- | --- |
| **Règles de conservation** (Vault ou fonctions équivalentes, selon l'édition) | Garder les données pendant une durée définie |
| **Outil de sauvegarde tiers** | Copie quotidienne des e-mails et fichiers hors de la suite, restauration simple |
| **Test de restauration** | Restaurer un fichier et une boîte de test chaque trimestre |

```
Documentation – Tanora Mandroso
1. Comptes et groupes : liste, unités organisationnelles, rôles
2. Domaine : bureau d'enregistrement, enregistrements DNS (sans mots de passe)
3. Fichiers : Drive partagés, accès, règles de partage
4. Protections : validation en deux étapes, administrateurs, compte d'urgence
5. Sauvegardes : outil, fréquence, procédure de restauration
6. Procédures : arrivée, départ, mot de passe oublié, téléphone perdu
```

> [!retenir]
> - Un plan validé par écrit, des utilisateurs prévenus.
> - Domaine au nom du client, comptes, groupes, Drive partagés.
> - Migration avec l'accord des utilisateurs, jamais d'accès aux comptes personnels.
> - Bascule préparée (TTL, MX, SPF, DKIM, DMARC), contrôles et formation.
> - Sauvegarde adaptée, restauration testée, documentation complète.

## Exercice pratique : la migration de Tanora Mandroso

> [!exercice] Exercice pratique · 8 heures (sur plusieurs jours)
> 1. Rédigez le plan de migration complet avec un calendrier.
> 2. Dans votre environnement d'essai, créez les comptes, groupes et Drive partagés de l'association.
> 3. Migrez les e-mails d'un compte Gmail de test que vous possédez.
> 4. Rédigez 3 fiches d'une page pour les utilisateurs et la documentation finale.
>
> **À livrer** : le plan, des captures, vos fiches et la documentation. C'est votre projet de portfolio.
