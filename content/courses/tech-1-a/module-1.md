Exécuter des cas de test et rédiger de bons rapports de bugs ouvre les premières missions. Les testeurs les mieux payés vont plus loin : ils **automatisent** les tests répétitifs, testent les API, la performance et l'accessibilité, et aident l'équipe à livrer plus vite **sans casser** ce qui marche. Ce module vous aide à choisir votre spécialité et à vendre des résultats.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Comparer les 6 spécialités avancées du test logiciel.
> 2. Choisir la vôtre selon vos forces et le marché.
> 3. Mener un audit de la qualité d'un projet.
> 4. Construire une stratégie de test fondée sur les risques.
> 5. Proposer des offres à plus forte valeur.

## Les 6 spécialités avancées

| N° | Spécialité | Ce que vous faites | Ce qu'il faut maîtriser |
| --- | --- | --- | --- |
| 1 | **Automatisation des tests web** | Écrire des tests qui s'exécutent seuls à chaque version | Playwright, JavaScript ou TypeScript, sélecteurs, intégration continue |
| 2 | **Tests d'API** | Vérifier les échanges entre applications | Postman, HTTP, JSON, authentification |
| 3 | **Tests mobiles** | Tester des applications sur de vrais téléphones | Android et iOS, fermes d'appareils, cas propres au mobile |
| 4 | **Tests de performance** | Mesurer la tenue face à de nombreux utilisateurs | Outils de charge, lecture des temps de réponse |
| 5 | **Tests d'accessibilité** | Vérifier l'usage par les personnes handicapées | Normes WCAG, lecteurs d'écran, navigation au clavier |
| 6 | **Responsable qualité (QA lead)** | Organiser le test d'un projet ou d'une équipe | Stratégie, indicateurs, outils, encadrement |

> [!definition] Test de non-régression
> Un test qui vérifie que les fonctions existantes marchent toujours après une modification. C'est le premier candidat à l'automatisation, car on le répète à chaque version.

> [!madagascar] Des spécialités où vous avez un avantage
> - **Automatisation et non-régression** pour des éditeurs francophones qui publient souvent.
> - **Tests mobiles en conditions réelles** : réseaux lents, coupures, téléphones d'entrée de gamme, très répandus en Afrique.
> - **Test en français et en anglais** pour des produits bilingues.

## L'audit de la qualité d'un projet

Un audit est une bonne **offre d'entrée** : vous montrez où l'équipe perd du temps et où se cachent les risques.

| Domaine | Questions |
| --- | --- |
| **Processus** | Quand teste-t-on ? Qui décide qu'une version est prête ? |
| **Couverture** | Quelles fonctions critiques sont testées ? Lesquelles jamais ? |
| **Automatisation** | Existe-t-il des tests automatiques ? Sont-ils fiables ? |
| **Bugs** | Combien sont trouvés par les clients après la mise en ligne ? |
| **Environnements et données** | Existe-t-il un environnement de test stable et des données de test ? |
| **Outils** | Tickets, gestion des cas de test, rapports |

### Le rapport d'audit

```
Projet : application de livraison – Sakafo Express
Constat principal : 60 % des bugs graves des 3 derniers mois ont été trouvés par les clients.

Risques prioritaires
1. Paiement Mobile Money : aucun test après les mises à jour.
2. Application Android : testée sur un seul téléphone récent.
3. Pas d'environnement de test : les tests se font en production.

Proposition
- Mois 1 : cas de test des parcours critiques, environnement de test.
- Mois 2 : automatisation de 20 tests de non-régression.
- Ensuite : campagne avant chaque version, rapport mensuel.
```

## La stratégie de test fondée sur les risques

> [!definition] Risque
> La combinaison de la **probabilité** qu'une fonction contienne un bug et de l'**impact** de ce bug pour les utilisateurs ou l'entreprise.

| Fonction | Probabilité | Impact | Priorité |
| --- | --- | --- | --- |
| Paiement | Moyenne | Très fort | **Très haute** |
| Inscription | Faible | Fort | Haute |
| Recherche de restaurants | Moyenne | Moyen | Moyenne |
| Page « À propos » | Faible | Faible | Basse |

> [!astuce]
> On ne peut jamais tout tester. Une stratégie fondée sur les risques permet d'expliquer au client **pourquoi** vous testez d'abord certaines fonctions, et ce qui reste un risque accepté.

## La pyramide des tests

| Niveau | Quantité | Qui |
| --- | --- | --- |
| **Tests unitaires** (base) | Nombreux, très rapides | Développeurs |
| **Tests d'API et d'intégration** (milieu) | Assez nombreux | Testeurs et développeurs |
| **Tests de bout en bout** dans l'interface (sommet) | Peu nombreux, plus lents | Testeurs |
| **Tests exploratoires** | Sessions régulières | Testeurs |

> [!attention]
> Automatiser des centaines de tests dans l'interface est une erreur fréquente : ils sont lents et cassent souvent. Gardez au sommet les **parcours critiques**, et testez le reste par l'API quand c'est possible.

## Des offres à forte valeur

| Offre | Contenu | Exemple de prix |
| --- | --- | --- |
| **Audit qualité** | Rapport et plan d'action | 400 000 Ar |
| **Mise en place de l'automatisation** | 20 à 30 tests automatisés, intégration continue | 2 500 000 Ar |
| **Testeur dédié** | Campagnes avant chaque version | 1 500 000 Ar par mois |
| **Campagne mobile** | Tests sur 10 appareils réels, rapport | 800 000 Ar |

*(Montants donnés en exemple. Pour les clients étrangers, fixez vos prix en euros ou en dollars selon leur marché.)*

> [!retenir]
> - Six spécialités : automatisation, API, mobile, performance, accessibilité, QA lead.
> - L'audit qualité montre les risques et ouvre une mission.
> - Prioriser selon la probabilité et l'impact.
> - La pyramide des tests : peu de tests d'interface, plus de tests d'API.
> - Des offres à valeur : automatisation, testeur dédié, campagnes mobiles.

## Exercice pratique : votre spécialité et votre audit

> [!exercice] Exercice pratique · 3 heures
> 1. Choisissez votre spécialité et justifiez-la en 5 lignes.
> 2. Choisissez une application publique et listez 10 fonctions avec leur probabilité, leur impact et leur priorité.
> 3. Rédigez un rapport d'audit fictif avec 3 risques et un plan sur 2 mois.
> 4. Préparez 3 offres avec leur prix.
>
> **À livrer** : votre choix, votre tableau de risques, votre rapport et vos offres.
