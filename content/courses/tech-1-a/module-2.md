Les équipes professionnelles testent sur de nombreux navigateurs et appareils réels, et suivent leurs campagnes de tests dans un outil central. Ce module vous apprend à utiliser **BrowserStack** pour tester sur des appareils réels et en automatique, et les **offres payantes de Jira** avec la gestion des cas de test, les automatisations et les tableaux de bord.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Tester manuellement sur des appareils réels avec BrowserStack.
> 2. Exécuter des tests Playwright sur BrowserStack.
> 3. Gérer des cas de test et des campagnes dans Jira.
> 4. Créer des automatisations et des tableaux de bord dans Jira.
> 5. Choisir les outils adaptés au budget du client.

## BrowserStack : tester sur des appareils réels

> [!definition] Ferme d'appareils
> Un service en ligne qui donne accès à des centaines de vrais téléphones, tablettes et navigateurs, à distance, sans les acheter.

| Produit (noms à vérifier sur le site officiel) | Usage |
| --- | --- |
| **Live** | Tests manuels d'un site sur un navigateur ou un téléphone réel |
| **App Live** | Tests manuels d'une application mobile installée sur un appareil réel |
| **Automate** | Exécution de tests automatiques web sur de nombreux navigateurs |
| **App Automate** | Exécution de tests automatiques mobiles |
| **Percy** | Comparaison visuelle des écrans d'une version à l'autre |
| **Local testing** | Tester un site qui n'est pas encore public (environnement interne) |

### Choisir les appareils

1. **Demandez** les statistiques du client : navigateurs et téléphones les plus utilisés.
2. **Couvrez** les plus fréquents, plus un ancien modèle et un petit écran.
3. **Ajoutez** les cas propres au marché : téléphones Android d'entrée de gamme pour l'Afrique.

> [!astuce]
> Les outils de simulation de réseau lent (souvent proposés par ces services) permettent de tester l'application comme un utilisateur avec une **connexion faible**. Notez dans vos rapports le réseau utilisé.

### Exécuter des tests Playwright à distance

L'intégration de Playwright avec BrowserStack se fait généralement avec le SDK officiel et un fichier de configuration qui liste les navigateurs et appareils. Les identifiants sont fournis par des **variables d'environnement** :

```
BROWSERSTACK_USERNAME=…   (dans les secrets, jamais dans le code)
BROWSERSTACK_ACCESS_KEY=…
```

> [!attention]
> Ne publiez jamais vos clés d'accès dans un dépôt de code ou une capture d'écran. Utilisez les **secrets** de l'outil d'intégration continue ou un fichier local ignoré par Git.

## Jira : les fonctions payantes utiles au test

| Fonction | Usage pour le testeur |
| --- | --- |
| **Gestion des cas de test** (extensions comme Xray ou Zephyr) | Cas de test, campagnes d'exécution, lien entre exigences, tests et bugs |
| **Automatisations** | Changer un statut, notifier, créer des sous-tâches automatiquement |
| **Tableaux de bord** | Bugs ouverts par gravité, avancement d'une campagne |
| **Permissions avancées** | Accès différents pour le client, l'équipe, les prestataires |
| **Historique et audit** | Traçabilité des changements |

> [!definition] Traçabilité
> Le lien entre une exigence, les tests qui la vérifient et les bugs trouvés. Elle permet de répondre à la question : « Cette fonction a-t-elle été testée, et avec quel résultat ? »

### Une campagne dans un outil de gestion des tests

| Élément | Exemple |
| --- | --- |
| Plan de test | Version 2.4 – application de livraison |
| Exécution | 86 cas : 74 réussis, 9 échoués, 3 bloqués |
| Bugs liés | 9 bugs créés et liés aux cas échoués |
| Couverture | 100 % des exigences critiques testées |

### Exemples d'automatisations Jira

1. Quand un bug passe à « Corrigé », il est **attribué** au testeur pour vérification.
2. Quand un bug est créé avec la gravité « Bloquant », le **chef de projet est notifié**.
3. Quand toutes les sous-tâches de test sont terminées, l'histoire passe à « Prête pour la mise en ligne ».

## Choisir selon le budget

| Budget du client | Proposition |
| --- | --- |
| Faible | Jira gratuit, cas de test dans un tableur ou une page, appareils physiques disponibles |
| Moyen | Extension de gestion des tests, abonnement BrowserStack limité |
| Élevé | Gestion des tests complète, fermes d'appareils et tests visuels automatiques |

> [!madagascar]
> Ces outils sont payés **par le client ou l'employeur**, en dollars. Pour vous former, utilisez les essais gratuits et les comptes gratuits proposés aux projets open source quand ils existent. Mentionnez sur votre profil ce que vous avez réellement fait avec chaque outil.

> [!retenir]
> - BrowserStack : appareils réels, tests manuels, automatiques et visuels.
> - Choisir les appareils selon les statistiques du client.
> - Clés d'accès dans les secrets, jamais dans le code.
> - Jira : gestion des tests, traçabilité, automatisations, tableaux de bord.
> - Adapter les outils au budget.

## Exercice pratique : un environnement de test professionnel

> [!exercice] Exercice pratique · 4 heures
> 1. Avec un essai BrowserStack (ou un outil similaire), testez un site sur 5 appareils et notez les différences.
> 2. Configurez un test Playwright pour qu'il lise ses identifiants dans des variables d'environnement.
> 3. Dans Jira, créez 10 cas de test, une campagne et 3 bugs liés.
> 4. Créez 2 automatisations et un tableau de bord.
>
> **À livrer** : votre rapport multi-appareils, votre configuration (sans clés), des captures de Jira.
