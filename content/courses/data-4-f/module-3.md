Ce module vous fait prendre en main **Make** et **Zapier**, les deux plateformes d'automatisation les plus utilisées, et vous montre comment y intégrer un **assistant d'IA**. Vous découvrirez aussi ce qu'apportent les **offres payantes** et les **abonnements d'IA**.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Créer un scénario dans Make avec un filtre et un routeur.
> 2. Créer un Zap dans Zapier.
> 3. Ajouter une étape d'IA dans une automatisation.
> 4. Tester, surveiller et documenter un scénario.
> 5. Comprendre les limites et les coûts des offres.

## Make et Zapier

| Point | Make | Zapier |
| --- | --- | --- |
| **Présentation** | Scénarios visuels en forme de schéma | Zaps présentés étape par étape |
| **Points forts** | Très flexible : routeurs, boucles, transformation de données | Très simple à prendre en main, très grand nombre d'applications |
| **Unité de mesure** | Opérations (chaque étape exécutée compte) | Tâches (chaque action réussie compte) |
| **Offre gratuite** | Limitée en opérations et en fréquence | Limitée en tâches et en nombre d'étapes |

*(Les offres, les limites et les noms des unités changent souvent : vérifiez sur les sites officiels.)*

## Votre premier scénario dans Make

### L'exemple : inscription à une formation

1. **Déclencheur** : « Google Forms – Watch Responses » (nouvelle réponse au formulaire).
2. **Action** : « Google Sheets – Add a Row » (ajouter une ligne avec les champs du formulaire).
3. **Filtre** : continuer seulement si l'e-mail n'est pas vide.
4. **Routeur** :
   - Chemin 1 : si niveau = « Débutant », envoyer l'e-mail de bienvenue débutant.
   - Chemin 2 : si niveau = « Avancé », envoyer l'e-mail de bienvenue avancé.
5. **Action** : envoyer un message au formateur (e-mail ou application de messagerie d'équipe).

> [!astuce]
> Testez chaque module avec **« Run once »** et une vraie réponse de test, puis regardez les données qui sortent de chaque étape (la petite bulle au-dessus de chaque module dans Make). Vous voyez exactement où une donnée manque.

## Votre premier Zap dans Zapier

1. **Trigger** : nouvelle ligne dans Google Sheets.
2. **Filter** : seulement si la colonne « Statut » vaut « Nouveau ».
3. **Action** : créer un événement dans Google Agenda (rendez-vous de découverte).
4. **Action** : envoyer un e-mail de confirmation avec la date.
5. **Action** : mettre la colonne « Statut » à « Traité ».

> [!attention]
> La dernière étape (mettre le statut à « Traité ») est essentielle : elle évite de traiter deux fois la même ligne si le scénario se relance.

## Ajouter une étape d'IA

Make et Zapier proposent des modules pour les principaux assistants d'IA (OpenAI, Anthropic, Google et d'autres), ainsi que leurs propres fonctions d'IA.

### Exemple : trier les messages des clients

1. **Déclencheur** : nouvel e-mail dans la boîte « contact ».
2. **IA** : la consigne de classement du module 2 renvoie `{"categorie": "...", "urgence": "..."}`.
3. **Analyse du JSON** : lire `categorie` et `urgence`.
4. **Routeur** :
   - commande → ajouter au tableau des commandes ;
   - reclamation + urgence haute → alerte immédiate au responsable ;
   - question → brouillon de réponse proposé par l'IA, **enregistré comme brouillon**, pas envoyé ;
   - autre ou format invalide → étiquette « à traiter à la main ».

> [!definition] Clé d'API
> Un code secret qui permet à Make ou Zapier d'utiliser le service d'IA au nom du compte qui paie. Elle doit être gardée secrète, enregistrée dans la connexion de la plateforme, jamais copiée dans un e-mail ou un document partagé.

## Tester, surveiller, documenter

### Avant la mise en service

| Test | Exemple |
| --- | --- |
| Cas normal | Une inscription complète |
| Champ manquant | Pas d'e-mail |
| Doublon | La même personne s'inscrit deux fois |
| Cas inattendu | Message en anglais, message vide |
| Volume | 20 réponses en même temps |

### Après la mise en service

1. **Activez les alertes** d'erreur de la plateforme (e-mail en cas d'échec).
2. **Consultez l'historique** des exécutions chaque jour la première semaine.
3. **Surveillez** la consommation d'opérations ou de tâches.

### La fiche de documentation

```
Nom : Inscriptions formation → tableau + e-mails
Plateforme : Make (compte du client)
Déclencheur : nouvelle réponse au formulaire « Inscription 2026 »
Étapes : 1. Ajout ligne Sheets  2. Filtre e-mail  3. Routeur niveau  4. E-mails  5. Alerte formateur
Données personnelles : nom, e-mail, téléphone (pas de données sensibles)
En cas de panne : l'assistante reçoit une alerte ; traiter les inscriptions à la main depuis le formulaire
Responsable : Mme Voahangy · Créé le : 12/05/2026 · Version : 1.1
```

## Les offres payantes et les abonnements d'IA

| Outil | Ce qu'apporte l'offre payante |
| --- | --- |
| **Make** | Plus d'opérations, exécution plus fréquente, scénarios plus nombreux, fonctions avancées |
| **Zapier** | Plus de tâches, Zaps à plusieurs étapes, chemins conditionnels, exécution plus rapide |
| **Abonnements d'assistants d'IA** | Usage plus important, modèles plus performants, fonctions pour les équipes |
| **API d'IA** | Paiement à l'usage, selon la quantité de texte traitée |

> [!madagascar]
> Ces services sont facturés en dollars ou en euros, souvent par carte bancaire internationale. La bonne pratique est que **le client crée les comptes à son nom et les paie**, puis vous invite comme collaborateur. Vous ne portez pas le risque des factures, et le client reste propriétaire de ses automatisations. Vérifiez les prix à jour sur les sites officiels.

> [!retenir]
> - Make : visuel et flexible ; Zapier : simple et très connecté.
> - Testez chaque étape avec des données réelles de test.
> - Une étape d'IA renvoie un format strict, analysé puis routé.
> - Les brouillons de l'IA sont relus avant l'envoi.
> - Alertes, historique, documentation et comptes au nom du client.

## Exercice pratique : vos premiers scénarios

> [!exercice] Exercice pratique · 4 heures
> 1. Créez un compte gratuit Make et un compte gratuit Zapier.
> 2. Construisez dans Make le scénario d'inscription avec filtre et routeur.
> 3. Construisez dans Zapier le Zap de rendez-vous avec mise à jour du statut.
> 4. Ajoutez une étape d'IA (si votre offre ou un essai le permet) pour classer des messages, avec le chemin « à traiter à la main ».
> 5. Testez les 5 cas du tableau et rédigez la fiche de documentation.
>
> **À livrer** : des captures de vos scénarios, les résultats des tests et vos fiches de documentation.
