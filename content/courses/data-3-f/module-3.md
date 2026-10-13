Ce module vous fait prendre en main les trois outils de base de l'analyste : **Excel** (formules, Power Query, tableaux croisés dynamiques), **SQL** pour interroger une base de données, et **Power BI** pour les tableaux de bord. Vous découvrirez aussi les outils payants : **Microsoft 365**, **Power BI Pro** et **Tableau**.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Utiliser les formules et les tableaux croisés dynamiques d'Excel.
> 2. Nettoyer des données avec Power Query.
> 3. Écrire des requêtes SQL simples.
> 4. Créer un premier tableau de bord dans Power BI.
> 5. Comprendre ce qu'apportent les outils payants.

## Excel pour l'analyste

### Les formules essentielles

| Formule (en français) | Usage |
| --- | --- |
| `SOMME.SI.ENS` | Total des ventes d'un magasin pour un mois |
| `NB.SI.ENS` | Nombre de ventes d'un produit |
| `MOYENNE.SI.ENS` | Panier moyen par magasin |
| `RECHERCHEX` | Retrouver le prix d'achat d'un produit dans une autre table |
| `SI` | Classer : « Rentable » ou « À perte » |
| `SUPPRESPACE`, `MAJUSCULE` | Nettoyer les textes |

### Le tableau croisé dynamique

> [!definition] Tableau croisé dynamique
> Un outil qui résume un grand tableau en quelques clics : par exemple, le total des ventes par magasin (en lignes) et par mois (en colonnes), sans écrire de formule.

1. Transformez les données en **tableau** (Insertion → Tableau).
2. **Insertion → Tableau croisé dynamique**.
3. Glissez « Magasin » en lignes, « Mois » en colonnes, « Montant » en valeurs.
4. Ajoutez un **graphique croisé dynamique** si besoin.

## Power Query : nettoyer une fois, réutiliser chaque mois

1. **Données → Obtenir des données** depuis le fichier d'export.
2. Dans l'éditeur Power Query : supprimer les colonnes inutiles, changer les types (date, nombre), remplacer les valeurs, supprimer les doublons.
3. **Fermer et charger** dans Excel.
4. Le mois suivant, remplacez le fichier source et cliquez sur **Actualiser** : toutes les étapes se rejouent.

> [!astuce]
> Power Query existe aussi dans Power BI, avec la même logique. Ce que vous apprenez dans Excel vous servira directement dans Power BI.

## SQL : interroger une base de données

> [!definition] SQL
> Le langage standard pour interroger les bases de données. Il permet de sélectionner, filtrer, regrouper et relier des tables, même avec des millions de lignes.

### Les requêtes de base

```sql
-- Les 10 dernières ventes
SELECT date_vente, magasin, produit, montant
FROM ventes
ORDER BY date_vente DESC
LIMIT 10;

-- Le total des ventes par magasin en 2026
SELECT magasin, SUM(montant) AS total
FROM ventes
WHERE date_vente >= '2026-01-01'
GROUP BY magasin
ORDER BY total DESC;

-- Relier les ventes aux produits pour calculer la marge
SELECT v.produit, SUM(v.montant - v.quantite * p.prix_achat) AS marge
FROM ventes v
JOIN produits p ON p.nom = v.produit
GROUP BY v.produit
ORDER BY marge;
```

| Mot clé | Rôle |
| --- | --- |
| `SELECT` | Les colonnes à afficher |
| `FROM` | La table |
| `WHERE` | Le filtre sur les lignes |
| `GROUP BY` | Le regroupement |
| `SUM`, `COUNT`, `AVG` | Les calculs |
| `JOIN` | La liaison entre deux tables |
| `ORDER BY` | Le tri |

> [!attention]
> Sur la base de données d'un client, n'utilisez que des requêtes de **lecture** (`SELECT`) et un compte en lecture seule si possible. Une commande comme `DELETE` ou `UPDATE` mal écrite peut détruire des données.

## Power BI : le premier tableau de bord

1. **Obtenir les données** (Excel, CSV, base SQL).
2. **Transformer** dans Power Query.
3. **Modéliser** : relier la table des ventes à la table des produits et à une table des dates.
4. **Créer des mesures** simples :

