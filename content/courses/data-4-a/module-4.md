Les entreprises européennes et nord-américaines recherchent des spécialistes de l'automatisation et de l'IA, mais elles sont très attentives à la protection des données, à la sécurité et aux règles sur l'IA. Ce module vous prépare à travailler avec elles de façon professionnelle et rassurante.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Identifier les données personnelles qui circulent dans une automatisation.
> 2. Choisir et documenter les services utilisés (sous-traitants).
> 3. Tenir compte des règles applicables à l'IA.
> 4. Documenter et communiquer en anglais.
> 5. Travailler en équipe asynchrone avec un client étranger.

## Les données personnelles dans une automatisation

### La cartographie des flux

| Étape | Données | Service | Localisation |
| --- | --- | --- | --- |
| Formulaire | Nom, e-mail, téléphone, message | Outil de formulaire | Selon le fournisseur |
| Automatisation | Toutes les données du formulaire | Make ou Zapier | Selon l'offre et la région du compte |
| Classement par l'IA | Message (sans nom ni téléphone) | Fournisseur d'IA | Selon le fournisseur |
| CRM | Nom, e-mail, téléphone, catégorie | CRM du client | Selon le fournisseur |

> [!astuce]
> Retirez les données inutiles **avant** l'étape d'IA : pour classer un message, l'IA n'a pas besoin du nom ni du téléphone. Vous réduisez les risques et souvent les coûts.

### Les principes à appliquer

1. **Minimisation** : seulement les données nécessaires à chaque étape.
2. **Durée de conservation** : les historiques d'exécution et les tables ne gardent pas les données plus longtemps que nécessaire.
3. **Accès** : comptes au nom du client, accès personnels, double authentification.
4. **Sécurité** : connexions sécurisées, pas de données sensibles dans les journaux visibles.
5. **Droits des personnes** : pouvoir retrouver et supprimer les données d'une personne dans tous les outils.

## Les services utilisés (sous-traitants)

> [!definition] Sous-traitant (au sens de la protection des données)
> Un service qui traite des données personnelles pour le compte du client : plateforme d'automatisation, fournisseur d'IA, CRM, service d'e-mail. Le client doit savoir lesquels sont utilisés, et souvent signer leurs conditions de traitement des données.

| À vérifier pour chaque service | Exemple de question |
| --- | --- |
| **Conditions de traitement des données** | Existe-t-il un accord de traitement des données (DPA) ? |
| **Localisation** | Où sont hébergées les données ? Peut-on choisir une région ? |
| **Usage des données par le fournisseur** | Les données envoyées à l'IA servent-elles à entraîner les modèles ? Selon quelle offre ? |
| **Sécurité** | Certifications, chiffrement, double authentification |

> [!attention]
> Les réponses dépendent de l'**offre** souscrite (gratuite, professionnelle, entreprise) et changent avec le temps. Vérifiez la documentation officielle de chaque fournisseur, et laissez le client et ses conseillers valider les choix juridiques.

## Les règles applicables à l'IA

1. **Transparence** : informer les personnes quand elles échangent avec un assistant automatique.
2. **Contrôle humain** pour les décisions importantes concernant des personnes.
3. **Règles sectorielles** : santé, finance, emploi, éducation sont souvent plus encadrés.
4. **Règles européennes sur l'IA** : l'Union européenne a adopté un règlement sur l'IA qui classe les usages selon leur niveau de risque. Si votre client est concerné, il doit vérifier ses obligations avec ses conseillers.

## Documenter et communiquer en anglais

### Le vocabulaire

| Français | Anglais |
| --- | --- |
| Scénario d'automatisation | Workflow / scenario / Zap |
| Déclencheur | Trigger |
| Gestion des erreurs | Error handling |
| Consigne | Prompt |
| Sortie structurée | Structured output |
| Jeu de test | Evaluation set / test set |
| Humain dans la boucle | Human in the loop |
| Accord de traitement des données | Data processing agreement (DPA) |

> [!exemple] Note de livraison en anglais
> "The invoice workflow is now live in assisted mode. High-confidence invoices under EUR 1,000 are pre-filled; all others go to the 'To review' queue. On our 80-invoice test set, field accuracy is 94% and no amount errors were found. Personal data is removed before the AI step. Monthly AI cost is estimated at USD 35, with a USD 60 cap. Next review: May 15."

## Travailler en équipe asynchrone

| Pratique | Pourquoi |
| --- | --- |
| **Vidéo courte** de démonstration de chaque livraison | Le client comprend sans réunion |
| **Fiche** de chaque scénario dans un espace partagé | Tout le monde retrouve l'information |
| **Point hebdomadaire écrit** | Avancement, risques, décisions attendues |
| **Heures de chevauchement** fixées | Pour les échanges en direct |
| **Procédure d'incident** connue | Qui fait quoi en cas de panne, avec les heures en UTC |

> [!madagascar]
> Avec des clients en Europe, le faible décalage horaire permet de travailler presque aux mêmes heures. Avec l'Amérique du Nord, privilégiez l'écrit et les vidéos, et convenez d'une plage commune en fin de journée à Antananarivo.

> [!retenir]
> - Une cartographie des flux de données et la minimisation avant l'IA.
> - Chaque service vérifié : accord de traitement, localisation, usage des données.
> - Transparence, contrôle humain et vérification des règles sur l'IA par le client.
> - Une documentation et des notes de livraison en anglais.
> - Le travail asynchrone repose sur l'écrit, les vidéos et des procédures claires.

## Exercice pratique : un projet international

> [!exercice] Exercice pratique · 3 heures
> 1. Cartographiez les flux de données d'un de vos scénarios.
> 2. Pour 3 services utilisés, cherchez dans leur documentation officielle : accord de traitement des données, localisation, usage des données envoyées.
> 3. Modifiez le scénario pour retirer les données inutiles avant l'étape d'IA.
> 4. Rédigez une note de livraison en anglais et enregistrez une vidéo de démonstration de 2 minutes.
>
> **À livrer** : votre cartographie, vos recherches, votre scénario modifié, votre note et votre vidéo.
