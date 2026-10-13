Les sites, les comptes et les données des entreprises sont attaqués tous les jours : mots de passe volés, faux e-mails, failles dans des sites mal entretenus. L'analyste en cybersécurité aide les organisations à se protéger : il repère les points faibles, propose des corrections et forme les équipes. Ce métier se fait en grande partie à distance. Ce premier module vous le présente, avec ses règles éthiques et légales, qui sont au cœur du métier.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Expliquer ce que fait un analyste en cybersécurité.
> 2. Connaître les principales menaces.
> 3. Comprendre les trois piliers de la sécurité.
> 4. Respecter les règles éthiques et légales du métier.
> 5. Préparer votre laboratoire et votre plan d'apprentissage.

## Le métier en une phrase

Un **analyste en cybersécurité** protège les systèmes d'une organisation : il évalue les risques, repère les faiblesses avec l'autorisation du client, recommande des corrections, surveille les alertes et sensibilise les utilisateurs.

> [!definition] Vulnérabilité
> Une faiblesse dans un logiciel, une configuration ou une habitude (par exemple un mot de passe réutilisé) qui pourrait être utilisée par un attaquant. Le travail de l'analyste est de les trouver et de les faire corriger **avant** qu'un attaquant ne les exploite.

## Les principales menaces

| Menace | Principe | Protection de base |
| --- | --- | --- |
| **Hameçonnage (phishing)** | Faux message pour voler un mot de passe ou faire payer | Sensibilisation, double authentification |
| **Mots de passe faibles ou réutilisés** | Un mot de passe volé ouvre plusieurs comptes | Gestionnaire de mots de passe, double authentification |
| **Logiciels pas à jour** | Failles connues non corrigées | Mises à jour régulières |
| **Mauvaise configuration** | Service ouvert à tous, droits trop larges | Revue de configuration |
| **Rançongiciel** | Fichiers chiffrés contre rançon | Sauvegardes hors ligne, mises à jour |
| **Failles des sites web** | Erreurs de programmation exploitables | Bonnes pratiques de développement, tests |

> [!madagascar]
> À Madagascar, les arnaques les plus courantes passent par **les réseaux sociaux et le Mobile Money** : faux comptes, faux concours, demandes de code de confirmation. Expliquer simplement ces risques aux PME et à leurs employés est déjà un service de sécurité très utile.

## Les trois piliers de la sécurité

| Pilier | Question | Exemple d'atteinte |
| --- | --- | --- |
| **Confidentialité** | Seules les bonnes personnes voient-elles les données ? | Fuite d'une liste de clients |
| **Intégrité** | Les données sont-elles exactes et non modifiées ? | Montant d'une facture changé |
| **Disponibilité** | Le service fonctionne-t-il quand on en a besoin ? | Site bloqué, fichiers chiffrés |

## Éthique et légalité : les règles absolues

| Règle | Pourquoi |
| --- | --- |
| **Autorisation écrite** avant tout test | Sans autorisation, tester un système est une infraction |
| **Périmètre précis** | Ne tester que ce qui est prévu par écrit |
| **Aucun dommage** | Pas de suppression, pas de blocage du service |
| **Confidentialité** | Ce que vous découvrez reste entre vous et le client |
| **Signalement** | Les faiblesses sont rapportées au client, jamais publiées ni vendues |
| **Pas de « test » sur des tiers** | Ni un site au hasard, ni le compte d'un ami, même pour apprendre |

> [!attention]
> Scanner, tester ou tenter d'accéder à un système **sans autorisation écrite de son propriétaire** est illégal à Madagascar (loi sur la cybercriminalité) comme dans la plupart des pays, même si votre intention est bonne. Pour apprendre, utilisez uniquement **votre propre laboratoire** et les plateformes d'entraînement prévues à cet effet.

## Qui sont vos clients ?

| Client | Besoins |
| --- | --- |
| **PME** à Madagascar | Sécurité des comptes, sauvegardes, sensibilisation |
| **Agences web** | Vérification de sécurité des sites avant livraison |
| **Start-up** | Bonnes pratiques, revue de configuration |
| **ONG** | Protection des données sensibles des bénéficiaires |
| **Entreprises étrangères** | Analystes à distance pour la surveillance et l'analyse des alertes |

## Votre laboratoire et votre plan d'apprentissage

| Élément | Usage |
| --- | --- |
| **Machine virtuelle Linux** | Outils de sécurité |
| **Application volontairement vulnérable** (par exemple OWASP Juice Shop) | S'entraîner légalement, sur votre machine |
| **Plateformes d'entraînement** en ligne | Exercices encadrés et autorisés |
| **Carnet de notes** | Méthodes, commandes, rapports |

| Mois | Objectif |
| --- | --- |
| **1** | Réseau, Linux, menaces, éthique |
| **2** | Sécurité des comptes et des sites, OWASP Top 10 |
| **3** | Outils d'analyse : Nmap, OWASP ZAP, lecture de journaux |
| **4** | Audit complet dans le laboratoire, rapport, portfolio |

> [!retenir]
> - L'analyste repère les faiblesses avec autorisation, recommande des corrections et sensibilise.
> - Hameçonnage, mots de passe, mises à jour, configuration, rançongiciel, failles web.
> - Confidentialité, intégrité, disponibilité.
> - Autorisation écrite, périmètre, aucun dommage, confidentialité, signalement au client.
> - S'entraîner uniquement dans son laboratoire et sur des plateformes prévues.

## Exercice pratique : votre laboratoire et vos règles

> [!exercice] Exercice pratique · 3 heures
> 1. Installez une machine virtuelle Linux et l'application d'entraînement OWASP Juice Shop sur votre ordinateur.
> 2. Faites la liste de vos propres comptes et activez la double authentification partout où c'est possible.
> 3. Rédigez votre charte éthique personnelle en 6 règles.
> 4. Décrivez 3 arnaques courantes à Madagascar et le conseil que vous donneriez pour chacune.
>
> **À livrer** : des captures de votre laboratoire, votre charte et vos conseils.
