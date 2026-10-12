Ce module vous donne les bases techniques et la méthode du support : diagnostiquer pas à pas, poser les bonnes questions, connaître les éléments essentiels de Windows et du réseau, et expliquer simplement à un utilisateur.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Appliquer une méthode de diagnostic en 6 étapes.
> 2. Poser les bonnes questions à un utilisateur.
> 3. Utiliser les outils de base de Windows.
> 4. Vérifier une connexion réseau.
> 5. Expliquer une solution sans jargon.

## La méthode de diagnostic en 6 étapes

| N° | Étape | Exemple : « Je n'ai plus Internet » |
| --- | --- | --- |
| 1 | **Comprendre** le problème exact | Plus aucun site, ou un seul ? Depuis quand ? |
| 2 | **Reproduire** ou constater | Prise en main : le navigateur affiche « Pas de connexion » |
| 3 | **Isoler** la cause | Les collègues ont Internet ? Le Wi-Fi est-il connecté ? |
| 4 | **Tester** une solution à la fois | Désactiver puis réactiver le Wi-Fi |
| 5 | **Vérifier** avec l'utilisateur | Il ouvre ses sites habituels |
| 6 | **Documenter** dans le ticket | Cause, solution, durée |

> [!astuce]
> Commencez toujours par **les causes simples** : câble débranché, appareil éteint, mode avion activé, mise à jour en attente, redémarrage jamais fait. Une grande partie des problèmes se règlent ainsi.

## Les bonnes questions

| Question | Ce qu'elle apprend |
| --- | --- |
| « Que se passe-t-il exactement ? Quel message voyez-vous ? » | Le symptôme précis |
| « Depuis quand ? » | Ce qui a pu changer |
| « Avez-vous fait quelque chose de nouveau avant ? » | Mise à jour, installation, clic |
| « Est-ce que vos collègues ont le même problème ? » | Problème individuel ou général |
| « Pouvez-vous me lire le message d'erreur ? » | Une piste de recherche |
| « Avez-vous déjà redémarré l'ordinateur ? » | Écarter une cause simple |

> [!definition] Problème général
> Quand plusieurs utilisateurs ont le même problème en même temps (messagerie en panne pour tous), on parle d'incident majeur. On le signale tout de suite au responsable, au lieu de traiter chaque appel séparément.

## Les outils de base de Windows

| Outil | Usage |
| --- | --- |
| **Gestionnaire des tâches** (Ctrl + Maj + Échap) | Voir ce qui ralentit l'ordinateur, fermer un programme bloqué |
| **Paramètres** | Wi-Fi, mises à jour, imprimantes, comptes |
| **Panneau de configuration** | Programmes installés, options avancées |
| **Gestionnaire de périphériques** | Pilotes de l'imprimante, de la carte réseau |
| **Observateur d'événements** | Historique des erreurs du système |
| **Invite de commandes** | Commandes de diagnostic réseau |

> [!definition] Pilote
> Le petit logiciel qui permet à Windows de faire fonctionner un matériel (imprimante, carte réseau, carte graphique).

## Le réseau : l'essentiel

| Notion | Explication simple |
| --- | --- |
| **Adresse IP** | L'adresse d'un appareil sur le réseau |
| **Passerelle** | La « porte » vers Internet, souvent la box ou le routeur |
| **DNS** | Le service qui transforme un nom de site en adresse IP |
| **Wi-Fi et câble** | Deux façons de se connecter au réseau local |
| **VPN** | Un tunnel sécurisé vers le réseau de l'entreprise |

### Les commandes utiles

```
ipconfig                → voir l'adresse IP et la passerelle
ping 8.8.8.8            → tester l'accès à Internet par une adresse IP
ping google.com         → tester aussi la résolution des noms (DNS)
ipconfig /flushdns      → vider le cache DNS
```

> [!exemple] Lire le résultat
> Si `ping 8.8.8.8` répond mais `ping google.com` ne répond pas, Internet fonctionne mais la **résolution des noms (DNS)** pose problème.

## Expliquer simplement

| Au lieu de | Dites |
| --- | --- |
| « Votre cache DNS est corrompu » | « Votre ordinateur a gardé une mauvaise adresse en mémoire, je vais l'effacer » |
| « Il faut mettre à jour le pilote » | « Je vais installer la dernière version du programme de l'imprimante » |
| « Faites Windows + R puis tapez… » | « Appuyez sur la touche avec le logo Windows et, en même temps, sur la lettre R » |

> [!madagascar]
> Les coupures de courant et les connexions instables provoquent des problèmes fréquents : fichiers non enregistrés, mises à jour interrompues, box à redémarrer. Pensez-y dans vos diagnostics et conseillez aux utilisateurs l'enregistrement automatique et un onduleur.

> [!retenir]
> - Comprendre, reproduire, isoler, tester, vérifier, documenter.
> - Les causes simples d'abord.
> - Les bonnes questions donnent la moitié de la réponse.
> - Gestionnaire des tâches, paramètres, pilotes, événements, commandes réseau.
> - Expliquer sans jargon, étape par étape.

## Exercice pratique : diagnostiquer

> [!exercice] Exercice pratique · 2 heures 30
> 1. Dans votre machine virtuelle, utilisez `ipconfig` et `ping` et notez les résultats.
> 2. Coupez le réseau de la machine et refaites les tests : que voyez-vous ?
> 3. Rédigez la liste de questions pour 3 problèmes : imprimante, messagerie, ordinateur lent.
> 4. Réécrivez 5 explications techniques en langage simple.
>
> **À livrer** : vos résultats de tests, vos listes de questions et vos 5 explications.
