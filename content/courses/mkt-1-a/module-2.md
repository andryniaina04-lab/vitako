Au niveau Avancé, vous travaillez avec les outils que les clients sérieux attendent : un **budget publicitaire** important à piloter, des fonctions avancées de Meta et de Google, **Canva Pro** pour produire des créations en série, et des outils de suivi et de test comme **AdEspresso**. Ce module vous montre comment les utiliser de façon professionnelle.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Gérer les accès et les budgets d'un client de façon professionnelle.
> 2. Mettre en place un suivi fiable : API de conversions, UTM, conversions importées.
> 3. Utiliser les campagnes automatisées de Meta et de Google.
> 4. Produire des créations en série avec Canva Pro.
> 5. Tester et analyser avec AdEspresso et un tableau de bord.

## Les accès et les budgets

### Les règles professionnelles

1. **Le compte publicitaire et le moyen de paiement appartiennent au client.** Vous recevez un accès par le **Business Manager** de Meta (portefeuille business) ou par votre **compte administrateur Google Ads** (MCC).
2. **Vous ne payez jamais la publicité avec votre argent** : la carte du client est enregistrée dans son compte.
3. **Le budget est écrit** : budget mensuel maximal, répartition, règles de dépassement.
4. **Vos honoraires sont séparés** du budget publicitaire.

> [!definition] Compte administrateur Google Ads (MCC)
> Un compte qui permet de gérer plusieurs comptes Google Ads clients depuis un seul accès, sans connaître leurs mots de passe. Le client accepte votre demande d'association et peut la retirer à tout moment.

> [!madagascar]
> Les clients malgaches paient souvent leurs publicités avec une carte internationale (Visa, Mastercard) ou une carte prépayée en devises. Vérifiez avec eux que la carte est acceptée et approvisionnée avant chaque lancement : une campagne arrêtée par un paiement refusé perd sa phase d'apprentissage.

## Un suivi fiable

| Outil | Rôle |
| --- | --- |
| **Pixel Meta** | Mesure les actions sur le site depuis le navigateur |
| **API de conversions Meta** | Envoie les mêmes événements depuis le serveur : plus fiable quand les navigateurs bloquent les traceurs |
| **Balise Google et conversions Google Ads** | Mesurent les achats et prospects issus de Google |
| **Conversions améliorées** | Utilisent des données hachées (e-mail) pour mieux attribuer les conversions, avec le consentement de l'utilisateur |
| **UTM** | Étiquettes dans les liens pour retrouver chaque campagne dans Google Analytics |
| **Conversions hors ligne importées** | Remontent les ventes conclues par téléphone ou en boutique |

### Le modèle d'UTM

```
https://exemple.com/vanille?utm_source=facebook&utm_medium=paid_social&utm_campaign=vanille_fr_2026_06&utm_content=video_recette
```

Règle : toujours en minuscules, sans espaces, avec la même convention pour toutes les campagnes.

> [!attention]
> Le consentement des visiteurs (bannière de cookies, en Europe le RGPD) est obligatoire pour certains traceurs. C'est au client de le mettre en place avec son développeur ; vous devez le lui rappeler par écrit.

## Les campagnes automatisées

| Plateforme | Campagne | Quand l'utiliser | Point de vigilance |
| --- | --- | --- | --- |
| **Meta** | Advantage+ achats (shopping) | Boutique avec catalogue et assez de ventes | Exclure ou limiter les clients existants si l'objectif est d'en trouver de nouveaux |
| **Meta** | Campagne prospects avec formulaire instantané | Services, écoles, immobilier | Ajouter une question de qualification pour éviter les faux contacts |
| **Google** | Performance Max | Boutique avec flux produits, ou objectif de prospects | Bien fournir les signaux d'audience et exclure les marques si besoin |
| **Google** | Recherche avec enchères intelligentes | Demande déjà existante | Surveiller les termes de recherche et ajouter des mots clés négatifs |

> [!definition] Phase d'apprentissage
> La période pendant laquelle l'algorithme découvre qui convertit. Elle demande un nombre suffisant de conversions (sur Meta, on parle souvent d'environ 50 par semaine et par ensemble). Modifier trop souvent une campagne la relance.

### Règles de gestion

1. **Peu de campagnes, des budgets suffisants** plutôt que beaucoup de petites campagnes.
2. **Attendre** avant de juger : 3 à 7 jours selon le volume.
3. **Changer peu à la fois** : budget de 20 % maximum par modification, par exemple.
4. **Documenter** chaque changement dans un journal (date, changement, raison).

## Canva Pro : des créations en série

| Fonction | Usage en publicité |
| --- | --- |
| **Kit de marque** | Couleurs, polices et logos du client toujours disponibles |
| **Redimensionnement magique** | Passer d'un format carré 1:1 à vertical 9:16 et 4:5 en un clic |
| **Suppression d'arrière-plan** | Produits détourés sur fond uni |
| **Modèles d'équipe** | Gabarits validés pour produire vite des variantes |
| **Création en lot (Bulk Create)** | 20 visuels à partir d'un tableau de titres et de prix |

> [!astuce]
> Pour chaque campagne, préparez au moins **3 angles** (bénéfice, preuve, offre) × **2 formats** (image et vidéo courte). Vous obtenez 6 créations à tester, et l'algorithme trouve plus vite ce qui marche.

## AdEspresso et le tableau de bord

> [!definition] AdEspresso
> Un outil payant (de l'éditeur Hootsuite) qui aide à créer et tester de nombreuses variantes de publicités Meta et Google, à automatiser certaines règles et à produire des rapports. Il existe d'autres outils similaires ; vérifiez les prix et les fonctions sur les sites officiels.

### Ce que vous en faites

1. **Tests multivariés** : combiner titres, visuels et textes.
2. **Règles automatiques** : arrêter une publicité dont le CPA dépasse un seuil.
3. **Rapports** envoyés automatiquement au client.

### Le tableau de bord

Avec **Looker Studio** (gratuit), réunissez les chiffres de Meta, Google Ads et Google Analytics dans un tableau unique : dépense, ventes, ROAS, CPA, par semaine et par campagne. Le client voit tout au même endroit.

> [!retenir]
> - Le compte et le moyen de paiement appartiennent au client ; vous avez un accès.
> - Pixel + API de conversions + UTM = un suivi fiable.
> - Les campagnes automatisées demandent peu de structures, des budgets suffisants et de la patience.
> - Canva Pro pour produire des créations en série ; AdEspresso et Looker Studio pour tester et rendre compte.

## Exercice pratique : votre boîte à outils avancée

> [!exercice] Exercice pratique · 2 heures 30
> 1. Rédigez la procédure d'accès (Business Manager et MCC) que vous enverrez à vos clients.
> 2. Créez votre convention UTM et 5 liens de campagnes.
> 3. Concevez la structure d'une campagne Advantage+ et d'une campagne Performance Max pour une boutique de vanille.
> 4. Produisez 6 créations dans Canva (3 angles × 2 formats).
> 5. Construisez un tableau de bord Looker Studio avec des données d'exemple.
>
> **À livrer** : votre procédure, vos liens, vos structures, vos créations et une capture du tableau de bord.
