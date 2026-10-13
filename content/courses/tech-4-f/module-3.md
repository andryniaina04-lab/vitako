Ce module vous fait prendre en main deux outils gratuits incontournables : **Nmap** pour inventorier les machines et les services exposés, et **OWASP ZAP** pour analyser la sécurité d'un site web. Vous découvrirez ensuite les outils professionnels payants : **Burp Suite Professional** et **Nessus**. Tous les exercices se font dans votre laboratoire ou sur des cibles explicitement autorisées.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Inventorier les services d'un réseau autorisé avec Nmap.
> 2. Interpréter les résultats d'un scan.
> 3. Analyser une application web de test avec OWASP ZAP.
> 4. Trier et vérifier les alertes.
> 5. Comprendre l'apport de Burp Suite Professional et de Nessus.

> [!attention]
> Rappel : n'utilisez ces outils **que** sur votre propre laboratoire, sur les cibles d'entraînement prévues à cet effet, ou sur les systèmes d'un client qui vous a donné une **autorisation écrite** avec un périmètre précis.

## Nmap : inventorier les services

> [!definition] Scan de ports
> Vérifier quels ports d'une machine répondent et quels services y fonctionnent. C'est l'équivalent de faire le tour d'un bâtiment pour compter les portes et vérifier lesquelles sont ouvertes.

```bash
# Machines actives dans votre réseau de laboratoire
nmap -sn 192.168.56.0/24

# Ports les plus courants d'une machine de votre laboratoire
nmap 192.168.56.101

# Versions des services détectés
nmap -sV 192.168.56.101

# Enregistrer les résultats pour le rapport
nmap -sV -oN resultat-scan.txt 192.168.56.101
```

| Résultat | Signification | Question à se poser |
| --- | --- | --- |
| **open** | Un service répond | Ce service doit-il être accessible depuis Internet ? |
| **closed** | Aucun service, mais la machine répond | Normal |
| **filtered** | Un pare-feu bloque | Normal pour les ports non utilisés |

> [!exemple] Interprétation
> Un serveur web présente les ports 22 (SSH), 80 et 443 (web) et 3306 (base de données MySQL) ouverts. Le port 3306 ne devrait pas être accessible depuis Internet : **recommandation** : le fermer au pare-feu et n'autoriser l'accès qu'en interne.

## OWASP ZAP : analyser un site web

| Fonction | Usage |
| --- | --- |
| **Exploration (spider)** | Découvre les pages du site |
| **Analyse passive** | Observe les réponses sans rien envoyer d'agressif : en-têtes de sécurité, cookies, informations exposées |
| **Analyse active** | Envoie des requêtes de test : seulement sur un site de test et avec autorisation |
| **Rapport** | Liste des alertes par niveau de risque |

| Étape | Action dans votre laboratoire |
| --- | --- |
| 1 | Lancer OWASP Juice Shop sur votre machine |
| 2 | Ouvrir ZAP et indiquer l'adresse locale de l'application |
| 3 | Lancer l'exploration et l'analyse passive |
| 4 | Lire les alertes et leur niveau |
| 5 | Exporter le rapport |

## Trier et vérifier les alertes

| Niveau | Exemple d'alerte | Action |
| --- | --- | --- |
| **Élevé** | Données sensibles transmises sans chiffrement | Corriger en priorité |
| **Moyen** | En-tête de sécurité manquant | Corriger rapidement |
| **Faible** | Version du serveur visible | Corriger à l'occasion |
| **Information** | Remarque technique | Noter |

> [!astuce]
> Les outils automatiques produisent des **faux positifs** : des alertes qui ne correspondent pas à un vrai problème. Vérifiez chaque alerte importante avant de la mettre dans un rapport. Un rapport rempli d'alertes non vérifiées fait perdre confiance au client.

## Les outils payants

| Outil | Ce qu'il apporte |
| --- | --- |
| **Burp Suite Professional** | Outil de référence pour les tests de sécurité web autorisés : analyse approfondie, outils manuels avancés, rapports |
| **Nessus** | Scanner de vulnérabilités : détecte les logiciels pas à jour et les mauvaises configurations sur de nombreuses machines, avec des rapports détaillés |

> [!madagascar]
> Ces licences coûtent cher et se paient en dollars par carte bancaire internationale. Commencez avec Nmap, OWASP ZAP et les versions gratuites ou d'essai (Burp Suite Community, Nessus Essentials pour un usage limité). Achetez une licence professionnelle quand vos contrats la justifient, ou utilisez celle du client.

> [!retenir]
> - Uniquement sur son laboratoire, des cibles d'entraînement ou avec autorisation écrite.
> - Nmap : machines actives, ports ouverts, versions ; chaque service exposé doit être justifié.
> - OWASP ZAP : exploration, analyse passive, analyse active sur site de test seulement.
> - Trier par niveau et vérifier les faux positifs.
> - Burp Suite Professional et Nessus pour aller plus loin.

## Exercice pratique : inventaire et analyse dans votre laboratoire

> [!exercice] Exercice pratique · 5 heures
> 1. Créez un réseau privé de laboratoire avec deux machines virtuelles.
> 2. Inventoriez-les avec Nmap et justifiez chaque port ouvert.
> 3. Analysez OWASP Juice Shop avec ZAP (exploration et analyse passive).
> 4. Choisissez 5 alertes, vérifiez-les et proposez une correction pour chacune.
>
> **À livrer** : vos résultats Nmap, le rapport ZAP et votre tableau d'alertes vérifiées.
