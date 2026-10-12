Les clients professionnels utilisent les **offres payantes** de Mailchimp, Brevo ou ActiveCampaign pour leurs automatisations avancées, leur segmentation et leurs intégrations. Ce module vous apprend à choisir l'outil adapté, à construire des scénarios complexes, à noter les contacts et à protéger la délivrabilité.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Choisir entre Mailchimp, Brevo et ActiveCampaign selon le client.
> 2. Construire des automatisations à plusieurs branches.
> 3. Mettre en place une notation des contacts.
> 4. Relier l'outil à une boutique ou à un CRM.
> 5. Configurer l'authentification et respecter les règles des grandes messageries.

## Choisir l'outil

| Outil | Points forts | Client type |
| --- | --- | --- |
| **Mailchimp** (offres payantes) | Interface simple, intégrations e-commerce, parcours clients, nombreux modèles | Petites et moyennes boutiques |
| **Brevo** (offres payantes) | Prix souvent basé sur le volume d'envoi, e-mail, SMS et WhatsApp, e-mails transactionnels, interface en français | Entreprises francophones, envois fréquents |
| **ActiveCampaign** | Automatisations très puissantes, notation des contacts, CRM de vente intégré selon l'offre | B2B, formations en ligne, cycles de vente longs |

> [!attention]
> Les offres, les limites et les prix changent souvent. Vérifiez-les sur les sites officiels avant chaque recommandation, et comparez le coût **pour la taille réelle** de la liste du client.

## Les automatisations à plusieurs branches

> [!definition] Déclencheur, condition, action
> Un **déclencheur** lance le scénario (inscription, achat, visite d'une page). Une **condition** sépare les contacts en branches (a acheté ou non). Une **action** envoie un e-mail, ajoute une étiquette ou met à jour un champ.

### Exemple : panier abandonné

```
Déclencheur : panier abandonné depuis 1 heure
├─ E-mail 1 : « Vous avez oublié quelque chose ? » (produits du panier)
├─ Attendre 24 h
├─ Condition : a acheté ?
│   ├─ Oui → sortir du scénario
│   └─ Non → E-mail 2 : avis clients sur les produits
├─ Attendre 48 h
└─ Condition : panier supérieur à 150 000 Ar ?
    ├─ Oui → E-mail 3 : livraison offerte (24 h)
    └─ Non → E-mail 3 : rappel simple
```

> [!astuce]
> Placez toujours une **condition de sortie** après chaque attente : un client qui vient d'acheter ne doit plus recevoir de relance. Rien n'énerve plus un client que de recevoir « Vous avez oublié votre panier » après avoir payé.

### Les automatisations clés

| Scénario | Objectif |
| --- | --- |
| Bienvenue | Présenter la marque, première vente |
| Panier abandonné | Récupérer les ventes perdues |
| Navigation abandonnée | Relancer après la visite d'un produit |
| Après achat | Remercier, conseiller, demander un avis, vendre un complément |
| Réachat | Rappeler un produit qui s'épuise (thé, cosmétiques) |
| Réactivation | Relancer les inactifs, puis les retirer |
| Anniversaire ou date clé | Fidéliser |

## La notation des contacts

> [!definition] Lead scoring
> Attribuer des points à chaque contact selon son profil et ses actions, pour repérer ceux qui sont prêts à acheter.

| Action ou profil | Points |
| --- | --- |
| Ouvre un e-mail | +1 (indicatif) |
| Clique sur un lien | +3 |
| Visite la page des tarifs | +10 |
| Télécharge un guide | +5 |
| Poste de direction dans une entreprise cible | +15 |
| Inactif depuis 30 jours | −10 |

Au-delà d'un **seuil** (par exemple 50 points), le contact est transmis à l'équipe commerciale ou reçoit une offre de rendez-vous.

## Les intégrations

| Intégration | Ce qu'elle permet |
| --- | --- |
| **Boutique en ligne** (Shopify, WooCommerce) | Achats, paniers, produits vus, revenus par e-mail |
| **CRM** | Synchroniser contacts, étapes de vente, notes |
| **Formulaires et pages** | Inscriptions avec étiquettes et champs |
| **Outils d'automatisation** (Make, Zapier) | Relier des outils sans intégration directe |

## La délivrabilité professionnelle

### L'authentification du domaine

| Enregistrement | Rôle |
| --- | --- |
| **SPF** | Indique quels serveurs peuvent envoyer pour le domaine |
| **DKIM** | Signe les e-mails pour prouver qu'ils n'ont pas été modifiés |
| **DMARC** | Indique quoi faire des e-mails qui échouent et envoie des rapports |

### Les exigences des grandes messageries

Depuis 2024, Gmail et Yahoo imposent aux expéditeurs de gros volumes :
1. L'**authentification** SPF, DKIM et un enregistrement DMARC.
2. La **désinscription en un clic**, traitée rapidement.
3. Un **taux de plaintes pour spam** très bas (ils indiquent de rester sous 0,3 %, et visent idéalement beaucoup moins).

> [!madagascar]
> Les enregistrements SPF, DKIM et DMARC se configurent chez l'hébergeur du **nom de domaine du client**. Demandez un accès ou envoyez-lui les instructions précises : vous n'avez pas besoin de son mot de passe principal.

> [!retenir]
> - Choisir l'outil selon le client, en vérifiant les offres actuelles.
> - Déclencheur, conditions, actions, et toujours une condition de sortie.
> - Les automatisations clés de la bienvenue à la réactivation.
> - Noter les contacts et transmettre au-delà d'un seuil.
> - SPF, DKIM, DMARC, désinscription en un clic, plaintes très basses.

## Exercice pratique : un système automatisé

> [!exercice] Exercice pratique · 4 heures
> 1. Comparez les 3 outils pour une boutique de 10 000 contacts et un cabinet B2B de 2 000 contacts.
> 2. Construisez (dans un essai ou en schéma détaillé) un scénario de panier abandonné avec conditions de sortie.
> 3. Créez une grille de notation des contacts pour un cabinet B2B.
> 4. Rédigez les instructions SPF, DKIM et DMARC à envoyer à un client.
>
> **À livrer** : votre comparatif, votre scénario, votre grille et vos instructions.
