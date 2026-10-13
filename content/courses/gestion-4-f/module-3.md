Ce module vous fait prendre en main les outils de l'aide-comptable : **Excel** pour les contrôles et les tableaux de suivi, les **logiciels comptables** (avec des solutions gratuites pour apprendre), la **numérisation des pièces**, puis les logiciels payants les plus utilisés : **Sage**, **QuickBooks** et **Odoo**.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Utiliser Excel pour suivre, contrôler et préparer les données.
> 2. Comprendre le fonctionnement d'un logiciel comptable.
> 3. Organiser la numérisation et le classement des pièces.
> 4. Importer un relevé bancaire et le rapprocher.
> 5. Connaître les forces de Sage, QuickBooks et Odoo.

## Excel pour l'aide-comptable

| Usage | Exemple de formule (en français) |
| --- | --- |
| Total des factures d'un fournisseur | `=SOMME.SI.ENS(Montant;Fournisseur;"Imprimerie Soa")` |
| Calcul du HT à partir du TTC | `=ARRONDI(TTC/(1+Taux);0)` |
| Retard de paiement en jours | `=AUJOURDHUI()-DateEchéance` |
| Contrôle d'équilibre d'une écriture | `=SI(SOMME(Débit)=SOMME(Crédit);"OK";"ÉCART")` |
| Repérer les doublons de factures | `=NB.SI.ENS(NumFacture;[@NumFacture];Fournisseur;[@Fournisseur])>1` |

> [!astuce]
> Créez un **tableau de contrôle mensuel** : nombre de pièces reçues, saisies, en attente, montant total des achats et des ventes. Il vous permet de vérifier que rien n'est oublié avant d'envoyer le dossier au comptable.

## Comment fonctionne un logiciel comptable

| Élément | Rôle |
| --- | --- |
| **Plan de comptes** | La liste des comptes du dossier |
| **Journaux** | Achats, ventes, banque, caisse, opérations diverses |
| **Tiers** | Fiches clients et fournisseurs |
| **Saisie** | Enregistrement des écritures, souvent avec la pièce jointe |
| **Lettrage** | Rapprochement des factures et des paiements |
| **Rapprochement bancaire** | Import du relevé et association automatique ou manuelle |
| **États** | Grand livre, balance, échéancier, déclarations préparatoires |

> [!definition] Balance
> Un tableau qui liste tous les comptes avec leur total débit, total crédit et solde. Le total des débits doit égaler le total des crédits. C'est un outil de contrôle essentiel avant la clôture du mois.

### Pour apprendre gratuitement

1. **Versions d'essai** des logiciels (souvent 15 à 30 jours).
2. **Odoo** : version communautaire gratuite et libre, à installer, ou essai en ligne.
3. **Excel** : tenir un journal, un grand livre et une balance à la main pour bien comprendre.

## La numérisation et le classement des pièces

### Les règles

1. **Numérisez** chaque pièce lisiblement (scanner ou application de numérisation sur téléphone).
2. **Nommez** les fichiers de façon uniforme : `2026-03-12_Achat_ImprimerieSoa_F2026-118_120000.pdf`.
3. **Classez** par mois et par journal : `2026-03/Achats`, `2026-03/Ventes`, `2026-03/Banque`.
4. **Joignez** la pièce à l'écriture dans le logiciel si c'est possible.
5. **Conservez** les originaux selon les règles du pays et les consignes du comptable.

> [!madagascar]
> Beaucoup de pièces arrivent sous forme de **photos prises au téléphone**, de **reçus manuscrits** ou de **captures de reçus Mobile Money**. Demandez des photos nettes, à plat et complètes, et indiquez au client ce qu'une pièce valable doit contenir (date, montant, nom du fournisseur, objet). Une pièce illisible doit être redemandée, pas devinée.

## Importer et rapprocher un relevé bancaire

1. **Téléchargez** le relevé au format proposé par la banque (CSV, Excel ou format bancaire).
2. **Importez-le** dans le logiciel (ou préparez-le dans Excel au bon format).
3. **Laissez** le logiciel proposer les correspondances.
4. **Vérifiez** chaque proposition : montant, date, tiers.
5. **Saisissez** les opérations manquantes avec leur pièce.
6. **Contrôlez** que le solde du logiciel est égal à celui du relevé.

> [!attention]
> Ne validez jamais les propositions automatiques sans les vérifier : deux factures du même montant chez le même fournisseur peuvent être confondues.

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

## Les logiciels payants

| Logiciel | Points forts | Où on le rencontre |
| --- | --- | --- |
| **Sage** | Très répandu chez les cabinets et les entreprises francophones, solide pour la comptabilité générale et la paie | Cabinets, PME et grandes entreprises, en France, en Afrique et à Madagascar |
| **QuickBooks** | Simple, en ligne, connexion bancaire, très utilisé par les petites entreprises | Amérique du Nord, Royaume-Uni et de nombreuses petites entreprises dans le monde |
| **Odoo** | Logiciel de gestion complet (ventes, achats, stocks, comptabilité) qui relie toutes les opérations | PME qui veulent un outil unique ; version libre gratuite et versions payantes |

> [!madagascar]
> Les licences sont achetées par l'entreprise ou le cabinet, qui vous crée un accès. Vérifiez quels logiciels utilisent les cabinets que vous visez : apprendre celui de vos futurs clients est le meilleur investissement. Les prix et versions changent : consultez les sites officiels.

> [!retenir]
> - Excel pour les contrôles, le suivi et la préparation des données.
> - Un logiciel comptable : plan de comptes, journaux, tiers, saisie, lettrage, rapprochement, états.
> - La balance est équilibrée : total débit = total crédit.
> - Des pièces numérisées, nommées, classées et jointes aux écritures.
> - Sage, QuickBooks et Odoo : apprenez celui de vos clients.

## Exercice pratique : votre dossier dans un logiciel

> [!exercice] Exercice pratique · 3 heures
> 1. Ouvrez un essai d'un logiciel comptable ou installez Odoo (version libre ou essai en ligne).
> 2. Créez un dossier fictif : 5 fournisseurs, 5 clients, les comptes nécessaires.
> 3. Saisissez 20 opérations avec leurs pièces numérisées (créées par vous).
> 4. Importez un relevé bancaire fictif et rapprochez-le.
> 5. Éditez la balance et vérifiez son équilibre.
> 6. Construisez votre tableau de contrôle mensuel dans Excel.
>
> **À livrer** : des captures du logiciel, la balance et votre tableau de contrôle.
