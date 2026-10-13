Dans ce module, vous réalisez un audit de sécurité de base pour un client, comme le ferait un analyste indépendant : cadre et autorisation, inventaire, analyse du site, revue des comptes et des sauvegardes, rapport et plan de correction, puis vérification.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Cadrer une mission avec une autorisation écrite.
> 2. Mener un audit de base avec méthode.
> 3. Classer les constats par niveau de risque.
> 4. Rédiger un rapport clair pour un client non technique.
> 5. Accompagner les corrections et vérifier le résultat.

## Le cas pratique : « Lamba Gasy Shop »

> [!exemple] Votre client
> **Lamba Gasy Shop** vend des lamba et des articles en soie sauvage sur son site, à Madagascar et à l'étranger. L'an dernier, le compte Facebook de la boutique a été piraté et un client s'est plaint d'avoir reçu un faux message de paiement. La gérante veut savoir si son site et ses comptes sont bien protégés. Le site est hébergé chez un prestataire et géré par une agence web.

## Étape 1 : le cadre et l'autorisation

| Élément de l'autorisation | Contenu |
| --- | --- |
| **Signataire** | La gérante, propriétaire du site et des comptes |
| **Accord de l'hébergeur et de l'agence** | Vérifié : les conditions de l'hébergeur autorisent les tests, l'agence est informée |
| **Périmètre** | Le site lambagasyshop.mg (exemple), les comptes de messagerie et de réseaux sociaux de la boutique |
| **Hors périmètre** | Les comptes personnels, les systèmes de l'hébergeur et des clients |
| **Méthodes** | Inventaire, analyse passive du site, revue de configuration avec la gérante |
| **Dates et horaires** | Fenêtre définie, contact joignable en cas de problème |
| **Confidentialité** | Résultats remis uniquement à la gérante |

> [!attention]
> Si le site est hébergé chez un prestataire, **son accord** ou ses conditions d'utilisation comptent aussi. Pas d'autorisation écrite complète, pas de test.

## Étape 2 : l'audit

| Domaine | Vérifications |
| --- | --- |
| **Inventaire** | Ports exposés, services, versions (Nmap, dans le périmètre autorisé) |
| **Site web** | HTTPS, en-têtes de sécurité, cookies, version du CMS et des extensions (ZAP en analyse passive) |
| **Comptes** | Double authentification, administrateurs, anciens accès |
| **Messagerie** | Protection contre l'usurpation du nom de domaine (enregistrements SPF, DKIM, DMARC) |
| **Sauvegardes** | Existence, fréquence, copie hors du serveur, restauration testée |
| **Pratiques** | Qui a les mots de passe, comment sont-ils partagés |

## Étape 3 : les constats

| N° | Constat | Risque | Recommandation |
| --- | --- | --- | --- |
| 1 | Pas de double authentification sur Facebook et l'administration du site | **Critique** | L'activer immédiatement |
| 2 | Extensions du site non mises à jour depuis 1 an | **Élevé** | Mettre à jour, supprimer les extensions inutiles |
| 3 | Pas de protection DMARC sur le nom de domaine | **Élevé** | Configurer SPF, DKIM et DMARC avec l'hébergeur |
| 4 | Ancien employé toujours administrateur | **Élevé** | Retirer l'accès |
| 5 | Sauvegardes sur le même serveur, jamais testées | **Moyen** | Copie externe, test de restauration |
| 6 | Version du serveur visible | **Faible** | Masquer la version |

> [!madagascar]
> Pour une boutique qui vend par Mobile Money, ajoutez une **recommandation de communication** : publier clairement sur le site et les réseaux les seuls numéros officiels de paiement, et rappeler aux clients que la boutique ne demande jamais de code de confirmation.

## Étape 4 : le rapport

```
Rapport d'audit de sécurité – Lamba Gasy Shop
1. Résumé pour la direction (1 page, sans jargon)
   - Niveau global : à améliorer
   - 3 actions prioritaires cette semaine
2. Cadre : autorisation, périmètre, dates, méthodes
3. Constats classés par risque (description, preuve, impact, recommandation)
4. Plan de correction : quoi, qui, quand
5. Annexes techniques (résultats d'outils vérifiés)
```

> [!astuce]
> Le **résumé pour la direction** est la partie la plus lue. Écrivez-le pour quelqu'un qui n'est pas technicien : ce qui est en danger, ce qu'il faut faire, combien de temps cela prend.

## Étape 5 : correction et vérification

| N° | Action |
| --- | --- |
| 1 | Présenter le rapport à la gérante et à l'agence web |
| 2 | Aider à prioriser : critique cette semaine, élevé ce mois-ci |
| 3 | Accompagner les corrections (double authentification, retrait d'accès) |
| 4 | Vérifier chaque correction (nouveau test dans le périmètre autorisé) |
| 5 | Remettre une note de clôture et proposer une revue dans 6 mois |

> [!retenir]
> - Autorisation écrite, périmètre, hors périmètre, accord de l'hébergeur.
> - Audit : inventaire, site, comptes, messagerie, sauvegardes, pratiques.
> - Constats classés avec recommandations concrètes.
> - Rapport avec résumé non technique et plan de correction.
> - Accompagner et vérifier les corrections.

## Exercice pratique : l'audit de Lamba Gasy Shop

> [!exercice] Exercice pratique · 10 heures (sur plusieurs jours)
> 1. Rédigez l'autorisation écrite de la mission (modèle).
> 2. Dans votre laboratoire, installez un site de test (par exemple un CMS avec une extension ancienne) et auditez-le.
> 3. Classez au moins 6 constats et rédigez vos recommandations.
> 4. Écrivez le rapport complet avec le résumé pour la direction.
> 5. Corrigez dans votre laboratoire et vérifiez les corrections.
>
> **À livrer** : l'autorisation, le rapport et la note de clôture. C'est votre projet de portfolio.
