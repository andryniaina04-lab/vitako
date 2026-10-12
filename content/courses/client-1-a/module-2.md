Au niveau Fondamentaux, vous utilisiez Zendesk ou Freshdesk pour répondre. Au niveau Avancé, vous savez **les configurer** : vues, macros, règles automatiques, délais de service, base de connaissances, bots et intégrations. Ces outils sont payants et presque toujours **fournis par l'entreprise** ; ce module vous apprend à en tirer le meilleur.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Organiser le travail avec des vues et des groupes.
> 2. Écrire des macros avancées avec des champs dynamiques.
> 3. Créer des règles automatiques (déclencheurs et automatisations).
> 4. Configurer des délais de service (SLA).
> 5. Gérer une base de connaissances, un bot et les intégrations.

## Les éléments de configuration

| Élément | Zendesk | Freshdesk | À quoi il sert |
| --- | --- | --- | --- |
| **Vues** | Vues | Vues (filtres enregistrés) | Listes de tickets à traiter : urgents, en attente, par langue |
| **Groupes** | Groupes | Groupes | Équipes : N1, N2, facturation, anglais |
| **Champs** | Champs de ticket | Champs de ticket | Motif, produit, pays, numéro de commande |
| **Macros** | Macros | Réponses prédéfinies et scénarios | Réponses et actions en un clic |
| **Règles sur événement** | Déclencheurs | Automatisations à la création ou à la mise à jour | Agir quand un ticket est créé ou modifié |
| **Règles dans le temps** | Automatisations | Automatisations basées sur le temps | Agir après un délai |
| **Délais de service** | Politiques SLA | Politiques SLA | Délais de réponse et de résolution |
| **Base de connaissances** | Guide (centre d'aide) | Solutions | Articles d'aide pour les clients et les agents |

> [!attention]
> Les noms des menus changent avec les mises à jour. Travaillez toujours sur un **compte d'essai** ou un **environnement de test** (sandbox) avant de modifier les règles d'un vrai compte, et demandez l'accord écrit du responsable.

## Les macros avancées

Une macro peut **écrire la réponse** et **modifier le ticket** en même temps.

```
Nom : Livraison – retard transporteur
Actions :
- Réponse : (texte ci-dessous)
- Motif : Livraison / Retard
- Statut : En attente
- Ajouter l'étiquette : retard_transporteur

Bonjour {{ticket.requester.first_name}},

Merci pour votre message. Votre commande {{ticket.ticket_field_numero_commande}}
a bien été expédiée, mais le transporteur nous signale un retard.
Vous pouvez suivre le colis ici : [lien de suivi].

Nous surveillons votre colis et revenons vers vous sous 48 heures
si la situation n'avance pas.

Bien cordialement,
{{current_user.first_name}}
```

> [!definition] Champ dynamique (placeholder)
> Un code entre accolades remplacé automatiquement par une information : le prénom du client, le numéro de commande, le nom de l'agent. La syntaxe exacte dépend de l'outil : vérifiez-la dans sa documentation.

> [!astuce]
> Relisez toujours une réponse générée par macro avant de l'envoyer : une macro mal choisie envoyée trop vite fait plus de dégâts qu'une réponse écrite à la main.

## Les règles automatiques

### Les déclencheurs (sur événement)

| Condition | Action |
| --- | --- |
| Ticket créé ET langue = anglais | Groupe = Support anglais |
| Ticket créé ET sujet contient « remboursement » | Motif = Remboursement, priorité = Haute |
| Ticket créé ET client = VIP | Groupe = N2, notification au responsable |

### Les automatisations (dans le temps)

| Condition | Action |
| --- | --- |
| Statut = En attente depuis 72 heures | Relance automatique au client |
| Statut = En attente depuis 7 jours sans réponse | Statut = Résolu, avec un message poli |
| Statut = Résolu depuis 4 jours | Statut = Fermé |

> [!attention] Les boucles
> Une règle qui modifie un ticket peut déclencher une autre règle, qui le modifie à nouveau. Ajoutez toujours une **condition d'arrêt** (par exemple une étiquette « relance_envoyee ») pour qu'une règle ne s'exécute qu'une fois.

## Les délais de service (SLA)

> [!definition] SLA (Service Level Agreement)
> Un engagement de délai : par exemple, première réponse en moins de 4 heures ouvrées pour les tickets urgents. L'outil affiche le temps restant et signale les dépassements.

| Priorité | Première réponse | Résolution |
| --- | --- | --- |
| Urgente | 1 h | 8 h |
| Haute | 4 h | 24 h |
| Normale | 8 h | 48 h |
| Basse | 24 h | 5 jours |

*(Délais donnés en exemple : chaque entreprise fixe les siens, en heures ouvrées.)*

## La base de connaissances, le bot et les intégrations

### Un bon article d'aide

1. **Un titre** qui reprend les mots du client (« Comment suivre ma commande ? »).
2. **La réponse** dès la première phrase.
3. **Des étapes numérotées** avec captures.
4. **Une date** de mise à jour.
5. **Des liens** vers les articles proches.

### Le bot et l'IA

Zendesk et Freshdesk proposent des bots et des fonctions d'IA (payantes) qui suggèrent des articles, résument des tickets ou proposent des brouillons de réponse. Votre rôle :

1. **Alimenter** le bot avec de bons articles.
2. **Relire** les brouillons proposés par l'IA.
3. **Analyser** les conversations où le bot a échoué, pour améliorer les articles.

### Les intégrations

| Intégration | Ce qu'elle apporte |
| --- | --- |
| **Shopify** | Voir les commandes du client dans le ticket, parfois rembourser depuis l'outil |
| **Jira** | Créer un rapport de bug relié au ticket |
| **Slack** | Prévenir l'équipe d'un ticket urgent |
| **Messageries** (WhatsApp, Messenger) | Recevoir les messages dans le même outil |

> [!retenir]
> - Vues, groupes et champs organisent le travail.
> - Les macros répondent et modifient le ticket ; relisez avant d'envoyer.
> - Déclencheurs sur événement, automatisations dans le temps, toujours avec une condition d'arrêt.
> - Les SLA fixent des délais par priorité.
> - Base de connaissances, bot et intégrations réduisent le travail répétitif.

## Exercice pratique : configurer un helpdesk

> [!exercice] Exercice pratique · 3 heures
> 1. Ouvrez un compte d'essai Zendesk ou Freshdesk.
> 2. Créez 2 groupes, 3 champs (motif, numéro de commande, pays) et 4 vues.
> 3. Écrivez 5 macros avancées avec champs dynamiques.
> 4. Créez 3 déclencheurs et 2 automatisations avec conditions d'arrêt.
> 5. Configurez une politique SLA à 4 priorités.
> 6. Rédigez 3 articles d'aide.
>
> **À livrer** : des captures de votre configuration, vos macros et vos articles.