```
Total ventes = SUM(Ventes[Montant])
Nombre de ventes = COUNTROWS(Ventes)
Panier moyen = DIVIDE([Total ventes], [Nombre de ventes])
```

5. **Créer les visuels** : chiffres clés en haut, évolution au milieu, détail en bas.
6. **Ajouter des filtres** (segments) : magasin, mois, catégorie.

> [!definition] DAX
> Le langage de formules de Power BI (les « mesures » ci-dessus). Les bases ressemblent aux formules d'Excel.

## Un nouvel outil gratuit à tester : GridCraft (ArtCraft)

**ArtCraft** est une suite de logiciels de création **gratuits et open source** (licence MIT ou Apache 2.0), publiée en octobre 2026 par un développeur indépendant. Elle fonctionne sur Windows, Mac et Linux, sans compte, et veut proposer des équivalents gratuits des grands logiciels payants. Pour les tableaux, elle propose **GridCraft**, un tableur gratuit qui veut remplacer Excel, publié en octobre 2026.

| Application ArtCraft | Équivalent payant | Usage dans ce métier |
| --- | --- | --- |
| **GridCraft** | Microsoft Excel | Tableaux, formules et calculs |
| **WordCraft** | Microsoft Word | Rapports et documents |
| **PdfCraft** | Adobe Acrobat Pro | Fichiers PDF |

> [!attention] Une version encore en test
> GridCraft vient d'être publié et la presse spécialisée le juge encore loin d'Excel. Pour l'instant :
> - testez-le sur des **fichiers d'entraînement**, jamais sur les données réelles d'un client ;
> - **vérifiez chaque formule** et chaque total en comparant avec Excel ou Google Sheets ;
> - vérifiez qu'il ouvre et enregistre correctement les fichiers **.xlsx** avant de l'utiliser avec quelqu'un d'autre ;
> - téléchargez-les **uniquement depuis le site officiel getartcraft.com ou la page GitHub du projet**, jamais depuis un site de téléchargement inconnu.

> [!astuce]
> Pour les données des clients, une erreur de formule peut coûter très cher. Restez sur Excel ou Google Sheets pour le travail réel, et suivez les nouvelles versions de GridCraft.

## Les outils payants

| Outil | Ce qu'il apporte |
| --- | --- |
| **Microsoft 365 (Excel)** | La version complète et à jour d'Excel, Power Query, nouvelles fonctions, partage dans OneDrive et Teams |
| **Power BI Pro** | Publier et partager des tableaux de bord en ligne, actualisation planifiée, travail en équipe |
| **Tableau** | Autre outil de visualisation très utilisé, surtout dans les grandes entreprises ; version gratuite publique (Tableau Public) pour s'entraîner |

> [!madagascar]
> Les licences sont payantes et facturées en dollars ou en euros. Souvent, **le client fournit la licence** (Microsoft 365 ou Power BI Pro) et vous invite dans son espace. Pour apprendre, utilisez Power BI Desktop (gratuit), Google Sheets et Tableau Public, et vérifiez les prix et conditions sur les sites officiels.

> [!retenir]
> - Excel : SOMME.SI.ENS, RECHERCHEX, SI et tableaux croisés dynamiques.
> - Power Query : nettoyer une fois, actualiser chaque mois.
> - SQL : SELECT, WHERE, GROUP BY, JOIN, en lecture seule chez le client.
> - Power BI : données, transformation, modèle, mesures, visuels, filtres.
> - Microsoft 365, Power BI Pro et Tableau souvent fournis par le client.

## Exercice pratique : votre boîte à outils

> [!exercice] Exercice pratique · 4 heures
> 1. Avec votre tableau nettoyé du module 2, créez un tableau croisé par magasin et par mois.
> 2. Refaites le nettoyage avec Power Query.
> 3. Entraînez-vous au SQL sur un site d'exercices gratuit ou une base locale : écrivez 10 requêtes (filtres, regroupements, une jointure).
> 4. Créez dans Power BI Desktop (ou Tableau Public) un tableau de bord d'une page avec 3 chiffres clés, une courbe, un classement et 2 filtres.
>
> **À livrer** : votre fichier Excel, vos 10 requêtes et une capture de votre tableau de bord.
