Les sites qui visent plusieurs pays ou plusieurs langues ont des besoins SEO particuliers, et les clients étrangers attendent des rapports professionnels, souvent en anglais. Ce module vous prépare au SEO international et au travail avec des agences et des entreprises étrangères.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Choisir une structure pour un site international.
> 2. Mettre en place les balises hreflang.
> 3. Adapter les contenus à chaque marché.
> 4. Rédiger un rapport SEO en français ou en anglais.
> 5. Travailler en marque blanche pour une agence.

## La structure d'un site international

| Structure | Exemple | Avantages | Inconvénients |
| --- | --- | --- | --- |
| **Domaine par pays** | exemple.fr, exemple.it | Signal fort pour chaque pays | Coûteux, popularité séparée |
| **Sous-dossiers** | exemple.com/fr/, exemple.com/it/ | Popularité partagée, simple à gérer | Signal pays moins fort |
| **Sous-domaines** | fr.exemple.com | Séparation technique | Popularité moins partagée |

> [!astuce]
> Pour la plupart des PME (hôtels, agences, exportateurs), les **sous-dossiers par langue** sont la solution la plus simple et la plus efficace.

## Les balises hreflang

> [!definition] Hreflang
> Une indication qui dit à Google quelles pages sont des versions d'un même contenu dans d'autres langues ou pour d'autres pays, afin qu'il montre la bonne version à chaque internaute.

```html
<link rel="alternate" hreflang="fr" href="https://exemple.com/fr/circuits/nord-madagascar/" />
<link rel="alternate" hreflang="en" href="https://exemple.com/en/tours/northern-madagascar/" />
<link rel="alternate" hreflang="it" href="https://exemple.com/it/tour/nord-madagascar/" />
<link rel="alternate" hreflang="x-default" href="https://exemple.com/en/tours/northern-madagascar/" />
```

### Les règles

1. **Chaque version** liste toutes les versions, **y compris elle-même**.
2. **Les liens sont réciproques** : si la page française cite l'italienne, l'italienne cite la française.
3. **Les codes** sont corrects (langue, et pays si besoin : `fr`, `fr-CA`, `en-GB`).
4. **x-default** indique la version par défaut.
5. **Les URL** sont les adresses canoniques et renvoient un code 200.

> [!attention]
> Les erreurs de hreflang sont très fréquentes (liens non réciproques, codes faux, pages redirigées). Vérifiez-les avec un crawler et dans Search Console après chaque mise en ligne.

## Adapter les contenus à chaque marché

| Élément | À adapter |
| --- | --- |
| **Mots clés** | Les recherches ne sont pas la traduction littérale (recherchez dans chaque langue) |
| **Exemples et références** | Vols depuis Paris, Milan ou Montréal ; saisons de vacances du pays |
| **Prix et devises** | Euros, dollars canadiens, affichage local |
| **Preuves** | Avis et témoignages de clients du même pays |
| **Contact** | Horaires dans le fuseau du pays, langue parlée au téléphone |

> [!madagascar]
> Ne publiez pas une simple traduction automatique de vos pages françaises en italien ou en allemand : Google et les visiteurs la repèrent. Faites traduire et adapter par des traducteurs natifs (voir la formation Traducteur), puis faites votre propre recherche de mots clés dans chaque langue.

## Le rapport SEO

### Les 6 parties

1. **Résumé** : résultats clés du mois, comparaison avec l'objectif.
2. **Visibilité et trafic** : impressions, clics, visites naturelles hors marque.
3. **Résultats d'entreprise** : demandes, ventes, réservations.
4. **Travaux réalisés** : technique, contenus, liens.
5. **Problèmes et risques** : erreurs, baisses, actions en attente du client.
6. **Plan du mois suivant**.

### Le vocabulaire en anglais

| Français | Anglais |
| --- | --- |
| Référencement naturel | Organic search / SEO |
| Trafic naturel hors marque | Non-branded organic traffic |
| Liens entrants | Backlinks |
| Domaines référents | Referring domains |
| Exploration, indexation | Crawling, indexing |
| Redirection permanente | 301 redirect |
| Données structurées | Structured data / schema markup |

> [!exemple] Résumé en anglais
> "In March, non-branded organic clicks grew 23% month over month, mainly thanks to the updated 'best time to visit Madagascar' guide, now ranking #3 in France. Organic enquiries rose from 14 to 21. We fixed 120 broken internal links and launched the Italian version with hreflang. Next month: publish the 15-day itinerary and start outreach to 10 travel blogs."

## Travailler en marque blanche

1. **Confidentialité** : aucun contact direct avec les clients de l'agence, pas de mention dans votre portfolio sans accord.
2. **Les modèles de l'agence** : rapports, présentations, conventions.
3. **Des délais écrits** et des livrables précis.
4. **Des accès** donnés par l'agence, retirés en fin de mission.

> [!retenir]
> - Des sous-dossiers par langue pour la plupart des PME.
> - Des balises hreflang complètes, réciproques et vérifiées.
> - Des contenus adaptés à chaque marché, pas seulement traduits.
> - Un rapport en 6 parties, en français ou en anglais.
> - En marque blanche : confidentialité et procédures de l'agence.

## Exercice pratique : un site international

> [!exercice] Exercice pratique · 3 heures
> 1. Proposez la structure internationale d'un site touristique malgache en français, anglais et italien.
> 2. Rédigez les balises hreflang de 3 pages dans les 3 langues.
> 3. Faites une recherche de mots clés en anglais et en italien pour 2 pages, et comparez avec la traduction littérale.
> 4. Rédigez un rapport mensuel complet avec des chiffres fictifs, et son résumé en anglais.
>
> **À livrer** : votre structure, vos balises, votre recherche et votre rapport.
