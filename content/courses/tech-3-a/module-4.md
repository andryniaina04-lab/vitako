Start-up, éditeurs de logiciels et prestataires d'Europe, d'Amérique du Nord et d'Afrique recrutent des administrateurs et des ingénieurs DevOps à distance. Ce module vous prépare à travailler avec eux : communication en anglais pendant les incidents, astreinte selon les fuseaux horaires, sécurité des accès, conformité, certifications et contrats.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Communiquer en anglais, en particulier pendant un incident.
> 2. Organiser une astreinte avec des clients dans d'autres fuseaux horaires.
> 3. Respecter les exigences de sécurité et de conformité des clients.
> 4. Choisir les certifications utiles.
> 5. Négocier vos conditions et un engagement de service.

## Communiquer en anglais

| Situation | Formule utile |
| --- | --- |
| Ouvrir un incident | « We're investigating elevated error rates on the checkout API. Next update in 30 minutes. » |
| Donner des nouvelles | « We've identified a full disk on the database server and are freeing space. » |
| Clore | « The issue is resolved. Error rates are back to normal. A post-incident review will follow. » |
| Proposer un changement | « I'd like to upgrade PostgreSQL on Saturday at 06:00 UTC. Expected downtime: under 5 minutes. » |
| Demander une validation | « Could you approve the Terraform plan before I apply it? » |

> [!astuce]
> Pendant un incident, communiquez **régulièrement**, même pour dire « toujours en cours ». Un client tolère mieux une panne quand il sait ce qui se passe et quand viendra la prochaine information.

## L'astreinte et les fuseaux horaires

| Question | Réponse à prévoir au contrat |
| --- | --- |
| **Heures couvertes** | Heures de bureau du client, ou 24 heures sur 24 |
| **Délai de réaction** | Selon la gravité (par exemple 15 minutes pour un incident critique) |
| **Outils d'alerte** | Application d'astreinte, appel téléphonique, SMS |
| **Remplaçant** | Qui intervient si vous êtes injoignable |
| **Rémunération** | Forfait d'astreinte, plus les interventions |

> [!madagascar]
> Une astreinte crédible depuis Madagascar demande une **double connexion** (fibre ou 4G de deux opérateurs), une batterie ou un onduleur pour le routeur et l'ordinateur, et un remplaçant identifié. Les clients étrangers posent toujours cette question : préparez une réponse écrite.

## Sécurité des accès chez le client

| Exigence fréquente | En pratique |
| --- | --- |
| **Double authentification** partout | Application d'authentification ou clé de sécurité |
| **Accès par VPN ou serveur de rebond** | Pas d'accès direct aux serveurs depuis Internet |
| **Appareil sécurisé** | Disque chiffré, mises à jour, antivirus selon la politique du client |
| **Accès temporaires** | Droits élevés seulement pour la durée d'une intervention |
| **Traçabilité** | Toutes les actions enregistrées |

## La conformité

| Référence | Ce que le client peut vous demander |
| --- | --- |
| **RGPD** | Données de citoyens européens stockées dans des régions autorisées, accès limités, journal des incidents |
| **ISO 27001** | Respect de procédures de sécurité documentées |
| **SOC 2** | Preuves de contrôles (accès, changements, sauvegardes) pour les audits du client |
| **Règles du secteur** | Santé, banque, paiement : exigences supplémentaires |

> [!attention]
> Ne promettez jamais qu'une infrastructure est « conforme » à une norme sans audit officiel. Vous pouvez dire que vous **appliquez des pratiques** qui aident le client à se mettre en conformité, et fournir les preuves de votre travail.

## Les certifications utiles

| Certification | Pour qui |
| --- | --- |
| **AWS Certified Cloud Practitioner, puis Solutions Architect Associate** | Cloud AWS |
| **HashiCorp Terraform Associate** | Infrastructure décrite en code |
| **Certified Kubernetes Administrator (CKA)** | Orchestration de conteneurs |
| **Certifications Linux** (par exemple LFCS) | Administration Linux |
| **Certification Datadog** | Surveillance avec Datadog |

> [!astuce]
> Les éditeurs modifient régulièrement leurs certifications. Vérifiez la **liste actuelle**, le prix, la langue et le mode d'examen sur le site officiel, et utilisez leurs parcours d'apprentissage gratuits.

## Vos conditions et l'engagement de service

| Point | Exemple |
| --- | --- |
| **Périmètre** | Serveurs, services et environnements couverts |
| **Engagement de service (SLA)** | Délais de réaction et de rétablissement selon la gravité |
| **Changements** | Fenêtres de maintenance, validation par le client |
| **Comptes et propriété** | Au nom du client, documentation à jour remise |
| **Responsabilité** | Limitée, selon le contrat |
| **Paiement** | Forfait mensuel payé d'avance, interventions en plus |

> [!retenir]
> - En anglais : ouvrir, informer, clore un incident ; proposer et faire valider un changement.
> - Astreinte : heures, délais, outils, remplaçant, rémunération, double connexion.
> - Accès : double authentification, VPN, appareil sécurisé, droits temporaires.
> - Conformité : appliquer des pratiques, ne pas promettre de certification.
> - SLA, fenêtres de maintenance, propriété au client.

## Exercice pratique : une mission internationale

> [!exercice] Exercice pratique · 3 heures
> 1. Rédigez en anglais les 3 messages d'un incident fictif (ouverture, suivi, clôture).
> 2. Rédigez votre plan de continuité pour l'astreinte.
> 3. Choisissez une certification et préparez un plan d'étude de 2 mois.
> 4. Rédigez un SLA simple avec 3 niveaux de gravité.
>
> **À livrer** : vos messages, votre plan de continuité, votre plan d'étude et votre SLA.
