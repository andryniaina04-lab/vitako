-- Fichier généré par tools/build.mjs. Ne pas modifier à la main : modifier content/ puis relancer.
-- À exécuter dans Supabase > SQL Editor après schema.sql, et à chaque mise à jour du contenu.
-- Il remplace le contenu des formations sans toucher aux comptes, paiements ni attestations.
begin;
insert into public.courses (id, job_key, job_name, level, title, hours, published) values
  ('design-0-f', 'design-0', 'Graphiste', 'f', 'Graphiste – Fondamentaux', 12, true),
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
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('design-0-f', 0, 'Le métier de graphiste freelance depuis Madagascar', 'Clients, commandes fréquentes, coupures et décalage horaire.', 'Un graphiste freelance vend des images qui aident ses clients à vendre. Depuis Madagascar, on peut servir des clients locaux et des clients à l''étranger avec le même ordinateur.

## Ce que fait un graphiste

Il traduit un message en image : un logo pour qu''on reconnaisse une marque, une affiche pour annoncer un événement, un visuel Facebook pour vendre un produit. Il ne dessine pas « joli » au hasard : chaque choix sert un objectif du client.

## Les commandes les plus fréquentes pour un débutant

- Visuels pour Facebook, Instagram et TikTok (publications, bannières, stories).
- Logos et petites identités visuelles pour commerces, restaurants, coopératives.
- Affiches, flyers, cartes de visite, menus de restaurant.
- Miniatures YouTube et couvertures de livres numériques.
- Mise en page de présentations et de catalogues.

## Qui sont les clients ?

- **À Madagascar** : commerces d''Antananarivo et des villes régionales, hôtels et agences de voyage (Nosy Be, Sainte-Marie, Morondava), ONG, associations, églises, organisateurs d''événements.
- **À l''étranger** : petites entreprises francophones (France, Belgique, Canada, La Réunion, Maurice) qui cherchent un graphiste réactif à prix raisonnable. Le français est un vrai avantage.

## Travailler à distance depuis Madagascar

Trois réalités à anticiper :

1. **Les coupures d''électricité** : gardez une batterie externe, travaillez sur des fichiers enregistrés en local et annoncez vos délais avec une marge.
2. **La connexion** : préparez vos fichiers hors ligne, envoyez-les compressés, prévoyez un forfait de données mobile en secours.
3. **Le décalage horaire** : Madagascar est à UTC+3. Pendant l''hiver européen, vous avez 2 heures d''avance sur Paris ; pendant l''été, 1 heure. Annoncez vos horaires de réponse.

## Statut

Pour facturer des clients officiellement à Madagascar, un graphiste indépendant demande en général un NIF (numéro d''identification fiscale) et une carte statistique (STAT). Renseignez-vous auprès du centre fiscal de votre ville pour les démarches à jour.

## Exercice pratique

Listez 10 clients possibles autour de vous (commerces, associations, connaissances qui vendent en ligne). Pour chacun, notez en une ligne le visuel qui l''aiderait le plus.

Exemple : « Épicerie de mon quartier : une affiche des prix de la semaine pour Facebook ».', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 0, 0, 'Quel est le rôle principal d''un graphiste ?', '["Dessiner ce qu''il trouve beau","Gérer la page Facebook du client","Imprimer des affiches","Traduire le message du client en image utile"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 0, 1, 'Quel est un vrai avantage d''un graphiste malgache pour des clients en France ?', '["Il travaille en français avec un faible décalage horaire","Il n''a pas besoin d''Internet","Il travaille gratuitement","Il n''a pas de délais"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 0, 2, 'Que faire pour limiter l''effet des coupures d''électricité ?', '["Travailler en ligne sans sauvegarde","Enregistrer en local, avoir une batterie et prévoir une marge sur les délais","Ne jamais annoncer de délai","Refuser les clients étrangers"]'::jsonb, 1);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('design-0-f', 1, 'Les fondamentaux du design', 'Hiérarchie, composition, couleur et typographie.', 'Quatre règles suffisent pour qu''un visuel ait l''air professionnel : une hiérarchie claire, une composition alignée, deux ou trois couleurs, deux polices au maximum.

## 1. La hiérarchie

Sur Facebook, on regarde un visuel moins de 3 secondes. Décidez ce que le lecteur doit lire en premier, en deuxième, en troisième. Le plus important est le plus grand ou le plus contrasté.

Exemple pour une affiche de concert : 1) le nom de l''artiste, 2) la date et le lieu, 3) le prix et le contact.

## 2. La composition

- Alignez tout sur des lignes invisibles : un élément placé au hasard paraît être une erreur.
- Gardez des marges : au moins 5 % de la largeur sur chaque bord.
- Laissez de l''espace vide autour du message principal. Le vide n''est pas du gaspillage, il guide l''œil.
- Regroupez ce qui va ensemble (date et lieu), éloignez ce qui est différent.

