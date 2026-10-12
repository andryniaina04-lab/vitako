Ce module vous fait prendre en main les outils de l'assistant administratif et RH : **Google Workspace** et **Excel** pour les documents, les registres et les formulaires, le **publipostage** pour produire des dizaines de documents en une fois, puis les outils payants : **Microsoft 365** et les **logiciels de paie**.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Créer des modèles de documents et un formulaire de demande de congé.
> 2. Partager les dossiers avec les bons droits.
> 3. Construire un registre des congés avec des formules.
> 4. Produire des documents en série avec le publipostage.
> 5. Comprendre ce qu'apportent Microsoft 365 et un logiciel de paie.

## Les outils gratuits

| N° | Outil | À quoi il sert |
| --- | --- | --- |
| 1 | **Google Docs** | Modèles de documents, rédaction, commentaires |
| 2 | **Google Sheets** ou **Excel** | Registres, tableaux de suivi, calculs |
| 3 | **Google Forms** | Formulaires : demande de congé, candidature, inscription à une formation |
| 4 | **Google Drive** | Classement, partage avec les bons droits |
| 5 | **Google Agenda** et **Meet** | Réunions et entretiens |

## Les modèles de documents

1. Créez un document avec l'**en-tête** de l'entreprise (logo, nom, adresse).
2. Utilisez des **styles** (Titre 1, Titre 2, Texte normal) pour une mise en forme cohérente.
3. Marquez les zones à remplir de façon visible : **[NOM DU SALARIÉ]**, **[DATE]**.
4. Rangez les modèles dans un dossier « Modèles » en **lecture seule** pour les autres.
5. Pour utiliser un modèle : **Fichier → Créer une copie**, jamais en modifiant l'original.

## Le formulaire de demande de congé

1. Créez un **Google Forms** « Demande de congé ».
2. Ajoutez les questions : nom, service, type de congé (liste), date de début, date de fin, remarque.
3. Rendez les questions **obligatoires**.
4. Reliez le formulaire à une **feuille Google Sheets** : chaque demande crée une ligne.
5. Partagez le lien du formulaire avec le personnel.

> [!astuce]
> Ajoutez dans la feuille des réponses des colonnes pour **votre vérification** (droits restants) et la **décision** du responsable. Vous obtenez un suivi complet, sans e-mails perdus.

## Partager avec les bons droits

| Dossier | Qui y a accès | Droit |
| --- | --- | --- |
| Modèles | Tout le personnel administratif | Lecteur |
| Notes de service | Tout le personnel | Lecteur |
| Dossiers du personnel | Direction et assistant RH seulement | Éditeur pour l'assistant, lecteur ou éditeur pour la direction |
| Paie | Direction, comptable, assistant RH | Selon les besoins |

### Les règles

1. **Jamais** « Tous les utilisateurs disposant du lien » pour un document RH.
2. **Vérifiez les accès** chaque trimestre, et retirez ceux des personnes parties.
3. **Utilisez des dossiers partagés** de l'entreprise, pas votre Drive personnel.

## Le registre des congés avec des formules

| Colonne | Formule (Google Sheets ou Excel en français) |
| --- | --- |
| Jours demandés (jours ouvrés) | `=NB.JOURS.OUVRES(Début;Fin;Fériés)` |
| Jours restants | `=Droits-Pris` |
| Alerte si droits dépassés | `=SI(JoursDemandés>Restants;"Droits insuffisants";"OK")` |

> [!definition] Jours ouvrés
> Les jours normalement travaillés dans l'entreprise (souvent du lundi au vendredi), hors jours fériés. La fonction **NB.JOURS.OUVRES** les compte entre deux dates, en excluant une liste de jours fériés que vous fournissez.

> [!madagascar]
> Créez dans le tableur une feuille « Jours fériés » avec les jours fériés de Madagascar de l'année (par exemple le 1er janvier, le 29 mars, le 1er mai, le 26 juin, le 15 août, le 1er novembre, le 25 décembre, ainsi que les fêtes mobiles comme le lundi de Pâques). Vérifiez la liste officielle chaque année, et utilisez-la dans la formule NB.JOURS.OUVRES.

## Le publipostage : des documents en série

> [!definition] Publipostage
> Une méthode pour produire de nombreux documents personnalisés à partir d'un **modèle** et d'un **tableau** : chaque ligne du tableau (un salarié, un candidat) donne un document avec ses informations.

### Exemple : 20 convocations à une formation

1. Préparez le **tableau** : nom, prénom, service, date, heure, lieu.
2. Préparez le **modèle** de convocation avec des champs (« Madame, Monsieur «Nom» »).
3. Lancez le **publipostage** :
   - **Word** (Microsoft 365) : onglet Publipostage, sélection de la liste, insertion des champs, fusion.
   - **Google Docs** : avec une extension de publipostage, ou en recopiant le modèle selon une méthode adaptée.
4. **Vérifiez** 3 documents au hasard.
5. **Envoyez** ou imprimez.

## Les outils payants

| Outil | Ce qu'il apporte | Qui le paie |
| --- | --- | --- |
| **Microsoft 365** | Word (publipostage complet), Excel (fonctions avancées), Outlook, Teams, SharePoint et OneDrive (partage sécurisé d'entreprise) | L'entreprise, qui vous crée un compte |
| **Logiciel de paie** | Calcul des salaires, cotisations, bulletins, déclarations, selon la législation du pays | L'entreprise ; utilisé par le comptable ou le service paie |
| **Logiciel RH (SIRH)** | Dossiers du personnel, congés, entretiens, documents en ligne | L'entreprise |

> [!definition] SIRH
> Système d'information des ressources humaines : un logiciel qui regroupe les informations du personnel, les congés, les absences, les entretiens et souvent la paie.

### Votre rôle avec un logiciel de paie

1. **Saisir** ou transmettre les éléments variables (absences, heures, primes).
2. **Vérifier** les informations des salariés (arrivées, départs, changements).
3. **Classer** les bulletins et documents produits.
4. **Ne pas modifier** les paramètres de calcul (taux, règles) : c'est le rôle du comptable ou du spécialiste paie.

Les logiciels de paie doivent être **adaptés au pays** (règles de Madagascar, de France…). C'est l'entreprise qui les choisit et les paie.

> [!retenir]
> - Des modèles en lecture seule, utilisés par copie.
> - Un formulaire de congé relié à un tableau de suivi.
> - Des accès restreints pour tout ce qui est RH et paie.
> - NB.JOURS.OUVRES avec la liste des jours fériés du pays.
> - Le publipostage pour les documents en série ; Microsoft 365 et les logiciels de paie sont fournis par l'entreprise.

## Exercice pratique : votre boîte à outils administrative

> [!exercice] Exercice pratique · 2 heures 30
> 1. Créez 3 modèles (attestation de travail, convocation, note de service) avec en-tête et zones à remplir.
> 2. Créez le formulaire de demande de congé relié à une feuille, et faites 5 demandes de test.
> 3. Construisez le registre des congés avec NB.JOURS.OUVRES, la feuille des jours fériés et l'alerte de droits insuffisants.
> 4. Réalisez un publipostage de 10 convocations à partir d'un tableau.
> 5. Organisez le partage d'un dossier RH fictif avec les bons droits et faites une capture.
>
> **À livrer** : vos modèles, le lien du formulaire, le registre, les 10 convocations et la capture des droits.
