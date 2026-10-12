Au niveau Avancé, vous travaillez avec les outils payants que les entreprises structurées utilisent : **Microsoft 365** dans ses fonctions avancées, et les **logiciels de paie** et **SIRH**. Ces outils sont presque toujours **fournis par l'entreprise** ; votre valeur est de savoir les utiliser à fond et de les faire travailler ensemble.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Utiliser les fonctions avancées d'Excel pour les données RH.
> 2. Organiser les documents RH dans SharePoint et Teams avec les bons droits.
> 3. Automatiser des circuits simples avec Forms et Power Automate.
> 4. Travailler dans un logiciel de paie selon un circuit de contrôle.
> 5. Participer à la mise en place d'un SIRH.

## Excel avancé pour les RH

### Les fonctions utiles

| Fonction (en français) | Usage RH |
| --- | --- |
| `RECHERCHEX` | Retrouver le service ou le salaire de base d'un salarié à partir de son matricule |
| `NB.SI.ENS` | Compter les absences d'un service sur un mois |
| `SOMME.SI.ENS` | Additionner les heures supplémentaires par service |
| `DATEDIF` | Calculer l'ancienneté |
| `FILTRE` | Afficher les contrats qui finissent dans les 60 jours |
| Tableau croisé dynamique | Effectif par service, par contrat, par ancienneté |

```
Ancienneté en années :      =DATEDIF(DateEntrée;AUJOURDHUI();"Y")
Contrats à échéance proche : =FILTRE(Contrats;(Contrats[Fin]-AUJOURDHUI())<=60)
Absences d'un service :     =NB.SI.ENS(Absences[Service];"Logistique";Absences[Mois];"2026-03")
```

> [!definition] Power Query
> Un outil intégré à Excel qui importe et nettoie des données (par exemple l'export du logiciel de pointage) toujours de la même façon. Une fois la requête créée, il suffit de cliquer sur « Actualiser » chaque mois.

> [!astuce]
> Transformez chaque liste en **tableau Excel** (Insertion → Tableau) : les formules utilisent des noms clairs (`Contrats[Fin]`), les filtres sont automatiques et les tableaux croisés se mettent à jour avec les nouvelles lignes.

## SharePoint et Teams : des documents RH bien protégés

| Espace | Contenu | Accès |
| --- | --- | --- |
| **Site RH (SharePoint)** | Dossiers du personnel, paie, contrats | Direction et équipe RH seulement |
| **Équipe Teams « Tout le personnel »** | Notes de service, règlement intérieur, formulaires | Tout le personnel, en lecture |
| **Équipe Teams « Managers »** | Procédures pour les responsables, plannings | Responsables |

### Les règles

1. **Des groupes** plutôt que des accès individuels : on ajoute ou retire une personne du groupe.
2. **Pas de partage par lien ouvert** pour les documents RH.
3. **L'historique des versions** activé pour les modèles et les procédures.
4. **Une revue des accès** chaque trimestre et à chaque départ.

## Automatiser avec Forms et Power Automate

> [!definition] Power Automate
> L'outil d'automatisation de Microsoft 365 : **quand** quelque chose se produit (un formulaire est envoyé), **alors** des actions se lancent (créer une ligne, envoyer une demande d'approbation, notifier).

### Exemple : la demande de congé avec approbation

1. Le salarié remplit le **formulaire Forms**.
2. Power Automate **ajoute une ligne** dans le registre (liste SharePoint ou Excel).
3. Une **demande d'approbation** part au responsable dans Teams ou Outlook.
4. La réponse est **enregistrée** dans le registre.
5. Le salarié reçoit **un e-mail** avec la décision.

> [!attention]
> Testez chaque automatisation avec des données fictives avant de la mettre en service, et documentez-la (qui l'a créée, ce qu'elle fait, à qui demander en cas de panne). Une automatisation que personne ne comprend devient un risque.

## Le logiciel de paie : un circuit de contrôle

### Le calendrier mensuel (exemple)

| Date | Étape | Responsable |
| --- | --- | --- |
| Du 1er au 20 | Collecte des éléments variables | Assistant RH |
| Le 20 | Clôture des éléments, contrôle croisé avec le registre des congés | Assistant RH |
| Le 21 | Saisie ou import dans le logiciel de paie | Assistant paie |
| Le 23 | Calcul de la paie, contrôles | Gestionnaire de paie ou comptable |
| Le 25 | Validation par la direction | Direction |
| Fin du mois | Paiement des salaires, envoi des bulletins | Comptable, direction |
| Selon les échéances légales | Déclarations sociales et fiscales | Comptable |

### Les contrôles de paie

| Contrôle | Exemple |
| --- | --- |
| **Effectif** | Nombre de bulletins = nombre de salariés payés (arrivées et départs compris) |
| **Écarts d'un mois à l'autre** | Tout salaire net qui varie de plus de 10 % est expliqué |
| **Éléments variables** | Chaque élément du tableau se retrouve sur le bon bulletin |
| **Absences** | Les absences du registre sont toutes prises en compte |
| **Totaux** | Le total des salaires correspond au virement prévu |

> [!madagascar]
> Les logiciels de paie utilisés à Madagascar doivent intégrer les règles locales (cotisations à la CNaPS et aux organismes de santé, impôt sur les revenus salariaux). Ces paramètres sont fixés par le comptable ou l'éditeur du logiciel et changent avec la loi : vous **contrôlez la cohérence** des résultats, vous ne modifiez pas les paramètres.

## Participer à la mise en place d'un SIRH

1. **Recenser les besoins** : dossiers, congés, entretiens, formation, paie.
2. **Comparer** 2 ou 3 logiciels (fonctions, prix, langue, hébergement des données).
3. **Préparer les données** : nettoyer le fichier du personnel (doublons, dates, formats).
4. **Paramétrer** : services, types de congés, circuits d'approbation, droits.
5. **Tester** avec quelques utilisateurs.
6. **Former** les salariés et les responsables.
7. **Suivre** les premiers mois et corriger.

> [!retenir]
> - Excel avancé : RECHERCHEX, NB.SI.ENS, FILTRE, tableaux croisés, Power Query.
> - SharePoint et Teams avec des groupes et des accès restreints.
> - Forms et Power Automate pour les circuits simples, testés et documentés.
> - Un calendrier et des contrôles de paie ; les paramètres restent au spécialiste.
> - Un SIRH se met en place en 7 étapes.

## Exercice pratique : votre boîte à outils avancée

> [!exercice] Exercice pratique · 3 heures
> 1. Créez un fichier du personnel fictif de 30 salariés sous forme de tableau Excel.
> 2. Ajoutez l'ancienneté, la liste des contrats à échéance proche et un tableau croisé de l'effectif par service.
> 3. Concevez sur papier (ou dans un compte d'essai) le circuit Forms + Power Automate de la demande de congé.
> 4. Rédigez le calendrier de paie et la liste des 5 contrôles d'une entreprise fictive.
> 5. Comparez 2 logiciels SIRH à partir de leurs sites officiels.
>
> **À livrer** : votre fichier Excel, votre circuit, votre calendrier et votre comparaison.