## 3. La couleur

- Choisissez une couleur principale, une couleur d''accent et une couleur neutre (blanc, gris, noir).
- Vérifiez le contraste : texte foncé sur fond clair, ou l''inverse. Un texte jaune sur fond blanc est illisible.
- Une couleur porte un sens : le vert évoque la nature et l''agriculture, le bleu la confiance, le rouge l''urgence et les promotions.
- Pour un client, partez de ses couleurs existantes (enseigne, uniforme, emballage).

## 4. La typographie

- Deux polices maximum : une pour les titres, une pour le texte.
- Pour le texte courant, une police simple sans empattement (exemples sur Google Fonts : Poppins, Montserrat, Open Sans).
- Titres courts, texte lisible sur un téléphone : au moins 24 px sur un visuel carré de 1080 px.
- Évitez les polices fantaisie pour les informations pratiques (prix, téléphone, adresse).

## Exercice pratique

Trouvez une affiche ou une publication Facebook d''un commerce près de chez vous. Notez ce que vous lisez en premier, combien de couleurs et de polices elle utilise, et une amélioration possible.

Refaites ensuite la même affiche sur papier en appliquant les 4 règles.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 1, 0, 'Sur une affiche de concert, que doit-on lire en premier ?', '["Les conditions de vente","Le numéro de téléphone","Le nom du graphiste","Le nom de l''artiste"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 1, 1, 'Combien de polices utiliser au maximum sur un visuel simple ?', '["Autant que possible","Une par ligne","Deux","Cinq"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 1, 2, 'Quelle combinaison est la plus lisible ?', '["Texte bleu foncé sur fond blanc","Texte rouge sur fond vert","Texte gris clair sur fond blanc","Texte jaune sur fond blanc"]'::jsonb, 0);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('design-0-f', 2, 'Les outils gratuits et payants, les formats', 'Canva, Figma, Photopea, Inkscape ; Illustrator, Photoshop, InDesign, Canva Pro ; tailles et exports.', 'Quatre outils gratuits couvrent presque toutes les commandes d''un débutant, et leurs équivalents payants prennent le relais quand les clients l''exigent. Le vrai savoir-faire est de livrer chaque visuel au bon format et à la bonne taille.

## Les outils gratuits

| Outil | Pour quoi faire | Point fort | Limite |
| --- | --- | --- | --- |
| Canva | Visuels réseaux sociaux, affiches, présentations | Très rapide, modèles prêts | Les modèles se ressemblent ; certains éléments sont payants |
| Figma | Logos simples, maquettes, visuels sur mesure | Précis, travail en ligne avec le client | Demande un peu d''apprentissage |
| Photopea | Retouche photo, détourage, montages | Fonctionne dans le navigateur, proche de Photoshop | Lent avec une connexion faible |
| Inkscape | Logos vectoriels, fichiers pour imprimeur | Installé sur l''ordinateur, marche hors ligne | Interface moins moderne |

Conseil : maîtrisez d''abord Canva pour vendre vite, puis Figma et Inkscape pour les logos.

## Les outils payants

Les agences et les clients étrangers demandent souvent des fichiers créés avec les logiciels professionnels. Connaître leurs équivalents payants vous permet de comprendre leurs demandes, puis de passer au payant quand vos revenus le justifient.

| Outil payant | Équivalent gratuit | Quand il devient utile |
| --- | --- | --- |
| Adobe Illustrator | Inkscape | Logos vectoriels ; agences et imprimeurs qui demandent des fichiers .ai |
| Adobe Photoshop | Photopea, GIMP | Retouche avancée ; fichiers .psd échangés avec les agences |
| Adobe InDesign | Canva, Scribus | Catalogues, magazines, livres de plusieurs dizaines de pages |
| Canva Pro | Canva gratuit | Kit de marque par client, suppression d''arrière-plan, redimensionnement en un clic |
| Figma (offre payante) | Figma gratuit | Nombreux projets, bibliothèques partagées avec une équipe ou un client |

**Quand passer au payant ?** Quand l''abonnement est couvert par une ou deux commandes par mois, ou quand un client exige un format précis (.ai, .psd, .indd). Avant, les outils gratuits suffisent pour vendre.

**Payer un abonnement depuis Madagascar.** Ces logiciels se paient en ligne, souvent en dollars ou en euros, par carte Visa ou Mastercard internationale. Demandez à votre banque une carte utilisable sur Internet, ou une carte prépayée virtuelle. Les prix changent souvent : vérifiez toujours le tarif sur le site officiel de l''éditeur.

**Économiser.** Profitez des essais gratuits pour un projet précis, des tarifs étudiants quand vous y avez droit, et ne prenez que le logiciel dont vous avez besoin.

**Pas de logiciels piratés.** Les versions « crackées » contiennent souvent des virus qui volent vos mots de passe et les fichiers de vos clients. Elles peuvent aussi vous faire perdre un client ou un compte sur une plateforme.

## Les formats de fichiers

- **PNG** : visuels avec texte, logos sur fond transparent, publications réseaux sociaux.
- **JPG** : photos, fichiers légers à envoyer par WhatsApp ou e-mail.
- **PDF** : documents à imprimer (affiches, flyers, cartes de visite) et devis.
- **SVG** : logos vectoriels, agrandissables sans perte de qualité.

## Les tailles courantes

| Support | Taille |
| --- | --- |
| Publication Facebook ou Instagram carrée | 1080 × 1080 px |
| Story Instagram, Facebook, TikTok | 1080 × 1920 px |
| Miniature YouTube | 1280 × 720 px |
| Couverture de page Facebook | 1640 × 624 px (texte au centre) |
| Flyer A5 imprimé | 148 × 210 mm, 300 dpi, 3 mm de fond perdu |

## Préparer un fichier pour l''imprimeur

Demandez toujours à l''imprimeur ses consignes. En général : PDF haute qualité, 300 dpi, couleurs en CMJN, 3 mm de fond perdu, aucun texte à moins de 5 mm du bord.

## Organiser ses fichiers

Un dossier par client, puis un sous-dossier par projet. Nommez les fichiers clairement, par exemple `hotel-ravinala_post-promo_v2.png`. Gardez une copie sur Google Drive en plus de l''ordinateur.

## Exercice pratique

Dans Canva, créez la même promotion « -20 % ce week-end » pour une boulangerie en trois formats : publication carrée, story et flyer A5. Exportez chaque version dans le bon format et rangez-les dans un dossier bien nommé.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 2, 0, 'Quel format pour un logo sur fond transparent destiné au web ?', '["PNG","JPG","MP4","DOCX"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 2, 1, 'Quelle taille pour une story Instagram ?', '["1280 × 720 px","1080 × 1080 px","500 × 500 px","1080 × 1920 px"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 2, 2, 'Quand devient-il utile de payer Adobe Illustrator ?', '["Dès le premier jour, avant d''avoir un client","Quand des clients ou des imprimeurs exigent des fichiers .ai et que vos revenus couvrent l''abonnement","Jamais, il est interdit à Madagascar","Seulement pour retoucher des photos"]'::jsonb, 1);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('design-0-f', 3, 'Créer un logo et une identité visuelle', 'Brief, croquis, vectorisation, pack et mini-charte.', 'Un bon logo naît d''un bon brief : on pose les questions d''abord, on dessine ensuite, et on livre un pack complet que le client peut utiliser seul.

## Les 6 étapes d''un projet de logo

1. **Le brief** : entretien de 20 minutes avec le client (questions ci-dessous).
2. **La recherche** : regardez les logos des concurrents et notez ce qui se répète, pour vous en distinguer.
3. **Les croquis** : 10 à 20 idées rapides sur papier, sans couleur.
4. **La vectorisation** : les 3 meilleures idées dans Figma ou Inkscape, en noir et blanc d''abord.
5. **La présentation** : 2 ou 3 propositions montrées en situation (enseigne, t-shirt, publication Facebook).
6. **La livraison** : après validation et paiement du solde, envoi du pack de fichiers.

## Les questions du brief

- Que vend l''entreprise et à qui ?
- Quels sont ses trois mots-clés (par exemple : naturel, local, fiable) ?
- Qui sont ses concurrents ?
- Quelles couleurs aime-t-elle, lesquelles refuse-t-elle ?
- Où le logo sera-t-il utilisé : enseigne, emballage, réseaux sociaux, broderie ?
- Quel est le budget et la date limite ?

## Les types de logos

- **Logotype** : le nom seul, dans une typographie travaillée.
- **Symbole + nom** : une icône simple à côté du nom. Le plus courant pour les commerces.
- **Emblème** : le nom à l''intérieur d''une forme (badge, cercle). Idéal pour cafés, coopératives, produits artisanaux.

## Les règles d''un logo solide

- Il reste lisible en petit (32 px) et en une seule couleur.
- Il ne copie aucun logo existant ni image trouvée sur Internet.
- Il évite les clichés trop vus (une feuille pour tout ce qui est « naturel ») sauf si on les rend originaux.

## Le pack à livrer

- Logo en couleur, en noir et en blanc.
- Formats SVG, PNG transparent, PDF.
- Une version horizontale et une version carrée (photo de profil).
- Une mini-charte d''une page : couleurs avec leurs codes (HEX pour l''écran, CMJN pour l''impression), polices, marges autour du logo, exemples d''usages interdits.

## Exercice pratique

Créez le logo de « Vanille d''Antalaha », coopérative fictive qui vend de la vanille bourbon en ligne. Faites 10 croquis, vectorisez les 2 meilleurs, puis préparez la mini-charte d''une page.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 3, 0, 'Que faut-il faire avant de dessiner un logo ?', '["Un brief avec le client","Choisir une police au hasard","Télécharger une image sur Google","Envoyer la facture finale"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 3, 1, 'Quel test un logo doit-il réussir ?', '["Contenir au moins 5 couleurs","Avoir un dégradé","Rester lisible en petit et en une couleur","Ressembler au logo du concurrent"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 3, 2, 'Quel format permet d''agrandir un logo sans perte de qualité ?', '["PNG de 200 px","JPG","SVG","GIF"]'::jsonb, 2);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('design-0-f', 4, 'Trouver des clients et se faire payer', 'Portfolio, prix, devis, acompte, Mobile Money et Payoneer.', 'Un portfolio de 6 projets, un prix calculé et un acompte de 50 % avant de commencer : c''est la base pour vivre du graphisme depuis Madagascar.

## Le portfolio

Montrez 6 projets, même fictifs au début (les exercices de cette formation comptent). Pour chacun : le besoin du client, votre solution, le résultat en situation. Publiez-le sur Behance (gratuit) et gardez une version PDF légère à envoyer par WhatsApp.

## Où trouver des clients

| Canal | Pour qui | Conseil |
| --- | --- | --- |
| Entourage et commerces locaux | Premiers clients, paiement en ariary | Proposez une amélioration concrète de leur page Facebook |
| Groupes Facebook de freelances et d''entrepreneurs malgaches | Clients locaux et diaspora | Publiez vos réalisations, pas seulement « je cherche du travail » |
| Fiverr, Upwork | Clients internationaux, souvent anglophones | Commencez par une offre très précise (ex. : « 3 visuels Instagram en 48 h ») |
| Plateformes francophones | Clients en France, Belgique, Canada | Vérifiez que la plateforme accepte les freelances basés à Madagascar |
| LinkedIn | Agences et entreprises | Contactez les agences qui sous-traitent leurs visuels |

## Calculer son prix

Ne copiez pas le prix du voisin : calculez-le.

1. Fixez votre revenu mensuel visé (exemple : 1 500 000 Ar).
2. Estimez vos heures réellement facturables par mois (exemple : 80 h, le reste part en prospection et en échanges).
3. Divisez : 1 500 000 ÷ 80 ≈ 19 000 Ar de l''heure.
4. Multipliez par le temps du projet : un logo de 8 h ≈ 150 000 Ar.

Ces chiffres sont des exemples. Pour les clients étrangers, affichez un prix en euros ou en dollars adapté à leur marché.

## Le cadre de chaque projet

- Un devis écrit : prestation, nombre de propositions, nombre de retouches incluses (2 en général), délai, prix.
- Un acompte de 50 % avant de commencer, le solde avant la livraison des fichiers finaux.
- Des aperçus en basse définition ou avec filigrane tant que le solde n''est pas payé.

## Se faire payer depuis Madagascar

- **Clients locaux** : Mobile Money (MVola, Orange Money, Airtel Money) ou virement bancaire.
- **Plateformes internationales** : retrait le plus souvent via Payoneer ou virement vers un compte bancaire malgache.
- **Clients étrangers en direct** : virement international ou Payoneer. Les possibilités de PayPal pour Madagascar sont limitées : vérifiez avant de le proposer.
- Gardez une trace de chaque paiement pour votre comptabilité et vos impôts.

## Livrer comme un professionnel

Un lien Google Drive avec les dossiers rangés, la mini-charte en PDF, un message de remerciement et une demande d''avis. Un client satisfait revient et vous recommande.

## Exercice pratique

Calculez votre prix horaire avec vos propres chiffres. Rédigez ensuite le devis du logo « Vanille d''Antalaha » du module 4 : prestation, 2 propositions, 2 retouches, délai de 7 jours, acompte de 50 %.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 4, 0, 'Quand demander l''acompte ?', '["Jamais","Seulement si le client est étranger","Avant de commencer le travail","Après la livraison des fichiers finaux"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-f', 4, 1, 'Comment calculer son prix horaire ?', '["Diviser par 2 le prix d''une agence","Prendre le prix le plus bas de Fiverr","Revenu mensuel visé divisé par les heures facturables","Laisser le client fixer le prix"]'::jsonb, 2);
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
commit;
