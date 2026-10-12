Ce module vous donne les bases du travail d'automatisation : décrire un processus, préparer les données, comprendre les formats d'échange, écrire de bonnes consignes pour l'IA et prévoir les erreurs avant qu'elles n'arrivent.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Dessiner un processus avant de l'automatiser.
> 2. Préparer des données propres et structurées.
> 3. Lire un format JSON simple.
> 4. Écrire une consigne d'IA précise et vérifiable.
> 5. Prévoir les erreurs et les cas particuliers.

## Dessiner le processus d'abord

> [!definition] Cartographie de processus
> Un schéma qui décrit étape par étape comment une tâche se fait aujourd'hui : qui fait quoi, avec quel outil, dans quel ordre, et ce qui se passe en cas de problème.

### Exemple : une commande de gâteau sur mesure

```
1. Le client remplit le formulaire du site (nom, téléphone, date, type de gâteau, message)
2. La gérante lit l'e-mail de notification
3. Elle vérifie la disponibilité dans son agenda
4. Elle recopie la commande dans un tableau
5. Elle envoie un devis par e-mail ou WhatsApp
6. Le client paie un acompte par Mobile Money
7. Elle confirme la commande
```

### Les questions à poser

1. Quelles étapes sont **répétitives** et sans décision ? (2, 4, une partie de 5)
2. Quelles étapes demandent une **décision humaine** ? (3, vérification du paiement en 6)
3. Quels **cas particuliers** existent ? (date trop proche, gâteau impossible, client qui annule)
4. Où se trouvent les **données** ? (formulaire, agenda, tableau, messagerie)

> [!astuce]
> Automatisez d'abord **une partie** du processus, la plus simple et la plus répétitive. Un petit scénario fiable vaut mieux qu'un grand scénario fragile.

## Des données propres

| Règle | Pourquoi |
| --- | --- |
| **Champs obligatoires** dans les formulaires | Éviter les lignes incomplètes |
| **Listes déroulantes** plutôt que du texte libre | « Antananarivo » écrit toujours de la même façon |
| **Formats fixes** pour les dates et les téléphones | Les outils les comprennent sans erreur |
| **Un identifiant unique** par ligne (numéro de commande) | Retrouver et mettre à jour la bonne ligne |
| **Une colonne de statut** | Savoir où en est chaque élément : nouveau, traité, erreur |

## Lire un JSON simple

Les outils s'échangent souvent les données au format **JSON**.

```json
{
  "commande_id": "C-2026-0412",
  "client": {
    "nom": "Rasoa Hanta",
    "telephone": "0341234567"
  },
  "date_livraison": "2026-05-18",
  "produit": "Gâteau d'anniversaire chocolat",
  "parts": 20,
  "message": "Joyeux anniversaire Tiana !"
}
```

| Élément | Signification |
| --- | --- |
| `{ }` | Un objet (un ensemble de champs) |
| `"nom": "Rasoa Hanta"` | Un champ et sa valeur |
| `"client": { … }` | Un objet dans un objet |
| `20` | Un nombre (sans guillemets) |
| `[ … ]` | Une liste |

Dans Make ou Zapier, vous choisissez ces champs dans des menus pour les placer dans les étapes suivantes : c'est la **correspondance**.

## Écrire une bonne consigne d'IA

> [!definition] Prompt (consigne)
> Le texte qui dit à l'assistant d'IA ce qu'il doit faire. Dans une automatisation, la même consigne sera utilisée des centaines de fois : elle doit être précise, stable et produire un résultat facile à vérifier.

### Les 6 éléments d'une consigne d'automatisation

| Élément | Exemple |
| --- | --- |
| **Rôle et tâche** | « Tu classes les messages reçus par une pâtisserie. » |
| **Catégories ou règles** | « Catégories possibles : commande, question, réclamation, autre. » |
| **Données d'entrée** | « Voici le message : {{message}} » |
| **Format de sortie strict** | « Réponds uniquement par un JSON : {"categorie": "...", "urgence": "haute ou normale"} » |
| **Cas incertain** | « Si tu n'es pas sûr, utilise la catégorie autre. » |
| **Interdits** | « N'invente aucune information qui n'est pas dans le message. » |

> [!exemple] Consigne complète
> « Tu classes les messages reçus par une pâtisserie d'Antananarivo. Catégories possibles : commande, question, reclamation, autre. Urgence : haute si le client parle d'une livraison dans les 48 heures ou d'un problème avec une commande, sinon normale. Réponds uniquement par un JSON valide de la forme {"categorie": "...", "urgence": "..."}, sans aucun autre texte. Si tu n'es pas sûr, utilise "autre". Message : {{message}} »

> [!attention]
> Demandez toujours un **format de sortie strict** (une catégorie dans une liste, un JSON) : l'étape suivante du scénario doit pouvoir le lire sans erreur. Un texte libre de l'IA casse souvent l'automatisation.

## Prévoir les erreurs

| Situation | Ce qu'il faut prévoir |
| --- | --- |
| Un champ obligatoire est vide | Filtre qui arrête le scénario et alerte une personne |
| L'IA renvoie un format inattendu | Vérification du format, et sinon envoi en « à traiter à la main » |
| Un service externe est en panne | Nouvelle tentative automatique, puis alerte |
| Le même formulaire est envoyé deux fois | Vérifier l'identifiant avant de créer une ligne |
| Un cas particulier non prévu | Chemin « autre » vers un humain |

> [!madagascar]
> Les numéros de téléphone malgaches sont écrits de nombreuses façons (034 12 345 67, +261 34 12 345 67, 0341234567). Ajoutez une étape qui **normalise** les numéros dans un format unique avant de les utiliser pour un SMS ou un message WhatsApp.

> [!retenir]
> - Dessinez le processus et repérez les étapes répétitives et les décisions humaines.
> - Des données propres : champs obligatoires, listes, formats fixes, identifiant, statut.
> - Le JSON : objets, champs, valeurs, listes.
> - Une consigne d'IA précise, avec un format de sortie strict et un cas « autre ».
> - Chaque erreur possible a son chemin, souvent vers un humain.

## Exercice pratique : préparer une automatisation

> [!exercice] Exercice pratique · 2 heures 30
> 1. Dessinez le processus complet d'une tâche choisie au module 1.
> 2. Marquez les étapes à automatiser et celles qui restent humaines.
> 3. Créez le formulaire et le tableau avec des données propres (Google Forms et Google Sheets).
> 4. Écrivez une consigne d'IA avec les 6 éléments, testez-la sur 10 messages variés dans un assistant d'IA, et notez les erreurs.
> 5. Listez 5 erreurs possibles et ce que le scénario doit faire pour chacune.
>
> **À livrer** : votre schéma, votre formulaire, votre consigne avec les résultats des tests et votre liste d'erreurs.
