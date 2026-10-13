Sécuriser un serveur, déployer une application avec Docker et automatiser les tests ouvrent les premières missions. Les administrateurs et DevOps les mieux payés vont plus loin : ils conçoivent des infrastructures **fiables**, **reproductibles** et **maîtrisées en coût**, et prennent la responsabilité de leur bon fonctionnement. Ce module vous aide à choisir votre spécialité et à proposer un audit d'infrastructure comme offre d'entrée.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Comparer les 6 spécialités avancées du DevOps.
> 2. Choisir la vôtre selon vos forces et le marché.
> 3. Mener un audit d'infrastructure.
> 4. Présenter des risques et des priorités clairs.
> 5. Proposer des offres à plus forte valeur.

## Les 6 spécialités avancées

| N° | Spécialité | Ce que vous faites | Ce qu'il faut maîtriser |
| --- | --- | --- | --- |
| 1 | **Cloud** | Concevoir et gérer des infrastructures chez un grand fournisseur | Réseau, identités et droits, services gérés |
| 2 | **Infrastructure décrite en code** | Créer serveurs et réseaux à partir de fichiers versionnés | Terraform, Ansible, Git |
| 3 | **Orchestration de conteneurs** | Faire tourner de nombreux conteneurs de façon fiable | Kubernetes, réseau, stockage |
| 4 | **Observabilité et fiabilité (SRE)** | Mesurer, alerter, réagir aux incidents | Métriques, journaux, traces, objectifs de fiabilité |
| 5 | **Sécurité DevOps (DevSecOps)** | Intégrer la sécurité dans les pipelines et l'infrastructure | Secrets, analyses de vulnérabilités, durcissement |
| 6 | **Maîtrise des coûts (FinOps)** | Réduire et prévoir les factures du cloud | Facturation, dimensionnement, réservations |

> [!madagascar] Des spécialités où vous avez un avantage
> - **Maintenance et surveillance à distance** pour des PME et agences européennes, avec un faible décalage horaire.
> - **Maîtrise des coûts** : vous savez travailler avec des budgets serrés, une qualité très recherchée par les start-up.
> - **Infrastructures pour l'Afrique** : choix des régions proches des utilisateurs, applications qui supportent les réseaux lents.

## L'audit d'infrastructure : votre offre d'entrée

| Domaine | Questions |
| --- | --- |
| **Sécurité** | Accès, mots de passe, mises à jour, ports ouverts, secrets dans le code ? |
| **Sauvegardes** | Existent-elles hors du serveur ? Une restauration a-t-elle déjà été testée ? |
| **Disponibilité** | Que se passe-t-il si un serveur tombe ? Combien de pannes ces derniers mois ? |
| **Déploiement** | Manuel ou automatique ? Retour arrière possible ? |
| **Surveillance** | Qui est prévenu en cas de panne, et comment ? |
| **Coûts** | Ressources inutilisées, serveurs trop gros, facture qui augmente ? |
| **Documentation** | Une autre personne pourrait-elle reprendre l'infrastructure ? |

> [!attention]
> Réalisez l'audit avec un **accès officiel en lecture**, accordé par écrit par le client, et sans rien modifier pendant l'audit. Les corrections viennent ensuite, une fois validées.

### Le rapport d'audit

```
Client : Tsena Online (exemple)
Constat principal : un seul serveur, sauvegardes sur le même disque,
déploiements manuels par SSH, facture cloud en hausse de 60 % en 6 mois.

Risques prioritaires
1. Perte totale des données si le disque tombe en panne.
2. Deux anciens prestataires ont encore un accès administrateur.
3. Trois serveurs de test oubliés représentent 35 % de la facture.

Proposition
- Semaine 1 : retrait des accès, sauvegardes externes testées, arrêt des serveurs inutiles.
- Semaines 2 à 4 : infrastructure en code, déploiement automatique, surveillance.
```

> [!astuce]
> Classez chaque constat par **gravité** et par **effort** de correction. Commencez par les corrections graves et rapides (accès, sauvegardes) : le client voit tout de suite la valeur de votre travail.

## Des offres à plus forte valeur

| Offre | Pourquoi elle vaut plus |
| --- | --- |
| **Infrastructure reproductible** | Le client peut recréer son infrastructure en cas de catastrophe |
| **Surveillance et astreinte** | Les pannes sont détectées et traitées, même la nuit |
| **Réduction des coûts** | Le travail se rembourse par les économies réalisées |
| **Plan de reprise après sinistre** | Le client sait combien de temps et de données il peut perdre au maximum |

> [!retenir]
> - 6 spécialités : cloud, infrastructure en code, orchestration, observabilité, DevSecOps, FinOps.
> - Audit : sécurité, sauvegardes, disponibilité, déploiement, surveillance, coûts, documentation.
> - Accès en lecture accordé par écrit, aucune modification pendant l'audit.
> - Priorités par gravité et effort.
> - Vendre reproductibilité, surveillance, économies et reprise après sinistre.

## Exercice pratique : votre positionnement

> [!exercice] Exercice pratique · 3 heures
> 1. Choisissez votre spécialité et justifiez votre choix en 5 lignes.
> 2. Auditez l'infrastructure de votre projet Fondamentaux selon les 7 domaines.
> 3. Classez vos constats dans une grille gravité et effort.
> 4. Rédigez un rapport avec une proposition en 2 étapes.
>
> **À livrer** : votre positionnement, votre grille et votre rapport.
