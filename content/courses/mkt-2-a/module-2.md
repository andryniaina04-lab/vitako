Au niveau Avancé, vous travaillez avec les outils payants que les agences et les entreprises utilisent : **Semrush** et **Ahrefs**. Vous les combinez avec un **logiciel d'exploration** (crawler) et avec Google Search Console, qui reste la source de vérité sur les données du site. Ce module vous apprend à en tirer des décisions, pas seulement des chiffres.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Analyser les concurrents et trouver les écarts de mots clés.
> 2. Analyser un profil de liens.
> 3. Suivre les positions de façon utile.
> 4. Explorer un site comme un robot avec un crawler.
> 5. Ajouter et vérifier des données structurées.

## Semrush et Ahrefs

| Fonction | Semrush | Ahrefs | Usage |
| --- | --- | --- | --- |
| **Recherche de mots clés** | Base très large, regroupement de mots clés | Base très large, difficulté et potentiel de trafic | Construire une stratégie de contenu |
| **Analyse de concurrents** | Mots clés et pages des concurrents | Pages et mots clés des concurrents | Trouver ce qui manque au site |
| **Écart de mots clés** | Comparaison de plusieurs domaines | Comparaison de plusieurs domaines | Mots clés des concurrents absents du site |
| **Liens entrants** | Profil de liens, domaines référents | Analyse de liens réputée très complète | Comprendre la popularité |
| **Audit de site** | Exploration et problèmes techniques | Exploration et problèmes techniques | Repérer les erreurs |
| **Suivi de positions** | Projets de suivi quotidien | Suivi de positions | Mesurer les progrès |

*(Les fonctions, les limites et les prix changent : vérifiez sur les sites officiels. Beaucoup d'agences donnent accès à leur compte à leurs freelances.)*

> [!attention]
> Les chiffres de trafic et de volume de ces outils sont des **estimations**, souvent imprécises pour les petits pays et les petites niches. Utilisez-les pour **comparer** et **trouver des idées**, et Search Console pour les **données réelles** du site.

## L'écart de mots clés

1. **Choisissez** 3 concurrents réels (ceux qui apparaissent sur les recherches importantes, pas forcément les concurrents commerciaux).
2. **Lancez** la comparaison des mots clés.
3. **Filtrez** : mots clés où au moins 2 concurrents sont dans le top 10 et le site absent.
4. **Classez** par intention et par pertinence pour l'entreprise.
5. **Associez** chaque groupe de mots clés à une page existante ou à créer.

| Mot clé | Concurrent A | Concurrent B | Site | Action |
| --- | --- | --- | --- | --- |
| circuit nord madagascar 10 jours | 4 | 7 | - | Créer une page circuit |
| meilleure période madagascar | 2 | 5 | 38 | Améliorer l'article existant |
| vol paris nosy be | 6 | - | - | Article d'information + lien vers les circuits |

## Analyser un profil de liens

| Élément | Question |
| --- | --- |
| **Domaines référents** | Combien de sites différents citent le site ? |
| **Qualité et pertinence** | Les sites qui citent sont-ils sérieux et liés au sujet ? |
| **Textes d'ancre** | Les liens utilisent-ils des textes naturels (nom de marque, adresse) ou trop de mots clés exacts ? |
| **Pages les plus citées** | Quelles pages attirent les liens ? |
| **Comparaison** | Quels sites citent les concurrents mais pas le client ? |

> [!astuce]
> La liste des sites qui citent **plusieurs concurrents mais pas votre client** est une excellente liste de partenaires à contacter : annuaires professionnels, offices du tourisme, blogs spécialisés, presse.

> [!attention]
> N'achetez pas de liens et n'utilisez pas de réseaux de sites créés pour vendre des liens : c'est contraire aux règles de Google et peut faire chuter le site. Les liens durables viennent de **contenus utiles**, de **partenariats** et de **relations presse**.

## Suivre les positions de façon utile

1. **Suivez 50 à 200 mots clés** importants, regroupés par thème et par page.
2. **Séparez** les mots clés de marque et hors marque.
3. **Suivez** par pays et par appareil (téléphone et ordinateur).
4. **Regardez** les tendances sur plusieurs semaines, pas les variations d'un jour.
5. **Reliez** aux clics réels de Search Console.

## Le crawler : voir le site comme un robot

> [!definition] Crawler (logiciel d'exploration)
> Un logiciel qui parcourt toutes les pages d'un site en suivant les liens, comme le robot de Google, et liste les problèmes : erreurs, redirections, titres manquants ou en double, pages profondes, balises noindex. Screaming Frog (gratuit jusqu'à 500 adresses) est un des plus utilisés.

| Contrôle | Problème typique |
| --- | --- |
| Codes de réponse | Pages 404, chaînes de redirections |
| Titres et descriptions | Manquants, en double, trop longs |
| Balises noindex et canonical | Pages importantes exclues par erreur |
| Profondeur | Pages importantes à plus de 4 clics de l'accueil |
| Liens internes | Pages orphelines (aucun lien vers elles) |
| Images | Poids, textes alternatifs manquants |

## Les données structurées

> [!definition] Données structurées
> Un code ajouté aux pages (souvent au format JSON-LD) qui décrit précisément leur contenu à Google : produit, prix, avis, entreprise locale, questions fréquentes, événement. Il peut permettre des **résultats enrichis** (étoiles, prix, disponibilité), sans garantie.

```json
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "Gousses de vanille bourbon de Madagascar – 100 g",
  "brand": { "@type": "Brand", "name": "Vanille Soa" },
  "offers": {
    "@type": "Offer",
    "price": "24.90",
    "priceCurrency": "EUR",
    "availability": "https://schema.org/InStock"
  }
}
```

Vérifiez toujours le code avec l'**outil de test des résultats enrichis** de Google, et ne décrivez que ce qui est **réellement visible** sur la page.

> [!madagascar]
> Pour les entreprises locales, les données structurées **LocalBusiness** (adresse, horaires, téléphone) et une fiche d'établissement Google cohérente renforcent la présence sur les recherches de type « restaurant Antsirabe » ou « hôtel Toliara ».

> [!retenir]
> - Semrush et Ahrefs pour comparer, trouver des idées et analyser les liens ; Search Console pour les données réelles.
> - L'écart de mots clés transforme les concurrents en plan de contenu.
> - Des liens obtenus par des contenus et des partenariats, jamais achetés.
> - Un suivi de positions par thème, hors marque, par pays et appareil.
> - Un crawler pour l'audit technique et des données structurées vérifiées.

## Exercice pratique : vos outils avancés

> [!exercice] Exercice pratique · 3 heures
> 1. Avec un essai de Semrush ou d'Ahrefs (ou les versions gratuites limitées), faites l'écart de mots clés d'un site touristique malgache face à 3 concurrents.
> 2. Listez 10 sites qui citent les concurrents mais pas ce site.
> 3. Explorez le site avec Screaming Frog (500 adresses) et listez les 10 problèmes principaux.
> 4. Rédigez les données structurées d'une page et vérifiez-les avec l'outil de Google.
>
> **À livrer** : votre tableau d'écart, votre liste de partenaires, votre rapport d'exploration et votre code vérifié.
