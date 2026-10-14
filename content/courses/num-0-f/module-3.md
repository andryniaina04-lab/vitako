Le tableur est l'outil qui distingue le plus vite un assistant ordinaire d'un assistant recherché. Suivre un budget, un stock, des ventes ou une liste de contacts : tout cela se fait dans un tableur. Ce module vous apprend les formules et les fonctions qui servent tous les jours, avec Excel, Google Sheets ou LibreOffice Calc.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Comprendre cellules, lignes, colonnes et feuilles.
> 2. Écrire des formules et utiliser les fonctions essentielles.
> 3. Utiliser les références absolues avec le signe $.
> 4. Trier, filtrer et mettre en forme un tableau.
> 5. Résumer des données avec un tableau croisé dynamique et un graphique.

## Les bases du tableur

> [!definition] Cellule
> La case à l'intersection d'une colonne (lettre) et d'une ligne (chiffre). La cellule B3 est dans la colonne B, à la ligne 3.

| Logiciel | Prix | Remarque |
| --- | --- | --- |
| **Google Sheets** | Gratuit | En ligne, partage facile |
| **Excel (version web)** | Gratuit avec un compte Microsoft | Fonctions principales |
| **LibreOffice Calc** | Gratuit | Sans Internet |
| **Excel (bureau)** | Payant | Le plus demandé par les entreprises |

Règles d'un bon tableau :
1. Une ligne de titres en haut, une colonne par information.
2. Une ligne par élément (une vente, un produit, un contact).
3. Pas de ligne vide au milieu.
4. Les dates au même format partout.

## Les formules et fonctions essentielles

Une formule commence toujours par le signe **=**.

| Fonction | Exemple | Résultat |
| --- | --- | --- |
| **SOMME** | =SOMME(C2:C20) | Le total de la colonne |
| **MOYENNE** | =MOYENNE(C2:C20) | La moyenne |
| **NB** | =NB(C2:C20) | Le nombre de cellules contenant un nombre |
| **SI** | =SI(D2>=50;"Réussi";"À revoir") | Un résultat selon une condition |
| **SOMME.SI** | =SOMME.SI(B2:B20;"Vanille";C2:C20) | Le total pour une seule catégorie |
| **RECHERCHEV** | =RECHERCHEV(A2;Produits!A:C;3;FAUX) | Va chercher une information dans une autre liste |

> [!astuce]
> Selon la langue du logiciel, le séparateur est le point-virgule ou la virgule, et les noms de fonctions changent (SUM en anglais). Les versions récentes d'Excel et de Google Sheets proposent aussi RECHERCHEX (XLOOKUP), plus simple que RECHERCHEV.

## Les références absolues

Quand on recopie une formule vers le bas, les cellules se décalent. Pour bloquer une cellule, on ajoute **$**.

> [!exemple] Prix en euros
> Un hôtel de Nosy Be note ses tarifs en ariary dans la colonne B, et le taux de change dans la cellule F1. La formule en C2 est =B2/$F$1. Recopiée vers le bas, elle utilise toujours le taux de F1, mais le prix de chaque ligne.

Astuce : sélectionnez la référence dans la formule et appuyez sur **F4** pour ajouter les $ automatiquement (dans Excel).

## Trier, filtrer, mettre en forme

| Action | Utilité |
| --- | --- |
| **Figer la première ligne** | Garder les titres visibles en descendant |
| **Filtre** | Afficher seulement une catégorie ou une période |
| **Tri** | Classer du plus grand au plus petit, ou par date |
| **Format nombre** | Séparateur de milliers, 2 décimales, format date |
| **Mise en forme conditionnelle** | Colorer automatiquement les retards ou les stocks bas |

## Résumer les données

> [!definition] Tableau croisé dynamique
> Un outil qui résume une grande liste en quelques clics : par exemple le total des ventes par mois et par produit, sans écrire de formule.

1. Sélectionnez votre tableau.
2. Insertion, puis Tableau croisé dynamique.
3. Placez « Mois » en lignes, « Produit » en colonnes, « Montant » en valeurs.
4. Insérez un graphique à partir du résultat : histogramme pour comparer, courbe pour une évolution.

> [!attention] Erreurs fréquentes
> - Taper les totaux à la main au lieu d'une formule.
> - Fusionner des cellules dans un tableau de données : le tri et le filtre ne marchent plus.
> - Mélanger texte et nombres dans une même colonne (« 15 000 Ar » au lieu de 15000).
> - Oublier les $ et obtenir des résultats faux en recopiant.

> [!madagascar]
> Beaucoup de petites entreprises tiennent encore leurs comptes dans un cahier. Proposer de transformer ce cahier en tableur, avec des totaux automatiques par mois, est un premier service simple et très utile à vendre localement.

> [!retenir]
> - Une ligne par élément, une colonne par information.
> - SOMME, MOYENNE, SI, SOMME.SI, RECHERCHEV.
> - Le $ pour bloquer une cellule.
> - Filtres, tri, mise en forme conditionnelle, tableau croisé dynamique.

## Exercice pratique : le suivi des ventes d'une boutique

> [!exercice] Exercice pratique · 2 heures
> 1. Créez un tableau de 30 ventes : date, produit, quantité, prix unitaire, montant.
> 2. Calculez le montant avec une formule, puis le total général.
> 3. Ajoutez une colonne « Gros achat » avec SI (oui au-delà de 100 000 Ar).
> 4. Faites un tableau croisé dynamique des ventes par produit et un graphique.
> 5. Colorez automatiquement les gros achats.
>
> **À livrer** : le fichier XLSX (ou le lien Google Sheets) avec le tableau, le résumé et le graphique.
