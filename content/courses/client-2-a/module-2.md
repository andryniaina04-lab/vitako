Au niveau Avancé, vous travaillez avec les outils payants des équipes de prospection : **HubSpot Sales** pour les séquences, les tâches et le suivi dans le CRM, et **Lemlist** pour les campagnes multicanales personnalisées. Vous maîtrisez aussi la **délivrabilité**, sans laquelle les meilleurs messages arrivent en spam.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Organiser un CRM professionnel avec HubSpot.
> 2. Créer des séquences et des modèles dans HubSpot Sales.
> 3. Construire une campagne multicanale dans Lemlist.
> 4. Configurer et protéger la délivrabilité.
> 5. Produire des rapports de prospection.

## Un CRM professionnel avec HubSpot

| Élément | Bonne pratique |
| --- | --- |
| **Propriétés** | Champs utiles et normalisés : secteur, taille, source, raison du contact, statut de prospection |
| **Statuts du prospect** | Nouveau, en cours, connecté, rendez-vous fixé, non qualifié, ne plus contacter |
| **Associations** | Contacts reliés à leur entreprise, rendez-vous reliés aux deux |
| **Tâches** | Chaque appel ou relance manuelle est une tâche datée |
| **Vues enregistrées** | « Mes prospects à appeler aujourd'hui », « Rendez-vous de la semaine » |

> [!attention]
> Un contact qui demande à ne plus être contacté doit être marqué **immédiatement** dans le CRM et exclu de toutes les séquences, dans tous les outils. C'est une obligation légale dans de nombreux pays et une question de respect.

## HubSpot Sales : séquences et modèles

> [!definition] Séquence
> Une suite programmée d'e-mails et de tâches (appel, message LinkedIn) envoyés au nom d'un prospecteur, qui s'arrête automatiquement quand le contact répond ou prend rendez-vous.

### Une séquence type

| Étape | Jour | Type | Contenu |
| --- | --- | --- | --- |
| 1 | J1 | E-mail automatique | Premier message personnalisé |
| 2 | J2 | Tâche LinkedIn | Invitation avec message court |
| 3 | J4 | E-mail automatique | Relance avec une preuve |
| 4 | J6 | Tâche appel | Appel de qualification |
| 5 | J10 | E-mail automatique | Autre angle (témoignage, question) |
| 6 | J17 | E-mail automatique | Message de clôture |

### Les champs de personnalisation

```
Bonjour {{ contact.firstname }},

J'ai vu que {{ company.name }} {{ contact.raison_du_contact }}.
...
```

> [!astuce]
> Les champs automatiques ne suffisent pas : la **première phrase** doit être écrite (ou vérifiée) pour chaque prospect important. Un e-mail personnalisé seulement avec le prénom et le nom de l'entreprise se reconnaît tout de suite.

## Lemlist : campagnes multicanales

| Fonction | Usage |
| --- | --- |
| **Campagnes multicanales** | E-mail, LinkedIn (dans le respect de ses règles), appels, dans une même séquence |
| **Personnalisation avancée** | Variables, paragraphes conditionnels, images personnalisées |
| **Conditions** | Si le prospect a ouvert ou cliqué, ou s'il a accepté l'invitation, passer à telle étape |
| **Gestion des adresses d'envoi** | Plusieurs adresses, limites quotidiennes, préchauffage |
| **Statistiques** | Réponses, intérêts, rendez-vous par campagne et par étape |

*(Les fonctions et les prix des offres changent : vérifiez sur les sites officiels de HubSpot et de Lemlist. L'abonnement est en général payé par le client.)*

## La délivrabilité

> [!definition] Délivrabilité
> La capacité de vos e-mails à arriver dans la boîte de réception, et non dans les spams. Elle dépend des réglages techniques du domaine, de la réputation de l'adresse d'envoi, de la qualité de la liste et du comportement des destinataires.

### Les réglages techniques

| Réglage | Rôle |
| --- | --- |
| **SPF** | Indique quels serveurs ont le droit d'envoyer pour le domaine |
| **DKIM** | Signe les e-mails pour prouver qu'ils n'ont pas été modifiés |
| **DMARC** | Indique quoi faire des e-mails qui échouent aux contrôles, et envoie des rapports |
| **Domaine d'envoi secondaire** | Un domaine proche du principal (par exemple « soa-consulting.co » à côté de « soa-consulting.com ») pour protéger la réputation du domaine principal |

Ces réglages se font dans la **zone DNS** du domaine, par le client ou son prestataire technique, en suivant la documentation de son fournisseur de messagerie.

### Les bonnes pratiques d'envoi

1. **Préchauffer** une nouvelle adresse : augmenter le volume progressivement sur plusieurs semaines.
2. **Limiter** le volume par adresse et par jour (souvent quelques dizaines d'e-mails de prospection).
3. **Vérifier** les adresses avant l'envoi : peu d'erreurs (rebonds).
4. **Éviter** les pièces jointes, les liens nombreux et les images lourdes au premier contact.
5. **Surveiller** le taux de rebond, les signalements en spam et les réponses négatives.

> [!attention]
> Les grands fournisseurs de messagerie (comme Google et Yahoo) ont renforcé leurs exigences pour les expéditeurs : authentification, désinscription facile, faible taux de signalement en spam. Vérifiez leurs règles à jour avant chaque nouvelle campagne.

## Les rapports de prospection

| Rapport | Contenu |
| --- | --- |
| **Hebdomadaire** | Contacts touchés, réponses, rendez-vous fixés, problèmes |
| **Mensuel** | Entonnoir complet, comparaison des messages et des cibles, recommandations |
| **Par campagne** | Résultats par étape et par canal |

> [!madagascar]
> Pour un client européen, envoyez le rapport hebdomadaire **le lundi matin heure de Paris** : c'est souvent le moment où l'équipe commerciale planifie sa semaine. Avec 1 à 2 heures d'avance à Antananarivo, vous pouvez le préparer tôt.

> [!retenir]
> - Un CRM propre : propriétés, statuts, associations, tâches, vues.
> - Des séquences HubSpot qui s'arrêtent à la réponse, avec une première phrase personnelle.
> - Des campagnes Lemlist multicanales avec conditions.
> - SPF, DKIM, DMARC, domaine secondaire, préchauffage et volumes limités.
> - Des rapports hebdomadaires et mensuels.

## Exercice pratique : votre système de prospection professionnel

> [!exercice] Exercice pratique · 4 heures
> 1. Dans HubSpot (offre gratuite ou essai), créez les propriétés, statuts et vues d'une campagne.
> 2. Rédigez une séquence de 6 étapes avec ses modèles.
> 3. Concevez la même campagne dans Lemlist (essai) avec au moins 2 conditions.
> 4. Rédigez la liste de contrôle de délivrabilité d'un nouveau domaine d'envoi.
> 5. Créez le modèle de rapport hebdomadaire.
>
> **À livrer** : vos captures, votre séquence, votre campagne, votre liste de contrôle et votre modèle de rapport.
