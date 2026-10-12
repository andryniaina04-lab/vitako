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
  ('mkt-0-f', 'mkt-0', 'Community manager', 'f', 'Community manager – Fondamentaux', 14, true),
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
  ('gestion-0-f', 'gestion-0', 'Assistant virtuel', 'f', 'Assistant virtuel – Fondamentaux', 14, true),
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

-- gestion-0-f
delete from public.exam_questions where course_id = 'gestion-0-f';
delete from public.module_questions where course_id = 'gestion-0-f';
delete from public.lessons where course_id = 'gestion-0-f' and module_index >= 5;
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('gestion-0-f', 0, 'Le métier d''assistant virtuel depuis Madagascar', 'Ce que fait un assistant virtuel, les 8 tâches les plus demandées, vos clients, les qualités attendues et votre poste de travail.', 'Un assistant virtuel fait à distance ce que fait une assistante de direction dans un bureau : il gère les e-mails, l''agenda, les documents et les petites tâches qui font perdre du temps à son client. C''est un des métiers du télétravail les plus accessibles depuis Madagascar, car il demande surtout de l''organisation, un bon français écrit et de la fiabilité. Ce premier module vous montre le métier tel qu''il est vraiment.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Expliquer en une phrase ce que fait un assistant virtuel.
> 2. Citer les 8 tâches les plus demandées à un débutant.
> 3. Repérer vos premiers clients possibles, à Madagascar et à l''étranger.
> 4. Évaluer vos qualités et ce qu''il vous reste à travailler.
> 5. Préparer votre poste de travail malgré les coupures et la connexion.

## Le métier d''assistant virtuel en une phrase

Un assistant virtuel **fait gagner du temps à son client** en prenant en charge ses tâches administratives et organisationnelles, à distance.

Le client est souvent un entrepreneur, un coach, un médecin ou le dirigeant d''une petite entreprise. Il est débordé : il passe ses soirées à répondre aux e-mails au lieu de travailler sur son vrai métier. Votre rôle : lui rendre ces heures.

> [!definition] Assistant virtuel
> Un assistant indépendant qui travaille à distance pour un ou plusieurs clients, avec des outils en ligne (e-mail, agenda partagé, documents, visioconférence). On utilise aussi l''abréviation anglaise **VA** (*virtual assistant*).

## Les 8 tâches les plus demandées

| N° | Tâche | Exemple concret |
| --- | --- | --- |
| 1 | Gestion des e-mails | Trier la boîte de réception, répondre aux demandes simples, signaler l''urgent |
| 2 | Gestion de l''agenda | Fixer les rendez-vous, envoyer les rappels, éviter les doubles réservations |
| 3 | Organisation de déplacements | Comparer vols et hôtels, préparer un programme |
| 4 | Saisie et mise à jour de données | Fichier clients, tableau des commandes |
| 5 | Rédaction de documents simples | Courriers, comptes rendus de réunion, modèles |
| 6 | Suivi administratif | Relancer les factures impayées, classer les documents |
| 7 | Service client de premier niveau | Répondre aux questions fréquentes par e-mail ou message |
| 8 | Recherches sur Internet | Trouver 20 fournisseurs, comparer 5 logiciels |

Pour commencer, concentrez-vous sur les tâches **1, 2, 4 et 8** : elles sont demandées par presque tous les clients et s''apprennent vite.

## Qui sont vos clients ?

### Clients à l''étranger (la majorité)

1. **Entrepreneurs et indépendants francophones** (France, Belgique, Suisse, Canada) : coachs, consultants, thérapeutes, formateurs.
2. **Petites entreprises** sans secrétariat : artisans, agences immobilières, cabinets.
3. **Créateurs de formations en ligne** qui ont besoin d''aide pour leurs élèves et leurs e-mails.

### Clients à Madagascar

1. **Dirigeants de PME** et responsables d''ONG très sollicités.
2. **Professions libérales** : médecins, avocats, architectes.
3. **Entreprises de la diaspora** qui ont une activité à Madagascar et vivent à l''étranger.

> [!madagascar] Votre avantage
> Un français écrit soigné, un faible décalage horaire avec l''Europe (1 ou 2 heures) et la capacité de travailler aux heures de bureau européennes : pour un client en France, vous êtes disponible pendant **toute** sa journée de travail.

## Les qualités d''un bon assistant virtuel

| Qualité | Pourquoi c''est essentiel | Comment la montrer |
| --- | --- | --- |
| **Fiabilité** | Le client vous confie son agenda et ses clients | Respecter chaque délai, même petit |
| **Discrétion** | Vous voyez des informations privées | Ne jamais parler d''un client à un autre |
| **Organisation** | Vous gérez des dizaines de petites tâches | Listes, rappels, dossiers bien rangés |
| **Français écrit** | Vous écrivez au nom du client | Zéro faute dans vos messages |
| **Autonomie** | Le client n''a pas le temps de tout expliquer | Proposer une solution avec chaque question |

> [!exemple] Autonomie : la bonne façon de poser une question
> Mauvais : « Le client Dupont veut changer son rendez-vous, je fais quoi ? »
> Bon : « M. Dupont demande à déplacer son rendez-vous de jeudi. Vous êtes libre vendredi à 10 h ou lundi à 14 h : je lui propose les deux ? »

## Préparer son poste de travail

### L''équipement minimum

1. Un **ordinateur** (même ancien, s''il fait tourner un navigateur récent sans ramer).
2. Une **connexion Internet** principale et un **forfait mobile de secours**.
3. Un **casque avec micro** pour les appels.
4. Un **endroit calme** pour les visioconférences.
5. Une **batterie** ou un onduleur pour tenir pendant les coupures courtes.

### S''organiser malgré les coupures

1. Travaillez avec des outils en ligne qui enregistrent tout seuls (Google Docs, Notion), mais gardez une copie hors ligne des documents importants du jour.
2. Prévenez le client **dès qu''une coupure** risque de retarder une tâche, par téléphone si besoin.
3. Annoncez des délais avec une marge.

### Le décalage horaire

Madagascar est à UTC+3 toute l''année : 2 h d''avance sur Paris en hiver, 1 h en été, et 7 h d''avance sur Montréal en hiver. Indiquez toujours l''heure **dans le fuseau du client** quand vous fixez un rendez-vous.

> [!astuce]
> Ajoutez le fuseau horaire de chaque client dans votre agenda Google (Paramètres → Fuseau horaire secondaire). Vous voyez les deux heures côte à côte et évitez les erreurs de rendez-vous.

> [!attention] Erreurs fréquentes des débutants
> - Dire « oui » à toutes les tâches, même celles qu''on ne sait pas faire.
> - Disparaître pendant une coupure sans prévenir le client.
> - Envoyer des messages avec des fautes au nom du client.
> - Mélanger les fichiers de plusieurs clients dans le même dossier.

> [!retenir]
> - Un assistant virtuel fait gagner du temps à son client.
> - Les premières tâches à maîtriser : e-mails, agenda, saisie, recherches.
> - La plupart des clients sont des indépendants et petites entreprises francophones.
> - Fiabilité, discrétion et français écrit sont vos premières qualités.

## Exercice pratique : votre bilan de départ

> [!exercice] Exercice pratique · 45 minutes
> 1. Pour chacune des 8 tâches, notez-vous de 1 à 5 (1 = jamais fait, 5 = je sais très bien faire).
> 2. Pour chacune des 5 qualités, écrivez un exemple de votre vie (études, travail, famille) qui la prouve.
> 3. Faites la liste de votre équipement et de ce qui vous manque.
> 4. Notez 5 types de clients que vous aimeriez aider, et pourquoi.
>
> **À livrer** : votre bilan (tâches, qualités, équipement, clients visés). Il vous servira à rédiger votre offre au module 5.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('gestion-0-f', 0, 0, 'Quel est le rôle principal d''un assistant virtuel ?', '["Remplacer le client dans ses rendez-vous","Vendre les produits du client","Créer le site web du client","Faire gagner du temps à son client en prenant en charge ses tâches administratives"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('gestion-0-f', 0, 1, 'Quelle est la bonne façon de poser une question à un client ?', '["Ne jamais poser de question","Attendre qu''il pose lui-même la question","Demander « je fais quoi ? » sans détail","Expliquer la situation et proposer une solution"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('gestion-0-f', 0, 2, 'Que faire si une coupure risque de retarder une tâche ?', '["Annuler la mission","Ne rien dire et livrer en retard","Attendre qu''il le remarque","Prévenir le client tout de suite"]'::jsonb, 3);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('gestion-0-f', 1, 'Les bases : e-mails, agenda et organisation', 'L''e-mail professionnel en 5 parties, la méthode des 4 D, le rendez-vous sans erreur de fuseau, la matrice urgent / important et la confidentialité.', 'Le travail d''un assistant virtuel repose sur quatre savoir-faire : écrire des e-mails professionnels, trier une boîte de réception, tenir un agenda sans erreur et organiser les tâches. Ce module vous donne une méthode simple pour chacun, avec des modèles prêts à l''emploi.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Écrire un e-mail professionnel clair en 5 parties.
> 2. Trier une boîte de réception avec la méthode des 4 D.
> 3. Fixer un rendez-vous sans erreur de fuseau horaire.
> 4. Organiser les tâches avec la matrice urgent / important.
> 5. Protéger les informations confidentielles de vos clients.

## Écrire un e-mail professionnel

Vous écrirez souvent **au nom de votre client**. Chaque e-mail doit être clair, poli et sans faute.

### Les 5 parties d''un bon e-mail

1. **L''objet** : précis, il résume la demande (« Rendez-vous du 14 mars : nouvelle date proposée »).
2. **La formule d''appel** : « Bonjour Madame Rabe, » ou « Bonjour Paul, » selon le niveau de familiarité.
3. **Le message** : l''essentiel dans la première phrase, puis les détails en phrases courtes.
4. **L''action attendue** : ce que le destinataire doit faire, et avant quand.
5. **La formule de politesse et la signature** : « Bien cordialement, » puis nom, fonction et coordonnées.

> [!exemple] E-mail de changement de rendez-vous
> **Objet** : Rendez-vous du jeudi 14 mars : nouvelle date
>
> Bonjour Monsieur Martin,
>
> Mme Laurent a un empêchement jeudi 14 mars et vous prie de l''excuser. Elle vous propose deux nouvelles dates :
> 1. vendredi 15 mars à 10 h (heure de Paris) ;
> 2. lundi 18 mars à 14 h (heure de Paris).
>
> Pourriez-vous me dire laquelle vous convient d''ici mercredi soir ?
>
> Bien cordialement,
> Hanta Rakoto, assistante de Mme Laurent

### Les règles de forme

| Règle | Exemple |
| --- | --- |
| Vouvoiement par défaut | « Pourriez-vous… » |
| Une idée par paragraphe | 2 à 3 lignes maximum |
| Pas de majuscules pour crier | Écrire « important » et non « IMPORTANT !!! » |
| Dates complètes | « jeudi 14 mars », pas « jeudi prochain » |
| Toujours relire | Avec un correcteur (LanguageTool, BonPatron) avant d''envoyer |

## Trier une boîte de réception : la méthode des 4 D

Un client débordé peut avoir des centaines d''e-mails non lus. Chaque e-mail doit recevoir **une seule décision** parmi 4. La méthode vient de l''anglais, où les 4 mots commencent par D :

| N° | Décision | Quand | Action |
| --- | --- | --- | --- |
| 1 | **Faire** (*Do*) | Moins de 2 minutes | Répondre ou traiter tout de suite |
| 2 | **Déléguer** (*Delegate*) | Une autre personne doit s''en occuper | Transférer, avec un mot d''explication |
| 3 | **Différer** (*Defer*) | Plus de 2 minutes | Ajouter à la liste des tâches avec une date |
| 4 | **Supprimer ou archiver** (*Delete*) | Publicité, information sans action | Archiver ou se désinscrire |

### Les libellés (ou dossiers) conseillés

1. **À traiter par le client** : ce que lui seul peut décider.
2. **En attente de réponse** : vous attendez quelqu''un.
3. **Factures et paiements**.
4. **À lire** : lettres d''information utiles.
5. **Archivé** : tout le reste.

> [!astuce] Le résumé quotidien
> Chaque fin de journée, envoyez au client un court message : « Aujourd''hui : 34 e-mails traités, 3 rendez-vous fixés, 2 décisions vous attendent (dossier À traiter). » En 30 secondes, il sait tout.

## Tenir un agenda sans erreur

### Fixer un rendez-vous en 6 étapes

1. Vérifiez les disponibilités du client **et** ses règles (pas de rendez-vous avant 9 h, 15 minutes de pause entre deux appels…).
2. Proposez **2 ou 3 créneaux** précis à la personne.
3. Indiquez toujours le **fuseau horaire** : « 14 h, heure de Paris ».
4. Une fois la date acceptée, créez l''événement avec : titre clair, lieu ou lien de visioconférence, numéro de téléphone, objet du rendez-vous.
5. Invitez la personne depuis l''agenda : elle reçoit l''invitation dans **son** fuseau horaire.
6. Programmez un **rappel** la veille.

> [!definition] Fuseau horaire
> La zone de la Terre qui partage la même heure. Madagascar est à UTC+3, la France à UTC+1 en hiver et UTC+2 en été. Une erreur de fuseau, c''est un client qui attend seul en visioconférence.

### Le titre d''un événement

Écrivez des titres qui se comprennent sans ouvrir l''événement :
« Appel découverte · Sophie Morel (prospect) · Zoom ».

## Organiser les tâches : la matrice urgent / important

| | **Urgent** | **Pas urgent** |
| --- | --- | --- |
| **Important** | 1. À faire tout de suite (facture à envoyer aujourd''hui) | 2. À planifier (préparer le rapport du mois) |
| **Pas important** | 3. À faire vite ou à déléguer (répondre à une demande de devis standard) | 4. À éliminer ou faire plus tard (trier les anciens fichiers) |

Commencez chaque journée en classant vos tâches dans ces 4 cases.

## La confidentialité

Vous aurez accès aux e-mails, aux clients et parfois aux comptes de votre client. Votre réputation dépend de votre discrétion.

### Les 6 règles à respecter

1. Ne jamais parler des affaires d''un client à quelqu''un d''autre, même à un autre client.
2. Utiliser un **gestionnaire de mots de passe** (Bitwarden, par exemple) plutôt qu''un fichier ou un carnet.
3. Activer la **double authentification** sur tous vos comptes.
4. Ne pas travailler sur un ordinateur partagé ou dans un cybercafé.
5. Verrouiller votre écran quand vous vous éloignez.
6. Supprimer les accès et les fichiers à la fin d''une mission, si le client le demande.

> [!attention] Erreurs fréquentes des débutants
> - Écrire « jeudi prochain » au lieu de la date complète.
> - Oublier le fuseau horaire dans une proposition de rendez-vous.
> - Supprimer des e-mails au lieu de les archiver.
> - Répondre à une question délicate (prix, réclamation) sans l''accord du client.

> [!retenir]
> - Un e-mail : objet précis, message clair, action attendue, politesse.
> - Chaque e-mail reçoit une décision : faire, déléguer, différer, supprimer.
> - Un rendez-vous : 2 ou 3 créneaux, fuseau horaire, invitation, rappel.
> - Classez vos tâches par urgence et importance.
> - Discrétion totale et mots de passe protégés.

## Exercice pratique : trier et répondre

> [!exercice] Exercice pratique · 1 heure
> 1. Créez une adresse Gmail d''exercice.
> 2. Rédigez 3 e-mails professionnels : une proposition de rendez-vous, une relance de facture polie, une réponse à une demande d''information.
> 3. Créez les 5 libellés conseillés dans Gmail.
> 4. Prenez 10 e-mails de votre boîte personnelle (publicités comprises) et notez pour chacun la décision des 4 D.
> 5. Classez 8 tâches de votre semaine dans la matrice urgent / important.
>
> **À livrer** : vos 3 e-mails, une capture de vos libellés, votre tableau des 4 D et votre matrice.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('gestion-0-f', 1, 0, 'Que faire d''un e-mail qui se traite en moins de 2 minutes ?', '["Le traiter tout de suite","Le transférer au client","Le mettre de côté pour la semaine suivante","Le supprimer"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('gestion-0-f', 1, 1, 'Que faut-il toujours indiquer en proposant un rendez-vous à un client étranger ?', '["Le prix du rendez-vous","Le fuseau horaire","La météo","Votre adresse personnelle"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('gestion-0-f', 1, 2, 'Où ranger les mots de passe des clients ?', '["Dans un fichier Word sur le bureau","Dans un gestionnaire de mots de passe","Dans un carnet","Dans un message WhatsApp"]'::jsonb, 1);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('gestion-0-f', 2, 'Les outils : Google Workspace, Notion, et les outils payants', 'Gmail professionnel, agenda partagé, Drive bien rangé, tableau Notion, puis Google Workspace payant, Notion Plus et Calendly.', 'Un assistant virtuel passe sa journée dans quelques outils en ligne. Bien les maîtriser, c''est travailler deux fois plus vite et inspirer confiance. Ce module vous fait prendre en main la suite Google et Notion, puis vous présente les versions payantes et les outils que vos clients vous demanderont.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Utiliser Gmail comme un professionnel : libellés, filtres, modèles de réponse.
> 2. Partager un agenda et des fichiers avec les bons droits.
> 3. Ranger un Google Drive avec une arborescence claire.
> 4. Construire un tableau de suivi des tâches dans Notion.
> 5. Savoir quand passer à Google Workspace, Notion Plus et Calendly.

## Les outils gratuits indispensables

| N° | Outil | À quoi il sert |
| --- | --- | --- |
| 1 | **Gmail** | E-mails, libellés, filtres, modèles de réponse |
| 2 | **Google Agenda** | Rendez-vous, rappels, agendas partagés |
| 3 | **Google Drive, Docs et Sheets** | Documents, tableaux et partage de fichiers |
| 4 | **Google Meet** | Visioconférences avec le client |
| 5 | **Notion** (offre gratuite) | Liste des tâches, procédures, notes de réunion |
| 6 | **Bitwarden** (offre gratuite) | Gestionnaire de mots de passe |

## Gmail comme un professionnel

### Les 3 réglages qui font gagner des heures

1. **Les libellés** (module 2) : un par catégorie, avec une couleur.
2. **Les filtres** : Gmail range tout seul certains e-mails.
   - Ouvrez la barre de recherche, cliquez sur l''icône des options.
   - Indiquez l''expéditeur (exemple : `factures@fournisseur.com`).
   - Cliquez sur **Créer un filtre**, cochez **Appliquer le libellé** « Factures et paiements ».
3. **Les modèles de réponse** : activez-les dans **Paramètres → Voir tous les paramètres → Paramètres avancés → Modèles**. Enregistrez vos réponses fréquentes (demande de devis, confirmation de rendez-vous) et insérez-les en deux clics.

> [!astuce] Les raccourcis clavier
> Activez les raccourcis dans les paramètres de Gmail. **e** archive un e-mail, **r** répond, **c** écrit un nouvel e-mail, **/** place le curseur dans la recherche. Sur 100 e-mails par jour, vous gagnez facilement 20 minutes.

### Accéder à la boîte d''un client

La bonne méthode est la **délégation** : le client vous autorise à lire et envoyer des e-mails depuis son compte, sans vous donner son mot de passe. Dans Gmail, elle se règle dans **Paramètres → Comptes et importation → Accorder l''accès à votre compte** (selon le type de compte, l''option peut être différente : votre client vérifie avec son administrateur).

## Google Agenda : partager et organiser

### Les 3 niveaux de partage

| Droit | Ce que vous pouvez faire | Pour quoi |
| --- | --- | --- |
| Voir disponibilités seulement | Voir les créneaux occupés, sans détail | Proposer des créneaux libres |
| Voir tous les détails | Lire les rendez-vous | Préparer la journée du client |
| Modifier les événements | Créer, déplacer, supprimer | Gérer complètement l''agenda |

Pour gérer l''agenda, demandez le droit **Modifier les événements**.

### Les bonnes habitudes

1. Une **couleur par type** d''événement : appels clients en vert, rendez-vous personnels en gris, tâches en orange.
2. Le **lien de visioconférence** dans chaque événement à distance.
3. Des **temps de pause** bloqués entre deux longs rendez-vous.
4. Un **bloc de travail** pour le client : 2 heures sans réunion le matin, s''il le souhaite.

## Ranger un Google Drive

Un Drive en désordre fait perdre des heures. Proposez une arborescence numérotée, la même pour tous vos clients :

```
CLIENT - Mme Laurent
├── 01 Administratif (contrats, attestations)
├── 02 Clients (un dossier par client)
├── 03 Factures et devis
│   ├── 2026-01
│   └── 2026-02
├── 04 Communication (logos, photos, modèles)
└── 05 Procédures (comment faire chaque tâche)
```

### Nommer les fichiers

Utilisez toujours le même ordre : **date (AAAA-MM-JJ) – type – nom**.
Exemple : `2026-03-14 - Devis - Hôtel Les Baobabs.pdf`. Les fichiers se classent alors tout seuls par date.

### Partager avec les bons droits

1. **Lecteur** : peut seulement voir (pour un document envoyé à un client final).
2. **Commentateur** : peut ajouter des remarques (pour une relecture).
3. **Éditeur** : peut modifier (pour l''équipe).

Évitez « Tous les utilisateurs disposant du lien » pour les documents confidentiels.

## Notion : le tableau de suivi des tâches

Notion permet de créer une base de données de tâches, partagée avec le client. Il voit en temps réel ce qui est fait.

### Construire le tableau en 6 étapes

1. Créez une page **Tâches – Nom du client**.
2. Ajoutez une **base de données** en vue **Tableau** (*Board*).
3. Créez les colonnes de statut : **À faire**, **En cours**, **En attente du client**, **Terminé**.
4. Ajoutez les propriétés : **Échéance** (date), **Priorité** (haute, moyenne, basse), **Temps passé** (nombre).
5. Créez une carte par tâche, avec une description courte.
6. Partagez la page avec le client.

> [!exemple] Une carte de tâche
> **Relancer les 3 factures impayées de février** · Échéance : 5 mars · Priorité : haute · Temps passé : 0,5 h · Note : « Factures n° 12, 15 et 17. Relance polie, puis appel si pas de réponse sous 7 jours. »

### La page « Procédures »

Pour chaque tâche répétitive, écrivez une procédure en étapes numérotées : « Comment envoyer une facture », « Comment préparer un déplacement ». Si vous êtes malade ou en congé, quelqu''un peut vous remplacer, et le client apprécie énormément.

## Quand passer aux outils payants ?

| Outil payant | Ce qu''il apporte | Qui le paie en général |
| --- | --- | --- |
| **Google Workspace** | Adresse e-mail au nom de l''entreprise, plus de stockage, gestion des comptes d''équipe | Le client (vous recevez un compte dans son espace) |
| **Notion Plus** | Plus de fonctions de partage et d''historique, adapté au travail en équipe | Le client, ou vous si vous gérez plusieurs clients dans votre espace |
| **Calendly** (offres payantes) | Prise de rendez-vous en ligne avancée : plusieurs types de rendez-vous, rappels, paiement à la réservation | Le client, souvent |

Les prix changent souvent : consultez le site officiel de chaque outil. Dans la majorité des cas, **c''est le client qui a l''abonnement** et vous donne un accès. N''achetez un abonnement à votre nom que s''il vous sert pour plusieurs clients.

> [!madagascar]
> Une adresse e-mail professionnelle à votre nom (exemple : `contact@votreprenom-assistance.com`) inspire confiance aux clients étrangers. Elle demande un nom de domaine et un abonnement : c''est un bon investissement quand vous avez vos premiers revenus réguliers.

> [!retenir]
> - Filtres, libellés et modèles de réponse dans Gmail.
> - Délégation et partage : jamais le mot de passe du client.
> - Un Drive numéroté et des fichiers nommés « date – type – nom ».
> - Un tableau Notion partagé : le client voit votre travail en temps réel.
> - Les abonnements payants sont le plus souvent ceux du client.

## Exercice pratique : l''espace de travail d''un client

> [!exercice] Exercice pratique · 1 heure 30
> 1. Dans votre Gmail d''exercice, créez 2 filtres et 3 modèles de réponse.
> 2. Créez un agenda « Client test » avec 5 rendez-vous de la semaine, en couleurs, avec liens de visioconférence.
> 3. Créez l''arborescence Drive proposée et nommez 3 fichiers d''exemple selon la règle.
> 4. Dans Notion, construisez le tableau de suivi avec 8 tâches réparties dans les 4 colonnes.
> 5. Rédigez une procédure de 6 étapes pour une tâche de votre choix.
>
> **À livrer** : des captures d''écran de chaque étape et le lien de votre page Notion en lecture seule.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('gestion-0-f', 2, 0, 'Comment accéder à la boîte e-mail d''un client sans son mot de passe ?', '["Par la délégation de son compte","En lui demandant son mot de passe","En créant une fausse adresse","C''est impossible"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('gestion-0-f', 2, 1, 'Quel nom de fichier suit la bonne règle ?', '["2026-03-14 - Devis - Hôtel Les Baobabs.pdf","devis final final 2.pdf","scan.pdf","Document1.pdf"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('gestion-0-f', 2, 2, 'Qui paie le plus souvent l''abonnement Google Workspace ?', '["Vitako","Le client, qui vous donne un compte","Personne, il est gratuit","Toujours l''assistant virtuel"]'::jsonb, 1);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('gestion-0-f', 3, 'Premier projet : la première semaine d''une mission', 'Appel de découverte en 10 questions, fiche de mission, plan de la semaine, boîte de réception remise à zéro, suivi du temps et bilan.', 'Place à la pratique. Dans ce module, vous vivez la première semaine avec un vrai type de client : de l''appel de découverte à la remise du premier bilan. Vous apprenez à poser les bonnes questions, à prendre en main un espace de travail en désordre et à prouver votre valeur dès les premiers jours.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Mener un appel de découverte avec 10 questions clés.
> 2. Rédiger une fiche de mission claire.
> 3. Remettre en ordre une boîte de réception et un agenda en une semaine.
> 4. Suivre votre temps de travail précisément.
> 5. Présenter un bilan de première semaine.

## Le cas pratique : Mme Claire Laurent

> [!exemple] Votre cliente
> **Claire Laurent** est coach en reconversion professionnelle à Lyon. Elle travaille seule et reçoit ses clients en visioconférence. Sa boîte de réception compte 1 200 e-mails non lus, elle oublie des rendez-vous, et ses factures partent en retard. Elle vous engage pour **10 heures par semaine**, pendant un premier mois d''essai.

## L''appel de découverte

Avant de commencer, un appel de 30 à 45 minutes permet de comprendre exactement ce que veut le client. Préparez vos questions à l''avance et prenez des notes.

### Les 10 questions clés

1. Quelles sont les tâches qui vous prennent le plus de temps aujourd''hui ?
2. Si vous ne deviez me confier qu''une seule tâche, laquelle ?
3. Quels outils utilisez-vous (messagerie, agenda, stockage, facturation) ?
4. Quelles décisions puis-je prendre seul, et lesquelles dois-je vous soumettre ?
5. Comment préférez-vous communiquer avec moi (e-mail, WhatsApp, appel) ?
6. À quelle fréquence voulez-vous un point de suivi ?
7. Quelles sont vos règles d''agenda (horaires, pauses, jours sans rendez-vous) ?
8. Y a-t-il des personnes ou des sujets sensibles à connaître ?
9. Comment vous adressez-vous à vos propres clients (tutoiement, vouvoiement, ton) ?
10. À quoi verrez-vous, dans un mois, que ma mission est réussie ?

> [!astuce]
> La question 10 est la plus importante : elle vous donne les **objectifs** de la mission. Notez la réponse mot pour mot et relisez-la chaque semaine.

## La fiche de mission

Après l''appel, envoyez une **fiche de mission** d''une page au client. Elle confirme ce que vous avez compris.

| Rubrique | Exemple pour Mme Laurent |
| --- | --- |
| Objectifs du mois | Boîte de réception à jour chaque soir ; zéro rendez-vous oublié ; factures envoyées sous 48 h |
| Tâches confiées | E-mails, agenda, facturation, relances, rappels de rendez-vous |
| Décisions autonomes | Fixer un rendez-vous dans les créneaux autorisés, répondre aux questions fréquentes |
| Décisions à soumettre | Prix, réclamations, tout message à un client mécontent |
| Communication | WhatsApp pour l''urgent, résumé quotidien par e-mail, point vidéo le vendredi à 16 h (heure de Lyon) |
| Volume | 10 h par semaine, rapport de temps chaque vendredi |

## La première semaine, jour par jour

| Jour | Objectif | Actions principales |
| --- | --- | --- |
| **Jour 1** | S''installer | Recevoir les accès (délégation Gmail, agenda, Drive) ; vérifier que tout fonctionne ; créer l''espace Notion |
| **Jour 2** | Désengorger la boîte | Archiver en masse les publicités et notifications ; créer les libellés et filtres |
| **Jour 3** | Trier le reste | Appliquer les 4 D aux e-mails restants ; lister les décisions pour la cliente |
| **Jour 4** | Fiabiliser l''agenda | Vérifier les rendez-vous des 3 prochaines semaines ; ajouter liens et rappels ; mettre en place une page de réservation |
| **Jour 5** | Rattraper le retard et faire le bilan | Envoyer les factures en retard, préparer les relances, présenter le bilan au point du vendredi |

### Vider une boîte de 1 200 e-mails sans rien perdre

1. Recherchez les expéditeurs de publicités et de lettres d''information : sélectionnez tout, **archivez** (ne supprimez pas).
2. Recherchez les notifications automatiques (réseaux sociaux, outils) : archivez-les, puis créez un filtre pour qu''elles ne passent plus par la boîte de réception.
3. Recherchez les mots « facture », « paiement », « devis » : appliquez le libellé correspondant.
4. Triez le reste du plus récent au plus ancien, avec les 4 D.
5. Les e-mails de plus de 3 mois sans réponse : regroupez-les dans un libellé « Ancien – à vérifier » et demandez au client s''il veut les traiter.

> [!attention]
> **Archivez, ne supprimez jamais en masse.** Un e-mail archivé reste retrouvable par la recherche. Un e-mail supprimé disparaît définitivement au bout de 30 jours.

## Suivre son temps de travail

Votre client paie des heures : il doit pouvoir vérifier ce qu''elles contiennent.

### La méthode

1. Notez **chaque bloc de travail** : date, heure de début et de fin, tâche.
2. Utilisez un outil simple : un tableau Google Sheets, ou un outil de suivi gratuit comme Clockify ou Toggl Track.
3. Arrondissez par quarts d''heure.
4. Envoyez le récapitulatif chaque semaine.

| Date | Tâche | Durée |
| --- | --- | --- |
| Lun 3 | Installation des accès, création de l''espace Notion | 1 h 30 |
| Mar 4 | Archivage en masse, libellés et filtres | 2 h |
| Mer 5 | Tri des 4 D, liste des décisions | 2 h 15 |
| Jeu 6 | Agenda : vérification, liens, rappels | 2 h |
| Ven 7 | Factures et relances, bilan | 2 h 15 |
| **Total** | | **10 h** |

## Le bilan de première semaine

Au point du vendredi, présentez en 10 minutes :

1. **Ce qui est fait** : « Boîte de réception passée de 1 200 à 0 e-mail non traité ; 14 rendez-vous vérifiés ; 6 factures envoyées. »
2. **Ce qui vous attend** : la liste des décisions que seule la cliente peut prendre.
3. **Ce qui est en place** : filtres, libellés, page de réservation, rappels automatiques.
4. **Vos propositions** pour la semaine suivante.
5. **Vos questions**.

> [!madagascar]
> Le point du vendredi à 16 h à Lyon, c''est 17 h ou 18 h à Antananarivo selon la saison. Vérifiez votre connexion 15 minutes avant, et gardez votre téléphone en partage de connexion prêt en cas de coupure.

> [!attention] Erreurs fréquentes des débutants
> - Commencer sans fiche de mission écrite.
> - Supprimer des e-mails au lieu de les archiver.
> - Oublier de noter son temps, puis le reconstituer de mémoire.
> - Prendre une décision sensible (prix, réclamation) sans l''accord du client.

> [!retenir]
> - Un appel de découverte avec 10 questions, dont « à quoi verrez-vous que c''est réussi ? ».
> - Une fiche de mission écrite, validée par le client.
> - Semaine 1 : accès, boîte de réception, agenda, retards, bilan.
> - Archiver plutôt que supprimer.
> - Un suivi du temps précis, envoyé chaque semaine.

## Exercice pratique : la semaine de Mme Laurent

> [!exercice] Exercice pratique · 2 heures 30
> 1. Faites un appel de découverte de 20 minutes avec un proche qui joue le rôle de Mme Laurent ; notez les réponses aux 10 questions.
> 2. Rédigez la fiche de mission.
> 3. Préparez dans Notion le plan de la semaine, jour par jour.
> 4. Rédigez 3 e-mails : une relance de facture, une confirmation de rendez-vous, une réponse à une demande d''information sur le coaching.
> 5. Remplissez un suivi du temps de 10 heures et rédigez le bilan de première semaine.
>
> **À livrer** : vos notes d''appel, la fiche de mission, le plan Notion, les 3 e-mails, le suivi du temps et le bilan. C''est votre étude de cas de portfolio.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('gestion-0-f', 3, 0, 'Quelle question de l''appel de découverte donne les objectifs de la mission ?', '["Quel âge avez-vous ?","Combien gagnez-vous ?","Quel est votre logiciel préféré ?","À quoi verrez-vous, dans un mois, que ma mission est réussie ?"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('gestion-0-f', 3, 1, 'Que faire des publicités dans une boîte de 1 200 e-mails ?', '["Y répondre une par une","Les archiver en masse","Les supprimer définitivement","Les transférer au client"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('gestion-0-f', 3, 2, 'Pourquoi noter chaque bloc de travail ?', '["Parce que Gmail l''exige","Pour que le client puisse vérifier les heures qu''il paie","Pour travailler plus lentement","Ce n''est pas utile"]'::jsonb, 1);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('gestion-0-f', 4, 'Trouver des clients et se faire payer', 'Offre de services, 5 canaux de prospection, appel de vente, forfaits d''heures, proposition, facture et paiements.', 'Un assistant virtuel fiable garde souvent ses clients pendant des années. Encore faut-il trouver le premier, fixer un prix juste et se faire payer sans difficulté depuis Madagascar. Ce dernier module vous donne une méthode complète, de votre profil en ligne jusqu''à la facture.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Présenter votre offre de services sur une page claire.
> 2. Trouver des clients grâce à 5 canaux, avec un message de prospection prêt à l''emploi.
> 3. Mener un appel de vente en 5 étapes.
> 4. Calculer votre prix et proposer des forfaits d''heures.
> 5. Rédiger une proposition de collaboration et facturer.
> 6. Vous faire payer en local et depuis l''étranger.

## Votre offre de services

Le client ne cherche pas « un assistant virtuel » : il cherche quelqu''un qui règle **son** problème. Présentez-vous par ce que vous résolvez.

### Les 5 parties d''une bonne présentation

1. **Pour qui** : « J''aide les coachs et consultants indépendants… »
2. **Quel problème** : « … qui n''ont plus le temps de gérer leurs e-mails et leur agenda… »
3. **Quelles tâches** : la liste précise de ce que vous faites (et de ce que vous ne faites pas).
4. **Comment** : vos horaires, vos outils, votre façon de rendre compte (résumé quotidien, suivi du temps).
5. **Preuves** : votre étude de cas (module 4), les avis de vos premiers clients.

> [!exemple] Phrase de présentation
> « J''aide les coachs et consultants francophones à retrouver 10 heures par semaine en gérant leurs e-mails, leur agenda et leurs factures. Disponible pendant toute la journée de travail européenne. »

Mettez cette présentation sur un **profil LinkedIn** complet, sur une page simple (Notion publique ou Canva site web) et dans un PDF d''une page à envoyer.

## Où trouver des clients : 5 canaux

| N° | Canal | Pour qui | Comment s''y prendre |
| --- | --- | --- | --- |
| 1 | LinkedIn | Coachs, consultants, dirigeants de PME | Profil soigné, publications utiles, messages personnalisés |
| 2 | Plateformes de freelance (Upwork, Fiverr, plateformes francophones) | Clients internationaux | Offre précise : « Gestion de votre boîte e-mail et de votre agenda, 10 h par semaine » ; vérifiez que la plateforme accepte les freelances basés à Madagascar |
| 3 | Groupes Facebook d''entrepreneurs francophones | Indépendants en France, Belgique, Canada | Répondez aux questions d''organisation, sans vendre directement |
| 4 | Réseau à Madagascar | Dirigeants de PME, ONG, diaspora | Parlez de votre métier autour de vous ; proposez un essai de 5 heures |
| 5 | Agences d''assistants virtuels | Missions régulières | Postulez pour sous-traiter et gagner en expérience |

### Le message de prospection, prêt à l''emploi

> [!exemple] Message LinkedIn à une coach
> « Bonjour Claire, j''ai lu votre publication sur la difficulté de trouver du temps pour développer votre activité. Je suis assistante virtuelle et j''aide des coachs indépendants à reprendre le contrôle de leur boîte e-mail et de leur agenda, quelques heures par semaine. Voici l''exemple d''une première semaine de travail : [lien]. Seriez-vous ouverte à un échange de 15 minutes ? »

Personnalisé, court, un problème précis, une preuve, une proposition. Envoyez **5 messages soignés par jour**.

## L''appel de vente en 5 étapes

1. **Écouter** (60 % du temps) : posez les questions 1, 2 et 10 de l''appel de découverte (module 4).
2. **Reformuler** : « Si je comprends bien, vous perdez environ 2 heures par jour sur vos e-mails et vos rendez-vous. »
3. **Proposer** : une solution précise, avec le nombre d''heures et les tâches.
4. **Rassurer** : discrétion, outils sécurisés, suivi du temps, essai d''un mois.
5. **Conclure** : « Voulez-vous que je vous envoie la proposition aujourd''hui ? »

## Calculer son prix

### Étape 1 : votre prix horaire

1. Fixez votre **revenu mensuel visé** (exemple : 1 400 000 Ar).
2. Estimez vos **heures facturables** par mois (exemple : 100 h ; le reste sert à la prospection, aux échanges et à la formation).
3. **Divisez** : 1 400 000 ÷ 100 = 14 000 Ar de l''heure.

Pour les clients étrangers, fixez un prix horaire en euros ou en dollars : regardez les profils d''assistants virtuels débutants francophones sur les plateformes, et placez-vous à un niveau raisonnable pour commencer. Vous l''augmenterez avec l''expérience et les avis.

### Étape 2 : les forfaits d''heures

Les clients préfèrent un forfait mensuel payé d''avance à un paiement à l''heure.

| Forfait | Heures par mois | Pour qui | Exemple de prix (14 000 Ar/h) |
| --- | --- | --- | --- |
| **Découverte** | 10 h | Essai, petites tâches | 140 000 Ar |
| **Régulier** | 20 h | Gestion e-mails et agenda | 280 000 Ar |
| **Intensif** | 40 h | Assistance complète | 560 000 Ar |

Ces prix sont des **exemples** à adapter à votre niveau et à vos clients.

> [!astuce]
> Précisez ce qui se passe si les heures ne sont pas toutes utilisées (perdues ou reportées au mois suivant, dans une limite) et si le client en demande plus (facturées en plus, au même tarif). Écrivez-le dans la proposition.

## La proposition de collaboration

### Ce qu''elle contient

1. Vos coordonnées et celles du client.
2. Les **tâches confiées** (reprenez la fiche de mission du module 4).
3. Le **forfait** : nombre d''heures, prix, ce qui se passe au-delà.
4. Les **horaires de disponibilité** et les délais de réponse.
5. La **confidentialité** : vous vous engagez à ne rien divulguer.
6. Le **paiement** : forfait payé en début de mois.
7. La **durée** (1 mois d''essai, puis renouvellement) et le **préavis** pour arrêter.

### La facture

Chaque mois, envoyez une facture avec : numéro, date, vos coordonnées (et votre NIF si vous en avez un), celles du client, la description (« Forfait Régulier, mars 2026, 20 heures »), le montant et le moyen de paiement. Joignez le suivi du temps.

## Se faire payer depuis Madagascar

| Situation | Moyens de paiement |
| --- | --- |
| Client local | Mobile Money (MVola, Orange Money, Airtel Money) ou virement bancaire |
| Plateforme internationale | Retrait selon la plateforme : souvent Payoneer ou virement vers une banque malgache |
| Client étranger en direct | Virement international ou Payoneer |

> [!madagascar]
> Les possibilités de PayPal sont limitées pour Madagascar : vérifiez avant de le proposer. Pour facturer officiellement, renseignez-vous sur le NIF et la carte statistique auprès du centre fiscal de votre ville. Gardez une trace de chaque paiement reçu.

## Garder ses clients longtemps

1. **Résumé quotidien et suivi du temps** chaque semaine, sans exception.
2. **Proposez des améliorations** : un modèle de réponse, une procédure, un outil qui fait gagner du temps.
3. **Prévenez à l''avance** de vos absences, et proposez une solution (procédures écrites, tâches avancées).
4. **Demandez un avis** après un mois réussi, et une recommandation.

> [!retenir]
> - Présentez-vous par le problème que vous résolvez.
> - Prospection : personnalisée, courte, avec une preuve et une proposition.
> - Prix horaire = revenu visé ÷ heures facturables ; vendez des forfaits d''heures.
> - Une proposition écrite et une facture mensuelle avec le suivi du temps.
> - La fiabilité au quotidien fait les clients fidèles.

## Exercice pratique : lancer votre activité

> [!exercice] Exercice pratique · 2 heures
> 1. Écrivez votre phrase de présentation et votre offre en 5 parties.
> 2. Créez ou complétez votre profil LinkedIn avec cette offre.
> 3. Calculez votre prix horaire et vos 3 forfaits.
> 4. Rédigez votre modèle de proposition de collaboration et un modèle de facture.
> 5. Écrivez 5 messages de prospection personnalisés et envoyez-en au moins 2 pour de vrai.
>
> **À livrer** : votre offre, le lien de votre profil, votre calcul de prix, vos 2 modèles et vos 5 messages.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('gestion-0-f', 4, 0, 'Comment se présenter à un client ?', '["Par la liste de vos diplômes","Par le problème que vous résolvez pour lui","Par votre âge et votre ville","Par le prix le plus bas du marché"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('gestion-0-f', 4, 1, 'Avec un revenu visé de 1 400 000 Ar et 100 heures facturables, quel est le prix horaire ?', '["1 400 Ar","4 000 Ar","14 000 Ar","140 000 Ar"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('gestion-0-f', 4, 2, 'Que faut-il joindre à la facture mensuelle ?', '["Rien","Votre CV","Le suivi du temps","Vos mots de passe"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Quel est le rôle principal d''un assistant virtuel ?', '["Remplacer le client dans ses rendez-vous","Développer les logiciels du client","Faire gagner du temps à son client en prenant en charge ses tâches administratives","Vendre les produits du client"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Quelles tâches maîtriser en premier ?', '["E-mails, agenda, saisie et recherches","Comptabilité complète et paie","Développement web","Montage vidéo"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Quel est un vrai avantage d''un assistant malgache pour un client en France ?', '["Il est disponible pendant toute la journée de travail européenne","Il n''a pas besoin de parler français","Il ne prend jamais de congé","Il travaille sans Internet"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Quelle qualité est essentielle parce que vous voyez des informations privées ?', '["La discrétion","L''humour","La vitesse de frappe","La créativité"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Que doit contenir l''objet d''un e-mail professionnel ?', '["Rien, il peut rester vide","Un résumé précis de la demande","Le nom de l''expéditeur","Seulement « Bonjour »"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Comment écrire une date dans un e-mail ?', '["« bientôt »","« dans quelques jours »","« jeudi 14 mars »","« jeudi prochain »"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Que signifie « différer » dans la méthode des 4 D ?', '["Supprimer l''e-mail","Transférer à quelqu''un d''autre","Répondre tout de suite","Ajouter la tâche à la liste avec une date"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Combien de créneaux proposer pour un rendez-vous ?', '["Un seul, à prendre ou à laisser","2 ou 3 créneaux précis","Aucun : demander à la personne de choisir","Toute la semaine"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Une tâche importante mais pas urgente doit être…', '["Oubliée","Éliminée","Planifiée","Faite tout de suite"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Où ne faut-il pas travailler pour un client ?', '["Sur un ordinateur partagé ou dans un cybercafé","Chez soi","Sur son ordinateur personnel sécurisé","Dans un espace de coworking avec écran verrouillé"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'À quoi sert un filtre Gmail ?', '["Corriger les fautes","Envoyer des e-mails plus vite","Ranger automatiquement certains e-mails","Bloquer Internet"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Quel droit d''agenda faut-il pour gérer complètement les rendez-vous du client ?', '["Modifier les événements","Voir tous les détails","Voir disponibilités seulement","Aucun droit"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Quel droit Google Drive donner pour une simple relecture avec remarques ?', '["Éditeur","Commentateur","Propriétaire","Tous les utilisateurs disposant du lien"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'À quoi sert la page « Procédures » dans Notion ?', '["Envoyer des factures","Stocker des photos","Permettre à quelqu''un de vous remplacer et gagner du temps","Publier sur les réseaux sociaux"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Qu''apporte Calendly dans ses offres payantes ?', '["Une adresse e-mail professionnelle","Une prise de rendez-vous en ligne avancée","Un gestionnaire de mots de passe","Un stockage de fichiers"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Qu''apporte Google Workspace payant à une entreprise ?', '["Un site e-commerce","Une adresse e-mail à son nom et plus de stockage","Des clients gratuits","Un logiciel de montage vidéo"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Que faut-il envoyer au client après l''appel de découverte ?', '["Votre mot de passe","Rien","Une facture immédiate","Une fiche de mission écrite"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Quelle décision un assistant ne doit-il pas prendre seul ?', '["Archiver une publicité","Ajouter un rappel dans l''agenda","Fixer un rendez-vous dans les créneaux autorisés","Répondre à une réclamation ou fixer un prix"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Pourquoi archiver plutôt que supprimer ?', '["La suppression est payante","L''archivage est plus rapide","Un e-mail archivé reste retrouvable par la recherche","Il n''y a aucune différence"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Quand envoyer le récapitulatif du temps de travail ?', '["Seulement si le client le réclame","Jamais","Une fois par an","Chaque semaine"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Quelle phrase présente bien une offre d''assistant virtuel ?', '["« Je suis le moins cher »","« Je fais tout ce que vous voulez »","« J''aide les coachs indépendants à retrouver 10 heures par semaine en gérant leurs e-mails et leur agenda »","« J''ai un ordinateur et Internet »"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Pendant un appel de vente, quelle part du temps passer à écouter ?', '["Aucune","100 %, sans jamais parler","La majorité, environ 60 %","10 %"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Pourquoi proposer des forfaits d''heures ?', '["Pour travailler moins","Parce que c''est obligatoire","Les clients préfèrent un forfait mensuel payé d''avance","Pour éviter de suivre son temps"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Que doit préciser la proposition si le client demande plus d''heures que le forfait ?', '["Qu''elles sont interdites","Rien","Qu''elles sont facturées en plus, au même tarif","Qu''elles sont gratuites"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('gestion-0-f', 'Quel moyen de paiement utiliser avec un client local à Madagascar ?', '["Uniquement des espèces par la poste","Uniquement PayPal","Mobile Money ou virement bancaire","Un chèque étranger"]'::jsonb, 2);

-- mkt-0-f
delete from public.exam_questions where course_id = 'mkt-0-f';
delete from public.module_questions where course_id = 'mkt-0-f';
delete from public.lessons where course_id = 'mkt-0-f' and module_index >= 5;
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('mkt-0-f', 0, 'Le métier de community manager depuis Madagascar', 'Ce que fait un community manager, la semaine type, vos clients, les réseaux qui comptent et l''organisation à distance.', 'Un community manager fait vivre la présence d''une marque sur les réseaux sociaux : il publie, répond, anime et mesure. À Madagascar, presque tous les commerces vendent sur Facebook, et beaucoup n''ont personne pour s''en occuper sérieusement. Ce premier module vous montre le métier tel qu''il est vraiment, qui vous paiera et comment vous organiser depuis chez vous.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Expliquer en une phrase ce que fait un community manager.
> 2. Décrire les 6 tâches d''une semaine type.
> 3. Repérer vos premiers clients possibles, à Madagascar et à l''étranger.
> 4. Choisir les réseaux sociaux qui comptent pour chaque type de client.
> 5. Organiser votre travail malgré les coupures, la connexion et le décalage horaire.

## Le métier de community manager en une phrase

Un community manager **transforme des abonnés en clients fidèles**. Il ne se contente pas de « poster des photos » : chaque publication, chaque réponse et chaque story doit servir un objectif de l''entreprise.

Les 3 objectifs qu''on vous demandera le plus souvent :

1. **Faire connaître** la marque : plus de personnes voient les publications.
2. **Créer la confiance** : la page est active, les clients reçoivent des réponses rapides et polies.
3. **Faire vendre** : les abonnés envoient un message, commandent ou viennent en boutique.

> [!definition] Communauté
> L''ensemble des personnes qui suivent une marque et interagissent avec elle : abonnés, clients, personnes qui commentent ou partagent. Le community manager « gère » cette communauté : il l''écoute, lui répond et la fait grandir.

## Une semaine type : les 6 tâches du métier

| N° | Tâche | Exemple concret | Temps par semaine (exemple pour 1 client) |
| --- | --- | --- | --- |
| 1 | Planifier les publications | Calendrier des 3 publications de la semaine | 1 h |
| 2 | Créer les contenus | Texte, visuel Canva, courte vidéo | 3 à 4 h |
| 3 | Publier et programmer | Programmation dans Meta Business Suite | 30 min |
| 4 | Répondre aux messages et commentaires | Questions sur les prix, livraisons, horaires | 2 à 3 h |
| 5 | Animer la communauté | Jeu-concours, sondage, question du jour | 1 h |
| 6 | Mesurer et rendre compte | Petit rapport mensuel au client | 1 h par mois |

Pour un débutant, gérer **3 à 5 petites pages** en même temps est un rythme réaliste.

## Qui sont vos clients ?

### Clients à Madagascar

1. **Boutiques en ligne** qui vendent sur Facebook : vêtements, cosmétiques, téléphones, accessoires.
2. **Restaurants, snacks et pâtisseries** : menus, plats du jour, livraisons.
3. **Tourisme** : hôtels, guides, agences (Nosy Be, Sainte-Marie, Morondava, Isalo).
4. **Écoles privées, centres de formation, églises et associations**.
5. **Professions libérales** : médecins, avocats, auto-écoles, salles de sport.

### Clients à l''étranger

1. **Petites entreprises francophones** (France, Belgique, Canada, La Réunion, Maurice) qui n''ont pas le temps de gérer leurs réseaux.
2. **Agences de communication** qui sous-traitent la modération et la programmation.
3. **Créateurs et coachs** qui veulent quelqu''un pour répondre à leurs messages et préparer leurs publications.

> [!madagascar] Votre avantage
> Les entreprises malgaches vous paient pour une chose simple : **répondre vite et bien** aux clients sur Messenger, en français et en malagasy. Beaucoup de pages perdent des ventes parce que personne ne répond le soir ou le week-end.

## Quels réseaux pour quels clients ?

Un community manager ne doit pas être partout : il choisit les réseaux où se trouvent les clients de la marque.

| Réseau | Pour qui | Type de contenu |
| --- | --- | --- |
| Facebook | Presque tous les clients à Madagascar | Publications, photos, vidéos, Messenger pour la vente |
| Instagram | Mode, beauté, tourisme, restauration | Belles photos, Reels, stories |
| TikTok | Marques qui visent les jeunes | Vidéos courtes, tendances, humour |
| WhatsApp Business | Commerces de proximité | Catalogue, statuts, réponses rapides |
| LinkedIn | Entreprises qui vendent à d''autres entreprises, recrutement | Textes professionnels, actualités de l''entreprise |

Règle simple : **commencez par 1 ou 2 réseaux bien tenus** plutôt que 5 réseaux abandonnés.

## Travailler à distance depuis Madagascar

### 1. Les coupures d''électricité et la connexion

1. **Programmez à l''avance** les publications de la semaine : si le courant coupe, elles partent quand même.
2. Gardez votre téléphone chargé et une batterie externe : il vous sert à répondre aux messages et de modem de secours.
3. Gardez un forfait de données mobiles réservé au travail.

### 2. Les horaires de réponse

Les clients écrivent surtout **le soir et le week-end**. Mettez-vous d''accord avec chaque client sur des horaires clairs, par exemple : « Réponses aux messages de 8 h à 20 h, du lundi au samedi ».

### 3. Le décalage horaire avec l''Europe

Madagascar est à UTC+3, toute l''année : 2 h d''avance sur Paris en hiver, 1 h en été. Pour un client français, programmez les publications **à l''heure de ses abonnés**, pas à la vôtre.

> [!astuce]
> Créez un groupe WhatsApp par client. Vous y envoyez les visuels à valider, il y répond quand il veut, et vous gardez une trace de toutes ses validations.

> [!attention] Erreurs fréquentes des débutants
> - Publier sans objectif, juste « pour publier quelque chose ».
> - Laisser des messages sans réponse pendant plus de 24 heures.
> - Supprimer les commentaires négatifs au lieu d''y répondre calmement.
> - Utiliser des photos ou des musiques trouvées sur Internet sans en avoir le droit.
> - Accepter de gérer une page sans accès officiel (en se connectant avec le mot de passe personnel du client).

> [!retenir]
> - Un community manager transforme des abonnés en clients fidèles.
> - 6 tâches : planifier, créer, publier, répondre, animer, mesurer.
> - À Madagascar, Facebook et Messenger d''abord ; les autres réseaux selon le client.
> - Programmer à l''avance protège des coupures ; des horaires de réponse clairs rassurent le client.

## Exercice pratique : analyser 3 pages

> [!exercice] Exercice pratique · 45 minutes
> 1. Choisissez 3 pages Facebook de commerces malgaches (une boutique, un restaurant, un service).
> 2. Pour chacune, notez : le nombre d''abonnés, la date de la dernière publication, le nombre moyen de réactions sur les 5 dernières publications.
> 3. Envoyez un message à chaque page avec une vraie question (« Livrez-vous à Ivato ? ») et notez le temps de réponse.
> 4. Pour chaque page, écrivez 3 améliorations précises (exemple : « publier le menu du jour chaque matin à 10 h »).
>
> **À livrer** : un tableau des 3 pages avec vos observations et vos 9 améliorations. Gardez-le : ces pages sont peut-être vos futurs clients (module 5).', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-f', 0, 0, 'Quel est le rôle principal d''un community manager ?', '["Publier le plus de photos possible","Supprimer les commentaires négatifs","Transformer des abonnés en clients fidèles","Créer le logo de la marque"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-f', 0, 1, 'Pour la plupart des commerces à Madagascar, quel réseau vient en premier ?', '["Facebook et Messenger","X (Twitter)","LinkedIn","Pinterest"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-f', 0, 2, 'Comment éviter qu''une coupure d''électricité empêche une publication ?', '["Publier uniquement le soir","Programmer les publications à l''avance","Ne publier que des stories","Publier depuis un cybercafé"]'::jsonb, 1);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('mkt-0-f', 1, 'Les bases : cible, ligne éditoriale et écriture', 'La fiche client type, la ligne éditoriale en 5 points, les 4 types de publications et la structure d''un bon texte.', 'Avant de publier, il faut savoir **à qui** on parle, **quoi** dire et **quand** le dire. Ce module vous donne les bases que tout client attend d''un community manager : la cible, la ligne éditoriale, les types de publications qui marchent et l''écriture pour les réseaux sociaux.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Décrire la cible d''une marque avec une fiche « client type ».
> 2. Rédiger une ligne éditoriale en 5 points.
> 3. Utiliser la règle des 4 types de publications.
> 4. Écrire une publication avec une accroche et un appel à l''action.
> 5. Choisir le bon format et le bon moment pour publier.

## Connaître la cible

On ne parle pas de la même façon à une étudiante de 20 ans et à un directeur d''hôtel. La **cible**, c''est le groupe de personnes que la marque veut toucher.

> [!definition] Persona (client type)
> Une description imaginaire mais réaliste d''un client typique : âge, ville, métier, habitudes, problèmes, ce qui le décide à acheter. On lui donne un prénom pour s''en souvenir.

### Construire une fiche client type en 6 questions

1. Qui est-il ? (âge, ville, métier)
2. Que fait-il sur les réseaux sociaux, et à quelle heure ?
3. Quel problème veut-il résoudre ?
4. Qu''est-ce qui le fait hésiter à acheter ? (prix, confiance, livraison)
5. Qu''est-ce qui le décide ? (promotion, avis d''autres clients, rapidité)
6. Quels mots utilise-t-il ? (français, malagasy, mélange des deux)

> [!exemple] Fiche client type d''une boutique de cosmétiques à Antananarivo
> **Fara, 24 ans**, employée de bureau à Ankorondrano. Elle regarde Facebook et TikTok le soir après 19 h. Elle veut des produits efficaces pour sa peau mais a peur des contrefaçons. Elle achète si elle voit des avis de vraies clientes et si la livraison est rapide. Elle écrit en français mêlé de malagasy.

## La ligne éditoriale

La ligne éditoriale, c''est **la règle du jeu** de la page : ce qu''on publie, comment on le dit, et ce qu''on ne publie jamais. Elle garantit que la page reste cohérente, même si plusieurs personnes y travaillent.

### Les 5 points d''une ligne éditoriale

1. **L''objectif** de la page (faire connaître, vendre, informer).
2. **Les thèmes** abordés (produits, conseils, coulisses, avis clients).
3. **Le ton** : tutoiement ou vouvoiement, sérieux ou amical, avec ou sans emojis.
4. **La langue** : français, malagasy, anglais, ou mélange.
5. **Les interdits** : sujets politiques, religion, critiques des concurrents, prix non validés.

## La règle des 4 types de publications

Une page qui ne publie que des promotions lasse vite ses abonnés. Variez entre 4 types :

| N° | Type | But | Exemple pour un restaurant |
| --- | --- | --- | --- |
| 1 | **Informer** | Donner une info utile | « Nouveaux horaires : ouvert jusqu''à 22 h le samedi » |
| 2 | **Divertir** | Faire sourire, créer un lien | Vidéo du cuisinier qui prépare un romazava |
| 3 | **Prouver** | Rassurer avec des faits | Photo d''un client satisfait, avis 5 étoiles |
| 4 | **Vendre** | Pousser à l''achat | « Menu du jour à 12 000 Ar, livraison offerte dès 2 plats » |

Une bonne répartition pour commencer : **environ 1 publication de vente sur 3 ou 4**.

## Écrire pour les réseaux sociaux

Sur un téléphone, une personne décide en 2 secondes si elle lit ou si elle passe. Votre texte doit être construit pour ça.

### La structure d''une bonne publication

1. **L''accroche** (1 ligne) : une question, un chiffre ou une promesse. C''est la seule ligne visible avant « Voir plus ».
2. **Le corps** (2 à 5 lignes courtes) : l''information utile, avec des retours à la ligne.
3. **L''appel à l''action** : ce que le lecteur doit faire maintenant.
4. **Les informations pratiques** : prix, adresse, numéro, lien.

> [!exemple] Publication pour une boutique de chaussures
> 👟 Vos pieds vous font mal le soir ?
>
> Nos baskets légères arrivent enfin à Analakely.
> Semelle souple, tailles 36 à 45, 4 couleurs.
>
> 👉 Envoyez « BASKET » en message pour réserver votre paire.
> 💰 85 000 Ar · 🚚 Livraison à Tana sous 24 h

> [!definition] Appel à l''action
> La phrase qui dit au lecteur quoi faire : « Envoyez-nous un message », « Commentez avec votre taille », « Réservez au 034… ». Sans appel à l''action, le lecteur aime la publication… et passe à autre chose.

## Formats et moments de publication

| Format | Points forts | Conseil |
| --- | --- | --- |
| Photo ou visuel | Rapide à produire | Un seul message par visuel, texte lisible sur téléphone |
| Carrousel (plusieurs images) | Montre plusieurs produits ou étapes | 3 à 7 images, la première doit donner envie de faire défiler |
| Vidéo courte (Reel, TikTok) | Souvent la plus vue | 15 à 45 secondes, l''essentiel dans les 3 premières secondes |
| Story | Contact quotidien, urgence | Coulisses, sondages, promotions de 24 h |
| Direct (live) | Forte proximité, ventes en direct | Annoncez-le 2 jours avant |

Il n''existe pas d''heure magique valable pour tout le monde. Méthode :

1. Commencez avec les moments où votre cible est sur son téléphone (souvent midi et après 18 h).
2. Après 4 semaines, regardez les statistiques (module 3) et gardez les heures qui marchent le mieux.

> [!madagascar]
> Beaucoup d''abonnés malgaches ont des forfaits de données limités. Préférez des vidéos courtes et légères, et mettez toujours l''information principale dans le texte : certains ne chargent pas la vidéo.

> [!attention] Erreurs fréquentes des débutants
> - Écrire de longs paragraphes sans retour à la ligne.
> - Oublier le prix : c''est la question n° 1 en commentaire.
> - Utiliser 15 hashtags qui n''ont rien à voir avec le contenu.
> - Publier 5 fois un jour, puis rien pendant 2 semaines.

> [!retenir]
> - Sachez à qui vous parlez : faites une fiche client type.
> - La ligne éditoriale fixe les thèmes, le ton, la langue et les interdits.
> - Variez : informer, divertir, prouver, vendre.
> - Accroche, corps court, appel à l''action, infos pratiques.

## Exercice pratique : la base d''une page

> [!exercice] Exercice pratique · 1 heure
> 1. Choisissez une des 3 pages analysées au module 1 (ou un commerce imaginaire : « Snack Mofo Gasy, à Antsirabe »).
> 2. Rédigez sa fiche client type (les 6 questions).
> 3. Rédigez sa ligne éditoriale (les 5 points).
> 4. Écrivez 4 publications, une de chaque type (informer, divertir, prouver, vendre), avec accroche et appel à l''action.
>
> **À livrer** : un document avec la fiche, la ligne éditoriale et les 4 textes.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-f', 1, 0, 'Quels sont les 4 types de publications à alterner ?', '["Photos, vidéos, textes, liens","Informer, divertir, prouver, vendre","Matin, midi, soir, nuit","Vendre, vendre, vendre, informer"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-f', 1, 1, 'Quelle partie d''une publication doit donner envie de cliquer sur « Voir plus » ?', '["L''accroche, la première ligne","La signature","Les hashtags","Le numéro de téléphone"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-f', 1, 2, 'Qu''est-ce qu''un appel à l''action ?', '["Une publicité payée","Un emoji en fin de texte","Un appel téléphonique au client","La phrase qui dit au lecteur quoi faire maintenant"]'::jsonb, 3);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('mkt-0-f', 2, 'Les outils : Meta Business Suite, Canva, et les outils payants', 'Accès professionnel à la page, programmation, boîte de réception, visuels Canva, statistiques, puis Canva Pro, Metricool et Hootsuite.', 'Un community manager efficace n''est pas sur son téléphone toute la journée : il utilise les bons outils pour préparer, programmer, répondre et mesurer. Ce module vous fait prendre en main les outils gratuits indispensables, puis vous présente les outils payants que demandent les clients plus importants.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Obtenir un accès professionnel à la page d''un client, sans son mot de passe.
> 2. Programmer une semaine de publications dans Meta Business Suite.
> 3. Gérer les messages et les commentaires dans une seule boîte de réception.
> 4. Créer un visuel aux bonnes dimensions avec Canva.
> 5. Lire les 4 statistiques essentielles.
> 6. Savoir quand passer à Canva Pro, Metricool ou Hootsuite.

## Les outils gratuits indispensables

| N° | Outil | À quoi il sert |
| --- | --- | --- |
| 1 | **Meta Business Suite** (ordinateur et application) | Programmer sur Facebook et Instagram, répondre aux messages, voir les statistiques |
| 2 | **Canva** (version gratuite) | Créer visuels, carrousels et stories à partir de modèles |
| 3 | **CapCut** (version gratuite) | Monter des vidéos courtes avec sous-titres |
| 4 | **Google Sheets** | Calendrier éditorial partagé avec le client |
| 5 | **WhatsApp Business** | Faire valider les contenus, échanger avec le client |

## Obtenir un accès professionnel à la page

Ne demandez **jamais** le mot de passe Facebook personnel d''un client. C''est risqué pour lui (son compte peut être bloqué pour connexion suspecte) et pour vous (on peut vous accuser en cas de problème).

### La bonne méthode

1. Le client ouvre les **paramètres de sa page** (ou son portefeuille business dans Meta Business Suite).
2. Il va dans la partie **accès à la page** (les noms des menus changent parfois : cherchez « Accès » ou « Personnes »).
3. Il vous ajoute avec votre propre compte Facebook ou votre adresse e-mail.
4. Il choisit les droits : pour commencer, un accès qui permet de **publier, répondre aux messages et voir les statistiques**, sans contrôle total de la page.
5. Vous acceptez l''invitation reçue par notification ou par e-mail.

> [!attention]
> Activez la **double authentification** sur votre propre compte Facebook. Si votre compte est piraté, ce sont les pages de tous vos clients qui sont en danger.

## Programmer une semaine dans Meta Business Suite

1. Ouvrez Meta Business Suite et choisissez la page du client.
2. Cliquez sur **Créer une publication**.
3. Cochez Facebook et, si la page est reliée, Instagram.
4. Ajoutez le texte et le visuel ou la vidéo.
5. Vérifiez l''aperçu sur téléphone (le texte coupé après 2 ou 3 lignes est-il accrocheur ?).
6. Au lieu de « Publier », choisissez **Programmer**, puis la date et l''heure.
7. Recommencez pour les autres publications de la semaine.
8. Ouvrez le **Planificateur** (calendrier) : vous voyez toute la semaine d''un coup d''œil.

> [!astuce]
> Programmez le lundi matin toute la semaine du client. Le reste de la semaine, vous ne faites plus que répondre, animer et ajuster.

## Répondre aux messages et aux commentaires

La **boîte de réception** de Meta Business Suite regroupe Messenger, les commentaires Facebook et les messages Instagram.

### Les 3 réglages à faire dès le premier jour

1. **Message d''accueil** : envoyé automatiquement au premier message d''un client (« Bonjour et merci ! Que pouvons-nous faire pour vous ? »).
2. **Réponses enregistrées** : des réponses prêtes pour les questions fréquentes (prix, livraison, adresse, horaires).
3. **Questions fréquentes** proposées au client : il clique et reçoit la réponse tout de suite.

### Répondre à un commentaire négatif en 4 étapes

1. **Remerciez** pour le retour, même s''il est désagréable.
2. **Reconnaissez** le problème sans vous disputer.
3. **Proposez** de continuer en message privé.
4. **Réglez** le problème en privé, puis remerciez en public si le client est satisfait.

> [!exemple] Réponse à « Commande jamais reçue, arnaque !!! »
> « Bonjour Hery, merci de nous avoir signalé ce problème et désolés pour l''attente. Nous vous écrivons en message privé pour retrouver votre commande tout de suite. »

Ne supprimez un commentaire que s''il contient des insultes, des données personnelles ou une arnaque (faux lien, faux concours).

## Créer des visuels avec Canva

| Format | Dimensions (en pixels) |
| --- | --- |
| Publication carrée (Facebook, Instagram) | 1080 × 1080 |
| Publication verticale (Instagram, Facebook) | 1080 × 1350 |
| Story, Reel, TikTok | 1080 × 1920 |
| Couverture de page Facebook | environ 1640 × 624 (à vérifier, Facebook change parfois) |

### Créer un visuel en 6 étapes

1. Dans Canva, choisissez la bonne taille (ou « Taille personnalisée »).
2. Partez d''un modèle, puis remplacez **toutes** les couleurs et polices par celles de la marque.
3. Gardez **un seul message** par visuel, en gros caractères.
4. Ajoutez le logo, petit, dans un coin.
5. Vérifiez la lisibilité en réduisant le zoom à la taille d''un téléphone.
6. Téléchargez en **PNG** pour un visuel avec texte, en **MP4** pour une animation.

## Les 4 statistiques essentielles

| N° | Statistique | Ce qu''elle dit |
| --- | --- | --- |
| 1 | **Couverture** (nombre de personnes touchées) | Combien de personnes différentes ont vu le contenu |
| 2 | **Interactions** (réactions, commentaires, partages) | Si le contenu intéresse vraiment |
| 3 | **Taux d''interaction** | Interactions ÷ couverture × 100 : permet de comparer deux publications |
| 4 | **Messages reçus** | Le signe le plus proche d''une vente |

> [!exemple] Calcul du taux d''interaction
> Une publication touche 2 000 personnes et reçoit 80 réactions, commentaires et partages. Taux d''interaction : 80 ÷ 2 000 × 100 = **4 %**.

## Quand passer aux outils payants ?

| Outil payant | Ce qu''il apporte | Quand le prendre |
| --- | --- | --- |
| **Canva Pro** | Kit de marque (couleurs, polices, logos enregistrés), suppression d''arrière-plan, redimensionnement en un clic, plus de modèles et d''images | Dès que vous gérez plusieurs clients chaque semaine |
| **Metricool** | Programmation sur plusieurs réseaux (dont TikTok et LinkedIn), rapports automatiques, analyse des concurrents | Quand un client est présent sur 3 réseaux ou plus |
| **Hootsuite** | Gestion de nombreux comptes, travail en équipe, validations | Pour les agences et les gros clients |

Les prix changent souvent : vérifiez-les sur le site officiel de chaque outil. Certains clients ou agences vous donneront un accès à **leur** abonnement : demandez-le avant d''en acheter un.

> [!madagascar]
> Ces abonnements se paient par carte bancaire internationale, en euros ou en dollars. Si vous n''en avez pas, vérifiez auprès de votre banque les cartes utilisables pour les paiements en ligne, ou faites intégrer l''outil dans le prix payé par le client.

> [!retenir]
> - Jamais le mot de passe du client : un accès à la page avec vos droits.
> - Programmez la semaine dans Meta Business Suite.
> - Message d''accueil, réponses enregistrées et réponse calme aux critiques.
> - Bonnes dimensions dans Canva, un seul message par visuel.
> - 4 chiffres à suivre : couverture, interactions, taux d''interaction, messages.

## Exercice pratique : une semaine programmée

> [!exercice] Exercice pratique · 1 heure 30
> 1. Créez une page Facebook d''essai pour votre commerce de l''exercice 2 (vous pourrez la supprimer ensuite).
> 2. Dans Canva, créez 3 visuels : un carré, un vertical et une story, aux couleurs de la marque.
> 3. Dans Meta Business Suite, programmez 3 publications sur la semaine avec vos textes du module 2.
> 4. Réglez un message d''accueil et 3 réponses enregistrées (prix, livraison, adresse).
> 5. Faites une capture d''écran du planificateur.
>
> **À livrer** : vos 3 visuels, la capture du planificateur et le texte de vos 3 réponses enregistrées.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-f', 2, 0, 'Comment obtenir l''accès à la page d''un client ?', '["Vous créez une nouvelle page à son nom","Le client vous ajoute dans les accès de sa page avec votre propre compte","Vous utilisez le compte d''un ami","Le client vous donne son mot de passe Facebook"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-f', 2, 1, 'Une publication touche 2 000 personnes et reçoit 80 interactions. Quel est le taux d''interaction ?', '["0,4 %","4 %","40 %","25 %"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-f', 2, 2, 'Quelle est la première étape face à un commentaire négatif ?', '["Bloquer la personne","Répondre que c''est faux","Remercier pour le retour","Supprimer le commentaire"]'::jsonb, 2);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('mkt-0-f', 3, 'Premier projet : gérer une page pendant un mois', 'Audit en 8 points, objectifs chiffrés, calendrier éditorial, jeu-concours, suivi quotidien et rapport mensuel.', 'Il est temps de tout assembler. Dans ce module, vous gérez une page de A à Z pendant un mois, comme pour un vrai client : audit de départ, objectifs, calendrier éditorial, création, animation, puis rapport. C''est ce projet qui deviendra la pièce maîtresse de votre portfolio.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Faire l''audit d''une page en 8 points.
> 2. Fixer des objectifs chiffrés et réalistes.
> 3. Construire un calendrier éditorial d''un mois.
> 4. Organiser un jeu-concours qui respecte les règles.
> 5. Rédiger un rapport mensuel clair pour le client.

## Le cas pratique : « Lamba Soa »

> [!exemple] Votre client
> **Lamba Soa** est une petite boutique de vêtements pour femmes à Antananarivo (Behoririka). Elle vend sur Facebook depuis 2 ans : 3 200 abonnés, une publication par semaine environ, des photos prises au téléphone. La gérante, Mme Voahangy, répond aux messages quand elle peut. Elle veut **plus de commandes par Messenger** et vous confie sa page pour un mois.

## L''audit de départ en 8 points

Avant de changer quoi que ce soit, notez la situation de départ. Sans ces chiffres, vous ne pourrez pas prouver vos résultats.

1. **Photo de profil et couverture** : nettes, à jour, avec le logo ?
2. **Informations** : adresse, horaires, numéro, zone de livraison complets ?
3. **Fréquence** : combien de publications sur les 30 derniers jours ?
4. **Interactions** : moyenne des réactions et commentaires par publication.
5. **Messages** : combien reçus le mois dernier ? Délai moyen de réponse ?
6. **Contenus qui marchent** : les 3 publications les plus réussies, et pourquoi.
7. **Avis et commentaires négatifs** : y en a-t-il sans réponse ?
8. **Concurrents** : 2 boutiques comparables, ce qu''elles font mieux.

## Fixer des objectifs chiffrés

Un objectif utile est **précis, mesurable et réaliste** en un mois.

| Mauvais objectif | Bon objectif |
| --- | --- |
| « Plus de visibilité » | « Passer de 4 à 12 publications par mois » |
| « Plus de clients » | « Passer de 40 à 60 messages reçus dans le mois » |
| « Être plus pro » | « Répondre à tous les messages en moins de 2 heures entre 8 h et 20 h » |

Pour Lamba Soa, retenez 3 objectifs maximum. Ne promettez jamais un nombre de ventes : vous ne contrôlez ni les prix, ni le stock, ni la livraison.

## Le calendrier éditorial du mois

Le calendrier éditorial est un tableau (Google Sheets) partagé avec le client.

| Date | Heure | Réseau | Type | Sujet | Visuel | Statut |
| --- | --- | --- | --- | --- | --- | --- |
| Lun 3 | 18 h 30 | Facebook + Instagram | Vendre | Nouvelle collection de robes | Carrousel 5 photos | Validé |
| Mer 5 | 12 h 15 | Facebook | Prouver | Avis d''une cliente avec photo | Visuel carré | À valider |
| Ven 7 | 19 h | Facebook + Instagram | Divertir | Vidéo « 3 façons de porter un lamba » | Reel 30 s | En création |

### Construire le mois en 5 étapes

1. Notez les **dates importantes** du mois : fête des mères, rentrée, fête de l''Indépendance (26 juin), fêtes de fin d''année, jours de paie.
2. Fixez le **rythme** : par exemple 3 publications par semaine et des stories tous les jours.
3. Répartissez les **4 types** de publications (environ 1 vente sur 3 ou 4).
4. Remplissez sujet et format pour chaque date.
5. Envoyez le calendrier au client **avant le début du mois** pour validation.

> [!astuce] Préparer les photos en une séance
> Demandez à la boutique une séance photo de 2 heures par mois : 30 à 40 photos des nouveaux articles, à la lumière du jour, devant un fond uni. Vous avez ainsi la matière de tout le mois.

## Animer : le jeu-concours

Un jeu-concours bien fait attire de nouveaux abonnés et crée de l''activité. Mal fait, il attire des chasseurs de cadeaux qui n''achèteront jamais.

### Organiser un jeu-concours en 6 étapes

1. Choisissez un **lot lié à la marque** (un bon d''achat de 50 000 Ar chez Lamba Soa, pas un téléphone).
2. Écrivez des **règles simples** : comment participer, date de fin, date du tirage, zone de livraison du lot.
3. Demandez une **participation utile** : commenter avec sa robe préférée, par exemple.
4. Respectez les **règles de Meta** : ne demandez pas de partager sur son propre profil ni d''identifier des amis comme condition obligatoire (consultez les règles à jour des pages Facebook).
5. Tirez au sort **de façon transparente** (outil de tirage, vidéo du tirage).
6. Annoncez le gagnant et montrez la remise du lot (photo, avec son accord).

## Pendant le mois : le suivi quotidien

Chaque jour, prévoyez 30 minutes à 1 heure :

1. Répondre à tous les messages et commentaires.
2. Publier 1 ou 2 stories (nouveautés, coulisses, sondage).
3. Noter les questions qui reviennent (elles donnent des idées de publications).
4. Signaler au client les demandes urgentes (réclamation, grosse commande).

## Le rapport mensuel

Le rapport montre au client ce que vous avez fait et ce que ça a donné. Une à deux pages suffisent.

### Les 6 parties du rapport

1. **Résumé** en 3 lignes : les résultats principaux.
2. **Chiffres clés** comparés au mois précédent (tableau).
3. **Les 3 meilleures publications**, avec la raison de leur succès.
4. **Ce qui a moins marché**, et pourquoi selon vous.
5. **Ce que disent les clients** : questions fréquentes, remarques.
6. **Propositions pour le mois suivant** : 3 actions concrètes.

| Indicateur | Mois précédent | Ce mois-ci | Évolution |
| --- | --- | --- | --- |
| Publications | 4 | 13 | +9 |
| Couverture totale | 6 500 | 15 200 | +134 % |
| Messages reçus | 40 | 63 | +58 % |
| Délai moyen de réponse | 9 h | 1 h 30 | divisé par 6 |

*(Chiffres donnés en exemple.)*

> [!attention] Erreurs fréquentes des débutants
> - Ne pas noter les chiffres de départ : impossible ensuite de montrer un progrès.
> - Publier sans validation du client (prix, stock, promotions).
> - Un rapport rempli de chiffres sans explication.
> - Cacher les résultats décevants : expliquez-les et proposez une solution.

> [!retenir]
> - Toujours commencer par un audit chiffré.
> - 3 objectifs précis, mesurables et réalistes.
> - Un calendrier validé par le client avant le début du mois.
> - Un jeu-concours avec un lot lié à la marque et des règles claires.
> - Un rapport court : résultats, explications, propositions.

## Exercice pratique : le mois de Lamba Soa

> [!exercice] Exercice pratique · 3 heures
> 1. Faites l''audit en 8 points d''une vraie page de boutique de vêtements (ou de la page analysée au module 1).
> 2. Fixez 3 objectifs chiffrés pour un mois.
> 3. Construisez le calendrier éditorial complet du mois dans Google Sheets (12 publications au minimum).
> 4. Créez dans Canva les visuels des 4 premières publications et écrivez leurs textes.
> 5. Rédigez le règlement d''un jeu-concours.
> 6. Rédigez un modèle de rapport mensuel avec des chiffres d''exemple.
>
> **À livrer** : l''audit, le calendrier, les 4 publications, le règlement et le modèle de rapport. C''est votre projet de portfolio.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-f', 3, 0, 'Pourquoi faire un audit chiffré avant de commencer ?', '["Pour fixer le prix des produits","Parce que Facebook l''exige","Pour critiquer l''ancien gestionnaire","Pour pouvoir prouver ensuite les progrès"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-f', 3, 1, 'Lequel est un bon objectif ?', '["Doubler les ventes à coup sûr","Devenir la page la plus connue de Madagascar","Passer de 40 à 60 messages reçus dans le mois","Avoir plus de visibilité"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-f', 3, 2, 'Quel lot choisir pour un jeu-concours ?', '["Un lot lié à la marque, comme un bon d''achat","Aucun lot","De l''argent liquide","Le lot le plus cher possible, même sans lien avec la marque"]'::jsonb, 0);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('mkt-0-f', 4, 'Trouver des clients et se faire payer', 'Portfolio et étude de cas, 5 canaux de prospection, forfaits mensuels, accord de collaboration et paiements.', 'Le grand avantage du community management, c''est qu''il se vend **au mois** : un client satisfait vous paie tous les mois, parfois pendant des années. Ce dernier module vous montre comment présenter votre travail, trouver vos premiers clients, fixer des forfaits mensuels, signer un accord clair et vous faire payer.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Présenter un portfolio de community manager convaincant.
> 2. Trouver des clients grâce à 5 canaux, avec un message de prospection prêt à l''emploi.
> 3. Calculer un forfait mensuel et proposer 3 formules.
> 4. Rédiger un accord de collaboration simple.
> 5. Vous faire payer en local et depuis l''étranger.
> 6. Garder vos clients longtemps.

## Le portfolio : prouver par des résultats

Un client n''achète pas « des publications », il achète des **résultats**. Votre portfolio doit les montrer.

### Les 4 éléments d''un bon portfolio

1. **Une étude de cas** complète : le projet Lamba Soa du module 4 (audit, objectifs, calendrier, visuels, rapport), présenté en 3 à 5 pages.
2. **6 à 9 exemples de publications** : visuels et textes, avec le type (informer, divertir, prouver, vendre).
3. **Des chiffres**, même modestes : « +58 % de messages en un mois ». Indiquez « projet d''étude » pour les exercices.
4. **Votre propre page professionnelle** bien tenue : c''est la première chose que le client regardera.

Présentez le tout dans un **PDF léger** (moins de 5 Mo) à envoyer par WhatsApp, et sur une page en ligne (Behance, Canva site web ou Google Drive en lecture seule).

## Où trouver des clients : 5 canaux

| N° | Canal | Pour qui | Comment s''y prendre |
| --- | --- | --- | --- |
| 1 | Commerces de votre entourage | Premiers clients, paiement en ariary | Montrez-leur 3 améliorations précises de leur page (exercice du module 1) |
| 2 | Groupes Facebook d''entrepreneurs malgaches | Boutiques en ligne, restaurants | Publiez un conseil utile chaque semaine, avec un exemple avant/après |
| 3 | LinkedIn | PME, hôtels, ONG, agences | Profil clair « Community manager freelance », messages personnalisés |
| 4 | Plateformes de freelance (Fiverr, Upwork, plateformes francophones) | Clients étrangers | Offre précise : « Gestion de votre page Facebook : 12 publications par mois » ; vérifiez que la plateforme accepte les freelances basés à Madagascar |
| 5 | Agences de communication | Sous-traitance régulière | Proposez de prendre en charge la modération et la programmation |

### Le message de prospection, prêt à l''emploi

> [!exemple] Message à une boutique (Messenger ou WhatsApp)
> « Bonjour Madame, je suis community manager à Antananarivo. Je suis votre page depuis quelque temps : vos robes sont très belles, mais j''ai remarqué que plusieurs questions sur les prix restent sans réponse en commentaire. Je peux m''occuper de vos publications et répondre à vos clients chaque jour, pour que vous ne perdiez plus de ventes. Voici un exemple de mon travail : [lien]. Seriez-vous disponible pour un appel de 10 minutes cette semaine ? »

Les règles d''or : **personnalisé**, **court**, **un problème précis**, **un exemple**, **une proposition**. Envoyez 5 messages bien préparés par jour plutôt que 50 copiés-collés.

## Calculer son forfait mensuel

### Étape 1 : votre prix horaire

1. Fixez votre **revenu mensuel visé** (exemple : 1 200 000 Ar).
2. Estimez vos **heures facturables** par mois, sans compter la prospection et la formation (exemple : 80 h).
3. **Divisez** : 1 200 000 ÷ 80 = 15 000 Ar de l''heure.

### Étape 2 : le temps par client

Reprenez la semaine type du module 1 : pour une petite page, environ 7 à 9 heures par semaine, soit **30 à 35 heures par mois**. Un forfait plus léger demande moins d''heures.

### Étape 3 : 3 formules

| Formule | Contenu | Temps estimé par mois | Exemple de prix |
| --- | --- | --- | --- |
| **Essentiel** | 8 publications, réponses aux messages en semaine | 12 h | 180 000 Ar |
| **Standard** | 12 publications, stories, réponses 7 jours sur 7, rapport mensuel | 22 h | 330 000 Ar |
| **Complet** | 16 publications dont 4 vidéos, jeu-concours, 2 réseaux, rapport détaillé | 35 h | 525 000 Ar |

Ces prix sont des **exemples** calculés avec 15 000 Ar de l''heure : adaptez-les à votre niveau et à vos clients. Pour les clients étrangers, fixez un prix en euros ou en dollars adapté à leur marché.

> [!attention]
> Le **budget de publicité** payée (boost, publicités Facebook) n''est **jamais** compris dans votre forfait. Il est payé directement par le client à Meta, avec sa propre carte.

## L''accord de collaboration

Un simple document de 1 page, signé ou validé par écrit (e-mail, WhatsApp), évite la plupart des conflits.

### Ce qu''il contient

1. Les noms et coordonnées des deux parties.
2. Les **réseaux** gérés et le **nombre de publications** par mois.
3. Les **horaires de réponse** aux messages.
4. Ce que le client fournit : photos, informations sur les prix et le stock, validation sous 48 h.
5. Ce qui n''est **pas** inclus : budget publicitaire, séances photo, création de logo.
6. Le **prix mensuel**, payé **au début du mois**.
7. La **durée** (exemple : 3 mois pour commencer) et le **préavis** pour arrêter (exemple : 15 jours).

> [!astuce]
> Proposez un premier engagement de **3 mois** : il faut souvent plusieurs semaines pour que les résultats se voient. Un client qui part après 2 semaines n''a pas eu le temps de voir votre travail.

## Se faire payer depuis Madagascar

| Situation | Moyens de paiement |
| --- | --- |
| Client local | Mobile Money (MVola, Orange Money, Airtel Money) ou virement bancaire, au début de chaque mois |
| Plateforme internationale | Retrait selon la plateforme : souvent Payoneer ou virement vers une banque malgache |
| Client étranger en direct | Virement international ou Payoneer |

> [!madagascar]
> Les possibilités de PayPal sont limitées pour Madagascar : vérifiez avant de le proposer. Gardez une trace de **chaque paiement** (capture du SMS, relevé) pour votre comptabilité et vos impôts.

## Garder ses clients longtemps

1. **Envoyez le rapport à date fixe**, chaque mois, même quand les chiffres sont moyens.
2. **Proposez une idée nouvelle** chaque mois (un format vidéo, un jeu, un partenariat).
3. **Prévenez avant les problèmes** : une absence, une coupure longue, un retard.
4. **Demandez un avis** après 2 ou 3 mois réussis, et une recommandation : « Connaissez-vous un autre commerçant qui aurait besoin d''aide ? »

> [!retenir]
> - Un portfolio avec une étude de cas et des chiffres.
> - Prospection : personnalisée, courte, un problème précis, une proposition.
> - Forfait mensuel = heures par mois × prix horaire ; proposez 3 formules.
> - Un accord écrit : contenu, horaires, prix payé en début de mois, durée, préavis.
> - Le budget publicitaire n''est jamais dans votre forfait.

## Exercice pratique : votre offre

> [!exercice] Exercice pratique · 1 heure 30
> 1. Calculez votre prix horaire avec **vos** chiffres.
> 2. Créez vos 3 formules (Essentiel, Standard, Complet) avec contenu et prix.
> 3. Rédigez votre accord de collaboration type (les 7 points).
> 4. Présentez votre projet Lamba Soa en étude de cas de 3 pages dans Canva.
> 5. Écrivez un message de prospection personnalisé pour chacune des 3 pages analysées au module 1, et envoyez-en au moins un pour de vrai.
>
> **À livrer** : votre calcul, vos 3 formules, l''accord type, l''étude de cas et vos 3 messages.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-f', 4, 0, 'Comment calculer un forfait mensuel ?', '["Heures par mois × prix horaire","Prendre le prix d''un concurrent","Demander au client ce qu''il veut payer","Nombre d''abonnés × 100 Ar"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-f', 4, 1, 'Le budget de publicité payée est-il compris dans votre forfait ?', '["Non, le client le paie directement à Meta","Oui, toujours","Oui, si le client le demande","Seulement le premier mois"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-f', 4, 2, 'Quand se faire payer un forfait mensuel ?', '["Seulement si les résultats sont bons","Au début du mois","Quand le client y pense","À la fin de l''année"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Quel est le rôle principal d''un community manager ?', '["Gérer la comptabilité du client","Transformer des abonnés en clients fidèles","Créer le site web de la marque","Publier le plus de photos possible"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Pour un débutant, combien de petites pages est-il réaliste de gérer en même temps ?', '["Une seule, toute l''année","Plus de 50","3 à 5","20 à 30"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Que regroupe la boîte de réception de Meta Business Suite ?', '["Seulement les e-mails","Seulement WhatsApp","Messenger, commentaires Facebook et messages Instagram","Les appels téléphoniques"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Pourquoi activer la double authentification sur votre compte Facebook ?', '["Pour publier plus vite","Pour protéger les pages de vos clients si votre compte est attaqué","C''est inutile","Pour avoir plus d''abonnés"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Qu''est-ce qu''une fiche client type (persona) ?', '["Une fiche de paie","La description réaliste d''un client typique de la marque","La liste des clients qui ont payé","Le contrat avec le client"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Que fixe la ligne éditoriale ?', '["Les horaires d''ouverture du magasin","Les thèmes, le ton, la langue et les interdits de la page","Le nombre d''abonnés à atteindre","Le prix des produits"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Pour commencer, quelle part des publications devrait servir à vendre ?', '["9 sur 10","Environ 1 sur 3 ou 4","Aucune","Toutes"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Quelle information est la question n° 1 en commentaire et ne doit pas être oubliée ?', '["La date de création de la boutique","La météo","Le nom du community manager","Le prix"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Quelles dimensions pour une story ou un Reel ?', '["1080 × 1080 pixels","1920 × 1080 pixels","500 × 500 pixels","1080 × 1920 pixels"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Quelles dimensions pour une publication carrée ?', '["4000 × 1000 pixels","1080 × 1080 pixels","300 × 600 pixels","1080 × 1920 pixels"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Que mesure la couverture ?', '["La taille de la photo de couverture","Le nombre de commentaires","Le nombre de personnes différentes qui ont vu le contenu","Le nombre de ventes"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Quelle statistique est la plus proche d''une vente ?', '["Le nombre de publications","Le nombre de « J''aime » sur la page","Les messages reçus","La couverture"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Quand peut-on supprimer un commentaire ?', '["S''il contient des insultes, des données personnelles ou une arnaque","Dès qu''il est négatif","Jamais, dans aucun cas","S''il pose une question sur le prix"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Quel outil payant aide à programmer sur plusieurs réseaux, dont TikTok et LinkedIn, avec des rapports automatiques ?', '["WhatsApp Business","Canva gratuit","Google Sheets","Metricool"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Qu''apporte surtout Canva Pro à un community manager ?', '["Des abonnés gratuits","Le kit de marque et le redimensionnement en un clic","La gestion de Messenger","La programmation des publications Facebook"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Que faut-il faire avant de modifier la page d''un nouveau client ?', '["Un audit chiffré de départ","Lancer une publicité","Supprimer les anciennes publications","Changer le nom de la page"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Pourquoi ne pas promettre un nombre de ventes au client ?', '["Vous ne contrôlez ni les prix, ni le stock, ni la livraison","Parce que c''est interdit par Meta","Parce que les ventes n''intéressent pas le client","Parce que les ventes ne se mesurent pas"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Quand envoyer le calendrier éditorial au client ?', '["Seulement s''il se plaint","Jamais, il n''a pas besoin de le voir","Après la fin du mois","Avant le début du mois, pour validation"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Que ne faut-il pas exiger dans un jeu-concours sur une page Facebook ?', '["Respecter une date de fin","Habiter dans la zone de livraison","Partager sur son propre profil comme condition obligatoire","Commenter la publication"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Que doit contenir un bon rapport mensuel ?', '["Uniquement des captures d''écran","Seulement les bons résultats","Résultats comparés, explications et propositions","La liste de toutes les publications sans chiffres"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Quel élément rend un portfolio de community manager convaincant ?', '["Votre CV scolaire","Une liste de logiciels connus","Une étude de cas avec des chiffres","Le plus grand nombre de visuels possible"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Quelle durée d''engagement proposer pour commencer ?', '["1 jour","10 ans","2 semaines","3 mois"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Qui paie le budget de publicité payée sur Facebook ?', '["Personne, c''est gratuit","Le client, directement à Meta","Le community manager, sur son forfait","Vitako"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Avec un revenu visé de 1 200 000 Ar et 80 heures facturables, quel est le prix horaire ?', '["150 000 Ar","15 000 Ar","1 500 Ar","96 000 Ar"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-f', 'Que faire pour garder un client longtemps ?', '["Baisser son prix chaque mois","Publier sans lui demander son avis","Envoyer le rapport à date fixe et proposer une idée nouvelle chaque mois","Ne lui écrire qu''en cas de problème"]'::jsonb, 2);
commit;
