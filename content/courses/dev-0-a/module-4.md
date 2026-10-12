Les start-up, agences et entreprises étrangères offrent les missions front-end les mieux payées, mais elles attendent une communication professionnelle en anglais, des applications multilingues, un respect strict de la confidentialité et de la propriété du code, et la réussite d'entretiens techniques exigeants. Ce module vous prépare à travailler avec elles.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Communiquer par écrit en anglais dans une équipe de développement.
> 2. Rendre une application multilingue et adaptée à chaque pays.
> 3. Respecter la confidentialité, la sécurité et la propriété du code.
> 4. Travailler en asynchrone avec une équipe dans d'autres fuseaux horaires.
> 5. Réussir un entretien technique front-end.

## Communiquer en anglais

### Les messages du quotidien

| Situation | Anglais |
| --- | --- |
| Point quotidien | "Yesterday: finished the booking form. Today: adding validation tests. Blocker: I need the API endpoint for availability." |
| Poser une question | "Quick question about the design: should the filter stay open on mobile after selection?" |
| Signaler un problème | "I found a bug in production: the date picker crashes on Safari 17. I'm on it, fix expected today." |
| Demander une relecture | "PR ready for review: adds keyboard navigation to the room gallery." |
| Prévenir d'une absence | "Heads-up: planned power outage tomorrow 9–11 a.m. my time (UTC+3). I'll catch up in the afternoon." |

### La description d'une pull request

```
## What
Adds keyboard navigation to the room gallery (arrow keys, Escape to close).

## Why
Accessibility audit (issue #42): the gallery was not usable without a mouse.

## How to test
1. Open /rooms
2. Tab to the first photo and press Enter
3. Use arrow keys to navigate, Escape to close

## Screenshots
(before / after)
```

## L'internationalisation

> [!definition] Internationalisation (i18n)
> Préparer une application pour plusieurs langues et pays : textes traduits, formats de dates, de nombres et de devises, sens de lecture, longueurs de texte différentes.

### Les règles

1. **Aucun texte écrit en dur** dans les composants : tous dans des fichiers de traduction.
2. **Formats** de dates, nombres et devises avec l'API `Intl` du navigateur.
3. **Mises en page souples** : l'allemand peut être bien plus long que l'anglais.
4. **Langue déclarée** dans `<html lang="…">` pour l'accessibilité et le référencement.

```ts
const prix = 180000;
new Intl.NumberFormat('fr-FR', { style: 'currency', currency: 'MGA' }).format(prix);
// « 180 000 MGA » (le format exact dépend du navigateur)

new Intl.NumberFormat('en-GB', { style: 'currency', currency: 'EUR' }).format(42.5);
// « €42.50 »

new Intl.DateTimeFormat('fr-FR', { dateStyle: 'long' }).format(new Date('2026-07-14'));
// « 14 juillet 2026 »
```

> [!madagascar]
> Pour les sites malgaches qui visent aussi les touristes et les clients étrangers, prévoyez au moins le **français** et l'**anglais**, et le **malgache** pour le public local. Faites relire chaque langue par un locuteur natif, et testez l'affichage avec les textes les plus longs.

## Confidentialité, sécurité et propriété du code

### Les 7 règles

1. **Respectez** l'accord de confidentialité : pas de capture du projet client dans votre portfolio sans accord.
2. **Ne mettez jamais** de secrets (clés d'API, mots de passe) dans le code ou le dépôt ; utilisez des variables d'environnement.
3. **Utilisez** les comptes et dépôts du client, avec la double authentification.
4. **N'installez** pas de bibliothèque inconnue sans vérifier sa popularité, sa maintenance et sa licence.
5. **Vérifiez** les licences des bibliothèques (MIT, Apache… compatibles avec l'usage du client).
6. **Respectez** la propriété du code : en général, le code appartient au client après paiement, selon le contrat.
7. **Retirez** vos accès et supprimez les copies locales à la fin de la mission si le contrat le demande.

> [!attention]
> Une clé d'API publiée par erreur sur GitHub peut être utilisée en quelques minutes par des robots. Si cela arrive, **prévenez immédiatement** le client et faites révoquer la clé : la supprimer du dépôt ne suffit pas, elle reste dans l'historique.

## Travailler en asynchrone

| Pratique | Pourquoi |
| --- | --- |
| **Heures de chevauchement** fixées avec l'équipe | Pour les réunions et les questions urgentes |
| **Messages complets** | Le lecteur peut agir sans vous répondre |
| **Tickets à jour** | Tout le monde sait où en sont les tâches |
| **Décisions écrites** | Pas de décision perdue dans un appel |
| **Démonstrations enregistrées** | Une courte vidéo remplace parfois une réunion |

| Équipe | Heure de Madagascar (UTC+3) |
| --- | --- |
| Paris (été, UTC+2) | 10 h à Paris = 11 h à Antananarivo |
| Londres (hiver, UTC+0) | 10 h à Londres = 13 h à Antananarivo |
| New York (été, UTC−4) | 10 h à New York = 17 h à Antananarivo |

## Réussir un entretien technique

| Étape | Contenu | Préparation |
| --- | --- | --- |
| **Questions de base** | JavaScript (portée, promesses, `this`), CSS (mise en page, spécificité), React (état, effets, clés) | Révisez et expliquez à voix haute |
| **Exercice en direct** | Construire un petit composant (liste filtrable, formulaire) | Parlez de votre raisonnement en codant |
| **Devoir à la maison** | Petite application en quelques heures | README clair, tests, code propre |
| **Revue de code** | Lire un code et proposer des améliorations | Pratiquez la relecture |
| **Entretien en anglais** | Expériences, travail en équipe | Préparez 5 exemples concrets |

> [!astuce]
> Pendant un exercice en direct, dites ce que vous faites et pourquoi, même si vous hésitez. Les recruteurs évaluent autant votre **raisonnement** et votre **communication** que le résultat.

> [!retenir]
> - Des messages en anglais complets : points quotidiens, questions, pull requests.
> - L'internationalisation : traductions, API `Intl`, mises en page souples, langue déclarée.
> - 7 règles de confidentialité, de sécurité et de propriété du code.
> - Le travail asynchrone repose sur l'écrit, les tickets et des heures de chevauchement.
> - Préparez chaque étape de l'entretien technique.

## Exercice pratique : prêt pour l'international

> [!exercice] Exercice pratique · 3 heures
> 1. Rendez votre projet disponible en français et en anglais, avec les prix et les dates formatés par `Intl`.
> 2. Rédigez en anglais 3 descriptions de pull requests et 5 messages de point quotidien.
> 3. Vérifiez votre dépôt : aucun secret, licences des dépendances listées.
> 4. Entraînez-vous à 3 exercices en direct (liste filtrable, formulaire, compteur avec minuterie) en expliquant à voix haute, et enregistrez-vous.
>
> **À livrer** : le lien du projet bilingue, vos textes en anglais, votre liste de licences et vos enregistrements.
