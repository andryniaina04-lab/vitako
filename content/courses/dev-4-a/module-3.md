Un produit no-code professionnel doit être **sûr, rapide, testé et documenté**, et il doit être livré à temps. Ce module vous donne les méthodes des meilleurs développeurs no-code : sécurité des données, performance, tests, environnements, réutilisation et documentation.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Protéger les données avec des règles de confidentialité solides.
> 2. Optimiser la vitesse d'un site ou d'une application.
> 3. Tester avant chaque mise en ligne.
> 4. Travailler avec un environnement de test et des versions.
> 5. Gagner du temps avec une bibliothèque de composants et une documentation.

## La sécurité des données

> [!definition] Règle de confidentialité
> Une règle qui définit, **côté serveur**, qui peut voir ou modifier chaque type de donnée. Cacher un élément dans la page ne suffit pas : les données restent accessibles si la règle n'existe pas.

| Vérification | Exemple |
| --- | --- |
| Chaque table a des règles | « Un client ne voit que ses propres commandes » |
| Les champs sensibles sont protégés | Téléphone visible seulement par l'administrateur |
| Les pages d'administration sont protégées | Redirection si l'utilisateur n'a pas le bon rôle |
| Les workflows vérifient les droits | Seul l'auteur peut supprimer son annonce |
| Les clés d'API sont privées | Jamais dans un champ visible ou dans le code de la page |

> [!attention]
> Testez la sécurité **avec un compte de test sans droits** : essayez d'ouvrir les pages et les données des autres. Beaucoup de fuites de données viennent d'applications no-code où seule l'interface était protégée.

## La performance

| Problème | Solution |
| --- | --- |
| Images lourdes | Formats modernes, tailles adaptées, chargement différé |
| Trop de données chargées | Filtres dans la recherche, pagination |
| Calculs répétés dans la page | Enregistrer le résultat dans un champ |
| Trop d'éléments sur une page | Diviser en onglets ou en pages |
| Scripts externes nombreux | Garder seulement les outils nécessaires |

> [!madagascar]
> Testez toujours vos projets avec une **connexion mobile lente**. Les outils du navigateur permettent de simuler un réseau lent : beaucoup de vos utilisateurs malgaches, et une partie des utilisateurs africains, se connectent ainsi.

## Tester avant chaque mise en ligne

| Type de test | Ce qu'on vérifie |
| --- | --- |
| **Parcours principaux** | Inscription, commande, paiement, réservation |
| **Rôles** | Chaque rôle voit et fait seulement ce qu'il doit |
| **Appareils** | Téléphone, tablette, ordinateur |
| **Cas limites** | Champs vides, textes très longs, doubles clics |
| **E-mails et notifications** | Envoyés, bien affichés, bons destinataires |
| **Intégrations** | Paiement, API, automatisations |

> [!astuce]
> Gardez une **liste de tests écrite** pour chaque projet et repassez-la avant chaque mise en ligne. Elle évite de casser une fonction ancienne en ajoutant une nouvelle.

## Environnements et versions

| Pratique | Pourquoi |
| --- | --- |
| **Version de développement** séparée de la version en ligne | Tester sans déranger les utilisateurs |
| **Données de test** distinctes des vraies données | Ne pas envoyer d'e-mails aux vrais clients par erreur |
| **Points de sauvegarde** avant chaque gros changement | Revenir en arrière si besoin |
| **Notes de version** | Le client sait ce qui a changé |

## Réutiliser pour aller plus vite

1. **Une bibliothèque de composants** : en-têtes, cartes, formulaires, tableaux.
2. **Des modèles de projet** : structure de base de données, rôles, pages d'administration.
3. **Des workflows types** : inscription, réinitialisation du mot de passe, notifications.
4. **Une liste de tests** et un **modèle de documentation**.

## La documentation

```
Application Stock-Kely – Documentation
1. Rôles : administrateur, magasinier, lecteur
2. Données : Produits, Mouvements, Fournisseurs (schéma joint)
3. Règles : un magasinier ne peut pas supprimer un mouvement
4. Automatisations : alerte e-mail si stock sous le seuil
5. Comptes et abonnements : propriétaire, offre, coût mensuel
6. Procédure : ajouter un utilisateur, changer un seuil
```

> [!retenir]
> - Des règles de confidentialité côté serveur, testées avec un compte sans droits.
> - Images légères, recherches filtrées, pages allégées.
> - Une liste de tests repassée avant chaque mise en ligne.
> - Version de développement, données de test, sauvegardes.
> - Composants, modèles et documentation pour livrer plus vite.

## Exercice pratique : la méthode professionnelle

> [!exercice] Exercice pratique · 3 heures
> 1. Ajoutez des règles de confidentialité à un de vos projets et testez-les avec un compte sans droits.
> 2. Mesurez la vitesse d'une page, appliquez 3 améliorations et mesurez à nouveau.
> 3. Rédigez la liste de tests du projet.
> 4. Rédigez sa documentation en 6 parties.
>
> **À livrer** : vos règles, vos mesures avant et après, votre liste de tests et votre documentation.
