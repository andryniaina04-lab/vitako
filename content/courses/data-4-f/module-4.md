Dans ce module, vous réalisez une mission complète d'automatisation pour une petite entreprise : diagnostic, conception, construction, tests, formation et suivi. C'est le type de projet qui deviendra votre première étude de cas, avec un résultat mesurable : le temps gagné.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Mener un diagnostic et mesurer le temps perdu.
> 2. Concevoir un ensemble de scénarios reliés.
> 3. Construire et tester avec le client.
> 4. Former l'équipe et remettre la documentation.
> 5. Mesurer les résultats après un mois.

## Le cas pratique : « Formation Mendrika »

> [!exemple] Votre client
> **Formation Mendrika** est un centre de formation en bureautique à Mahajanga. Il reçoit chaque mois environ 150 demandes d'information par son site, Facebook et e-mail, et inscrit 60 élèves. L'assistante, Mme Lova, passe ses journées à recopier les demandes, répondre aux mêmes questions, envoyer les rappels de cours et préparer les attestations de fin de formation. La directrice veut libérer du temps pour le suivi des élèves.

## Étape 1 : le diagnostic

| Tâche | Fréquence par mois | Durée | Temps total |
| --- | --- | --- | --- |
| Recopier les demandes dans le tableau | 150 | 3 min | 7 h 30 |
| Répondre aux questions fréquentes (prix, horaires) | 100 | 5 min | 8 h 20 |
| Envoyer les confirmations d'inscription | 60 | 4 min | 4 h |
| Envoyer les rappels la veille des cours | 240 | 1 min | 4 h |
| Préparer les attestations | 60 | 6 min | 6 h |
| **Total** | | | **environ 30 heures par mois** |

*(Chiffres donnés en exemple : mesurez-les avec le client pendant une ou deux semaines.)*

## Étape 2 : la conception

### Les 4 scénarios

| N° | Scénario | Déclencheur | Ce qu'il fait | Ce qui reste humain |
| --- | --- | --- | --- | --- |
| 1 | **Centralisation des demandes** | Formulaire du site, e-mail | Ajoute chaque demande au tableau avec la source et le statut « Nouveau » | Les demandes venues de Facebook sont ajoutées par un formulaire rapide |
| 2 | **Réponse aux questions fréquentes** | Nouvelle demande | L'IA classe la demande ; pour une question fréquente, elle prépare un brouillon à partir de la fiche d'informations officielle | L'assistante relit et envoie |
| 3 | **Inscription et rappels** | Statut passé à « Inscrit » | E-mail de confirmation avec le planning ; rappel automatique la veille de chaque cours | Les changements de planning |
| 4 | **Attestations** | Statut passé à « Formation terminée » | Crée l'attestation à partir d'un modèle (Google Docs), l'exporte en PDF et l'envoie | La directrice valide la liste des élèves qui ont réussi |

> [!attention]
> Pour le scénario 2, l'IA doit répondre **uniquement** à partir d'une **fiche d'informations officielle** (prix, horaires, adresse, programmes) fournie dans la consigne. Interdisez-lui d'inventer un prix ou une date : si l'information n'est pas dans la fiche, la demande part en « à traiter à la main ».

## Étape 3 : construire et tester avec le client

1. **Construisez** un scénario à la fois, dans le compte du client.
2. **Testez** avec des données fictives, puis avec 5 vraies demandes en parallèle du travail habituel.
3. **Montrez** les résultats à l'assistante : c'est elle qui sait si les brouillons sont bons.
4. **Ajustez** la consigne d'IA et les filtres.
5. **Mettez en service** progressivement : un scénario par semaine.

> [!astuce]
> Impliquez la personne dont vous automatisez le travail dès le début. Elle connaît les cas particuliers, et elle doit voir l'automatisation comme une aide, pas comme une menace.

## Étape 4 : former et documenter

### Le guide pour l'équipe (2 pages)

1. **Ce qui est automatique** et ce qui ne l'est pas.
2. **Où voir** les demandes et leur statut.
3. **Comment** relire et envoyer un brouillon.
4. **Que faire** si un e-mail n'est pas parti ou si une alerte arrive.
5. **Qui contacter** en cas de problème.

### La remise technique

1. Fiche de documentation de chaque scénario.
2. Liste des comptes et connexions (au nom du client).
3. Consignes d'IA et fiche d'informations officielle, avec leur date.
4. Procédure si un scénario tombe en panne.

## Étape 5 : mesurer les résultats

| Indicateur | Avant | Après 1 mois |
| --- | --- | --- |
| Temps de l'assistante sur ces tâches | 30 h par mois | 8 h par mois |
| Délai de réponse aux demandes | 1 à 2 jours | Moins de 4 heures |
| Demandes oubliées | Plusieurs par mois | 0 constatée |
| Erreurs d'attestation | 3 par mois | 0 constatée |

*(Chiffres donnés en exemple.)*

> [!madagascar]
> Beaucoup de clients malgaches reçoivent leurs demandes par **Facebook Messenger** ou **WhatsApp**. Les connexions automatiques à ces messageries sont soumises à des règles strictes et souvent payantes. Une solution simple et fiable : un **formulaire rapide** que l'assistante remplit en 30 secondes à partir du message, qui déclenche ensuite toute l'automatisation.

> [!retenir]
> - Mesurez le temps perdu avant de concevoir.
> - Des scénarios reliés par un tableau central et une colonne de statut.
> - L'IA répond uniquement à partir d'informations officielles, avec relecture.
> - Construction progressive, testée avec l'équipe.
> - Guide d'équipe, remise technique et mesure des résultats.

## Exercice pratique : la mission Formation Mendrika

> [!exercice] Exercice pratique · 8 heures (sur plusieurs jours)
> 1. Choisissez une vraie petite organisation (ou utilisez le cas Mendrika) et faites le diagnostic chiffré.
> 2. Concevez 3 ou 4 scénarios avec ce qui reste humain.
> 3. Construisez-les dans Make ou Zapier, dont au moins un avec une étape d'IA et une fiche d'informations.
> 4. Testez avec au moins 10 cas, dont des cas particuliers.
> 5. Rédigez le guide d'équipe et la remise technique.
> 6. Estimez le temps gagné.
>
> **À livrer** : votre diagnostic, vos scénarios, vos tests, vos documents et votre estimation. C'est votre projet de portfolio.
