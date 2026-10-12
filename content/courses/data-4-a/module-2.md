Au niveau Avancé, vous utilisez les fonctions professionnelles des **offres payantes de Make et de Zapier** et des **abonnements et API d'IA** : traitement de listes, stockage de données, gestion des erreurs, appels d'API sur mesure, sorties structurées et bases de connaissances. Ce module vous apprend à construire des systèmes robustes.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Traiter des listes avec itérateurs et agrégateurs.
> 2. Appeler n'importe quelle API avec le module HTTP et les webhooks.
> 3. Gérer les erreurs de façon professionnelle.
> 4. Utiliser une API d'IA avec des sorties structurées et maîtriser les coûts.
> 5. Construire un assistant qui répond à partir d'une base de connaissances.

## Make et Zapier : les fonctions avancées

| Besoin | Make | Zapier |
| --- | --- | --- |
| Traiter chaque élément d'une liste | Itérateur | Boucle (Looping) |
| Regrouper des éléments en un seul | Agrégateur | Fonctions de transformation |
| Conditions multiples | Routeur et filtres | Chemins (Paths) |
| Transformer des données | Fonctions intégrées | Formatter |
| Stocker des données entre exécutions | Data stores | Tables |
| Appeler une API sans connecteur | Module HTTP | Requêtes webhooks ou API |
| Petit code sur mesure | Selon l'offre | Étape Code (JavaScript ou Python) |
| Gestion des erreurs | Gestionnaires d'erreurs par module | Chemins d'erreur, nouvelles tentatives |

*(Les noms, fonctions et limites des offres changent : vérifiez sur les sites officiels.)*

## Itérateurs et agrégateurs

> [!exemple] Une facture avec plusieurs lignes
> 1. Une commande arrive avec 6 produits (une liste).
> 2. L'**itérateur** traite chaque produit : vérifier le stock, calculer la ligne.
> 3. L'**agrégateur** regroupe les 6 lignes calculées en un seul tableau.
> 4. Le module suivant crée **une** facture avec ses 6 lignes.

> [!attention]
> Chaque élément traité par un itérateur consomme des **opérations**. Une liste de 500 éléments traitée chaque heure peut épuiser un abonnement en quelques jours. Filtrez avant d'itérer, et estimez la consommation avant la mise en service.

## Le module HTTP et les webhooks

```
Requête HTTP vers une API de livraison
Méthode : POST
URL : https://api.exemple-livraison.com/v1/expeditions
En-têtes :
  Authorization: Bearer {{cle_api}}   (stockée dans une connexion sécurisée)
  Content-Type: application/json
Corps :
{
  "reference": "{{commande.id}}",
  "destinataire": "{{commande.client.nom}}",
  "telephone": "{{commande.client.telephone}}",
  "adresse": "{{commande.adresse}}"
}
```

### Les règles

1. **Lisez la documentation** de l'API : authentification, limites de débit, codes d'erreur.
2. **Testez** d'abord dans l'environnement de test du fournisseur.
3. **Stockez les clés** dans les connexions sécurisées, jamais dans un champ visible.
4. **Vérifiez** les webhooks reçus (signature ou secret partagé).
5. **Gérez** les limites de débit (pauses, files).

## La gestion des erreurs

| Stratégie | Quand l'utiliser |
| --- | --- |
| **Nouvelle tentative** automatique | Erreur temporaire (service indisponible, délai dépassé) |
| **Ignorer** l'élément et continuer | Un élément invalide parmi beaucoup d'autres, avec enregistrement |
| **Arrêter** et alerter | Erreur grave (paiement, données incohérentes) |
| **Mettre de côté** pour un humain | Cas incertain, à traiter à la main |

> [!astuce]
> Créez une **table des erreurs** (data store ou tableau) : date, scénario, élément, message, statut. Chaque matin, une personne la consulte. Vous transformez les pannes silencieuses en tâches visibles.

## Les API d'IA : sorties structurées et coûts

### Les sorties structurées

Les principales API d'IA permettent d'exiger une réponse conforme à un **schéma JSON**. L'étape suivante peut la lire sans erreur.

```json
{
  "type": "object",
  "properties": {
    "fournisseur": { "type": "string" },
    "numero_facture": { "type": "string" },
    "date": { "type": "string", "description": "Format AAAA-MM-JJ" },
    "montant_ttc": { "type": "number" },
    "devise": { "type": "string", "enum": ["MGA", "EUR", "USD"] },
    "confiance": { "type": "string", "enum": ["haute", "moyenne", "basse"] }
  },
  "required": ["fournisseur", "montant_ttc", "devise", "confiance"]
}
```

### Les réglages et les coûts

| Élément | Conseil |
| --- | --- |
| **Choix du modèle** | Un modèle plus petit et moins cher suffit souvent pour classer ; un modèle plus puissant pour les textes complexes |
| **Température** | Basse pour les tâches de classement et d'extraction (réponses plus stables) |
| **Longueur du texte envoyé** | Envoyer seulement ce qui est utile : le coût dépend de la quantité de texte (jetons) |
| **Volume** | Estimer : nombre d'appels par mois × coût moyen par appel |
| **Limites de dépenses** | Plafond mensuel configuré dans le compte du fournisseur |

> [!madagascar]
> Les API d'IA sont facturées à l'usage, en dollars, souvent par carte bancaire internationale. Le **client** ouvre le compte, enregistre son moyen de paiement et fixe un **plafond de dépenses** ; vous recevez une clé ou un accès. Présentez-lui une estimation mensuelle avant la mise en service.

## L'assistant à partir d'une base de connaissances

> [!definition] Génération augmentée par la recherche (RAG)
> Une méthode où l'on cherche d'abord les passages utiles dans une base de documents validés (procédures, fiches produits, règlement), puis on demande à l'IA de répondre **uniquement à partir de ces passages**, en citant la source.

### Les étapes

1. **Rassembler** les documents à jour et validés.
2. **Découper** en passages courts et clairs.
3. **Rechercher** les passages pertinents pour chaque question.
4. **Répondre** avec une consigne stricte : seulement à partir des passages, citer la source, dire « je ne sais pas » sinon.
5. **Mesurer** la qualité sur un jeu de questions de test.

> [!retenir]
> - Itérateurs et agrégateurs pour les listes, en surveillant la consommation.
> - Le module HTTP pour toute API, avec documentation, tests et clés protégées.
> - 4 stratégies d'erreur et une table des erreurs consultée chaque jour.
> - Sorties structurées, température basse, coûts estimés et plafonnés.
> - Un assistant qui répond à partir de documents validés et cite ses sources.

## Exercice pratique : un système robuste

> [!exercice] Exercice pratique · 5 heures
> 1. Construisez un scénario avec itérateur et agrégateur (commande à plusieurs lignes vers un document récapitulatif).
> 2. Appelez une API publique de test avec le module HTTP et gérez au moins 2 types d'erreurs.
> 3. Créez une table des erreurs et un chemin « à traiter à la main ».
> 4. Extrayez les champs de 10 factures fictives avec une API d'IA et un schéma JSON, et comparez avec les vraies valeurs.
> 5. Estimez le coût mensuel pour 2 000 factures.
>
> **À livrer** : captures de vos scénarios, votre table des erreurs, vos résultats d'extraction et votre estimation.
