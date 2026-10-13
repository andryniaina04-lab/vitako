Dans ce module, vous mettez en ligne et maintenez le catalogue d'une boutique, comme le ferait un gestionnaire à distance. Vous apprendrez à transformer les informations d'un fournisseur en fichier propre, à lancer une nouvelle collection, à mettre à jour les prix et les stocks, et à faire un rapport de qualité du catalogue.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Transformer les données d'un fournisseur en fichier d'import.
> 2. Lancer une nouvelle collection complète.
> 3. Mettre à jour prix et stocks en masse sans erreur.
> 4. Préparer une période de soldes.
> 5. Rédiger un rapport de qualité du catalogue.

## Le cas pratique : « Lamba Studio »

> [!exemple] Votre client
> **Lamba Studio** vend des vêtements et accessoires inspirés des tissus malgaches. La boutique Shopify compte 180 produits et 900 variantes. Les ateliers partenaires d'Antsirabe et d'Antananarivo envoient leurs nouvelles collections sous forme de tableurs incomplets et de photos. La gérante, Mme Laure, vous confie la gestion du catalogue à distance.

## Étape 1 : des données fournisseur au fichier d'import

### Ce que vous recevez

| Problème | Exemple |
| --- | --- |
| Noms de couleurs variés | « bleu », « Bleu foncé », « indigo » pour la même couleur |
| Tailles mal écrites | « m », « Moyen », « M » |
| Prix manquants | 4 produits sans prix |
| Poids absents | Aucun poids indiqué |
| Photos mal nommées | IMG_2034.jpg |

### La méthode

1. **Copiez** les données brutes dans un onglet « Fournisseur » (sans les modifier).
2. **Créez** un onglet « Nettoyé » avec des formules et des listes de correspondance (par exemple « bleu foncé » donne « Indigo »).
3. **Listez** les questions au client (prix, poids manquants).
4. **Générez** les SKU avec la règle.
5. **Renommez** les photos selon les SKU.
6. **Préparez** l'onglet « Import » au format exact du CSV.

> [!astuce]
> Une **table de correspondance** (valeur reçue, valeur standard) se réutilise à chaque nouvelle collection. Avec `RECHERCHEV`, le nettoyage devient presque automatique.

## Étape 2 : lancer une nouvelle collection

| Étape | Action |
| --- | --- |
| 1 | Import des produits en statut **brouillon** |
| 2 | Vérification dans la boutique : images, variantes, prix, poids |
| 3 | Ajout des descriptions du rédacteur et des métachamps |
| 4 | Étiquettes et collections automatiques |
| 5 | Validation par la gérante |
| 6 | Passage en statut **actif** à la date de lancement |
| 7 | Contrôle sur téléphone et ordinateur après la mise en ligne |

## Étape 3 : mettre à jour prix et stocks

| Situation | Méthode |
| --- | --- |
| Le fournisseur augmente ses prix de 10 % | Export, formule de calcul dans le tableur, vérification, import des seuls prix |
| Inventaire physique de l'atelier | Comparaison du stock compté et du stock en ligne par SKU, correction des écarts |
| Produit arrêté | Archiver plutôt que supprimer (historique des commandes conservé) |

> [!attention]
> Pour une mise à jour en masse, n'importez que les **colonnes nécessaires** (SKU et prix, par exemple), selon ce que permet l'outil. Réimporter tout le fichier risque d'écraser des modifications faites entre-temps dans la boutique.

### Le contrôle après mise à jour

1. Comparez 10 produits au hasard avec votre fichier.
2. Vérifiez qu'aucun prix n'est à zéro ou anormalement bas.
3. Vérifiez les produits épuisés : masqués ou affichés « épuisé » selon le choix de la boutique.

## Étape 4 : préparer les soldes

| Étape | Action |
| --- | --- |
| Liste des produits soldés | Validée par la gérante, avec le pourcentage |
| Calcul | Nouveau prix et prix barré (ancien prix) dans le tableur |
| Étiquette « soldes » | La collection automatique se remplit seule |
| Programmation | Import la veille au soir, vérification le matin |
| Fin des soldes | Fichier de retour aux prix normaux préparé à l'avance |

> [!madagascar]
> Les soldes d'une boutique européenne commencent souvent **tôt le matin en Europe**. Avec le décalage horaire de Madagascar (une à deux heures d'avance selon la saison), vous pouvez faire les vérifications avant l'ouverture et réagir vite en cas de problème.

## Étape 5 : le rapport de qualité du catalogue

| Indicateur | Exemple |
| --- | --- |
| Produits actifs | 214 |
| Produits sans poids | 0 (contre 37 le mois dernier) |
| Produits avec moins de 3 photos | 12 |
| Variantes épuisées encore visibles | 0 |
| SKU en double | 0 |
| Produits sans métachamp « Entretien » | 18 |
| Prochaines actions | Photos supplémentaires pour 12 produits ; entretien à compléter |

> [!retenir]
> - Garder les données brutes, nettoyer avec des tables de correspondance.
> - Lancer une collection en brouillon, vérifier, valider, activer.
> - Mettre à jour en masse seulement les colonnes nécessaires, puis contrôler.
> - Préparer les soldes et leur fin à l'avance.
> - Un rapport mensuel de qualité du catalogue.

## Exercice pratique : le catalogue de Lamba Studio

> [!exercice] Exercice pratique · 7 heures (sur plusieurs jours)
> 1. Créez un fichier fournisseur « désordonné » de 10 produits et nettoyez-le avec une table de correspondance.
> 2. Importez la collection en brouillon dans votre boutique de test, puis activez-la.
> 3. Simulez une hausse de prix de 10 % et un inventaire avec 5 écarts.
> 4. Préparez des soldes de 20 % sur 6 produits et leur retour aux prix normaux.
> 5. Rédigez le rapport de qualité.
>
> **À livrer** : vos fichiers, des captures de la boutique et le rapport. C'est votre projet de portfolio.
