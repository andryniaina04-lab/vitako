Les boutiques en ligne qui grandissent utilisent des helpdesks professionnels comme **Gorgias** et **Zendesk**. Ce module vous apprend à les configurer et à les utiliser comme un expert : règles automatiques, macros avec actions sur les commandes, niveaux de service, libre-service, statistiques et assistants d'IA.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Configurer Gorgias pour une boutique Shopify.
> 2. Créer des règles et des macros avec actions sur les commandes.
> 3. Configurer Zendesk : déclencheurs, automatisations, vues et SLA.
> 4. Mettre en place le libre-service et une base de connaissances.
> 5. Utiliser les assistants d'IA avec prudence.

## Gorgias : le helpdesk de l'e-commerce

| Fonction | Usage |
| --- | --- |
| **Fiche client et commandes** | Voir les commandes Shopify à côté du ticket |
| **Actions sur les commandes** | Selon les droits : rembourser, annuler, modifier l'adresse, renvoyer depuis le ticket |
| **Macros avec variables** | Insérer automatiquement le numéro de commande, le lien de suivi |
| **Règles** (rules) | Étiqueter, attribuer, répondre automatiquement selon des conditions |
| **Canaux réunis** | E-mail, chat, Facebook, Instagram, parfois SMS et WhatsApp |
| **Statistiques de revenus** | Ventes réalisées après une conversation de support |
| **Libre-service** | Suivi de commande, retours et questions fréquentes dans le chat |

### Exemple de règle

```
Quand : un ticket est créé
Si : le message contient « où est ma commande » ou « suivi » ou « livraison »
Alors : ajouter l'étiquette « WISMO », priorité normale,
        et répondre automatiquement avec la macro « Suivi de commande »
        si la commande est expédiée
```

> [!definition] WISMO
> « Where is my order? » : le nom anglais courant des demandes de suivi de commande, souvent le premier motif de contact en e-commerce.

> [!attention]
> Une réponse automatique doit être **juste**. Si la règle répond « votre colis arrive demain » à un client dont la commande n'est pas encore expédiée, elle crée une nouvelle plainte. Testez chaque règle sur des tickets réels avant de l'activer.

## Zendesk : le helpdesk polyvalent

| Fonction | Usage |
| --- | --- |
| **Déclencheurs** (triggers) | Actions immédiates quand un ticket est créé ou modifié |
| **Automatisations** | Actions basées sur le temps (relancer après 48 h sans réponse, fermer après 4 jours) |
| **Vues** | Listes de travail : urgents, à attribuer, en attente depuis plus de 24 h |
| **SLA** | Délais cibles selon la priorité, avec alertes |
| **Macros** | Réponses et actions enregistrées |
| **Centre d'aide** | Base de connaissances publique |
| **Rapports** (Explore) | Volumes, délais, satisfaction, performances des agents |

### Exemple de SLA

| Priorité | Première réponse | Résolution |
| --- | --- | --- |
| Urgente | 1 heure | 8 heures |
| Haute | 4 heures | 24 heures |
| Normale | 12 heures | 48 heures |
| Basse | 24 heures | 5 jours |

## La taxonomie des étiquettes

| Famille | Étiquettes |
| --- | --- |
| **Motif** | suivi, retour, échange, remboursement, defaut, taille, avant-achat, paiement |
| **Produit** | robes, sacs, bijoux |
| **Résultat** | resolu-premier-contact, escalade, geste-commercial |
| **Canal** | email, chat, instagram |

> [!astuce]
> Gardez **peu d'étiquettes**, bien définies et documentées. Une liste de 80 étiquettes que chacun utilise à sa façon rend les rapports inutilisables.

## Le libre-service

1. **Page de suivi de commande** accessible sans écrire au support.
2. **Portail de retour** : le client lance son retour seul selon la politique.
3. **Centre d'aide** avec les 20 questions les plus fréquentes.
4. **Réponses automatiques** dans le chat pour les questions simples, avec passage à un humain facile.

## Les assistants d'IA

| Usage | Prudence |
| --- | --- |
| **Suggestions de réponses** à l'agent | L'agent relit et corrige avant d'envoyer |
| **Résumé d'un long échange** | Vérifier les faits dans l'historique |
| **Agent automatique** pour les questions simples | Limiter aux sujets sûrs, toujours permettre de parler à un humain |
| **Traduction** | Relire les réponses importantes |

> [!attention]
> Un assistant d'IA peut **inventer** une règle de retour ou un délai. Il doit s'appuyer sur la base de connaissances de la boutique, et les sujets sensibles (remboursements importants, litiges, clients en colère) restent traités par un humain.

> [!madagascar]
> Ces outils sont payés **par la boutique**. Proposez-vous comme la personne qui les **configure et les fait vivre** : c'est une compétence rare et mieux payée que la seule réponse aux tickets. Utilisez les démonstrations et centres d'aide officiels pour vous former.

> [!retenir]
> - Gorgias : commandes à côté du ticket, actions, règles, revenus, libre-service.
> - Tester chaque règle automatique avant de l'activer.
> - Zendesk : déclencheurs, automatisations, vues, SLA, centre d'aide, rapports.
> - Peu d'étiquettes, bien définies.
> - L'IA aide les agents, mais les sujets sensibles restent humains.

## Exercice pratique : configurer un helpdesk

> [!exercice] Exercice pratique · 4 heures
> 1. Dans un essai de Gorgias ou de Zendesk, créez une taxonomie de 15 étiquettes.
> 2. Créez 3 règles ou déclencheurs et 2 automatisations basées sur le temps.
> 3. Créez 10 macros avec variables.
> 4. Définissez les SLA par priorité et 3 vues de travail.
>
> **À livrer** : des captures de votre configuration et une note expliquant chaque règle.
