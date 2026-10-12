Ce module vous fait prendre en main les deux outils principaux du technicien : un logiciel de **contrôle à distance** (AnyDesk, gratuit pour un usage personnel) et un **helpdesk** (Zendesk, avec une période d'essai). Vous découvrirez ensuite les versions professionnelles payantes : **TeamViewer** et **Zendesk**.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Établir une session de contrôle à distance sécurisée.
> 2. Guider un utilisateur pour qu'il vous donne l'accès.
> 3. Traiter des tickets dans un helpdesk.
> 4. Rédiger des articles de base de connaissances.
> 5. Comprendre ce qu'apportent TeamViewer et Zendesk en version payante.

## Le contrôle à distance avec AnyDesk

> [!definition] Contrôle à distance
> Un logiciel qui permet de voir l'écran d'un autre ordinateur et d'utiliser sa souris et son clavier, à travers Internet.

### Ouvrir une session

1. L'utilisateur **télécharge** AnyDesk depuis le site officiel.
2. Il vous **communique** son identifiant AnyDesk (une suite de chiffres).
3. Vous **demandez** la connexion depuis votre poste.
4. L'utilisateur **accepte** et choisit les autorisations.
5. Vous **expliquez** ce que vous faites pendant la session.
6. À la fin, vous **fermez** la session et l'utilisateur vérifie qu'elle est bien fermée.

> [!attention]
> Des escrocs se font passer pour des techniciens et demandent un accès à distance pour voler de l'argent ou des données. Rappelez aux utilisateurs de **ne jamais** donner un accès à quelqu'un qu'ils n'ont pas contacté eux-mêmes par un canal officiel. Et vous, ne demandez jamais un accès sans un ticket ou un appel identifié.

### Les fonctions utiles

| Fonction | Usage |
| --- | --- |
| **Transfert de fichiers** | Envoyer un installateur ou récupérer un fichier journal |
| **Discussion** | Échanger quand le téléphone n'est pas disponible |
| **Accès sans surveillance** | Se connecter sans présence de l'utilisateur, seulement si l'entreprise l'a autorisé et configuré |
| **Redémarrage à distance** | Redémarrer et se reconnecter automatiquement |
| **Qualité d'affichage** | Réduire la qualité pour une connexion faible |

> [!madagascar]
> Avec une connexion instable, réglez l'affichage sur la **qualité réduite** et désactivez le fond d'écran pendant la session. La session sera beaucoup plus fluide.

> [!astuce]
> Vérifiez les conditions de la version gratuite : elle est généralement réservée à un **usage personnel**. Pour un usage professionnel régulier, l'employeur doit acheter une licence.

## Le helpdesk avec Zendesk

### Le cycle d'un ticket

| Statut | Signification |
| --- | --- |
| **Nouveau** | Pas encore pris en charge |
| **Ouvert** | En cours de traitement |
| **En attente** | Attente d'une réponse de l'utilisateur |
| **En pause** | Attente d'un tiers (fournisseur, niveau 2) |
| **Résolu** | Solution apportée, en attente de confirmation |
| **Fermé** | Clos définitivement |

### Un ticket bien rempli

```
Demandeur : Mme Rasoa, comptabilité
Catégorie : Matériel > Imprimante
Priorité : Normale
Description : l'imprimante du 2e étage n'imprime plus depuis ce matin ; message « imprimante hors ligne ».
Actions :
- Vérification : imprimante allumée, papier présent.
- Les collègues impriment normalement → problème propre au poste.
- Suppression puis réinstallation de l'imprimante sur le poste.
- Page de test imprimée avec succès.
Résolution : imprimante réinstallée. Durée : 15 min.
```

### Les autres fonctions

| Fonction | Usage |
| --- | --- |
| **Macros** | Réponses et actions enregistrées |
| **Vues** | Listes filtrées (mes tickets, urgents) |
| **Niveaux de service (SLA)** | Délais à respecter selon la priorité |
| **Base de connaissances** | Articles d'aide pour les utilisateurs |
| **Rapports** | Volume, délais, satisfaction |

> [!definition] SLA (accord de niveau de service)
> Un engagement sur les délais : par exemple, première réponse en moins d'une heure pour une priorité haute.

## La base de connaissances

1. **Repérez** les problèmes qui reviennent souvent.
2. **Rédigez** un article par problème : symptôme, étapes, captures d'écran.
3. **Testez** l'article avec un utilisateur.
4. **Envoyez** le lien au lieu de réexpliquer à chaque fois.

## Les versions payantes

| Outil | Ce qu'il apporte |
| --- | --- |
| **TeamViewer** (licence professionnelle) | Contrôle à distance très répandu en entreprise, gestion d'un parc d'appareils, accès sans surveillance sécurisé, journaux des sessions, intégration avec des helpdesks |
| **Zendesk** (offres payantes) | Plusieurs canaux réunis, automatisations, SLA, rapports avancés, base de connaissances complète |

> [!madagascar]
> Ces licences sont payées **par l'employeur**. Pour vous former, utilisez les versions d'essai et les centres d'aide officiels. Sur votre profil, indiquez les outils que vous savez utiliser avec un exemple concret.

> [!retenir]
> - Contrôle à distance : identifiant, accord de l'utilisateur, explication, fermeture.
> - Méfiance face aux faux techniciens.
> - Le cycle d'un ticket et un ticket bien documenté.
> - Macros, vues, SLA, base de connaissances, rapports.
> - TeamViewer et Zendesk payants, fournis par l'employeur.

## Exercice pratique : votre première session

> [!exercice] Exercice pratique · 3 heures
> 1. Installez AnyDesk sur votre ordinateur et dans votre machine virtuelle (ou chez un proche qui accepte).
> 2. Faites une session : changez le fond d'écran, transférez un fichier, puis fermez la session.
> 3. Ouvrez un essai d'un helpdesk et créez 5 tickets avec statuts et catégories.
> 4. Rédigez 2 articles de base de connaissances avec captures d'écran.
>
> **À livrer** : des captures de la session et du helpdesk, et vos 2 articles.
