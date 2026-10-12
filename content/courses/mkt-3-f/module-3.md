Ce module vous fait prendre en main deux outils d'email marketing avec offre gratuite : **Brevo** et **MailerLite**. Vous apprendrez à importer une liste, créer un formulaire, concevoir un modèle d'e-mail, envoyer une campagne et construire une automatisation. Vous découvrirez aussi les **offres payantes** de Mailchimp, Brevo et ActiveCampaign.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Importer et organiser des contacts.
> 2. Créer un formulaire d'inscription.
> 3. Concevoir un modèle d'e-mail adapté au téléphone.
> 4. Envoyer une campagne et un test A/B.
> 5. Construire une automatisation de bienvenue.

## Brevo et MailerLite

| Point | Brevo | MailerLite |
| --- | --- | --- |
| **Points forts** | E-mail, SMS, WhatsApp et CRM dans un même outil ; interface en français | Simple, éditeur clair, pages d'atterrissage |
| **Offre gratuite** | Limitée en nombre d'e-mails par jour | Limitée en nombre d'abonnés et de fonctions |
| **Automatisations** | Oui | Oui |

*(Les limites des offres gratuites et les prix changent souvent : vérifiez sur les sites officiels.)*

## Importer et organiser les contacts

1. **Préparez** un fichier CSV propre : e-mail, prénom, pays, source, date d'inscription.
2. **Vérifiez** que chaque contact a donné son **consentement**.
3. **Importez** dans une liste et associez les champs.
4. **Ajoutez** des **étiquettes** ou attributs (client, prospect, centre d'intérêt).
5. **Supprimez** les doublons et les adresses invalides.

> [!attention]
> Les outils d'email marketing interdisent les listes achetées ou sans consentement, et peuvent **suspendre le compte** si les taux de rebond ou de plaintes sont trop élevés. Ne prenez jamais ce risque pour un client.

## Le formulaire d'inscription

1. **Créez** le formulaire dans l'outil (intégré, fenêtre surgissante ou page dédiée).
2. **Rédigez** la promesse et la mention de consentement.
3. **Activez** le double opt-in.
4. **Personnalisez** l'e-mail de confirmation.
5. **Intégrez** le formulaire sur le site (code à copier, extension WordPress ou Shopify).

## Le modèle d'e-mail

### Les règles de mise en page

| Règle | Pourquoi |
| --- | --- |
| **Une colonne** | Lisible sur téléphone |
| **Largeur d'environ 600 px** | Standard des messageries |
| **Texte de 14 à 16 px au moins** | Lisible sans zoomer |
| **Bouton large** pour l'appel à l'action | Facile à toucher |
| **Images légères** avec texte alternatif | Rapide à charger, compréhensible si les images sont bloquées |
| **Plus de texte que d'images** | Meilleure délivrabilité |

> [!astuce]
> Créez un **modèle de marque** (logo, couleurs, polices, pied de page) une fois pour toutes, puis dupliquez-le pour chaque campagne. Vous gagnez du temps et la marque reste cohérente.

## Envoyer une campagne

1. **Choisissez** le segment.
2. **Rédigez** l'objet, le texte d'aperçu et le contenu.
3. **Ajoutez** la personnalisation : `{{ contact.PRENOM }}` (la syntaxe dépend de l'outil).
4. **Envoyez-vous un test** sur un ordinateur et un téléphone : liens, images, fautes.
5. **Programmez** l'envoi à une heure adaptée au fuseau des abonnés.
6. **Analysez** les résultats après 48 heures.

### Le test A/B

| Élément testé | Version A | Version B |
| --- | --- | --- |
| Objet | « La récolte de vanille 2026 est arrivée » | « Claire, votre coffret Récolte 2026 vous attend » |

1. Envoyez chaque version à une petite partie de la liste (par exemple 2 × 15 %).
2. Choisissez le gagnant selon les **clics** (plus fiable que les ouvertures).
3. Envoyez la version gagnante au reste de la liste.

## L'automatisation de bienvenue

```
Déclencheur : inscription confirmée à la liste « Newsletter »
→ E-mail 1 (immédiat) : bienvenue + guide gratuit
→ Attendre 2 jours
→ E-mail 2 : l'histoire de la marque
→ Attendre 3 jours
→ Condition : a acheté ?
     oui → ajouter l'étiquette « client », fin
     non → E-mail 3 : avis clients et produits préférés
→ Attendre 4 jours
→ E-mail 4 : offre de bienvenue valable 7 jours
```

## Les offres payantes

| Outil | Ce qu'apportent les offres payantes |
| --- | --- |
| **Mailchimp** | Plus de contacts et d'envois, automatisations avancées, tests multiples, rapports détaillés |
| **Brevo** | Plus d'e-mails, suppression du logo Brevo, automatisations et tests avancés, adresses IP dédiées pour les gros volumes |
| **ActiveCampaign** | Automatisations très puissantes, CRM, notation des contacts, scénarios complexes |

> [!madagascar]
> Ces abonnements sont facturés en dollars ou en euros, souvent selon le nombre de contacts. La bonne pratique : le **client** ouvre et paie le compte, à son nom, et vous ajoute comme utilisateur. Vous restez libre de travailler avec plusieurs clients sans porter leurs factures. Vérifiez les prix à jour sur les sites officiels.

> [!retenir]
> - Des contacts importés avec consentement, étiquetés, sans doublon.
> - Un formulaire avec promesse claire et double opt-in.
> - Un modèle d'une colonne, lisible sur téléphone, avec un bouton visible.
> - Un test sur ordinateur et téléphone avant chaque envoi ; des tests A/B sur les clics.
> - Une automatisation de bienvenue avec condition.

## Exercice pratique : votre boîte à outils

> [!exercice] Exercice pratique · 3 heures
> 1. Créez un compte gratuit Brevo ou MailerLite.
> 2. Importez une liste fictive de 20 contacts (vos propres adresses de test) avec des étiquettes.
> 3. Créez un formulaire avec double opt-in et intégrez-le sur une page de test.
> 4. Créez un modèle de marque et envoyez-vous une campagne de test.
> 5. Construisez l'automatisation de bienvenue en 4 e-mails avec une condition.
>
> **À livrer** : captures de vos contacts, formulaire, modèle et automatisation.
