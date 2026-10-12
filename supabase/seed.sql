-- Fichier généré par tools/build.mjs. Ne pas modifier à la main : modifier content/ puis relancer.
-- À exécuter dans Supabase > SQL Editor après schema.sql, et à chaque mise à jour du contenu.
-- Il remplace le contenu des formations sans toucher aux comptes, paiements ni attestations.
begin;
insert into public.courses (id, job_key, job_name, level, title, hours, published) values
  ('design-0-f', 'design-0', 'Graphiste', 'f', 'Graphiste – Fondamentaux', 14, true),
  ('design-0-a', 'design-0', 'Graphiste', 'a', 'Graphiste – Avancé', 14, false),
  ('design-1-f', 'design-1', 'Designer UI/UX', 'f', 'Designer UI/UX – Fondamentaux', 11, false),
  ('design-1-a', 'design-1', 'Designer UI/UX', 'a', 'Designer UI/UX – Avancé', 15, false),
  ('design-2-f', 'design-2', 'Illustrateur numérique', 'f', 'Illustrateur numérique – Fondamentaux', 12, false),
  ('design-2-a', 'design-2', 'Illustrateur numérique', 'a', 'Illustrateur numérique – Avancé', 16, false),
  ('design-3-f', 'design-3', 'Retoucheur photo', 'f', 'Retoucheur photo – Fondamentaux', 13, false),
  ('design-3-a', 'design-3', 'Retoucheur photo', 'a', 'Retoucheur photo – Avancé', 17, false),
  ('design-4-f', 'design-4', 'Créateur de miniatures YouTube', 'f', 'Créateur de miniatures YouTube – Fondamentaux', 14, false),
  ('design-4-a', 'design-4', 'Créateur de miniatures YouTube', 'a', 'Créateur de miniatures YouTube – Avancé', 18, false),
  ('media-0-f', 'media-0', 'Monteur vidéo', 'f', 'Monteur vidéo – Fondamentaux', 11, false),
  ('media-0-a', 'media-0', 'Monteur vidéo', 'a', 'Monteur vidéo – Avancé', 16, false),
  ('media-1-f', 'media-1', 'Motion designer', 'f', 'Motion designer – Fondamentaux', 12, false),
  ('media-1-a', 'media-1', 'Motion designer', 'a', 'Motion designer – Avancé', 17, false),
  ('media-2-f', 'media-2', 'Monteur audio et podcast', 'f', 'Monteur audio et podcast – Fondamentaux', 13, false),
  ('media-2-a', 'media-2', 'Monteur audio et podcast', 'a', 'Monteur audio et podcast – Avancé', 18, false),
  ('media-3-f', 'media-3', 'Comédien voix off', 'f', 'Comédien voix off – Fondamentaux', 14, false),
  ('media-3-a', 'media-3', 'Comédien voix off', 'a', 'Comédien voix off – Avancé', 14, false),
  ('media-4-f', 'media-4', 'Sous-titreur', 'f', 'Sous-titreur – Fondamentaux', 10, false),
  ('media-4-a', 'media-4', 'Sous-titreur', 'a', 'Sous-titreur – Avancé', 15, false),
  ('dev-0-f', 'dev-0', 'Développeur front-end', 'f', 'Développeur front-end – Fondamentaux', 12, false),
  ('dev-0-a', 'dev-0', 'Développeur front-end', 'a', 'Développeur front-end – Avancé', 18, false),
  ('dev-1-f', 'dev-1', 'Développeur back-end', 'f', 'Développeur back-end – Fondamentaux', 13, false),
  ('dev-1-a', 'dev-1', 'Développeur back-end', 'a', 'Développeur back-end – Avancé', 14, false),
  ('dev-2-f', 'dev-2', 'Intégrateur web', 'f', 'Intégrateur web – Fondamentaux', 14, false),
  ('dev-2-a', 'dev-2', 'Intégrateur web', 'a', 'Intégrateur web – Avancé', 15, false),
  ('dev-3-f', 'dev-3', 'Développeur WordPress et Shopify', 'f', 'Développeur WordPress et Shopify – Fondamentaux', 10, false),
  ('dev-3-a', 'dev-3', 'Développeur WordPress et Shopify', 'a', 'Développeur WordPress et Shopify – Avancé', 16, false),
  ('dev-4-f', 'dev-4', 'Développeur no-code', 'f', 'Développeur no-code – Fondamentaux', 11, false),
  ('dev-4-a', 'dev-4', 'Développeur no-code', 'a', 'Développeur no-code – Avancé', 17, false),
  ('tech-0-f', 'tech-0', 'Développeur mobile', 'f', 'Développeur mobile – Fondamentaux', 13, false),
  ('tech-0-a', 'tech-0', 'Développeur mobile', 'a', 'Développeur mobile – Avancé', 15, false),
  ('tech-1-f', 'tech-1', 'Testeur logiciel (QA)', 'f', 'Testeur logiciel (QA) – Fondamentaux', 14, false),
  ('tech-1-a', 'tech-1', 'Testeur logiciel (QA)', 'a', 'Testeur logiciel (QA) – Avancé', 16, false),
  ('tech-2-f', 'tech-2', 'Technicien support à distance', 'f', 'Technicien support à distance – Fondamentaux', 10, false),
  ('tech-2-a', 'tech-2', 'Technicien support à distance', 'a', 'Technicien support à distance – Avancé', 17, false),
  ('tech-3-f', 'tech-3', 'Administrateur systèmes et DevOps', 'f', 'Administrateur systèmes et DevOps – Fondamentaux', 11, false),
  ('tech-3-a', 'tech-3', 'Administrateur systèmes et DevOps', 'a', 'Administrateur systèmes et DevOps – Avancé', 18, false),
  ('tech-4-f', 'tech-4', 'Analyste en cybersécurité', 'f', 'Analyste en cybersécurité – Fondamentaux', 12, false),
  ('tech-4-a', 'tech-4', 'Analyste en cybersécurité', 'a', 'Analyste en cybersécurité – Avancé', 14, false),
  ('mkt-0-f', 'mkt-0', 'Community manager', 'f', 'Community manager – Fondamentaux', 14, false),
  ('mkt-0-a', 'mkt-0', 'Community manager', 'a', 'Community manager – Avancé', 17, false),
  ('mkt-1-f', 'mkt-1', 'Gestionnaire de publicités en ligne', 'f', 'Gestionnaire de publicités en ligne – Fondamentaux', 10, false),
  ('mkt-1-a', 'mkt-1', 'Gestionnaire de publicités en ligne', 'a', 'Gestionnaire de publicités en ligne – Avancé', 18, false),
  ('mkt-2-f', 'mkt-2', 'Spécialiste SEO', 'f', 'Spécialiste SEO – Fondamentaux', 11, false),
  ('mkt-2-a', 'mkt-2', 'Spécialiste SEO', 'a', 'Spécialiste SEO – Avancé', 14, false),
  ('mkt-3-f', 'mkt-3', 'Email marketeur', 'f', 'Email marketeur – Fondamentaux', 12, false),
  ('mkt-3-a', 'mkt-3', 'Email marketeur', 'a', 'Email marketeur – Avancé', 15, false),
  ('mkt-4-f', 'mkt-4', 'Créateur de contenu UGC', 'f', 'Créateur de contenu UGC – Fondamentaux', 13, false),
  ('mkt-4-a', 'mkt-4', 'Créateur de contenu UGC', 'a', 'Créateur de contenu UGC – Avancé', 16, false),
  ('lang-0-f', 'lang-0', 'Rédacteur web et copywriter', 'f', 'Rédacteur web et copywriter – Fondamentaux', 10, false),
  ('lang-0-a', 'lang-0', 'Rédacteur web et copywriter', 'a', 'Rédacteur web et copywriter – Avancé', 14, false),
  ('lang-1-f', 'lang-1', 'Traducteur', 'f', 'Traducteur – Fondamentaux', 11, false),
  ('lang-1-a', 'lang-1', 'Traducteur', 'a', 'Traducteur – Avancé', 15, false),
  ('lang-2-f', 'lang-2', 'Transcripteur', 'f', 'Transcripteur – Fondamentaux', 12, false),
  ('lang-2-a', 'lang-2', 'Transcripteur', 'a', 'Transcripteur – Avancé', 16, false),
  ('lang-3-f', 'lang-3', 'Correcteur et relecteur', 'f', 'Correcteur et relecteur – Fondamentaux', 13, false),
  ('lang-3-a', 'lang-3', 'Correcteur et relecteur', 'a', 'Correcteur et relecteur – Avancé', 17, false),
  ('lang-4-f', 'lang-4', 'Rédacteur de fiches produits', 'f', 'Rédacteur de fiches produits – Fondamentaux', 14, false),
  ('lang-4-a', 'lang-4', 'Rédacteur de fiches produits', 'a', 'Rédacteur de fiches produits – Avancé', 18, false),
  ('data-0-f', 'data-0', 'Annotateur de données IA', 'f', 'Annotateur de données IA – Fondamentaux', 11, false),
  ('data-0-a', 'data-0', 'Annotateur de données IA', 'a', 'Annotateur de données IA – Avancé', 16, false),
  ('data-1-f', 'data-1', 'Évaluateur de réponses d’IA', 'f', 'Évaluateur de réponses d’IA – Fondamentaux', 12, false),
  ('data-1-a', 'data-1', 'Évaluateur de réponses d’IA', 'a', 'Évaluateur de réponses d’IA – Avancé', 17, false),
  ('data-2-f', 'data-2', 'Opérateur de saisie de données', 'f', 'Opérateur de saisie de données – Fondamentaux', 13, false),
  ('data-2-a', 'data-2', 'Opérateur de saisie de données', 'a', 'Opérateur de saisie de données – Avancé', 18, false),
  ('data-3-f', 'data-3', 'Analyste de données', 'f', 'Analyste de données – Fondamentaux', 14, false),
  ('data-3-a', 'data-3', 'Analyste de données', 'a', 'Analyste de données – Avancé', 14, false),
  ('data-4-f', 'data-4', 'Spécialiste automatisation et IA', 'f', 'Spécialiste automatisation et IA – Fondamentaux', 10, false),
  ('data-4-a', 'data-4', 'Spécialiste automatisation et IA', 'a', 'Spécialiste automatisation et IA – Avancé', 15, false),
  ('client-0-f', 'client-0', 'Téléconseiller à distance', 'f', 'Téléconseiller à distance – Fondamentaux', 12, false),
  ('client-0-a', 'client-0', 'Téléconseiller à distance', 'a', 'Téléconseiller à distance – Avancé', 18, false),
  ('client-1-f', 'client-1', 'Agent support chat et e-mail', 'f', 'Agent support chat et e-mail – Fondamentaux', 13, false),
  ('client-1-a', 'client-1', 'Agent support chat et e-mail', 'a', 'Agent support chat et e-mail – Avancé', 14, false),
  ('client-2-f', 'client-2', 'Prospecteur et prise de rendez-vous', 'f', 'Prospecteur et prise de rendez-vous – Fondamentaux', 14, false),
  ('client-2-a', 'client-2', 'Prospecteur et prise de rendez-vous', 'a', 'Prospecteur et prise de rendez-vous – Avancé', 15, false),
  ('client-3-f', 'client-3', 'Gestionnaire de réservations', 'f', 'Gestionnaire de réservations – Fondamentaux', 10, false),
  ('client-3-a', 'client-3', 'Gestionnaire de réservations', 'a', 'Gestionnaire de réservations – Avancé', 16, false),
  ('client-4-f', 'client-4', 'Modérateur de contenu', 'f', 'Modérateur de contenu – Fondamentaux', 11, false),
  ('client-4-a', 'client-4', 'Modérateur de contenu', 'a', 'Modérateur de contenu – Avancé', 17, false),
  ('gestion-0-f', 'gestion-0', 'Assistant virtuel', 'f', 'Assistant virtuel – Fondamentaux', 13, false),
  ('gestion-0-a', 'gestion-0', 'Assistant virtuel', 'a', 'Assistant virtuel – Avancé', 15, false),
  ('gestion-1-f', 'gestion-1', 'Gestionnaire de boutique en ligne', 'f', 'Gestionnaire de boutique en ligne – Fondamentaux', 14, false),
  ('gestion-1-a', 'gestion-1', 'Gestionnaire de boutique en ligne', 'a', 'Gestionnaire de boutique en ligne – Avancé', 16, false),
  ('gestion-2-f', 'gestion-2', 'Gestionnaire de catalogue produits', 'f', 'Gestionnaire de catalogue produits – Fondamentaux', 10, false),
  ('gestion-2-a', 'gestion-2', 'Gestionnaire de catalogue produits', 'a', 'Gestionnaire de catalogue produits – Avancé', 17, false),
  ('gestion-3-f', 'gestion-3', 'Agent SAV e-commerce', 'f', 'Agent SAV e-commerce – Fondamentaux', 11, false),
  ('gestion-3-a', 'gestion-3', 'Agent SAV e-commerce', 'a', 'Agent SAV e-commerce – Avancé', 18, false),
  ('gestion-4-f', 'gestion-4', 'Aide-comptable en ligne', 'f', 'Aide-comptable en ligne – Fondamentaux', 12, false),
  ('gestion-4-a', 'gestion-4', 'Aide-comptable en ligne', 'a', 'Aide-comptable en ligne – Avancé', 14, false),
  ('edu-0-f', 'edu-0', 'Professeur de langue en ligne', 'f', 'Professeur de langue en ligne – Fondamentaux', 14, false),
  ('edu-0-a', 'edu-0', 'Professeur de langue en ligne', 'a', 'Professeur de langue en ligne – Avancé', 17, false),
  ('edu-1-f', 'edu-1', 'Formateur en ligne', 'f', 'Formateur en ligne – Fondamentaux', 10, false),
  ('edu-1-a', 'edu-1', 'Formateur en ligne', 'a', 'Formateur en ligne – Avancé', 18, false),
  ('edu-2-f', 'edu-2', 'Créateur de cours en ligne', 'f', 'Créateur de cours en ligne – Fondamentaux', 11, false),
  ('edu-2-a', 'edu-2', 'Créateur de cours en ligne', 'a', 'Créateur de cours en ligne – Avancé', 14, false),
  ('edu-3-f', 'edu-3', 'Chef de projet digital', 'f', 'Chef de projet digital – Fondamentaux', 12, false),
  ('edu-3-a', 'edu-3', 'Chef de projet digital', 'a', 'Chef de projet digital – Avancé', 15, false),
  ('edu-4-f', 'edu-4', 'Assistant administratif et RH', 'f', 'Assistant administratif et RH – Fondamentaux', 13, false),
  ('edu-4-a', 'edu-4', 'Assistant administratif et RH', 'a', 'Assistant administratif et RH – Avancé', 16, false)
