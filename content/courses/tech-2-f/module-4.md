Dans ce module, vous assurez le support de niveau 1 d'une petite entreprise pendant une journée type, comme le ferait un technicien à distance. Vous apprendrez à accueillir l'appel, à résoudre les problèmes les plus fréquents, à escalader au niveau 2 et à documenter votre travail.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Prendre en charge un appel de bout en bout.
> 2. Résoudre 5 problèmes types de niveau 1.
> 3. Repérer un incident de sécurité et réagir.
> 4. Escalader un ticket au niveau 2.
> 5. Rédiger un bilan de journée.

## Le cas pratique : « Cabinet Fanilo »

> [!exemple] Votre client
> **Le cabinet Fanilo** est un cabinet comptable d'Antananarivo avec 18 employés. Il n'a pas d'informaticien. Un prestataire informatique vous confie le support de niveau 1 du cabinet, à distance, de 8 h à 17 h. Les employés appellent ou écrivent ; vous avez AnyDesk, un helpdesk et un contact au niveau 2 chez le prestataire.

## L'accueil d'un appel

| Étape | Exemple |
| --- | --- |
| **Saluer et s'identifier** | « Support informatique, bonjour, je suis Hery. » |
| **Identifier l'utilisateur** | Nom, service, poste |
| **Écouter le problème** | Laisser parler, puis reformuler |
| **Créer ou retrouver le ticket** | Pendant l'appel |
| **Annoncer la suite** | « Je vais me connecter à votre ordinateur avec votre accord. » |
| **Conclure** | Vérifier que tout fonctionne, donner le numéro de ticket |

## Les 5 problèmes types

### 1. Mot de passe oublié ou compte bloqué

1. **Vérifier l'identité** selon la procédure (question de sécurité, rappel sur un numéro connu).
2. Réinitialiser ou débloquer dans l'outil d'administration, si vous en avez les droits.
3. Donner un mot de passe temporaire par un canal sûr et demander de le changer.

> [!attention]
> Ne réinitialisez jamais un mot de passe sans **vérifier l'identité** de la personne. C'est une technique classique des pirates : appeler le support en se faisant passer pour un employé.

### 2. Imprimante qui n'imprime plus

1. Vérifier : allumée, papier, voyant d'erreur.
2. Les autres impriment-ils ? Si oui, le problème vient du poste.
3. Vider la file d'impression, puis supprimer et réinstaller l'imprimante si besoin.

### 3. Ordinateur très lent

1. Gestionnaire des tâches : quel programme utilise le processeur, la mémoire ou le disque ?
2. Espace disque libre suffisant ?
3. Mises à jour en cours ? Redémarrage depuis combien de temps ?
4. Fermer ou désinstaller ce qui pose problème, avec l'accord de l'utilisateur.

### 4. Messagerie qui ne reçoit plus

1. Le webmail fonctionne-t-il ? Si oui, le problème vient du logiciel de messagerie sur le poste.
2. Boîte pleine ? Connexion Internet ?
3. Réparer le profil ou reconfigurer le compte.

### 5. Installation d'un logiciel

1. Le logiciel est-il **autorisé** par l'entreprise ?
2. Télécharger uniquement depuis le site officiel ou le dépôt de l'entreprise.
3. Installer, tester, informer l'utilisateur.

## Un incident de sécurité

> [!exemple] L'appel
> « J'ai cliqué sur un lien dans un e-mail qui disait que mon compte allait être fermé, et j'ai tapé mon mot de passe. »

| Réaction | Pourquoi |
| --- | --- |
| **Rassurer** et remercier d'avoir appelé vite | L'utilisateur doit oser signaler |
| **Changer** le mot de passe immédiatement (ou faire changer) | Bloquer l'accès du pirate |
| **Débrancher** le poste du réseau si un fichier a été ouvert | Limiter la propagation |
| **Escalader** au niveau 2 ou au responsable sécurité | Analyse et vérifications |
| **Documenter** : heure, e-mail reçu, actions | Pour l'enquête |

## Escalader au niveau 2

```
Ticket #2214 – Priorité haute
Utilisateur : M. Rakoto, direction
Problème : le VPN refuse la connexion depuis ce matin (« échec d'authentification »).
Déjà fait :
- Identifiants vérifiés (connexion au webmail OK).
- Redémarrage du poste et du logiciel VPN.
- Même erreur sur le téléphone de l'utilisateur.
- 2 autres utilisateurs signalent la même erreur → possible problème général.
Demande : vérification du serveur VPN.
```

> [!astuce]
> Une bonne escalade dit **ce qui a déjà été fait**. Le niveau 2 ne refait pas les mêmes tests, et le problème est réglé plus vite.

## Le bilan de journée

| Rubrique | Exemple |
| --- | --- |
| Tickets reçus et résolus | 23 reçus, 20 résolus, 3 escaladés |
| Délai moyen de résolution | 22 minutes |
| Problèmes principaux | Imprimantes (6), mots de passe (5) |
| Incident de sécurité | 1 hameçonnage, mot de passe changé, escaladé |
| Proposition | Rappel aux employés sur les e-mails suspects |

> [!madagascar]
> Dans beaucoup d'entreprises malgaches, les coupures de courant entraînent des pannes répétées (box, imprimantes, postes). Notez-les dans votre bilan : proposer des onduleurs pour les équipements clés est un conseil utile et apprécié.

> [!retenir]
> - Saluer, identifier, écouter, créer le ticket, annoncer, conclure.
> - Mots de passe : vérifier l'identité avant tout.
> - Imprimante, lenteur, messagerie, installation : une méthode pour chaque cas.
> - Hameçonnage : changer le mot de passe, isoler, escalader, documenter.
> - Une escalade complète et un bilan chiffré.

## Exercice pratique : une journée au cabinet Fanilo

> [!exercice] Exercice pratique · 6 heures
> 1. Inventez 15 demandes variées des employés du cabinet.
> 2. Traitez-les dans votre helpdesk avec des tickets complets ; résolvez réellement dans votre machine virtuelle ceux qui le permettent (imprimante, lenteur, installation).
> 3. Rédigez 2 escalades au niveau 2 et la réaction à un incident d'hameçonnage.
> 4. Rédigez le bilan de la journée.
>
> **À livrer** : vos 15 tickets, vos captures, vos escalades et votre bilan. C'est votre projet de portfolio.
