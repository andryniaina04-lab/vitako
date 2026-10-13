Un support informatique professionnel règle les problèmes **vite et durablement**, et chaque technicien travaille de la même façon. Ce module vous donne les méthodes des meilleures équipes : bases d'ITIL, procédures d'arrivée et de départ, scripts simples, gestion des changements, documentation et indicateurs.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Appliquer les grandes pratiques d'ITIL au quotidien.
> 2. Suivre des procédures d'arrivée et de départ des employés.
> 3. Automatiser des vérifications avec des scripts simples.
> 4. Préparer un changement sans risque.
> 5. Documenter et suivre les bons indicateurs.

## Les pratiques d'ITIL au quotidien

> [!definition] ITIL
> Un ensemble de bonnes pratiques reconnu dans le monde entier pour gérer les services informatiques. On n'a pas besoin de tout appliquer : quelques pratiques suffisent à une petite équipe.

| Pratique | Au quotidien |
| --- | --- |
| **Gestion des incidents** | Rétablir le service le plus vite possible |
| **Gestion des problèmes** | Trouver et supprimer la cause des incidents répétés |
| **Gestion des demandes** | Traiter les demandes standard avec une procédure (nouveau compte, logiciel) |
| **Gestion des changements** | Préparer, valider et planifier toute modification qui peut casser quelque chose |
| **Gestion des connaissances** | Écrire ce qui est appris pour ne pas le rechercher à nouveau |

## Les procédures d'arrivée et de départ

### Arrivée d'un employé

1. Créer le compte et attribuer la licence.
2. Ajouter aux bons groupes (service, dossiers partagés).
3. Préparer le poste : système à jour, logiciels, chiffrement, outil de gestion à distance.
4. Activer la double authentification avec l'employé.
5. Envoyer un guide de bienvenue informatique.

### Départ d'un employé

1. **Bloquer** la connexion le jour du départ (heure convenue avec la direction).
2. **Transférer** la messagerie et les fichiers au responsable désigné.
3. **Retirer** les groupes, les accès aux applications et les licences.
4. **Récupérer** et réinitialiser le matériel.
5. **Noter** toutes les actions dans le ticket.

> [!attention]
> Un compte d'ancien employé resté actif est l'une des **failles les plus courantes** dans les petites entreprises. La procédure de départ doit être appliquée le jour même, sans exception.

## Automatiser avec des scripts simples

PowerShell permet d'automatiser des vérifications sous Windows. Commencez par des commandes qui **lisent** des informations, sans rien modifier.

```powershell
# Informations sur le système
Get-ComputerInfo | Select-Object CsName, OsName, OsVersion

# Espace libre sur les disques (en Go)
Get-PSDrive -PSProvider FileSystem |
  Select-Object Name, @{Name='LibreGo'; Expression={[math]::Round($_.Free / 1GB, 1)}}

# Tester l'accès à un site sur le port HTTPS
Test-NetConnection -ComputerName www.google.com -Port 443

# État d'un service (ici, le spouleur d'impression)
Get-Service -Name Spooler
```

> [!attention]
> N'exécutez jamais un script trouvé en ligne sans le comprendre, et testez toujours un nouveau script sur **une machine de test** avant de l'utiliser chez un client. Un script qui modifie des centaines de postes peut provoquer une panne générale.

## Préparer un changement

| Élément | Exemple : mise à jour du pare-feu |
| --- | --- |
| **Description** | Mise à jour du logiciel du pare-feu vers la dernière version |
| **Raison** | Correction d'une faille de sécurité |
| **Risque** | Coupure d'Internet si la mise à jour échoue |
| **Plan de retour arrière** | Sauvegarde de la configuration, version précédente disponible |
| **Créneau** | Samedi 8 h, en dehors des heures de travail |
| **Validation** | Accord écrit du directeur |
| **Communication** | Message aux employés 2 jours avant |
| **Vérification** | Tests d'accès après la mise à jour |

> [!madagascar]
> Planifiez les changements importants à un moment où l'**électricité et la connexion** sont les plus fiables, et prévoyez toujours un onduleur sur le matériel concerné. Une coupure pendant une mise à jour peut rendre un équipement inutilisable.

## Documenter

| Document | Contenu |
| --- | --- |
| **Fiche client** | Contacts, contrat, SLA, particularités |
| **Inventaire** | Postes, utilisateurs, licences, garanties |
| **Schéma réseau** | Box, routeur, Wi-Fi, imprimantes, adresses importantes |
| **Procédures** | Arrivée, départ, sauvegarde, restauration |
| **Accès** | Où sont les identifiants (gestionnaire de mots de passe), jamais les mots de passe eux-mêmes |

## Les indicateurs

| Indicateur | Ce qu'il montre |
| --- | --- |
| **Résolution au premier contact** | L'efficacité du niveau 1 |
| **Délai moyen de résolution** | La rapidité globale |
| **Respect des SLA** | Le respect des engagements |
| **Incidents répétés** | Les problèmes à traiter à la source |
| **Satisfaction des utilisateurs** | La perception du service |

> [!retenir]
> - Incidents, problèmes, demandes, changements, connaissances.
> - Procédures d'arrivée et de départ appliquées sans exception.
> - Des scripts simples, compris et testés avant usage.
> - Chaque changement avec risque, retour arrière, créneau et validation.
> - Une documentation à jour et des indicateurs suivis.

## Exercice pratique : la méthode professionnelle

> [!exercice] Exercice pratique · 3 heures
> 1. Rédigez les procédures d'arrivée et de départ pour une PME de 15 personnes.
> 2. Exécutez les 4 commandes PowerShell dans votre machine virtuelle et expliquez chaque résultat.
> 3. Rédigez une demande de changement complète pour une migration de messagerie.
> 4. Créez la fiche client et l'inventaire du cabinet Fanilo.
>
> **À livrer** : vos procédures, vos résultats commentés, votre demande de changement et votre documentation.
