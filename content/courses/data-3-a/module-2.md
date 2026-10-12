Au niveau Avancé, vous travaillez avec les outils que les organisations structurées utilisent : **Excel de Microsoft 365** dans ses fonctions avancées, **Power BI Pro** pour publier et partager, et **Tableau**. Ce module vous apprend à construire des modèles solides et des tableaux de bord qui s'actualisent seuls, en toute sécurité.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Construire un modèle de données en étoile.
> 2. Écrire des mesures DAX avancées, dont l'intelligence temporelle.
> 3. Publier, partager et actualiser dans le service Power BI.
> 4. Restreindre l'accès aux données selon l'utilisateur.
> 5. Utiliser les fonctions avancées d'Excel 365 et comprendre la place de Tableau.

## Le modèle en étoile

> [!definition] Modèle en étoile
> Une organisation des données avec une **table de faits** au centre (les événements : ventes, appels, paiements) reliée à des **tables de dimensions** autour (les descriptions : dates, produits, magasins, clients). C'est la structure recommandée pour Power BI.

| Table | Type | Colonnes |
| --- | --- | --- |
| **Ventes** | Faits | Date, IdProduit, IdMagasin, Quantité, Montant net, Coût |
| **Calendrier** | Dimension | Date, Année, Mois, Trimestre, Jour de la semaine, Jour férié |
| **Produits** | Dimension | IdProduit, Nom, Catégorie, Fournisseur |
| **Magasins** | Dimension | IdMagasin, Nom, Ville, Région |

### Les règles

1. **Relations** d'une dimension (côté 1) vers les faits (côté plusieurs).
2. **Une table calendrier** complète, marquée comme table de dates.
3. **Pas de colonnes inutiles** : elles alourdissent le modèle.
4. **Les calculs dans des mesures**, pas dans des colonnes, quand c'est possible.

## Le DAX avancé

### CALCULATE : la fonction clé

```
Ventes Antananarivo =
CALCULATE ( [Ventes nettes], Magasins[Ville] = "Antananarivo" )

Part des ventes =
DIVIDE ( [Ventes nettes], CALCULATE ( [Ventes nettes], ALL ( Magasins ) ) )
```

> [!definition] Contexte de filtre
> L'ensemble des filtres actifs au moment du calcul (un mois choisi, un magasin, une catégorie). CALCULATE permet de modifier ce contexte : ajouter, remplacer ou retirer des filtres.

### L'intelligence temporelle

```
Ventes année précédente =
CALCULATE ( [Ventes nettes], SAMEPERIODLASTYEAR ( Calendrier[Date] ) )

Évolution sur un an =
DIVIDE ( [Ventes nettes] - [Ventes année précédente], [Ventes année précédente] )

Ventes cumulées de l'année =
TOTALYTD ( [Ventes nettes], Calendrier[Date] )
```

> [!attention]
> Ces fonctions ne marchent correctement qu'avec une **table calendrier continue** (toutes les dates, sans trou) reliée aux faits. Sans elle, les comparaisons avec l'année précédente donnent des résultats faux sans message d'erreur.

## Le service Power BI (Power BI Pro)

| Fonction | Utilité |
| --- | --- |
| **Espaces de travail** | Organiser les rapports par client ou par équipe |
| **Publication** | Envoyer le rapport de Power BI Desktop vers le service en ligne |
| **Partage et applications** | Donner l'accès aux bonnes personnes |
| **Actualisation planifiée** | Mettre à jour les données automatiquement (plusieurs fois par jour selon la licence) |
| **Passerelle** | Relier le service en ligne à des données sur un ordinateur ou un serveur local |
| **Abonnements et alertes** | Envoyer le rapport par e-mail, alerter quand un chiffre dépasse un seuil |

> [!madagascar]
> Power BI Pro est une licence **par utilisateur**, facturée en dollars ou en euros. En général, chaque personne qui publie **et** chaque personne qui consulte un rapport partagé a besoin d'une licence (sauf dans certaines offres de capacité). Le client achète les licences, et vous travaillez dans son espace. Vérifiez les conditions et les prix sur le site officiel de Microsoft.

## Restreindre l'accès aux données

> [!definition] Sécurité au niveau des lignes (RLS)
> Une règle qui filtre automatiquement les données selon la personne connectée : le responsable du magasin de Toamasina ne voit que les ventes de Toamasina, la direction voit tout.

```
// Rôle « Responsable magasin », filtre sur la table Magasins
[EmailResponsable] = USERPRINCIPALNAME()
```

1. Créez les **rôles** dans Power BI Desktop.
2. **Testez** chaque rôle (« Afficher en tant que »).
3. **Attribuez** les personnes aux rôles dans le service.

## Excel de Microsoft 365 avancé

| Fonction | Usage |
| --- | --- |
| `FILTRE`, `TRIER`, `UNIQUE` | Listes dynamiques qui se mettent à jour seules |
| `LET` | Nommer des calculs intermédiaires dans une formule longue |
| **Power Pivot** | Modèle de données et mesures DAX dans Excel |
| **Power Query** | Combiner automatiquement tous les fichiers d'un dossier |
| **Tableaux croisés reliés au modèle** | Analyse sur plusieurs tables sans RECHERCHEX |

> [!astuce]
> « Obtenir des données → À partir d'un dossier » dans Power Query combine automatiquement tous les fichiers mensuels d'un même format. Le mois suivant, il suffit d'ajouter le nouveau fichier dans le dossier et d'actualiser.

## Tableau

> [!definition] Tableau
> Un logiciel de visualisation très utilisé, réputé pour la qualité et la souplesse de ses graphiques. Tableau Public est gratuit (les travaux sont publics) ; les versions professionnelles sont payantes.

| Situation | Outil souvent choisi |
| --- | --- |
| Entreprise qui utilise Microsoft 365 | Power BI |
| Grandes entreprises et certaines organisations internationales | Tableau ou Power BI selon leurs choix |
| Portfolio public, visualisations soignées | Tableau Public |

> [!retenir]
> - Un modèle en étoile avec une table calendrier.
> - CALCULATE modifie le contexte de filtre ; l'intelligence temporelle compare les périodes.
> - Le service Power BI publie, partage, actualise et alerte.
> - La sécurité au niveau des lignes protège les données.
> - Excel 365 avancé et Tableau selon le contexte du client.

## Exercice pratique : un système de BI

> [!exercice] Exercice pratique · 5 heures
> 1. Construisez dans Power BI Desktop un modèle en étoile (ventes, calendrier, produits, magasins) avec des données fictives sur 2 ans.
> 2. Créez 8 mesures : ventes nettes, marge, taux de marge, ventes de l'année précédente, évolution, cumul annuel, part des ventes, panier moyen.
> 3. Créez un rapport de 2 pages : vue direction et vue magasin.
> 4. Créez un rôle de sécurité par magasin et testez-le.
> 5. Si vous avez accès à une licence ou un essai, publiez et programmez une actualisation ; sinon, rédigez la procédure.
>
> **À livrer** : votre fichier, des captures et votre procédure.
