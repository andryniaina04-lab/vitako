Les établissements organisés utilisent un **channel manager** comme **SiteMinder** et souvent une plateforme tout-en-un comme **Cloudbeds** (PMS, channel manager et moteur de réservation). Ce module vous apprend à les paramétrer correctement : types de chambres, plans tarifaires, restrictions, connexion des canaux, moteur de réservation et rapports.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Structurer les types de chambres et les plans tarifaires.
> 2. Relier correctement les canaux au channel manager.
> 3. Utiliser les restrictions de vente.
> 4. Paramétrer un moteur de réservation pour le site de l'hôtel.
> 5. Lire les rapports d'un PMS.

## Structurer l'offre

| Élément | Exemple pour le Lodge Tsara |
| --- | --- |
| **Types de chambres** | Bungalow jardin (6), Bungalow vue mer (3), Suite familiale (1) |
| **Plan de base** | Flexible, petit-déjeuner inclus |
| **Plans dérivés** | Non remboursable (−12 %), Demi-pension (+60 000 Ar par nuit), Long séjour (−10 % dès 7 nuits) |
| **Saisons** | Basse, moyenne, haute, fêtes de fin d'année |

> [!definition] Plan tarifaire dérivé
> Un plan dont le prix est calculé automatiquement à partir du plan de base (par exemple −12 %). Quand vous changez le prix de base, tous les plans dérivés suivent : moins de saisie, moins d'erreurs.

## Relier les canaux

> [!definition] Correspondance (mapping)
> L'association entre chaque type de chambre et plan tarifaire du channel manager et ceux de chaque OTA. Une erreur de correspondance envoie un mauvais prix ou une mauvaise disponibilité sur un canal.

### La méthode de connexion

1. **Nettoyez** d'abord les types de chambres et plans sur chaque OTA.
2. **Créez** la même structure dans le channel manager.
3. **Reliez** chaque type et chaque plan un par un.
4. **Vérifiez** sur chaque OTA que les prix et disponibilités affichés sont corrects, sur plusieurs dates.
5. **Fermez** les anciennes saisies manuelles pour éviter les doubles mises à jour.

> [!attention]
> La période de **connexion** est la plus risquée : un canal peut rester ouvert avec d'anciennes disponibilités. Faites-la en basse saison si possible, et vérifiez toutes les réservations des jours suivants.

## Les restrictions

| Restriction | Usage | Exemple |
| --- | --- | --- |
| **Durée minimale de séjour** | Éviter les nuits isolées en haute saison | 3 nuits minimum en août |
| **Durée maximale** | Limiter certains tarifs | Non remboursable limité à 7 nuits |
| **Fermé à l'arrivée** | Interdire les arrivées un jour donné | Pas d'arrivée le samedi pendant un festival |
| **Fermé au départ** | Interdire les départs un jour donné | Pas de départ le 31 décembre |
| **Arrêt des ventes** (stop sell) | Fermer un canal ou un type de chambre | Fermer une OTA quand il reste 1 chambre |
| **Délai minimal avant l'arrivée** | Pour les tarifs promotionnels | Non remboursable réservé au moins 14 jours avant |

> [!astuce]
> Les restrictions sont aussi puissantes que les prix. Une durée minimale bien placée en haute saison peut augmenter le revenu **sans changer le prix**, en évitant les trous dans le planning.

## Le moteur de réservation

| Élément | Bonne pratique |
| --- | --- |
| **Intégration au site** | Bouton « Réserver » visible sur toutes les pages |
| **Prix** | Cohérents avec les OTA, selon les contrats |
| **Avantages directs** | Petit-déjeuner, transfert, flexibilité, selon ce que l'hôtel décide |
| **Paiement** | Acompte ou garantie par carte via une solution de paiement sécurisée |
| **Langues et devises** | Français, anglais ; devises des clients principaux |
| **Version mobile** | Testée sur téléphone |

> [!attention]
> Ne demandez **jamais** aux voyageurs d'envoyer leur numéro de carte bancaire par e-mail ou WhatsApp. Les données de carte doivent passer par une solution de paiement sécurisée, conforme aux règles du secteur.

## Les rapports du PMS

| Rapport | Usage |
| --- | --- |
| **Arrivées et départs du jour** | Organisation de l'équipe sur place |
| **Prévisions d'occupation** | Décisions de prix et de restrictions |
| **Pick-up** (réservations reçues depuis une date) | Voir si la demande accélère ou ralentit |
| **Production par canal** | Coût et efficacité de chaque canal |
| **Annulations et no-show** | Ajuster les politiques |

> [!madagascar]
> SiteMinder, Cloudbeds et les outils similaires sont **payés par l'établissement**, en dollars. Pour vous former, utilisez les démonstrations, les centres d'aide et les académies en ligne proposés par les éditeurs. Avoir configuré un channel manager pour un établissement réel est une très bonne référence.

> [!retenir]
> - Types de chambres clairs, plan de base et plans dérivés.
> - Une correspondance vérifiée canal par canal, en période calme.
> - Restrictions : durée minimale, fermetures à l'arrivée ou au départ, arrêt des ventes.
> - Un moteur de réservation visible, cohérent et sécurisé.
> - Les rapports du PMS : prévisions, pick-up, production par canal.

## Exercice pratique : paramétrer une distribution

> [!exercice] Exercice pratique · 4 heures
> 1. Concevez la structure complète du Lodge Tsara : types, plan de base, 4 plans dérivés, 4 saisons.
> 2. Rédigez la procédure de connexion d'une OTA au channel manager, étape par étape.
> 3. Définissez 6 restrictions pour l'année, avec leur raison.
> 4. Regardez la démonstration d'un PMS et listez les 5 rapports que vous consulteriez chaque semaine.
>
> **À livrer** : votre structure, votre procédure, vos restrictions et votre liste de rapports.
