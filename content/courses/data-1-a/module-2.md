Dans ce métier, **vous n'achetez aucun outil** : les plateformes fournissent leurs propres interfaces de travail. Être avancé, c'est savoir travailler vite et bien dans ces interfaces, et utiliser les bons outils de vérification autorisés. Ce module vous présente les interfaces des tâches avancées et les méthodes pour vérifier les faits, les calculs et le code.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Travailler dans les interfaces de comparaison et de notation détaillée.
> 2. Rédiger des justifications précises et vérifiables.
> 3. Vérifier les faits avec des sources fiables.
> 4. Vérifier les calculs et le code produits par l'IA.
> 5. Respecter les règles d'utilisation des outils sur les plateformes.

## Les interfaces des tâches avancées

| Interface | Ce que vous y faites | Point d'attention |
| --- | --- | --- |
| **Comparaison côte à côte** | Lire deux réponses, choisir la meilleure et indiquer l'écart (légère ou forte préférence) | Juger sur les critères des consignes, pas sur la longueur |
| **Grille détaillée** | Noter chaque critère et cocher les problèmes | Chaque note doit être justifiée |
| **Éditeur de réécriture** | Modifier la réponse de l'IA | Corriger toutes les erreurs, sans changer ce qui est correct |
| **Conversation** | Écrire des messages et évaluer chaque réponse | Garder une conversation naturelle et conforme au scénario |
| **Environnement de code** | Exécuter le code proposé et des tests | Tester les cas limites |

> [!definition] Échelle de préférence
> Une échelle qui indique **à quel point** une réponse est meilleure qu'une autre, par exemple de « A bien meilleure » à « B bien meilleure », avec « à peu près égales » au milieu. L'écart choisi doit correspondre à la gravité des différences.

## Les justifications précises

Une bonne justification permet à un réviseur de **vérifier** votre jugement en quelques secondes.

### La structure en 4 parties

1. **Le verdict** : quelle réponse est meilleure, et de combien.
2. **La raison principale** : l'erreur ou la qualité décisive.
3. **Les preuves** : citation précise, calcul correct, source.
4. **Les points secondaires** : autres différences, moins importantes.

> [!exemple] Justification
> **A est bien meilleure que B.**
> B se trompe sur le point principal : elle indique que la capitale de Madagascar est Toamasina (« The capital is Toamasina »), alors que c'est Antananarivo. A est exacte et répond à la question.
> Points secondaires : A est un peu longue (le dernier paragraphe répète l'introduction), mais cela ne change pas le verdict.

> [!attention] Les justifications à éviter
> - « A est meilleure. » (sans raison)
> - « B est plus agréable à lire. » (vague, sans critère des consignes)
> - « B contient des erreurs. » (lesquelles ? où ?)

## Vérifier les faits

### Les sources fiables

| Type d'information | Sources à privilégier |
| --- | --- |
| Faits officiels (lois, institutions, chiffres) | Sites officiels des gouvernements et des organisations internationales |
| Sciences et santé | Publications scientifiques, organismes de santé reconnus |
| Données économiques | Instituts de statistique, banques centrales, organisations internationales |
| Définitions | Dictionnaires et encyclopédies reconnus |
| Actualité | Plusieurs médias reconnus qui se confirment |

### La méthode

1. **Repérez** chaque affirmation vérifiable de la réponse (dates, chiffres, noms).
2. **Vérifiez** les plus importantes, en priorité celles qui changent le sens.
3. **Croisez** au moins deux sources pour les points douteux.
4. **Notez** la source dans votre justification si les consignes le demandent.

> [!madagascar]
> Pour les questions sur Madagascar (institutions, géographie, histoire, économie), vérifiez auprès de sources officielles ou reconnues, comme l'Institut national de la statistique (INSTAT) ou les sites des ministères. L'IA se trompe souvent sur les pays moins présents sur Internet : vos corrections ont beaucoup de valeur.

## Vérifier les calculs et le code

### Les calculs

1. **Refaites** chaque étape, pas seulement le résultat final.
2. **Vérifiez** les unités et les ordres de grandeur.
3. **Utilisez** une calculatrice ou un tableur si les consignes l'autorisent.

### Le code

```python
def moyenne(notes):
    return sum(notes) / len(notes)

print(moyenne([12, 15, 9]))   # 12.0 : correct
print(moyenne([]))            # erreur : division par zéro
```

| Vérification | Question |
| --- | --- |
| **Exécution** | Le code fonctionne-t-il sans erreur ? |
| **Résultat** | Donne-t-il le bon résultat sur des exemples ? |
| **Cas limites** | Liste vide, nombre négatif, texte inattendu ? |
| **Consignes** | Respecte-t-il la demande (langage, fonctions imposées) ? |
| **Sécurité** | Contient-il des pratiques dangereuses (mot de passe écrit dans le code, commande destructrice) ? |

## Les règles d'utilisation des outils

> [!attention]
> La plupart des plateformes **interdisent** d'utiliser un assistant d'IA pour faire les évaluations ou rédiger les réponses à votre place. Les textes générés par IA sont détectés, et les comptes sont fermés. Utilisez seulement les outils **autorisés par les consignes** (moteur de recherche, calculatrice, environnement de code fourni…). En cas de doute, demandez au support du projet.

### Les autres règles

1. **Ne copiez pas** les tâches hors de la plateforme (captures, textes).
2. **Ne partagez pas** les consignes, même avec d'autres évaluateurs hors des canaux officiels.
3. **Travaillez seul** sur votre compte.
4. **Respectez** les temps prévus : ni trop vite (travail bâclé), ni beaucoup trop lentement.

> [!retenir]
> - Aucun achat : les plateformes fournissent les interfaces.
> - Une justification en 4 parties : verdict, raison principale, preuves, points secondaires.
> - Vérifiez les faits avec des sources fiables et croisées.
> - Refaites les calculs, exécutez et testez le code, y compris les cas limites.
> - N'utilisez que les outils autorisés, jamais une IA pour faire le travail à votre place.

## Exercice pratique : les vérifications avancées

> [!exercice] Exercice pratique · 2 heures 30
> 1. Posez 3 questions à un assistant d'IA (un fait sur Madagascar, un calcul, un petit programme) et obtenez 2 réponses pour chacune (en relançant la génération).
> 2. Comparez chaque paire avec l'échelle de préférence et une justification en 4 parties.
> 3. Vérifiez les faits avec 2 sources, refaites le calcul, exécutez le code avec 3 cas de test.
> 4. Réécrivez la moins bonne réponse pour la rendre idéale.
>
> **À livrer** : vos 3 comparaisons, vos vérifications et vos réécritures.
