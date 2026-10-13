Ce module vous donne les bases techniques de la cybersécurité défensive : le réseau, la sécurité des comptes, la sécurité des sites web avec l'OWASP Top 10, les journaux et la gestion des risques.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Comprendre les notions réseau utiles à la sécurité.
> 2. Protéger les comptes et les accès.
> 3. Connaître les grandes familles de failles web.
> 4. Lire des journaux pour repérer un comportement suspect.
> 5. Évaluer et classer les risques.

## Le réseau pour la sécurité

| Notion | Explication |
| --- | --- |
| **Adresse IP** | L'adresse d'une machine sur le réseau |
| **Port** | Une « porte » pour un service (22 pour SSH, 443 pour HTTPS) |
| **Protocole** | Les règles d'échange (HTTP, HTTPS, DNS, SSH) |
| **Pare-feu** | Filtre qui autorise ou bloque les connexions |
| **Chiffrement** | Rend les échanges illisibles pour un tiers (HTTPS) |

> [!astuce]
> Une règle simple : **chaque port ouvert est une porte**. Moins il y a de services exposés sur Internet, moins il y a de risques. Une grande partie d'un audit consiste à vérifier que seules les portes nécessaires sont ouvertes.

## La sécurité des comptes

| Mesure | Effet |
| --- | --- |
| **Double authentification** | Un mot de passe volé ne suffit plus |
| **Gestionnaire de mots de passe** | Un mot de passe long et unique par compte |
| **Accès minimum** | Chacun n'a que les droits nécessaires |
| **Retrait des accès** au départ d'un employé | Éviter les comptes oubliés |
| **Comptes d'administration séparés** | Limiter les dégâts en cas de vol |

## La sécurité des sites : l'OWASP Top 10

> [!definition] OWASP
> L'OWASP est une communauté internationale ouverte qui publie des guides et des outils gratuits pour la sécurité des applications web. Son **Top 10** liste les familles de risques les plus importantes.

| Famille de risque | Idée simple | Correction type |
| --- | --- | --- |
| **Contrôle d'accès défaillant** | Un utilisateur voit les données d'un autre | Vérifier les droits à chaque requête |
| **Défaillances cryptographiques** | Données sensibles mal protégées | HTTPS partout, chiffrement adapté |
| **Injection** | Des données saisies sont interprétées comme du code | Requêtes paramétrées, validation des entrées |
| **Conception non sécurisée** | La sécurité n'a pas été prévue | Penser aux risques dès la conception |
| **Mauvaise configuration** | Options par défaut, messages d'erreur trop détaillés | Revue de configuration |
| **Composants vulnérables** | Bibliothèques pas à jour | Mises à jour, inventaire des composants |
| **Authentification défaillante** | Connexion trop facile à contourner | Double authentification, limitation des essais |
| **Intégrité des données et du logiciel** | Mises à jour ou données non vérifiées | Sources fiables, signatures |
| **Journalisation insuffisante** | Une attaque passe inaperçue | Journaux et alertes |
| **Requêtes forcées côté serveur** | Le serveur est poussé à contacter une adresse interne | Filtrer les adresses autorisées |

*(La liste exacte évolue avec les versions publiées par l'OWASP : consultez la plus récente.)*

> [!attention]
> Dans ce cours, on apprend à **reconnaître et corriger** ces risques, pas à les exploiter sur des systèmes réels. Les essais pratiques se font uniquement sur votre application d'entraînement.

## Lire les journaux

| Signe | Ce qu'il peut indiquer |
| --- | --- |
| Des centaines d'échecs de connexion en quelques minutes | Essais automatiques de mots de passe |
| Une connexion réussie depuis un pays inhabituel | Compte peut-être volé |
| Des requêtes vers des pages qui n'existent pas | Exploration automatique du site |
| Des erreurs serveur en série | Problème technique ou tentative d'attaque |

```bash
# Échecs de connexion SSH sur un serveur Ubuntu (votre laboratoire)
sudo grep "Failed password" /var/log/auth.log
```

## Évaluer les risques

| Probabilité / Impact | Impact faible | Impact fort |
| --- | --- | --- |
| **Probabilité forte** | Risque moyen | **Risque critique** |
| **Probabilité faible** | Risque faible | Risque élevé |

> [!exemple] Exemple
> Un site de vente sans double authentification pour l'administrateur : probabilité forte (les essais automatiques sont fréquents), impact fort (accès à toutes les commandes). **Risque critique**, à corriger en priorité, avec une solution simple et peu coûteuse.

> [!retenir]
> - IP, ports, protocoles, pare-feu, chiffrement ; chaque port ouvert est une porte.
> - Double authentification, gestionnaire de mots de passe, accès minimum.
> - L'OWASP Top 10 pour les sites web : reconnaître et corriger.
> - Les journaux révèlent les comportements suspects.
> - Classer les risques selon probabilité et impact.

## Exercice pratique : un petit diagnostic

> [!exercice] Exercice pratique · 4 heures
> 1. Faites l'inventaire des comptes d'une petite entreprise fictive et proposez 5 mesures de protection.
> 2. Pour 5 familles de l'OWASP Top 10, écrivez une explication simple et une correction.
> 3. Sur votre machine virtuelle, provoquez des échecs de connexion et retrouvez-les dans les journaux.
> 4. Classez 6 risques dans la grille probabilité et impact.
>
> **À livrer** : votre inventaire, vos explications, vos captures et votre grille.