on conflict (id) do update set job_key = excluded.job_key, job_name = excluded.job_name, level = excluded.level,
  title = excluded.title, hours = excluded.hours, published = excluded.published;

-- design-0-f
delete from public.exam_questions where course_id = 'design-0-f';
delete from public.module_questions where course_id = 'design-0-f';
delete from public.lessons where course_id = 'design-0-f' and module_index >= 5;
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('design-0-f', 0, 'Le métier de graphiste freelance depuis Madagascar', 'Ce que fait un graphiste, les 6 commandes fréquentes, vos clients et l''organisation malgré coupures et décalage horaire.', 'Un graphiste freelance vend des images qui aident ses clients à vendre. Depuis Madagascar, avec un ordinateur et une connexion Internet, vous pouvez servir des clients à Antananarivo comme à Paris ou à Montréal. Ce premier module vous montre le métier tel qu''il est vraiment : ce qu''on vous demandera, qui vous paiera et comment vous organiser malgré les contraintes locales.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Expliquer en une phrase ce que fait un graphiste freelance.
> 2. Citer les 6 commandes les plus fréquentes pour un débutant.
> 3. Repérer vos premiers clients possibles, à Madagascar et à l''étranger.
> 4. Organiser votre travail malgré les coupures, la connexion et le décalage horaire.
> 5. Connaître les démarches de base pour travailler en règle.

## Le métier de graphiste en une phrase

Un graphiste **traduit un message en image**. Le client a quelque chose à dire (« nous ouvrons un restaurant », « nos prix baissent ce week-end », « faites-nous confiance ») ; le graphiste choisit les mots, les couleurs, la mise en page et les images qui feront passer ce message en quelques secondes.

Ce n''est donc pas « dessiner joli ». Chaque choix doit servir un objectif du client :

1. **Attirer l''attention** : que la personne s''arrête sur la publication au lieu de faire défiler.
2. **Faire comprendre** : qu''elle saisisse le message en moins de 3 secondes.
3. **Faire agir** : qu''elle appelle, commande, vienne ou partage.

> [!definition] Freelance
> Un freelance (ou travailleur indépendant) travaille pour plusieurs clients, mission par mission, sans être salarié. Il fixe ses prix, choisit ses horaires et gère lui-même ses clients, ses paiements et ses impôts.

## Les 6 commandes les plus fréquentes pour un débutant

| N° | Commande | Exemple de client | Délai habituel |
| --- | --- | --- | --- |
| 1 | Visuels pour réseaux sociaux (publications, stories, bannières) | Boutique de vêtements à Analakely | 1 à 2 jours |
| 2 | Logo et petite identité visuelle | Nouveau restaurant, coopérative agricole | 5 à 10 jours |
| 3 | Affiche ou flyer d''événement | Concert, église, association | 1 à 3 jours |
| 4 | Carte de visite, menu, dépliant | Hôtel, gargote, cabinet | 1 à 3 jours |
| 5 | Miniature YouTube, couverture d''e-book | Créateur de contenu en France | 1 jour |
| 6 | Mise en page d''une présentation ou d''un catalogue | ONG, PME | 3 à 7 jours |

Commencez par les commandes 1, 3 et 5 : elles sont rapides, très demandées et permettent de constituer vite un portfolio.

## Qui sont vos clients ?

### Clients à Madagascar

1. **Commerces** d''Antananarivo et des villes régionales (Toamasina, Mahajanga, Fianarantsoa, Antsirabe…) qui vendent sur Facebook.
2. **Tourisme** : hôtels, guides et agences de voyage (Nosy Be, Sainte-Marie, Morondava, Isalo).
3. **Associations, ONG, églises** : affiches, rapports, visuels de campagne.
4. **Organisateurs d''événements** : concerts, mariages, conférences.
5. **Entrepreneurs** qui lancent une marque (cosmétiques, épices, artisanat, vanille).

### Clients à l''étranger

1. **Petites entreprises francophones** (France, Belgique, Suisse, Canada, La Réunion, Maurice) qui cherchent un graphiste fiable à prix raisonnable.
2. **Créateurs de contenu** (YouTube, Instagram, podcasts) qui ont besoin de visuels chaque semaine.
3. **Agences** qui sous-traitent une partie de leur production.

> [!madagascar] Votre avantage
> Vous travaillez en français, avec un faible décalage horaire avec l''Europe. Pour un client européen, c''est plus simple qu''un prestataire en Asie : il vous écrit le matin, vous lui répondez dans sa journée.

## Travailler à distance depuis Madagascar

Trois réalités à préparer dès le début.

### 1. Les coupures d''électricité

1. Enregistrez votre travail toutes les 10 minutes (**Ctrl + S**) et gardez une copie de vos fichiers sur votre ordinateur, pas seulement en ligne.
2. Ayez une batterie externe pour votre téléphone : il sert de modem en cas de coupure de la box.
3. Annoncez toujours un délai avec une marge : si un travail prend 2 jours, promettez 3 jours.

### 2. La connexion Internet

1. Préparez vos fichiers hors ligne, puis envoyez-les en une seule fois.
2. Compressez les envois lourds (dossier .zip) et envoyez des aperçus en JPG plutôt que des fichiers de travail.
3. Gardez un forfait de données mobiles de secours pour les livraisons urgentes.

### 3. Le décalage horaire

Madagascar est à UTC+3, toute l''année. Par rapport à Paris :

| Période | Différence | Quand il est 9 h à Paris |
| --- | --- | --- |
| Heure d''hiver en France (fin octobre à fin mars) | Madagascar a 2 h d''avance | 11 h à Antananarivo |
| Heure d''été en France (fin mars à fin octobre) | Madagascar a 1 h d''avance | 10 h à Antananarivo |

Indiquez clairement vos horaires de réponse, par exemple : « Je réponds du lundi au samedi, de 8 h à 18 h (heure de Madagascar) ».

> [!astuce]
> Créez une réponse automatique sur WhatsApp Business : « Merci pour votre message ! Je vous réponds dans les 2 heures, de 8 h à 18 h (heure de Madagascar). » Vos clients savent à quoi s''attendre.

## Travailler en règle

Pour facturer officiellement des clients à Madagascar, un graphiste indépendant demande en général :

1. Un **NIF** (numéro d''identification fiscale).
2. Une **carte statistique** (STAT).

Les démarches et les impôts dépendent de votre situation : renseignez-vous auprès du centre fiscal de votre ville avant de facturer régulièrement. Gardez dès maintenant une trace écrite de chaque paiement reçu.

> [!attention] Erreurs fréquentes des débutants
> - Accepter un travail sans délai ni prix écrits.
> - Promettre « livré ce soir » sans tenir compte des coupures.
> - Travailler gratuitement « pour se faire connaître » pendant des mois.
> - Copier un visuel trouvé sur Internet : c''est interdit et ça peut faire perdre un client.

> [!retenir]
> - Un graphiste traduit un message en image qui fait **agir**.
> - Les premières commandes : réseaux sociaux, affiches, miniatures.
> - Vos clients sont à Madagascar **et** dans le monde francophone.
> - Marge sur les délais, sauvegardes régulières et horaires clairs : c''est ce qui rend un freelance fiable.

## Exercice pratique : votre liste de 10 clients

> [!exercice] Exercice pratique · 30 minutes
> 1. Ouvrez un document ou une feuille de papier et faites un tableau à 3 colonnes : **Client**, **Ce qu''il vend**, **Visuel qui l''aiderait**.
> 2. Notez 5 clients possibles autour de vous : commerces du quartier, connaissances qui vendent en ligne, association de votre église ou de votre école.
> 3. Ajoutez 5 clients possibles à l''étranger : cherchez sur Facebook ou Instagram de petites marques francophones dont les visuels pourraient être améliorés.
> 4. Pour chacun, écrivez en une ligne le visuel qui l''aiderait le plus.
>
> **Exemple de ligne** : « Épicerie Tsara (Ambohijatovo) · produits alimentaires · une affiche des prix de la semaine pour Facebook. »
>
> **À livrer** : votre tableau de 10 clients. Gardez-le : il servira au module 5 pour votre première prospection.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 0, 0, 'Quel est le rôle principal d''un graphiste ?', '["Dessiner ce qu''il trouve beau","Gérer la page Facebook du client","Imprimer des affiches","Traduire le message du client en image utile"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 0, 1, 'Quel est un vrai avantage d''un graphiste malgache pour des clients en France ?', '["Il travaille en français avec un faible décalage horaire","Il n''a pas besoin d''Internet","Il travaille gratuitement","Il n''a pas de délais"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 0, 2, 'Que faire pour limiter l''effet des coupures d''électricité ?', '["Travailler en ligne sans sauvegarde","Enregistrer en local, avoir une batterie et prévoir une marge sur les délais","Ne jamais annoncer de délai","Refuser les clients étrangers"]'::jsonb, 1);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('design-0-f', 1, 'Les fondamentaux du design', 'Hiérarchie, composition, couleur (règle 60-30-10), typographie et liste de contrôle en 8 points.', 'Pourquoi certains visuels paraissent professionnels et d''autres non, alors qu''ils parlent de la même chose ? La différence vient presque toujours de quatre règles : la hiérarchie, la composition, la couleur et la typographie. Ce module vous les explique une par une, avec une méthode à appliquer sur chaque visuel.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Décider dans quel ordre le lecteur doit lire votre visuel.
> 2. Aligner et espacer les éléments pour un rendu propre.
> 3. Choisir une palette de 3 couleurs lisibles.
> 4. Choisir et associer 2 polices.
> 5. Vérifier un visuel avec une liste de contrôle en 8 points.

## La hiérarchie : qu''est-ce qu''on lit en premier ?

Sur Facebook, on regarde un visuel **moins de 3 secondes**. Le lecteur ne lit pas tout : il lit ce qui est le plus visible, puis décide de continuer ou non. Votre travail est de décider cet ordre à l''avance.

### La méthode en 3 niveaux

1. **Niveau 1, le message principal** : une seule information, la plus grande ou la plus contrastée.
2. **Niveau 2, les détails utiles** : date, lieu, prix, offre.
3. **Niveau 3, les informations pratiques** : téléphone, adresse, logo, réseaux sociaux.

> [!exemple] Affiche de concert
> 1. Niveau 1 : le nom de l''artiste, en très grand.
> 2. Niveau 2 : « Samedi 14 décembre · 19 h · CCI Ivato ».
> 3. Niveau 3 : prix des billets, numéro pour réserver, logos des partenaires.

### Les 4 outils pour créer la hiérarchie

| Outil | Comment l''utiliser |
| --- | --- |
| Taille | Le titre est au moins 2 à 3 fois plus grand que le texte |
| Graisse | Gras pour le niveau 1, normal pour le reste |
| Couleur | La couleur d''accent seulement sur le message principal ou le bouton d''action |
| Position | Le haut et le centre sont vus en premier |

## La composition : aligner, espacer, regrouper

### Les 4 règles de composition

1. **Aligner** : chaque élément est aligné sur une ligne invisible (à gauche, au centre ou à droite). Un élément placé « à peu près » paraît être une erreur.
2. **Garder des marges** : au moins 5 % de la largeur sur chaque bord. Sur un visuel de 1080 px, laissez au moins 54 px vides tout autour.
3. **Laisser respirer** : de l''espace vide autour du message principal. Le vide n''est pas du gaspillage, il guide l''œil.
4. **Regrouper** : ce qui va ensemble est proche (date et lieu), ce qui est différent est éloigné (le téléphone loin du titre).

> [!astuce]
> Dans Canva et Figma, activez les **règles et repères** et utilisez les lignes roses ou rouges qui apparaissent quand vous déplacez un élément : elles indiquent qu''il est aligné avec un autre.

## La couleur : 3 couleurs suffisent

### Construire une palette

1. **Une couleur principale** : celle de la marque (environ 60 % de la couleur du visuel).
2. **Une couleur neutre** : blanc, beige, gris ou noir pour le fond et le texte (environ 30 %).
3. **Une couleur d''accent** : pour le bouton, le prix ou l''offre (environ 10 %).

C''est la règle **60-30-10** : elle donne presque toujours un résultat équilibré.

### Le contraste avant tout

Le texte doit se lire facilement, même sur un petit téléphone au soleil.

| Combinaison | Lisibilité |
| --- | --- |
| Texte bleu foncé sur fond blanc | Excellente |
| Texte blanc sur fond vert foncé | Excellente |
| Texte gris clair sur fond blanc | Mauvaise |
| Texte jaune sur fond blanc | Très mauvaise |
| Texte rouge sur fond vert | Très mauvaise (et pénible pour les daltoniens) |

### Ce que les couleurs évoquent

| Couleur | Évoque souvent | Exemples d''usage |
| --- | --- | --- |
| Vert | Nature, agriculture, santé | Épicerie bio, coopérative |
| Bleu | Confiance, sérieux | Banque, clinique, assurance |
| Rouge | Urgence, promotion, passion | Soldes, restauration rapide |
| Orange | Énergie, convivialité | Événements, jeunesse |
| Noir | Luxe, élégance | Mode, parfum |

> [!madagascar]
> Partez toujours des couleurs que le client utilise déjà : enseigne, uniformes, emballages, peinture du magasin. Un commerce de Tsaralalana connu pour sa façade bleue doit garder ce bleu.

## La typographie : 2 polices, pas plus

### Choisir et associer

1. **Une police pour les titres** : avec du caractère (exemples gratuits sur Google Fonts : Montserrat, Poppins, Bebas Neue).
2. **Une police pour le texte** : simple et très lisible (Open Sans, Roboto, Lato).
3. Utilisez les **graisses** (normal, gras) pour varier, plutôt qu''une troisième police.

### Les tailles minimales sur un visuel de 1080 × 1080 px

| Élément | Taille conseillée |
| --- | --- |
| Titre | 80 à 140 px |
| Sous-titre | 40 à 60 px |
| Texte | 28 à 36 px (jamais moins de 24 px) |

> [!attention] Erreurs fréquentes
> - Utiliser 4 ou 5 polices différentes sur le même visuel.
> - Écrire tout le texte en MAJUSCULES : c''est plus difficile à lire.
> - Mettre une police fantaisie pour le numéro de téléphone ou le prix.
> - Remplir chaque espace vide avec une image ou un texte.

## La liste de contrôle en 8 points

Avant d''envoyer un visuel à un client, vérifiez :

1. Le message principal se comprend en 3 secondes.
2. Il y a 3 niveaux de lecture clairs.
3. Tous les éléments sont alignés.
4. Les marges sont respectées sur les 4 bords.
5. 3 couleurs maximum, avec un bon contraste.
6. 2 polices maximum.
7. Le texte se lit sur un téléphone (testez en réduisant l''image).
8. Aucune faute d''orthographe, et le bon numéro de téléphone.

> [!retenir]
> - **Hiérarchie** : décidez ce qu''on lit en premier.
> - **Composition** : alignez, gardez des marges, laissez respirer.
> - **Couleur** : règle 60-30-10 et contraste fort.
> - **Typographie** : 2 polices, des tailles lisibles sur téléphone.

## Exercice pratique : refaire une affiche

> [!exercice] Exercice pratique · 45 minutes
> 1. Trouvez une affiche ou une publication Facebook d''un commerce près de chez vous et prenez-la en photo.
> 2. Analysez-la avec la liste de contrôle en 8 points : notez ce qui fonctionne et ce qui ne fonctionne pas.
> 3. Identifiez son message principal et classez toutes les informations en 3 niveaux.
> 4. Redessinez-la sur papier, en appliquant les 4 règles.
> 5. Comparez l''avant et l''après, et écrivez en 3 lignes ce que vous avez amélioré.
>
> **À livrer** : la photo d''origine, votre croquis et vos 3 lignes d''explication.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 1, 0, 'Sur une affiche de concert, que doit-on lire en premier ?', '["Les conditions de vente","Le numéro de téléphone","Le nom du graphiste","Le nom de l''artiste"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 1, 1, 'Combien de polices utiliser au maximum sur un visuel simple ?', '["Autant que possible","Une par ligne","Deux","Cinq"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 1, 2, 'Que dit la règle 60-30-10 pour les couleurs ?', '["60 % couleur principale, 30 % neutre, 10 % accent","60 % texte, 30 % image, 10 % vide","60 couleurs différentes au maximum","Utiliser 3 couleurs à parts égales"]'::jsonb, 0);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('design-0-f', 2, 'Les outils gratuits et payants, les formats', 'Les outils gratuits et payants, les formats de fichiers, les tailles, l''impression et le rangement des fichiers.', 'Quatre outils gratuits couvrent presque toutes les commandes d''un débutant, et leurs équivalents payants prennent le relais quand les clients l''exigent. Mais le vrai savoir-faire est ailleurs : livrer chaque visuel au bon format, à la bonne taille, et retrouver ses fichiers en 10 secondes. C''est l''objet de ce module.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Choisir le bon outil gratuit selon la commande.
> 2. Savoir quand passer aux outils payants, et comment les payer depuis Madagascar.
> 3. Choisir le bon format de fichier (PNG, JPG, PDF, SVG).
> 4. Utiliser les bonnes tailles pour chaque réseau social et pour l''impression.
> 5. Préparer un fichier pour l''imprimeur.
> 6. Ranger vos fichiers comme un professionnel.

## Les 4 outils gratuits

| Outil | Pour quoi faire | Point fort | Limite |
| --- | --- | --- | --- |
| Canva | Visuels réseaux sociaux, affiches, présentations | Très rapide, nombreux modèles | Les modèles se ressemblent ; certains éléments sont payants |
| Figma | Logos simples, maquettes, visuels sur mesure | Précis, partage facile avec le client | Demande un peu d''apprentissage |
| Photopea | Retouche photo, détourage, montages | Dans le navigateur, très proche de Photoshop | Lent avec une connexion faible |
| Inkscape | Logos vectoriels, fichiers pour imprimeur | Installé sur l''ordinateur, marche hors ligne | Interface moins moderne |

### Quel outil pour quelle commande ?

1. **Publication Facebook, story, affiche simple** : Canva.
2. **Logo** : Inkscape (hors ligne) ou Figma (en ligne).
3. **Retouche ou détourage d''une photo de produit** : Photopea.
4. **Maquette de site ou d''application** : Figma.

> [!astuce] Par où commencer ?
> Maîtrisez d''abord Canva pour vendre vite vos premiers visuels. Apprenez ensuite Inkscape pour les logos : il marche sans Internet, ce qui est précieux en cas de coupure de connexion.

### Bien démarrer dans Canva

1. Créez un compte gratuit sur canva.com avec votre e-mail.
2. Cliquez sur **Créer un design**, puis choisissez **Publication Instagram (carrée)**.
3. Partez d''une page vide ou d''un modèle, puis **changez tout** : couleurs, polices, photos, textes. Un modèle laissé tel quel se reconnaît tout de suite.
4. Enregistrez vos couleurs et polices dans le **Kit de marque** (Brand Kit) quand vous travaillez souvent pour le même client (la version gratuite est limitée ; Canva Pro permet un kit par client).
5. Exportez avec **Partager → Télécharger**, en choisissant le format (voir plus bas).

## Les outils payants

Les agences et les clients étrangers demandent souvent des fichiers créés avec les logiciels professionnels.

| Outil payant | Équivalent gratuit | Quand il devient utile |
| --- | --- | --- |
| Adobe Illustrator | Inkscape | Logos vectoriels ; agences et imprimeurs qui demandent des fichiers .ai |
| Adobe Photoshop | Photopea, GIMP | Retouche avancée ; fichiers .psd échangés avec les agences |
| Adobe InDesign | Canva, Scribus | Catalogues, magazines, livres de plusieurs dizaines de pages |
| Canva Pro | Canva gratuit | Kit de marque par client, suppression d''arrière-plan, redimensionnement en un clic |
| Figma (offre payante) | Figma gratuit | Nombreux projets, bibliothèques partagées avec une équipe |

### Quand passer au payant ?

Passez au payant quand **au moins une** de ces conditions est vraie :

1. L''abonnement est couvert par une ou deux commandes par mois.
2. Un client exige un format précis (.ai, .psd, .indd).
3. Un outil payant vous fait gagner plusieurs heures par semaine.

Avant cela, les outils gratuits suffisent pour vendre.

> [!madagascar] Payer un abonnement depuis Madagascar
> 1. Ces logiciels se paient en ligne, en dollars ou en euros, par carte Visa ou Mastercard internationale.
> 2. Demandez à votre banque une carte utilisable sur Internet, ou une carte prépayée virtuelle.
> 3. Profitez des essais gratuits pour un projet précis et des tarifs étudiants si vous y avez droit.
> 4. Les prix changent souvent : vérifiez toujours le tarif sur le site officiel de l''éditeur.

> [!attention] Pas de logiciels piratés
> Les versions « crackées » contiennent souvent des virus qui volent vos mots de passe et les fichiers de vos clients. Elles peuvent aussi vous faire perdre un client ou un compte sur une plateforme de freelance. Les outils gratuits légaux sont une bien meilleure solution.

## Les 4 formats de fichiers à connaître

| Format | Quand l''utiliser | À éviter pour |
| --- | --- | --- |
| **PNG** | Visuels avec texte, logos sur fond transparent, réseaux sociaux | Grandes photos (fichiers lourds) |
| **JPG** | Photos, aperçus légers à envoyer par WhatsApp | Logos (pas de transparence, texte moins net) |
| **PDF** | Impression, devis, documents de plusieurs pages | Publications réseaux sociaux |
| **SVG** | Logos vectoriels, agrandissables sans perte | Photos |

> [!definition] Vectoriel ou matriciel ?
> Une image **matricielle** (PNG, JPG) est faite de petits points (pixels) : si on l''agrandit trop, elle devient floue. Une image **vectorielle** (SVG, AI, PDF vectoriel) est faite de formes calculées : on peut l''agrandir à la taille d''un panneau publicitaire sans perte. C''est pourquoi un logo se livre toujours en vectoriel.

## Les tailles à utiliser

| Support | Taille |
| --- | --- |
| Publication Facebook ou Instagram carrée | 1080 × 1080 px |
| Publication Instagram verticale | 1080 × 1350 px |
| Story Instagram, Facebook, TikTok | 1080 × 1920 px |
| Miniature YouTube | 1280 × 720 px |
| Couverture de page Facebook | 1640 × 624 px (texte au centre, les bords sont coupés sur téléphone) |
| Flyer A5 imprimé | 148 × 210 mm, 300 dpi, 3 mm de fond perdu |
| Carte de visite | 85 × 55 mm, 300 dpi, 3 mm de fond perdu |

Les plateformes changent parfois leurs formats : vérifiez dans leur aide si un visuel s''affiche mal.

## Préparer un fichier pour l''imprimeur

1. **Demandez ses consignes** avant de commencer : chaque imprimeur a ses habitudes.
2. **Résolution** : 300 dpi (points par pouce). Une image de 72 dpi sera floue à l''impression.
3. **Couleurs** : en CMJN (Cyan, Magenta, Jaune, Noir), le mode des imprimantes. L''écran utilise le RVB : les couleurs peuvent légèrement changer à l''impression.
4. **Fond perdu** : prolongez le fond de 3 mm au-delà du bord. La découpe n''est jamais parfaite ; sans fond perdu, un fin liseré blanc peut apparaître.
5. **Zone de sécurité** : aucun texte important à moins de 5 mm du bord.
6. **Export** : PDF haute qualité (dans Canva : « PDF pour impression », avec « Traits de coupe et fond perdu » coché).

> [!exemple] Commande d''un menu de restaurant A4
> Le client vous envoie ses plats et ses prix par WhatsApp. Vous demandez à son imprimeur ses consignes, vous créez le menu en 210 × 297 mm avec 3 mm de fond perdu, vous vérifiez chaque prix avec le client, puis vous envoyez un PDF pour impression directement à l''imprimeur, et une version JPG au client pour Facebook.

## Organiser ses fichiers

1. Créez **un dossier par client**, puis **un sous-dossier par projet**, par exemple `Hotel-Ravinala / 2026-10-Promo-Noel`.
2. Dans chaque projet, 3 sous-dossiers : `Sources` (photos et textes reçus), `Travail` (fichiers Canva, Figma, Inkscape), `Livraison` (fichiers finaux).
3. Nommez les fichiers clairement : `hotel-ravinala_post-promo_v2.png`. Le `v2` indique la version.
4. Gardez une copie sur **Google Drive** en plus de l''ordinateur : si le disque tombe en panne, rien n''est perdu.

> [!retenir]
> - Canva pour aller vite, Inkscape ou Figma pour les logos, Photopea pour les photos.
> - Le payant devient utile quand il est rentabilisé ou exigé par le client.
> - PNG pour le web, JPG pour les photos, PDF pour l''impression, SVG pour les logos.
> - Impression : 300 dpi, CMJN, 3 mm de fond perdu.
> - Un dossier par client, des noms clairs, une copie en ligne.

## Exercice pratique : une promotion en 3 formats

> [!exercice] Exercice pratique · 1 heure
> 1. Dans Canva, créez une promotion « -20 % ce week-end » pour une boulangerie fictive, « Mofo Tsara ».
> 2. Faites-en **3 versions** : publication carrée (1080 × 1080 px), story (1080 × 1920 px) et flyer A5 pour impression.
> 3. Adaptez la mise en page à chaque format : ne vous contentez pas d''étirer l''image.
> 4. Exportez la publication et la story en PNG, et le flyer en PDF pour impression avec fond perdu.
> 5. Rangez-les dans un dossier `Mofo-Tsara / Promo-weekend / Livraison`, avec des noms de fichiers clairs.
>
> **À livrer** : les 3 fichiers, correctement nommés et rangés.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 2, 0, 'Quel format pour un logo sur fond transparent destiné au web ?', '["PNG","JPG","MP4","DOCX"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 2, 1, 'Quelle taille pour une story Instagram ?', '["1280 × 720 px","1080 × 1080 px","500 × 500 px","1080 × 1920 px"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 2, 2, 'Combien de millimètres de fond perdu demande en général un imprimeur ?', '["3 mm","0 mm","1 cm sur un seul côté","30 mm"]'::jsonb, 0);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('design-0-f', 3, 'Créer un logo et une identité visuelle', 'Le brief en 8 questions, les 7 étapes d''un logo, les 5 tests d''un logo solide, le pack et la mini-charte.', 'Le logo est souvent la commande la mieux payée d''un graphiste débutant, et celle qui demande le plus de méthode. Un bon logo naît d''un bon brief : on pose les bonnes questions d''abord, on dessine ensuite, et on livre un pack complet que le client peut utiliser seul pendant des années.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Mener un brief client de 20 minutes avec 8 questions.
> 2. Suivre les 7 étapes d''un projet de logo, du croquis à la livraison.
> 3. Choisir le bon type de logo pour chaque client.
> 4. Vérifier qu''un logo est solide grâce à 5 tests.
> 5. Livrer un pack de fichiers et une mini-charte graphique.

## Le brief : les 8 questions à poser

Le brief est un entretien avec le client (appel, WhatsApp ou rendez-vous). Notez les réponses par écrit et faites-les valider par le client : c''est votre référence en cas de désaccord.

1. **Que vendez-vous, et à qui ?** (exemple : de la vanille bourbon à des épiceries fines en France)
2. **Quels sont vos 3 mots-clés ?** (exemple : naturel, authentique, haut de gamme)
3. **Qui sont vos concurrents ?** Demandez 2 ou 3 noms, puis regardez leurs logos.
4. **Quelles couleurs aimez-vous, lesquelles refusez-vous ?**
5. **Où le logo sera-t-il utilisé ?** Enseigne, emballage, réseaux sociaux, broderie sur t-shirt, tampon…
6. **Avez-vous déjà un logo ou des éléments à garder ?**
7. **Quel est votre budget ?**
8. **Pour quelle date en avez-vous besoin ?**

> [!astuce]
> Envoyez ces questions à l''avance par WhatsApp ou e-mail, puis faites un appel de 20 minutes pour les approfondir. Le client prépare ses réponses, et vous gagnez du temps.

## Les 7 étapes d''un projet de logo

| N° | Étape | Durée indicative | Ce que vous produisez |
| --- | --- | --- | --- |
| 1 | Brief et devis signé, acompte reçu | 1 jour | Brief écrit validé |
| 2 | Recherche (concurrents, inspiration) | 2 h | Planche d''inspiration |
| 3 | Croquis sur papier | 2 h | 10 à 20 idées rapides |
| 4 | Vectorisation des 3 meilleures idées | 1 jour | 3 propositions en noir et blanc |
| 5 | Couleur et typographie | 2 h | 2 ou 3 propositions finales |
| 6 | Présentation au client, retouches | 1 à 3 jours | Logo validé |
| 7 | Livraison du pack et de la mini-charte | 2 h | Dossier complet |

### Étape 3 en détail : les croquis

1. Prenez une feuille A4 et divisez-la en 12 cases.
2. Dans chaque case, dessinez une idée en moins de 2 minutes, au crayon, sans couleur.
3. Variez les approches : initiale, symbole, nom seul, forme qui entoure le nom.
4. Entourez les 3 idées les plus simples et les plus originales.

### Étape 4 en détail : la vectorisation dans Inkscape

1. Photographiez votre croquis et importez la photo dans Inkscape (**Fichier → Importer**).
2. Baissez son opacité et verrouillez-la : elle servira de modèle.
3. Redessinez les formes avec l''**outil Bézier** (le stylo) et les formes simples (cercle, rectangle).
4. Ajoutez le nom avec l''**outil Texte**, puis convertissez-le en tracé (**Chemin → Objet en chemin**) pour qu''il s''affiche partout pareil.
5. Travaillez **en noir et blanc d''abord** : si le logo fonctionne sans couleur, il fonctionnera avec.

### Étape 6 en détail : la présentation

Ne présentez jamais un logo seul sur fond blanc. Montrez-le **en situation** : sur une enseigne, un t-shirt, un sac, une publication Facebook, une carte de visite. Le client se projette et valide plus vite. Limitez-vous à **2 tours de retouches**, comme prévu dans le devis.

## Les 3 types de logos

| Type | Description | Idéal pour |
| --- | --- | --- |
| Logotype | Le nom seul, dans une typographie travaillée | Marques au nom court et original |
| Symbole + nom | Une icône simple à côté ou au-dessus du nom | La plupart des commerces |
| Emblème | Le nom à l''intérieur d''une forme (badge, cercle) | Cafés, coopératives, produits artisanaux |

## Les 5 tests d''un logo solide

1. **Test de la petite taille** : il reste lisible à 32 px (taille d''une photo de profil).
2. **Test d''une seule couleur** : il fonctionne en noir sur blanc et en blanc sur noir.
3. **Test de la photocopie** : il reste reconnaissable sur un tampon ou une photocopie.
4. **Test de l''originalité** : il ne ressemble à aucun logo existant (faites une recherche d''image inversée sur Google).
5. **Test des 5 secondes** : montrez-le 5 secondes à quelqu''un, cachez-le, demandez-lui de le décrire.

> [!attention] À ne jamais faire
> - Utiliser une image ou une icône trouvée sur Internet sans en avoir les droits.
> - Copier le logo d''une grande marque « en changeant un peu ».
> - Utiliser plus de 3 couleurs ou des dégradés compliqués.
> - Utiliser une police très fine, illisible en petit.

## Le pack à livrer

### Les fichiers

| Version | Formats |
| --- | --- |
| Couleur | SVG, PNG transparent, PDF |
| Noir | SVG, PNG transparent |
| Blanc (pour fonds sombres) | SVG, PNG transparent |
| Carrée (photo de profil) | PNG 1080 × 1080 px |

### La mini-charte graphique (1 page)

1. Le logo et ses versions.
2. Les couleurs avec leurs codes : **HEX** pour l''écran (exemple : #0B7A55) et **CMJN** pour l''impression.
3. Les polices utilisées.
4. La **zone de protection** : l''espace vide minimum autour du logo.
5. La **taille minimale** d''utilisation.
6. 3 ou 4 **usages interdits** illustrés : logo déformé, couleurs changées, fond trop chargé.

> [!madagascar]
> Beaucoup de clients malgaches font imprimer leur logo sur des tampons, des sacs en raphia ou des t-shirts brodés. Pensez-y dès le brief : un logo trop détaillé ne passera pas en broderie ni en tampon. C''est un argument de qualité à mettre en avant face aux concurrents.

> [!retenir]
> - Pas de dessin avant un **brief écrit validé** et un acompte.
> - Croquis sur papier, puis vectorisation **en noir et blanc d''abord**.
> - 5 tests : petite taille, une couleur, photocopie, originalité, 5 secondes.
> - Un pack complet et une mini-charte : le client ne doit plus avoir besoin de vous pour utiliser son logo.

## Exercice pratique : le logo de « Vanille d''Antalaha »

> [!exercice] Exercice pratique · 3 à 4 heures
> **Le client (fictif)** : « Vanille d''Antalaha », une coopérative de 40 producteurs de la région SAVA, qui veut vendre sa vanille bourbon en ligne à des épiceries fines en France. Mots-clés : naturel, authentique, haut de gamme.
>
> 1. Écrivez le brief en répondant aux 8 questions comme si vous étiez le client.
> 2. Faites 12 croquis sur papier.
> 3. Vectorisez les 2 meilleurs dans Inkscape ou Figma, en noir et blanc.
> 4. Ajoutez couleurs et typographie.
> 5. Appliquez les 5 tests et corrigez si besoin.
> 6. Préparez la mini-charte d''une page.
>
> **À livrer** : le brief, la photo de vos croquis, les 2 logos et la mini-charte. C''est votre premier projet de portfolio.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 3, 0, 'Que faut-il faire avant de dessiner un logo ?', '["Un brief avec le client","Choisir une police au hasard","Télécharger une image sur Google","Envoyer la facture finale"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 3, 1, 'Lequel de ces tests fait partie des 5 tests d''un logo solide ?', '["Il utilise un dégradé","Il reste lisible à 32 px et en une seule couleur","Il ressemble au logo d''une grande marque","Il contient au moins 5 couleurs"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 3, 2, 'Quel format permet d''agrandir un logo sans perte de qualité ?', '["PNG de 200 px","JPG","SVG","GIF"]'::jsonb, 2);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('design-0-f', 4, 'Trouver des clients et se faire payer', 'Portfolio, 5 canaux de prospection, calcul du prix, devis, acompte, paiement depuis Madagascar et livraison.', 'Savoir créer ne suffit pas : il faut trouver des clients, fixer un prix juste, se protéger avec un devis et être payé. Ce dernier module vous donne une méthode complète, adaptée à la réalité de Madagascar, pour transformer vos compétences en revenus réguliers.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Construire un portfolio de 6 projets qui convainc.
> 2. Trouver des clients grâce à 5 canaux, avec un message de prospection prêt à l''emploi.
> 3. Calculer votre prix horaire et le prix d''un projet.
> 4. Rédiger un devis complet et vous protéger avec un acompte.
> 5. Vous faire payer en local et depuis l''étranger.
> 6. Livrer de façon professionnelle et obtenir des recommandations.

## Le portfolio : votre vitrine

Un client ne vous connaît pas : il juge sur ce qu''il voit. Votre portfolio doit lui donner confiance en moins d''une minute.

### Les 4 règles d''un bon portfolio

1. **6 projets suffisent**, à condition qu''ils soient bons. Les exercices de cette formation comptent, même fictifs : indiquez simplement « projet d''étude ».
2. **Pour chaque projet** : le besoin du client, votre solution, le résultat en situation (logo sur une enseigne, visuel sur un téléphone).
3. **Variez** : un logo, des visuels réseaux sociaux, une affiche, un menu ou un flyer.
4. **Deux versions** : sur Behance (gratuit, reconnu à l''international) et un PDF léger (moins de 5 Mo) à envoyer par WhatsApp.

## Où trouver des clients : 5 canaux

| N° | Canal | Pour qui | Comment s''y prendre |
| --- | --- | --- | --- |
| 1 | Entourage et commerces locaux | Premiers clients, paiement en ariary | Proposez une amélioration concrète de leur page Facebook |
| 2 | Groupes Facebook d''entrepreneurs et de freelances malgaches | Clients locaux et diaspora | Publiez vos réalisations avec une courte explication, pas seulement « je cherche du travail » |
| 3 | Fiverr, Upwork | Clients internationaux, souvent anglophones | Commencez par une offre très précise : « 3 visuels Instagram en 48 h » |
| 4 | Plateformes de freelance francophones | Clients en France, Belgique, Canada | Vérifiez d''abord que la plateforme accepte les freelances basés à Madagascar |
| 5 | LinkedIn et e-mail aux agences | Agences et PME | Proposez votre aide pour leurs pics d''activité |

### Le message de prospection, prêt à l''emploi

> [!exemple] Message à un commerce local (Facebook ou WhatsApp)
> « Bonjour, je suis graphiste à Antananarivo. J''ai vu votre page Facebook et j''aime beaucoup vos produits. Je vous propose de créer 3 visuels pour vos promotions de la semaine, plus lisibles sur téléphone. Voici 2 exemples de mon travail : [lien]. Si ça vous intéresse, je peux vous faire une première proposition. Bonne journée ! »

Règles d''or : un message **personnalisé** (citez quelque chose de précis sur leur page), **court**, avec **un exemple** et **une proposition concrète**. Envoyez 5 messages par jour plutôt que 50 messages copiés-collés.

## Calculer son prix

Ne copiez pas le prix du voisin : calculez-le.

### Étape 1 : votre prix horaire

1. Fixez votre **revenu mensuel visé** (exemple : 1 500 000 Ar).
2. Estimez vos **heures facturables** par mois : pas toutes vos heures, car une partie part en prospection, échanges et formation (exemple : 80 h).
3. **Divisez** : 1 500 000 ÷ 80 ≈ 19 000 Ar de l''heure.

### Étape 2 : le prix d''un projet

Multipliez le prix horaire par le temps estimé, puis ajoutez une marge de 20 % pour les imprévus.

| Projet | Temps estimé | Calcul | Prix arrondi |
| --- | --- | --- | --- |
| 3 visuels Facebook | 3 h | 3 × 19 000 + 20 % | 70 000 Ar |
| Affiche d''événement | 4 h | 4 × 19 000 + 20 % | 90 000 Ar |
| Logo + mini-charte | 8 h | 8 × 19 000 + 20 % | 180 000 Ar |

Ces chiffres sont des **exemples**, à adapter à votre niveau et à vos clients. Pour les clients étrangers, affichez un prix en euros ou en dollars adapté à leur marché.

> [!astuce] Proposez des forfaits
> Les clients préfèrent un prix fixe à un prix à l''heure. Proposez 3 formules : **Essentiel** (logo seul), **Standard** (logo + mini-charte), **Complet** (logo + mini-charte + 5 visuels réseaux sociaux). La plupart choisissent celle du milieu.

## Le devis et l''acompte : vous protéger

### Ce que contient un devis

1. Vos coordonnées et celles du client.
2. La description précise de la prestation (exemple : « 2 propositions de logo, 2 tours de retouches »).
3. Ce qui n''est **pas** inclus (exemple : « impression non comprise »).
4. Le délai de livraison.
5. Le prix total et les conditions de paiement : **50 % d''acompte** à la commande, **50 % à la livraison**.
6. La date et la durée de validité du devis (exemple : 30 jours).

### Les 3 règles qui protègent

1. **Pas de travail sans acompte.** Un client qui refuse l''acompte est souvent un client qui ne paiera pas.
2. **Aperçus en basse définition ou avec filigrane** tant que le solde n''est pas payé.
3. **Retouches limitées** au nombre prévu dans le devis ; au-delà, un supplément.

## Se faire payer depuis Madagascar

| Situation | Moyens de paiement |
| --- | --- |
| Client local | Mobile Money (MVola, Orange Money, Airtel Money) ou virement bancaire |
| Plateforme internationale (Fiverr, Upwork…) | Retrait le plus souvent via Payoneer, ou virement vers un compte bancaire malgache, selon la plateforme |
| Client étranger en direct | Virement international ou Payoneer |

> [!madagascar]
> Les possibilités de PayPal sont limitées pour Madagascar : vérifiez avant de le proposer à un client. Gardez une trace de **chaque paiement** (capture du SMS, relevé) pour votre comptabilité et vos impôts.

## Livrer comme un professionnel

1. Un **lien Google Drive** avec les dossiers rangés (voir module 3).
2. La **mini-charte** en PDF pour un logo.
3. Un **message de remerciement** avec un récapitulatif de ce qui est livré.
4. Une **demande d''avis** : « Si vous êtes satisfait, pouvez-vous laisser un avis sur ma page ? »
5. Une **relance 1 mois plus tard** : « Besoin de visuels pour vos promotions de fin de mois ? »

> [!retenir]
> - 6 projets bien présentés valent mieux que 30 images sans explication.
> - Prospection : personnalisée, courte, avec un exemple et une proposition.
> - Prix = prix horaire × temps + 20 % ; proposez 3 forfaits.
> - Toujours un devis écrit et 50 % d''acompte.
> - Un client satisfait est votre meilleure publicité : demandez un avis.

## Exercice pratique : votre première offre

> [!exercice] Exercice pratique · 1 heure 30
> 1. Calculez votre prix horaire avec **vos** chiffres.
> 2. Créez vos 3 forfaits (Essentiel, Standard, Complet) avec un prix pour chacun.
> 3. Rédigez le devis du logo « Vanille d''Antalaha » (module 4) : prestation, 2 propositions, 2 retouches, délai de 7 jours, 50 % d''acompte.
> 4. Reprenez votre liste de 10 clients (module 1) et écrivez un message de prospection personnalisé pour 3 d''entre eux.
> 5. Envoyez-en au moins un pour de vrai.
>
> **À livrer** : votre calcul de prix, vos 3 forfaits, le devis et vos 3 messages.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 4, 0, 'Quand demander l''acompte ?', '["Jamais","Seulement si le client est étranger","Avant de commencer le travail","Après la livraison des fichiers finaux"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 4, 1, 'Avec un prix horaire de 19 000 Ar, combien coûte environ un projet de 4 h, marge de 20 % comprise ?', '["Environ 400 000 Ar","Environ 40 000 Ar","Environ 90 000 Ar","Environ 19 000 Ar"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 4, 2, 'Que contient un bon devis ?', '["Le mot de passe du client","Le logo final","Uniquement le prix","Prestation, nombre de retouches, délai et prix"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Quel est le rôle principal d''un graphiste ?', '["Imprimer des affiches","Traduire le message du client en image utile","Dessiner ce qu''il trouve beau","Gérer la page Facebook"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Quel fuseau horaire a Madagascar ?', '["UTC+1","UTC−3","UTC+8","UTC+3"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Sur une affiche, comment doit être l''élément le plus important ?', '["Le plus petit","Le plus grand ou le plus contrasté","Placé dans un coin","Écrit en italique"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Combien de polices au maximum sur un visuel simple ?', '["Cinq","Deux","Sans limite","Une par ligne"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Quelle combinaison est la plus lisible ?', '["Rouge sur vert","Jaune sur blanc","Gris clair sur blanc","Texte foncé sur fond clair"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'À quoi sert l''espace vide sur un visuel ?', '["Économiser l''encre","Rien, il faut le remplir","Cacher des erreurs","Guider l''œil vers le message"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Quel outil gratuit fonctionne hors ligne pour les logos vectoriels ?', '["Photopea","Behance","Inkscape","Canva"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Quelle taille pour une publication Instagram carrée ?', '["1280 × 720 px","1080 × 1080 px","300 × 300 px","1080 × 1920 px"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Quel format pour un logo transparent sur le web ?', '["PNG","MP3","DOCX","JPG"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Quelle résolution demande en général un imprimeur ?', '["30 dpi","300 dpi","72 dpi","1 000 dpi"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Que signifie « fond perdu » ?', '["Un fond supprimé","Une erreur d''impression","Un fichier égaré","Une marge de l''image qui dépasse la coupe"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Quelle est la première étape d''un logo ?', '["La livraison","Le brief avec le client","La facture","Les couleurs"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Quel format agrandit un logo sans perte ?', '["PNG de 200 px","JPG","SVG","GIF"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Un logo solide doit rester lisible…', '["seulement en grand","avec un dégradé","uniquement en couleur","en petit et en une seule couleur"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Que contient une mini-charte graphique ?', '["Couleurs, polices et règles d''usage du logo","Le devis","Le mot de passe du client","Les factures"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Quel code de couleur sert à l''impression ?', '["CMJN","HTML","RVB uniquement","HEX"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Comment calculer son prix horaire ?', '["Laisser le client décider","Un prix fixe pour tout","Copier le prix le plus bas","Revenu visé divisé par les heures facturables"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Quand demander l''acompte ?', '["À la fin de l''année","Avant de commencer","Jamais","Après la livraison"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Quel moyen de paiement convient pour un client local à Madagascar ?', '["Paiement en nature","Chèque étranger","Cryptomonnaie obligatoire","Mobile Money"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Pourquoi éviter les logiciels piratés ?', '["Ils sont plus lents à installer","Ils coûtent plus cher que les originaux","Ils n''existent qu''en anglais","Ils contiennent souvent des virus qui volent mots de passe et fichiers clients"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Que dit la règle 60-30-10 pour les couleurs ?', '["60 % texte, 30 % image, 10 % vide","Utiliser 60 couleurs au maximum","3 couleurs à parts égales","60 % couleur principale, 30 % neutre, 10 % accent"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'À quelle distance minimale du bord placer un texte important sur un document imprimé ?', '["Aucune règle","1 mm","0 mm","5 mm"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Pourquoi présenter un logo « en situation » (enseigne, t-shirt…) ?', '["Pour cacher les défauts","Parce que c''est obligatoire","Pour augmenter le prix sans raison","Pour que le client se projette et valide plus vite"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Qu''est-ce qui rend un message de prospection efficace ?', '["Il est personnalisé, court, avec un exemple et une proposition concrète","Il demande directement de l''argent","Il est très long et détaillé","Il est envoyé à 50 personnes à l''identique"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-f', 'Pourquoi proposer 3 forfaits (Essentiel, Standard, Complet) ?', '["Les clients préfèrent un prix fixe et choisissent souvent la formule du milieu","Parce que les plateformes l''exigent","Pour compliquer le choix","Pour éviter de faire un devis"]'::jsonb, 0);
commit;
