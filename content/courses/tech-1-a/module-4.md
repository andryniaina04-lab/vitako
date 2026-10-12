Les éditeurs de logiciels du monde entier recrutent des testeurs à distance. Ce module vous prépare à travailler avec eux : rapports de bugs en anglais, rituels d'une équipe agile, certifications reconnues, plateformes de test participatif et tests spécifiques à chaque marché.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Rédiger des rapports de bugs et des bilans en anglais.
> 2. Participer aux rituels d'une équipe agile internationale.
> 3. Connaître les certifications reconnues du test.
> 4. Utiliser les plateformes de test participatif.
> 5. Tester la localisation et les spécificités de chaque marché.

## Les rapports de bugs en anglais

> [!exemple] Bug report
> **Title**: Checkout – "Pay" button stays disabled after entering a valid card on iPhone 12 (Safari)
> **Environment**: Staging v2.4.1, iOS 17, Safari
> **Steps to reproduce**:
> 1. Add any item to the cart.
> 2. Go to checkout and enter a valid test card.
> 3. Tap outside the card field.
> **Expected result**: the "Pay" button becomes enabled.
> **Actual result**: the button stays disabled; no error message.
> **Severity**: Critical (blocks payment on iOS)
> **Attachments**: video, console log

### Le vocabulaire utile

| Français | Anglais |
| --- | --- |
| Étapes pour reproduire | Steps to reproduce |
| Résultat attendu, obtenu | Expected result, actual result |
| Gravité, priorité | Severity, priority |
| Bloquant | Blocker |
| Contournement | Workaround |
| Non reproductible | Cannot reproduce |
| Test de non-régression | Regression test |
| Critères d'acceptation | Acceptance criteria |

> [!astuce]
> Un titre qui dit **où, quoi et dans quelles conditions** permet aux développeurs de comprendre le bug sans ouvrir le ticket. Joignez toujours une vidéo courte pour les bugs d'interface.

## Les rituels d'une équipe agile

| Rituel | Rôle du testeur |
| --- | --- |
| **Planification du sprint** | Poser des questions sur les critères d'acceptation, estimer l'effort de test |
| **Point quotidien** | Dire ce qui est testé, ce qui bloque |
| **Affinage** (refinement) | Repérer tôt les cas limites et les risques |
| **Démonstration** | Montrer ce qui est validé |
| **Rétrospective** | Proposer des améliorations du processus qualité |

> [!definition] Shift-left
> Faire participer le test **le plus tôt possible** dans le projet : relire les exigences, préparer les cas de test pendant le développement, au lieu d'attendre la fin.

> [!madagascar]
> Madagascar a peu de décalage horaire avec l'Europe et l'Afrique de l'Est, ce qui facilite la participation aux rituels en direct. Avec l'Amérique du Nord, proposez des **mises à jour écrites** et un créneau commun court en fin de journée.

## Les certifications reconnues

| Certification | Intérêt |
| --- | --- |
| **ISTQB Foundation Level** | La référence internationale des bases du test ; demandée dans beaucoup d'offres |
| **ISTQB niveaux avancés et spécialisés** | Automatisation, test agile, gestion des tests, performance |
| **Certifications d'outils** | Montrent une compétence pratique sur un outil précis |

> [!attention]
> Vérifiez sur le site officiel de l'organisme les **modalités actuelles** : examen en ligne surveillé ou en centre, prix, langues disponibles. Méfiez-vous des sites qui vendent des « certifications garanties » ou des réponses d'examen.

## Les plateformes de test participatif

> [!definition] Test participatif (crowdtesting)
> Des entreprises publient des campagnes de test ouvertes à des testeurs du monde entier, payés selon les bugs trouvés et validés ou selon les cas exécutés.

| Avantage | Limite |
| --- | --- |
| Premières expériences rémunérées | Revenus irréguliers au début |
| Grande variété de produits | Concurrence pour trouver les bugs en premier |
| Note qui augmente avec la qualité | Règles strictes sur les rapports |

Vérifiez que la plateforme accepte les testeurs basés à Madagascar et ses moyens de paiement avant de vous inscrire.

## Tester la localisation et le marché

| Point | Exemples de bugs |
| --- | --- |
| **Traductions** | Texte non traduit, mots coupés, phrases trop longues pour un bouton |
| **Formats** | Dates (13/10/2026 ou 10/13/2026), séparateurs décimaux, devises |
| **Adresses et téléphones** | Formulaire qui refuse un numéro malgache (+261) ou une adresse sans code postal |
| **Paiements locaux** | Mobile Money absent ou mal géré |
| **Réseau** | Application inutilisable en 3G |

> [!exemple] Un bug de marché
> Le formulaire d'inscription exige un code postal à 5 chiffres. Les utilisateurs malgaches (codes postaux à 3 chiffres) ne peuvent pas s'inscrire. Gravité : **critique** pour le lancement à Madagascar.

> [!retenir]
> - Rapports en anglais : où, quoi, conditions, étapes, attendu, obtenu, preuves.
> - Participer aux rituels agiles et tester tôt.
> - ISTQB comme référence, en vérifiant les modalités officielles.
> - Le test participatif pour démarrer et se faire noter.
> - Tester traductions, formats, adresses, paiements et réseau.

## Exercice pratique : une mission internationale

> [!exercice] Exercice pratique · 3 heures
> 1. Rédigez en anglais 3 rapports de bugs trouvés sur une application publique.
> 2. Préparez 10 questions sur les critères d'acceptation d'une fonction de paiement.
> 3. Testez la localisation d'un site en 2 langues et listez les problèmes.
> 4. Comparez 2 plateformes de test participatif (conditions, paiements).
>
> **À livrer** : vos rapports, vos questions, votre liste et votre comparatif.
