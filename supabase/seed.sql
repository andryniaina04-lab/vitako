-- Fichier généré par tools/build.mjs. Ne pas modifier à la main : modifier content/ puis relancer.
-- À exécuter dans Supabase > SQL Editor après schema.sql, et à chaque mise à jour du contenu.
-- Il remplace le contenu des formations sans toucher aux comptes, paiements ni attestations.
begin;
insert into public.courses (id, job_key, job_name, level, title, hours, published) values
  ('design-0-f', 'design-0', 'Graphiste', 'f', 'Graphiste – Fondamentaux', 14, true),
  ('design-0-a', 'design-0', 'Graphiste', 'a', 'Graphiste – Avancé', 15, true),
  ('design-1-f', 'design-1', 'Designer UI/UX', 'f', 'Designer UI/UX – Fondamentaux', 11, false),
  ('design-1-a', 'design-1', 'Designer UI/UX', 'a', 'Designer UI/UX – Avancé', 15, false),
  ('design-2-f', 'design-2', 'Illustrateur numérique', 'f', 'Illustrateur numérique – Fondamentaux', 12, false),
  ('design-2-a', 'design-2', 'Illustrateur numérique', 'a', 'Illustrateur numérique – Avancé', 16, false),
  ('design-3-f', 'design-3', 'Retoucheur photo', 'f', 'Retoucheur photo – Fondamentaux', 13, false),
  ('design-3-a', 'design-3', 'Retoucheur photo', 'a', 'Retoucheur photo – Avancé', 17, false),
  ('design-4-f', 'design-4', 'Créateur de miniatures YouTube', 'f', 'Créateur de miniatures YouTube – Fondamentaux', 14, false),
  ('design-4-a', 'design-4', 'Créateur de miniatures YouTube', 'a', 'Créateur de miniatures YouTube – Avancé', 18, false),
  ('media-0-f', 'media-0', 'Monteur vidéo', 'f', 'Monteur vidéo – Fondamentaux', 16, true),
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
  ('dev-3-f', 'dev-3', 'Développeur WordPress et Shopify', 'f', 'Développeur WordPress et Shopify – Fondamentaux', 16, true),
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
  ('mkt-0-a', 'mkt-0', 'Community manager', 'a', 'Community manager – Avancé', 17, true),
  ('mkt-1-f', 'mkt-1', 'Gestionnaire de publicités en ligne', 'f', 'Gestionnaire de publicités en ligne – Fondamentaux', 10, false),
  ('mkt-1-a', 'mkt-1', 'Gestionnaire de publicités en ligne', 'a', 'Gestionnaire de publicités en ligne – Avancé', 18, false),
  ('mkt-2-f', 'mkt-2', 'Spécialiste SEO', 'f', 'Spécialiste SEO – Fondamentaux', 11, false),
  ('mkt-2-a', 'mkt-2', 'Spécialiste SEO', 'a', 'Spécialiste SEO – Avancé', 14, false),
  ('mkt-3-f', 'mkt-3', 'Email marketeur', 'f', 'Email marketeur – Fondamentaux', 12, false),
  ('mkt-3-a', 'mkt-3', 'Email marketeur', 'a', 'Email marketeur – Avancé', 15, false),
  ('mkt-4-f', 'mkt-4', 'Créateur de contenu UGC', 'f', 'Créateur de contenu UGC – Fondamentaux', 13, false),
  ('mkt-4-a', 'mkt-4', 'Créateur de contenu UGC', 'a', 'Créateur de contenu UGC – Avancé', 16, false),
  ('lang-0-f', 'lang-0', 'Rédacteur web et copywriter', 'f', 'Rédacteur web et copywriter – Fondamentaux', 15, true),
  ('lang-0-a', 'lang-0', 'Rédacteur web et copywriter', 'a', 'Rédacteur web et copywriter – Avancé', 14, false),
  ('lang-1-f', 'lang-1', 'Traducteur', 'f', 'Traducteur – Fondamentaux', 15, true),
  ('lang-1-a', 'lang-1', 'Traducteur', 'a', 'Traducteur – Avancé', 15, false),
  ('lang-2-f', 'lang-2', 'Transcripteur', 'f', 'Transcripteur – Fondamentaux', 12, false),
  ('lang-2-a', 'lang-2', 'Transcripteur', 'a', 'Transcripteur – Avancé', 16, false),
  ('lang-3-f', 'lang-3', 'Correcteur et relecteur', 'f', 'Correcteur et relecteur – Fondamentaux', 13, false),
  ('lang-3-a', 'lang-3', 'Correcteur et relecteur', 'a', 'Correcteur et relecteur – Avancé', 17, false),
  ('lang-4-f', 'lang-4', 'Rédacteur de fiches produits', 'f', 'Rédacteur de fiches produits – Fondamentaux', 14, false),
  ('lang-4-a', 'lang-4', 'Rédacteur de fiches produits', 'a', 'Rédacteur de fiches produits – Avancé', 18, false),
  ('data-0-f', 'data-0', 'Annotateur de données IA', 'f', 'Annotateur de données IA – Fondamentaux', 14, true),
  ('data-0-a', 'data-0', 'Annotateur de données IA', 'a', 'Annotateur de données IA – Avancé', 16, false),
  ('data-1-f', 'data-1', 'Évaluateur de réponses d’IA', 'f', 'Évaluateur de réponses d’IA – Fondamentaux', 12, false),
  ('data-1-a', 'data-1', 'Évaluateur de réponses d’IA', 'a', 'Évaluateur de réponses d’IA – Avancé', 17, false),
  ('data-2-f', 'data-2', 'Opérateur de saisie de données', 'f', 'Opérateur de saisie de données – Fondamentaux', 14, true),
  ('data-2-a', 'data-2', 'Opérateur de saisie de données', 'a', 'Opérateur de saisie de données – Avancé', 18, false),
  ('data-3-f', 'data-3', 'Analyste de données', 'f', 'Analyste de données – Fondamentaux', 14, false),
  ('data-3-a', 'data-3', 'Analyste de données', 'a', 'Analyste de données – Avancé', 14, false),
  ('data-4-f', 'data-4', 'Spécialiste automatisation et IA', 'f', 'Spécialiste automatisation et IA – Fondamentaux', 10, false),
  ('data-4-a', 'data-4', 'Spécialiste automatisation et IA', 'a', 'Spécialiste automatisation et IA – Avancé', 15, false),
  ('client-0-f', 'client-0', 'Téléconseiller à distance', 'f', 'Téléconseiller à distance – Fondamentaux', 14, true),
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

-- client-0-f
delete from public.exam_questions where course_id = 'client-0-f';
delete from public.module_questions where course_id = 'client-0-f';
delete from public.lessons where course_id = 'client-0-f' and module_index >= 5;
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('client-0-f', 0, 'Le métier de téléconseiller à distance depuis Madagascar', 'Ce que fait un téléconseiller, appels entrants et sortants, les 6 missions, qui recrute, l''installation technique et les fausses offres.', 'Le téléconseiller est la voix d''une entreprise au téléphone : il répond aux clients, règle leurs problèmes, prend des rendez-vous ou présente une offre. Madagascar, et surtout Antananarivo, est déjà connu pour ses centres d''appels francophones, et de plus en plus de postes se font depuis chez soi. Ce premier module vous montre le métier tel qu''il est vraiment et ce qu''il faut pour l''exercer à distance.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Expliquer en une phrase ce que fait un téléconseiller.
> 2. Distinguer les appels entrants et sortants, et les 6 types de missions.
> 3. Repérer qui recrute des téléconseillers à distance.
> 4. Vérifier que votre installation répond aux exigences techniques.
> 5. Reconnaître les fausses offres d''emploi.

## Le métier de téléconseiller en une phrase

Un téléconseiller **règle la demande d''un client par téléphone, au nom d''une entreprise, avec courtoisie et efficacité**.

Le client qui appelle ne vous voit pas : il juge l''entreprise entière sur votre voix, votre politesse et votre capacité à l''aider. C''est une grande responsabilité, et c''est pour ça que les bons téléconseillers sont recherchés.

> [!definition] Centre d''appels (ou centre de contacts)
> Une entreprise qui traite les appels, e-mails et messages des clients d''autres entreprises. On parle aussi d''**externalisation** ou de **BPO** (*Business Process Outsourcing*). Beaucoup de centres d''appels malgaches travaillent pour des entreprises françaises.

## Appels entrants et appels sortants

| | Appels **entrants** | Appels **sortants** |
| --- | --- | --- |
| Qui appelle ? | Le client appelle l''entreprise | Vous appelez le client ou le prospect |
| Exemples | Service client, assistance technique, réservations | Prise de rendez-vous, enquêtes, relances, vente |
| Difficulté | Clients parfois mécontents | Refus fréquents, il faut rester motivé |
| Ce qu''on mesure | Rapidité, résolution du problème, satisfaction | Nombre de contacts, rendez-vous ou ventes obtenus |

## Les 6 types de missions

| N° | Mission | Exemple concret |
| --- | --- | --- |
| 1 | Service client | Un abonné internet demande pourquoi sa facture a augmenté |
| 2 | Assistance technique de premier niveau | Aider un client à redémarrer sa box ou réinitialiser son mot de passe |
| 3 | Prise de rendez-vous | Appeler des artisans pour fixer un rendez-vous avec un commercial |
| 4 | Réservations | Hôtel, transport, restaurant |
| 5 | Enquêtes de satisfaction | 5 questions après un achat |
| 6 | Vente et relance | Proposer une offre, relancer un panier abandonné |

Pour débuter à distance, les missions **1, 3 et 5** sont les plus accessibles.

## Qui recrute des téléconseillers à distance ?

1. **Centres d''appels malgaches** qui proposent des postes en télétravail (partiel ou complet), surtout après une période de formation sur place.
2. **Centres d''appels étrangers** (France, Maurice, Maroc, Canada) qui recrutent des francophones à distance.
3. **Petites entreprises francophones** qui cherchent quelqu''un pour la prise de rendez-vous ou la relance clients, en freelance.
4. **Startups** qui ont besoin d''un service client par téléphone et par chat.

> [!madagascar] Votre avantage
> Un français oral clair, un faible décalage horaire avec l''Europe (1 ou 2 heures) et une solide tradition des centres d''appels à Madagascar : les recruteurs connaissent et apprécient les téléconseillers malgaches.

## Les exigences techniques du travail à distance

Les entreprises sont **exigeantes** : un appel coupé ou un bruit de fond, c''est un client perdu. Vérifiez ces 6 points avant de postuler.

| N° | Exigence | Ce qu''on attend en général | Comment vérifier |
| --- | --- | --- | --- |
| 1 | Connexion | Fibre ou ADSL stable, souvent au moins quelques Mbit/s dans les deux sens | Faire un test de débit et de *ping* plusieurs fois par jour |
| 2 | Connexion de secours | Forfait mobile 4G prêt à prendre le relais | Tester le partage de connexion |
| 3 | Électricité | Onduleur ou batterie pour l''ordinateur et la box | Simuler une coupure |
| 4 | Ordinateur | Récent, pas trop lent, souvent avec Windows | Vérifier qu''il ne rame pas avec 5 onglets ouverts |
| 5 | Casque | Casque filaire USB avec micro antibruit | S''enregistrer et s''écouter |
| 6 | Pièce | Calme, fermée, sans passage ni bruit de rue | Faire un appel test aux heures de travail |

> [!definition] Ping (ou latence)
> Le temps que met un signal pour faire l''aller-retour entre votre ordinateur et un serveur, en millisecondes (ms). Plus il est bas, mieux c''est. Un ping élevé crée des décalages et des coupures dans la voix.

> [!astuce]
> Branchez votre ordinateur à la box avec un **câble réseau** plutôt qu''en Wi-Fi : la connexion est plus stable et les coupures de voix diminuent nettement.

## Reconnaître les fausses offres d''emploi

Les annonces « téléconseiller à domicile, très bien payé, sans expérience » attirent aussi des escrocs.

### Les 5 signaux d''alerte

1. On vous demande de **payer** pour obtenir le poste (frais de formation, de dossier, de matériel).
2. Le salaire promis est **très au-dessus** des autres offres.
3. Aucun **nom d''entreprise** vérifiable, aucune adresse, seulement un numéro WhatsApp.
4. On vous demande des **informations bancaires** ou une copie de pièce d''identité avant tout entretien.
5. On vous presse : « Il ne reste qu''une place, décidez aujourd''hui. »

Une vraie entreprise ne vous fait **jamais payer** pour travailler pour elle.

> [!attention] Erreurs fréquentes des débutants
> - Postuler avec une connexion instable ou sans connexion de secours.
> - Travailler avec les écouteurs du téléphone au lieu d''un casque.
> - Accepter une offre sans vérifier l''entreprise.
> - Sous-estimer la fatigue : plusieurs heures d''appels demandent des pauses régulières.

> [!retenir]
> - Un téléconseiller règle la demande du client par téléphone, au nom de l''entreprise.
> - Appels entrants (le client appelle) et sortants (vous appelez).
> - À distance, l''installation technique est aussi importante que la voix.
> - On ne paie jamais pour obtenir un emploi.

## Exercice pratique : tester votre installation

> [!exercice] Exercice pratique · 45 minutes
> 1. Faites 3 tests de débit et de ping à 3 moments de la journée (matin, midi, soir) et notez les résultats.
> 2. Testez votre partage de connexion mobile : combien de temps pour basculer ?
> 3. Enregistrez-vous 1 minute avec votre casque (avec le dictaphone du téléphone ou l''ordinateur) en lisant un texte, puis écoutez : bruit de fond, souffle, clarté ?
> 4. Faites la liste de ce qui manque à votre installation et de son coût approximatif.
>
> **À livrer** : votre tableau de tests, votre enregistrement et votre liste d''équipement à prévoir.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('client-0-f', 0, 0, 'Qu''est-ce qu''un appel entrant ?', '["Un appel coupé","Un appel entre deux collègues","Un appel du client vers l''entreprise","Un appel du téléconseiller vers un prospect"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('client-0-f', 0, 1, 'Pourquoi brancher l''ordinateur à la box avec un câble réseau ?', '["C''est obligatoire en France","Pour une connexion plus stable","Pour appeler gratuitement","Pour charger l''ordinateur"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('client-0-f', 0, 2, 'Une offre vous demande de payer des frais pour obtenir le poste. Que faire ?', '["Payer pour réserver sa place","Refuser : une vraie entreprise ne fait jamais payer pour travailler","Envoyer ses informations bancaires","Payer la moitié"]'::jsonb, 1);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('client-0-f', 1, 'Les bases : voix, structure de l''appel et écoute', 'La voix, l''appel en 6 étapes, l''écoute active, les formules positives et la méthode CRAC face à un client mécontent.', 'Un bon appel ne doit rien au hasard : il suit une structure, utilise des mots choisis et s''appuie sur une vraie écoute. Ce module vous donne les bases que tous les centres d''appels enseignent : la voix, les 6 étapes d''un appel, l''écoute active, les formules à utiliser ou à éviter et la gestion d''un client mécontent.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Travailler votre voix : sourire, rythme, articulation.
> 2. Conduire un appel en 6 étapes.
> 3. Pratiquer l''écoute active : questions, reformulation.
> 4. Remplacer les formules négatives par des formules positives.
> 5. Calmer un client mécontent avec la méthode CRAC.

## La voix : votre seul outil

Au téléphone, le client ne voit ni votre visage ni vos gestes. Tout passe par la voix.

| N° | Élément | Ce qu''il faut faire |
| --- | --- | --- |
| 1 | **Le sourire** | Souriez vraiment en parlant : il s''entend dans la voix |
| 2 | **Le rythme** | Parlez un peu plus lentement qu''en conversation, surtout pour les chiffres |
| 3 | **L''articulation** | Prononcez la fin des mots ; épelez les noms et adresses |
| 4 | **Le volume** | Ni trop fort ni trop bas ; micro à 2 ou 3 cm de la bouche, sur le côté |
| 5 | **Les silences** | Une courte pause après une information importante |
| 6 | **La posture** | Assis droit ou debout : la voix porte mieux |

> [!astuce] Épeler sans erreur
> Utilisez l''alphabet des prénoms : « R comme Robert, A comme Anatole, K comme Kléber… ». Pour les numéros, groupez par deux : « 06 – 12 – 34 – 56 – 78 ».

## Conduire un appel en 6 étapes

| N° | Étape | Exemple (appel entrant, service client) |
| --- | --- | --- |
| 1 | **Accueil** | « Société Connexia, bonjour, Hanta à votre écoute. » |
| 2 | **Identification** | « Puis-je avoir votre nom et votre numéro client, s''il vous plaît ? » |
| 3 | **Découverte du besoin** | « Que puis-je faire pour vous ? » puis questions |
| 4 | **Reformulation** | « Si je comprends bien, votre connexion coupe depuis lundi soir, c''est bien ça ? » |
| 5 | **Solution** | Expliquer clairement la solution, ou l''étape suivante et son délai |
| 6 | **Conclusion** | « Puis-je faire autre chose pour vous ? … Merci de votre appel, Monsieur Dubois, bonne journée. » |

Utilisez le **nom du client** au moins 2 fois dans l''appel : il se sent reconnu.

> [!definition] Script
> Un texte préparé par l''entreprise qui indique quoi dire à chaque étape. On le suit pour les passages obligatoires (accueil, informations légales, conclusion), mais on parle naturellement le reste du temps : un client sent tout de suite quand on lit.

## L''écoute active

Écouter activement, c''est montrer au client qu''on a compris, et vérifier qu''on a bien compris.

### Les 3 types de questions

| Type | But | Exemple |
| --- | --- | --- |
| **Ouverte** | Laisser le client expliquer | « Pouvez-vous me décrire ce qui se passe ? » |
| **Fermée** | Obtenir une réponse précise (oui/non) | « Le voyant de la box est-il rouge ? » |
| **Alternative** | Faire choisir | « Préférez-vous un rappel ce matin ou cet après-midi ? » |

Commencez par une question **ouverte**, puis précisez avec des questions **fermées**.

### Les signes d''écoute

1. De petits mots pendant que le client parle : « d''accord », « je vois », « je comprends ».
2. **Prendre des notes** pendant l''appel, dans l''outil de l''entreprise.
3. **Ne jamais couper la parole**, même si vous avez déjà compris.
4. **Reformuler** avant de proposer une solution.

## Les mots qui aident et les mots qui fâchent

| À éviter | À dire plutôt |
| --- | --- |
| « Ce n''est pas possible. » | « Voici ce que je peux faire pour vous. » |
| « Je ne sais pas. » | « Je vérifie l''information et je reviens vers vous. » |
| « Vous vous êtes trompé. » | « Je vois qu''il y a eu un malentendu, on va corriger ça. » |
| « Ne quittez pas. » | « Je vous mets en attente une minute pour vérifier, d''accord ? » |
| « C''est pas mon service. » | « Je vous mets en relation avec le service qui pourra vous aider. » |
| « Problème » | « Situation », « question » |

> [!exemple] Mise en attente bien faite
> 1. Demander : « Je dois vérifier dans votre dossier, puis-je vous mettre en attente une minute ? »
> 2. Attendre l''accord.
> 3. Revenir avant le délai annoncé, même pour dire : « Merci de votre patience, j''ai encore besoin d''une minute. »
> 4. Remercier : « Merci d''avoir patienté. »

## Le client mécontent : la méthode CRAC

Un client en colère n''est pas en colère contre vous, mais contre une situation. Votre calme fera retomber la tension.

| Lettre | Étape | Ce qu''on dit |
| --- | --- | --- |
| **C** | **Calmer** : laisser parler sans interrompre | « Je vous écoute. » |
| **R** | **Reformuler** le problème et reconnaître l''émotion | « Je comprends que ce soit agaçant de rester sans connexion depuis 3 jours. » |
| **A** | **Agir** : proposer une solution concrète | « J''envoie un technicien ; le premier créneau est demain matin. » |
| **C** | **Conclure** : vérifier la satisfaction | « Cette solution vous convient-elle ? » |

### Les 3 règles face à un client agressif

1. Ne **jamais** répondre sur le même ton ni le prendre personnellement.
2. Si le client insulte, prévenez **une fois** poliment : « Je souhaite vous aider, mais je vous demande de rester courtois. »
3. Si les insultes continuent, suivez la procédure de l''entreprise (souvent : transfert au superviseur ou fin d''appel annoncée).

> [!madagascar]
> Certains clients étrangers ont du mal avec un accent qu''ils ne connaissent pas. Parlez un peu plus lentement, articulez, et ne vous laissez pas déstabiliser : un français clair et une attitude calme comptent plus que l''accent.

> [!attention] Erreurs fréquentes des débutants
> - Lire le script d''une voix monotone.
> - Proposer une solution avant d''avoir compris le problème.
> - Laisser un client en attente sans le prévenir.
> - Se justifier longuement au lieu d''agir.
> - Promettre ce qu''on ne peut pas tenir (« ce sera réglé dans une heure »).

> [!retenir]
> - Sourire, rythme posé, articulation : la voix fait l''image de l''entreprise.
> - 6 étapes : accueil, identification, découverte, reformulation, solution, conclusion.
> - Questions ouvertes puis fermées ; reformuler avant de proposer.
> - Des formules positives, jamais « ce n''est pas possible ».
> - Face à la colère : Calmer, Reformuler, Agir, Conclure.

## Exercice pratique : vos premiers appels simulés

> [!exercice] Exercice pratique · 1 heure 30
> 1. Lisez à voix haute un texte de 1 minute en souriant, puis sans sourire ; enregistrez-vous et comparez.
> 2. Avec un proche, simulez 3 appels entrants d''un fournisseur internet fictif « Connexia » : une question sur une facture, une panne, une demande de résiliation.
> 3. Simulez un appel avec un client très mécontent et appliquez la méthode CRAC.
> 4. Enregistrez les appels (avec l''accord de votre partenaire) et notez pour chacun : les 6 étapes ont-elles été respectées ? Combien de formules négatives ?
>
> **À livrer** : vos enregistrements et votre grille d''auto-évaluation pour chaque appel.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('client-0-f', 1, 0, 'Quelle étape vient juste avant la proposition de solution ?', '["L''accueil","La mise en attente","La reformulation","La conclusion"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('client-0-f', 1, 1, 'Quelle formule remplace « Ce n''est pas possible » ?', '["« Rappelez plus tard »","« Voici ce que je peux faire pour vous »","« Vous vous êtes trompé »","« Ce n''est pas mon problème »"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('client-0-f', 1, 2, 'Que signifie le premier C de la méthode CRAC ?', '["Couper l''appel","Compter jusqu''à dix","Contredire le client","Calmer : laisser parler sans interrompre"]'::jsonb, 3);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('client-0-f', 2, 'Les outils : softphone, CRM, et les outils professionnels', 'Le softphone et ses fonctions, le CRM, la note d''appel en 5 lignes, la base de connaissances, puis Aircall et Salesforce.', 'À distance, le téléconseiller travaille avec deux outils principaux : un **softphone** pour passer et recevoir les appels depuis l''ordinateur, et un **CRM** pour retrouver et noter les informations des clients. Ce module vous les fait découvrir avec des outils gratuits, puis vous présente les outils professionnels que les entreprises vous fourniront.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Expliquer ce qu''est un softphone et le configurer avec les informations fournies.
> 2. Utiliser un CRM pour retrouver un client et noter un appel.
> 3. Chercher rapidement une réponse dans une base de connaissances.
> 4. Rédiger une note d''appel claire en 5 lignes.
> 5. Connaître Aircall et Salesforce, souvent fournis par l''entreprise.

## Les outils du téléconseiller à distance

| N° | Outil | À quoi il sert | Exemples |
| --- | --- | --- | --- |
| 1 | **Softphone** | Téléphoner depuis l''ordinateur, avec le casque | MicroSIP, Zoiper (gratuits), ou le logiciel de l''entreprise |
| 2 | **CRM** | Fiche de chaque client, historique des appels | HubSpot CRM (offre gratuite), Salesforce |
| 3 | **Base de connaissances** | Les réponses aux questions fréquentes, les procédures | Pages internes de l''entreprise, Notion, Google Docs |
| 4 | **Messagerie interne** | Poser une question au superviseur pendant un appel | Slack, Microsoft Teams, Google Chat |
| 5 | **Outil de prise de rendez-vous** | Réserver un créneau pour un commercial | Google Agenda, Calendly |

> [!definition] Softphone
> Un logiciel qui transforme l''ordinateur en téléphone. On appelle et on reçoit les appels avec le casque, en passant par Internet (technologie **VoIP**, voix sur IP). C''est ce qui permet de travailler pour un centre d''appels depuis chez soi.

> [!definition] CRM
> *Customer Relationship Management* : gestion de la relation client. Un logiciel qui regroupe tout ce qu''on sait d''un client : coordonnées, achats, appels précédents, problèmes en cours.

## Le softphone

### Comment ça marche

1. L''entreprise vous donne des **identifiants** : un nom d''utilisateur, un mot de passe et l''adresse de son serveur téléphonique.
2. Vous les saisissez dans le softphone (ou vous vous connectez simplement à l''outil de l''entreprise dans le navigateur).
3. Vous choisissez votre **casque** comme micro et haut-parleur dans les réglages audio.
4. Vous passez un **appel de test** (souvent un numéro d''écho fourni par l''entreprise).
5. Vous indiquez votre **statut** : disponible, en pause, en appel, en traitement après appel.

### Les fonctions à connaître

| Fonction | Usage |
| --- | --- |
| **Mise en attente** | Vérifier une information sans couper l''appel |
| **Transfert** | Passer l''appel à un autre service ou au superviseur |
| **Muet** (*mute*) | Couper votre micro (pour tousser, par exemple) |
| **Statut** | Indiquer si vous pouvez recevoir un appel |

> [!attention]
> Ne mettez **jamais** un client en muet pour parler de lui à côté. Si le muet ne fonctionne pas, il entend tout. Prenez l''habitude de parler de chaque client comme s''il pouvait vous entendre.

## Le CRM : retrouver et noter

### Pendant un appel entrant

1. Le CRM affiche souvent la fiche du client automatiquement (grâce à son numéro).
2. Sinon, cherchez-le par **nom**, **numéro client** ou **e-mail**.
3. Lisez l''**historique** : a-t-il déjà appelé pour le même sujet ?
4. Traitez la demande.
5. Rédigez la **note d''appel** et choisissez le **motif** dans la liste.

### La note d''appel en 5 lignes

Une bonne note permet au collègue suivant de tout comprendre sans rappeler le client.

1. **Motif** : pourquoi le client a appelé.
2. **Vérifications** : ce que vous avez contrôlé.
3. **Solution** : ce que vous avez fait ou proposé.
4. **Suite** : ce qui reste à faire, par qui, et quand.
5. **Engagement** : ce que vous avez promis au client.

> [!exemple] Note d''appel
> **Motif** : connexion coupée depuis le 3/03.
> **Vérifications** : pas de panne dans le quartier ; box redémarrée avec le client, voyant toujours rouge.
> **Solution** : intervention technique créée (n° 45812).
> **Suite** : technicien le 5/03 entre 8 h et 12 h.
> **Engagement** : SMS de confirmation la veille.

### Le temps de traitement après appel

Après chaque appel, vous avez en général quelques dizaines de secondes pour finir la note. Prenez l''habitude d''écrire **pendant** l''appel, en mots-clés, puis de compléter juste après.

## La base de connaissances

Personne ne connaît toutes les réponses par cœur. Les bons téléconseillers savent **chercher vite**.

1. Gardez la base de connaissances ouverte dans un onglet en permanence.
2. Cherchez avec des **mots-clés courts** : « résiliation délai », « facture double ».
3. Notez dans un document personnel les 20 réponses que vous utilisez le plus souvent.
4. Si l''information n''existe pas, demandez au superviseur par la messagerie interne, puis proposez de l''ajouter à la base.

## Le poste de travail à l''écran

Organisez vos fenêtres toujours de la même façon pour ne rien chercher pendant un appel :

| Zone de l''écran | Contenu |
| --- | --- |
| Gauche | CRM, fiche du client |
| Droite | Base de connaissances |
| En bas ou en petit | Softphone et messagerie interne |

Un **deuxième écran**, même ancien, fait gagner beaucoup de temps.

## Les outils professionnels (souvent fournis)

| Outil | Ce qu''il apporte | Qui le paie |
| --- | --- | --- |
| **Aircall** | Téléphonie en ligne pour les équipes : numéros dans de nombreux pays, transferts, enregistrement des appels, statistiques | L''entreprise, qui vous crée un compte |
| **Salesforce** | CRM très utilisé par les grandes entreprises : fiches clients, tickets, ventes, rapports | L''entreprise |
| **HubSpot** (offres payantes) | CRM et outils de vente plus complets | L''entreprise, souvent |

Dans ce métier, **vous n''achetez presque jamais ces outils vous-même** : l''entreprise vous donne un accès. Ce qui compte, c''est de savoir les utiliser vite. Beaucoup proposent des formations gratuites en ligne (par exemple Trailhead pour Salesforce) : les suivre est un vrai plus sur votre CV.

> [!madagascar]
> Certaines entreprises demandent d''utiliser un **VPN** fourni par elles pour se connecter à leurs outils. Il peut ralentir un peu la connexion : faites un appel de test avec le VPN activé avant votre première journée.

> [!retenir]
> - Softphone pour téléphoner, CRM pour connaître le client, base de connaissances pour répondre.
> - Ne jamais parler d''un client en le croyant en muet.
> - Une note d''appel en 5 lignes : motif, vérifications, solution, suite, engagement.
> - Des fenêtres toujours au même endroit.
> - Aircall et Salesforce sont fournis par l''entreprise : apprenez à les utiliser.

## Exercice pratique : votre poste de travail

> [!exercice] Exercice pratique · 1 heure 30
> 1. Installez un softphone gratuit (MicroSIP ou Zoiper) et explorez ses réglages audio, la mise en attente et le transfert.
> 2. Créez un compte HubSpot CRM gratuit et ajoutez 5 clients fictifs de « Connexia ».
> 3. Pour chacun, ajoutez une note d''appel en 5 lignes correspondant à vos appels simulés du module 2.
> 4. Rédigez une mini base de connaissances de 10 questions fréquentes pour Connexia (facture, panne, résiliation, déménagement…).
> 5. Organisez votre écran comme proposé et faites une capture.
>
> **À livrer** : captures du softphone, de vos 5 fiches CRM, votre base de connaissances et la capture de votre écran.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('client-0-f', 2, 0, 'À quoi sert un softphone ?', '["Écrire des e-mails","Créer des visuels","Calculer les salaires","Téléphoner depuis l''ordinateur avec un casque"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('client-0-f', 2, 1, 'Que contient un CRM ?', '["Les mots de passe des clients","Les fiches clients et l''historique des échanges","Les films de l''entreprise","La liste des employés en congé"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('client-0-f', 2, 2, 'Qui paie en général Aircall ou Salesforce ?', '["L''entreprise, qui vous donne un accès","Le client final","Personne","Le téléconseiller"]'::jsonb, 0);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('client-0-f', 3, 'Premier projet : une journée d''appels sortants et entrants', 'Campagne de prise de rendez-vous, 5 objections, statuts d''appel, session de service client, 6 indicateurs et rythme de travail.', 'Dans ce module, vous vivez une vraie journée de téléconseiller : une campagne d''appels **sortants** pour prendre des rendez-vous, puis une session d''appels **entrants** au service client. Vous apprenez aussi à lire les indicateurs sur lesquels vous serez évalué, et à tenir le rythme sans vous épuiser.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Préparer et mener une campagne de prise de rendez-vous.
> 2. Répondre aux 5 objections les plus fréquentes.
> 3. Traiter une session d''appels entrants de bout en bout.
> 4. Comprendre les 6 indicateurs de performance d''un téléconseiller.
> 5. Organiser votre journée pour tenir sur la durée.

## Le cas pratique : « Solaris Énergie »

> [!exemple] Votre mission
> **Solaris Énergie** installe des panneaux solaires chez les particuliers, en France. L''entreprise vous confie deux missions :
> 1. **Le matin** : appeler une liste de 60 personnes qui ont demandé des informations sur son site, pour leur fixer un rendez-vous gratuit avec un conseiller.
> 2. **L''après-midi** : répondre aux appels du service client (questions sur les installations, factures, rendez-vous).

## Préparer une campagne d''appels sortants

### Avant le premier appel

1. **Lisez le script** et la fiche produit : qu''est-ce que Solaris propose, pour qui, quel avantage ?
2. **Vérifiez la liste** : nom, numéro, date de la demande, commentaire éventuel.
3. **Préparez vos réponses** aux objections (voir plus bas).
4. **Vérifiez les horaires autorisés** : en France, le démarchage téléphonique est encadré par la loi (jours, heures et consentement des personnes appelées). Ici, les personnes ont demandé à être rappelées, mais l''entreprise fixe les horaires : respectez-les strictement.
5. **Ouvrez l''agenda** des conseillers.

> [!madagascar]
> Les horaires autorisés sont ceux du **pays du client**. Si l''entreprise autorise les appels de 10 h à 13 h heure de Paris, vous appelez de 12 h à 15 h à Antananarivo quand la France est à l''heure d''hiver, et de 11 h à 14 h quand elle est à l''heure d''été. Notez les deux heures sur un papier devant vous.

### Le script de prise de rendez-vous

| N° | Étape | Exemple |
| --- | --- | --- |
| 1 | Présentation | « Bonjour Madame Petit, Hanta de Solaris Énergie. » |
| 2 | Raison de l''appel | « Vous avez demandé des informations sur les panneaux solaires sur notre site mardi, c''est bien ça ? » |
| 3 | Permission | « Avez-vous deux minutes ? » |
| 4 | Questions de qualification | « Êtes-vous propriétaire de votre maison ? Votre toit est-il orienté plutôt au sud ? » |
| 5 | Proposition | « Un conseiller peut passer gratuitement étudier votre toit. Je vous propose jeudi à 10 h ou vendredi à 15 h : qu''est-ce qui vous arrange ? » |
| 6 | Confirmation | Répéter la date, l''heure, l''adresse ; annoncer le SMS de confirmation |

> [!definition] Qualification
> Vérifier que la personne correspond bien à l''offre (ici : propriétaire d''une maison) avant de lui fixer un rendez-vous. Un rendez-vous avec quelqu''un qui ne peut pas acheter fait perdre du temps au conseiller.

## Répondre aux 5 objections les plus fréquentes

Une objection n''est pas un refus : c''est souvent une question ou une inquiétude.

| N° | Objection | Réponse possible |
| --- | --- | --- |
| 1 | « Je n''ai pas le temps. » | « Je comprends. Quel serait le meilleur moment pour vous rappeler, demain matin ou en fin d''après-midi ? » |
| 2 | « C''est trop cher. » | « Le rendez-vous est justement gratuit et sans engagement : le conseiller vous donnera le prix exact pour votre maison. » |
| 3 | « Envoyez-moi plutôt un e-mail. » | « Bien sûr. Pour vous envoyer les bonnes informations, puis-je vous poser deux questions sur votre maison ? » |
| 4 | « Je dois en parler à mon conjoint. » | « C''est normal. Le conseiller peut passer quand vous êtes tous les deux là : le samedi matin, ça vous irait ? » |
| 5 | « Ça ne m''intéresse plus. » | « D''accord, merci de me l''avoir dit. Puis-je vous demander ce qui vous a fait changer d''avis ? » Puis remercier et noter. |

Si la personne refuse clairement, **n''insistez pas** : remerciez, notez le refus dans le CRM et passez à l''appel suivant.

## Les résultats d''un appel sortant

Chaque appel reçoit un **statut** dans le CRM :

1. **Rendez-vous fixé** (avec date et heure).
2. **À rappeler** (avec date et heure demandées).
3. **Pas de réponse** (on réessaie selon les règles de la campagne, souvent 3 essais à des heures différentes).
4. **Refus** (avec la raison si elle est donnée).
5. **Faux numéro** ou **hors cible**.

## L''après-midi : la session d''appels entrants

Appliquez les 6 étapes du module 2 à chaque appel :

1. Passez au statut **Disponible**.
2. Décrochez avec la phrase d''accueil, en souriant.
3. Identifiez le client dans le CRM.
4. Découvrez, reformulez, résolvez (base de connaissances si besoin).
5. Concluez et rédigez la note en 5 lignes.
6. Repassez **Disponible** dès que la note est terminée.

> [!astuce] Le transfert annoncé
> Si vous devez transférer l''appel, présentez la situation au collègue **avant** de lui passer le client (« transfert annoncé ») : le client n''aura pas à tout répéter.

## Les 6 indicateurs de performance

| N° | Indicateur | Ce qu''il mesure | Comment l''améliorer |
| --- | --- | --- | --- |
| 1 | **DMT** (durée moyenne de traitement) | Temps moyen par appel, note comprise | Connaître la base de connaissances, écrire pendant l''appel |
| 2 | **Taux de résolution au premier appel** | Part des demandes réglées sans que le client rappelle | Bien comprendre le problème, reformuler |
| 3 | **Satisfaction client** | Note donnée par le client après l''appel | Politesse, écoute, solution claire |
| 4 | **Taux d''occupation** | Part du temps passé en appel ou en traitement | Respecter les statuts, limiter les pauses non prévues |
| 5 | **Taux de transformation** (sortant) | Rendez-vous fixés ÷ personnes jointes | Qualification, réponses aux objections |
| 6 | **Qualité** | Note donnée par un superviseur qui écoute vos appels | Respect du script et des étapes |

> [!exemple] Calcul du taux de transformation
> Vous avez joint 40 personnes et fixé 8 rendez-vous. Taux de transformation : 8 ÷ 40 × 100 = **20 %**.

Ne sacrifiez pas la qualité pour la vitesse : une DMT très basse avec des clients qui rappellent est un mauvais résultat.

## Tenir sur la durée

1. **Buvez de l''eau** régulièrement : la voix se fatigue vite.
2. **Prenez vos pauses** prévues, loin de l''écran.
3. **Après un appel difficile**, respirez profondément 3 fois avant le suivant.
4. **Fixez-vous un objectif positif** : « aider 30 personnes aujourd''hui » plutôt que « tenir jusqu''à 17 h ».
5. Parlez à votre superviseur si un appel vous a vraiment touché.

> [!attention] Erreurs fréquentes des débutants
> - Appeler hors des horaires autorisés.
> - Insister après un refus clair.
> - Oublier de noter les rappels promis.
> - Fixer un rendez-vous sans qualifier la personne.
> - Enchaîner les heures sans pause et perdre sa voix.

> [!retenir]
> - Une campagne se prépare : script, liste, objections, horaires, agenda.
> - Une objection est souvent une question : répondez, puis proposez.
> - Chaque appel reçoit un statut et une note.
> - Les 6 indicateurs : DMT, résolution au premier appel, satisfaction, occupation, transformation, qualité.
> - Pauses, eau et respiration : la voix est votre outil de travail.

## Exercice pratique : la journée Solaris

> [!exercice] Exercice pratique · 3 heures
> 1. Rédigez le script complet de prise de rendez-vous pour Solaris, avec vos réponses aux 5 objections.
> 2. Créez une liste de 10 prospects fictifs dans votre CRM gratuit.
> 3. Avec un ou deux proches qui jouent les prospects (chacun avec une objection différente), simulez les 10 appels et notez le statut de chacun.
> 4. Calculez votre taux de transformation.
> 5. Simulez 5 appels entrants du service client de Solaris, avec une note en 5 lignes pour chacun.
> 6. Rédigez un bilan d''une demi-page : ce qui a bien marché, ce que vous améliorerez.
>
> **À livrer** : le script, la liste avec les statuts, votre taux de transformation, les 5 notes d''appel, vos enregistrements et votre bilan.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('client-0-f', 3, 0, 'Que signifie « qualifier » un prospect ?', '["Lui vendre tout de suite","Lui donner une note sur 20","Vérifier qu''il correspond bien à l''offre","Lui envoyer un diplôme"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('client-0-f', 3, 1, 'Vous avez joint 40 personnes et fixé 8 rendez-vous. Quel est le taux de transformation ?', '["20 %","5 %","8 %","40 %"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('client-0-f', 3, 2, 'Que mesure la DMT ?', '["Le temps moyen de traitement d''un appel","Le débit de la connexion","Le nombre de clients mécontents","Le salaire moyen"]'::jsonb, 0);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('client-0-f', 4, 'Trouver un poste ou des missions et se faire payer', 'Salarié ou freelance, CV, entretien et simulation, offre freelance, prix, contrat, paiements et évolution.', 'Un téléconseiller à distance peut travailler de deux façons : comme **salarié** d''un centre d''appels qui accepte le télétravail, ou comme **freelance** pour des entreprises qui lui confient des missions. Ce dernier module vous prépare aux deux : CV, test vocal, entretien, offres freelance, prix, contrat et paiement.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Choisir entre salariat à distance et freelance.
> 2. Rédiger un CV et un message de candidature adaptés.
> 3. Réussir le test vocal et l''entretien téléphonique.
> 4. Construire une offre freelance et fixer un prix.
> 5. Lire un contrat et vous faire payer.
> 6. Progresser vers des postes mieux payés.

## Salarié ou freelance ?

| | **Salarié à distance** | **Freelance** |
| --- | --- | --- |
| Pour qui | Débutants qui veulent un revenu stable et une formation | Personnes autonomes, avec de l''expérience |
| Employeur | Un centre d''appels ou une entreprise | Plusieurs clients, mission par mission |
| Revenu | Salaire fixe, parfois primes | Prix à l''heure ou au résultat |
| Outils | Fournis par l''employeur | Parfois fournis, parfois à votre charge |
| Avantages | Stabilité, formation, protection sociale selon le contrat | Liberté, choix des clients, revenus parfois plus élevés |
| Inconvénients | Horaires imposés, objectifs suivis de près | Revenus irréguliers, prospection à faire |

**Conseil** : beaucoup de téléconseillers commencent salariés (souvent avec une formation sur place), puis passent au télétravail, puis au freelance quand ils ont de l''expérience et des références.

## Le CV et la candidature

### Ce que le recruteur cherche en 30 secondes

1. Un **français** écrit sans faute (il imagine votre français oral).
2. Une expérience de **contact avec le public** : vente, accueil, service, associations.
3. Votre **disponibilité** : horaires, week-end, date de début.
4. Votre **installation** : connexion, connexion de secours, casque, pièce calme.
5. Les **langues** : français, malagasy, anglais (même niveau scolaire, indiquez-le honnêtement).

> [!exemple] Rubrique « Installation de télétravail » sur le CV
> Connexion fibre (testée : débit stable, faible ping) · Secours 4G · Onduleur · Casque USB antibruit · Pièce fermée et calme · Disponible du lundi au samedi, de 8 h à 20 h (heure de Madagascar).

### Le message de candidature

> [!exemple] Message de candidature
> « Bonjour, je souhaite postuler au poste de téléconseiller en télétravail. J''ai suivi une formation complète au métier (accueil, écoute active, gestion des objections, CRM) et j''ai réalisé des simulations d''appels entrants et sortants que je peux vous faire écouter. Mon installation répond à vos exigences : fibre, secours 4G, onduleur et casque antibruit. Je suis disponible dès le [date]. Vous trouverez mon CV en pièce jointe. Bien cordialement, [Nom], [numéro]. »

## Le test vocal et l''entretien

Les recrutements se font souvent en 3 étapes : **test écrit** (orthographe, compréhension), **test vocal** ou entretien téléphonique, **simulation d''appel**.

### Réussir l''entretien téléphonique en 7 points

1. Faites l''entretien **avec votre casque**, dans votre pièce de travail.
2. Testez votre connexion 15 minutes avant.
3. Décrochez avec une phrase complète : « Bonjour, Hanta Rakoto à l''appareil. »
4. **Souriez** et parlez à un rythme posé, comme dans un vrai appel.
5. Préparez 3 exemples tirés de votre expérience : un client difficile, un objectif atteint, une erreur corrigée.
6. Préparez une question pour le recruteur : « Comment se passe la formation au début ? »
7. Concluez en remerciant et en redisant votre motivation.

### La simulation d''appel

Le recruteur joue un client (souvent mécontent). Il évalue surtout : la structure de l''appel (les 6 étapes), l''écoute, le calme et les formules positives. Appliquez exactement ce que vous avez appris aux modules 2 et 4.

## L''offre freelance

En freelance, vous pouvez proposer :

| Offre | Exemple | Mode de prix courant |
| --- | --- | --- |
| Prise de rendez-vous | Appeler des prospects pour un commercial | À l''heure, au rendez-vous fixé, ou un mélange des deux |
| Service client externalisé | Répondre aux appels d''une petite boutique en ligne | Forfait mensuel ou à l''heure |
| Relances | Relancer des factures ou des paniers abandonnés | À l''heure |
| Enquêtes | Appeler 200 clients pour 5 questions | Au questionnaire rempli |

### Calculer son prix horaire

1. Fixez votre **revenu mensuel visé** (exemple : 1 000 000 Ar).
2. Estimez vos **heures facturables** par mois (exemple : 100 h).
3. **Divisez** : 1 000 000 ÷ 100 = 10 000 Ar de l''heure.

Pour un client étranger, fixez un prix en euros ou en dollars adapté à son marché. Si on vous propose d''être payé **uniquement au résultat** (au rendez-vous fixé), vérifiez d''abord la qualité de la liste d''appels : avec une mauvaise liste, vous pouvez travailler des heures pour presque rien. Demandez un **minimum horaire** ou un essai rémunéré.

> [!astuce]
> Proposez un **essai de 10 heures** au tarif normal. Le client voit vos résultats, et vous voyez si la mission est rentable avant de vous engager.

## Le contrat : les 7 points à vérifier

1. Le **statut** : salarié (contrat de travail) ou prestataire (contrat de prestation).
2. La **rémunération** : montant, à l''heure ou au mois, primes, et comment elles sont calculées.
3. Les **horaires** et le nombre d''heures garanties.
4. Le **matériel** : qui fournit quoi (casque, logiciel, VPN).
5. Les **objectifs** et la façon dont vous êtes évalué.
6. La **confidentialité** : vous aurez accès à des données clients.
7. La **fin du contrat** : période d''essai, préavis.

Ne commencez **jamais** sans un écrit, et ne payez jamais pour être embauché.

## Se faire payer

| Situation | Moyens de paiement |
| --- | --- |
| Centre d''appels à Madagascar | Salaire par virement bancaire ou Mobile Money, selon l''employeur |
| Client local en freelance | Mobile Money (MVola, Orange Money, Airtel Money) ou virement |
| Plateforme internationale | Retrait selon la plateforme : souvent Payoneer ou virement vers une banque malgache |
| Client étranger en direct | Virement international ou Payoneer |

> [!madagascar]
> Les possibilités de PayPal sont limitées pour Madagascar : vérifiez avant de le proposer. En freelance, renseignez-vous sur le NIF et la carte statistique auprès du centre fiscal de votre ville, et gardez une trace de chaque paiement.

## Progresser dans le métier

| Étape | Ce qui change |
| --- | --- |
| Téléconseiller confirmé | Appels plus complexes, meilleurs indicateurs, primes |
| Téléconseiller bilingue | Appels en anglais : postes souvent mieux payés |
| Formateur ou référent | Vous formez les nouveaux |
| Superviseur | Vous encadrez une équipe et suivez ses indicateurs |
| Freelance spécialisé | Prise de rendez-vous pour un secteur précis (énergie, immobilier, logiciels) |

Travailler votre **anglais oral** est l''investissement le plus rentable pour la suite.

> [!retenir]
> - Salarié pour apprendre et être stable, freelance pour plus de liberté.
> - CV : français impeccable, contact client, disponibilités, installation technique.
> - Entretien et simulation : casque, sourire, les 6 étapes, la méthode CRAC.
> - Prix horaire = revenu visé ÷ heures facturables ; méfiance face au « 100 % au résultat ».
> - Toujours un contrat écrit ; ne jamais payer pour être embauché.

## Exercice pratique : votre candidature

> [!exercice] Exercice pratique · 2 heures
> 1. Rédigez votre CV de téléconseiller avec la rubrique « Installation de télétravail ».
> 2. Rédigez votre message de candidature.
> 3. Préparez vos 3 exemples d''expérience et votre question pour le recruteur.
> 4. Faites un entretien simulé de 15 minutes avec un proche, enregistrez-le et notez 3 points à améliorer.
> 5. Rédigez une offre freelance de prise de rendez-vous, avec votre prix horaire et un essai de 10 heures.
> 6. Trouvez 3 offres réelles de téléconseiller à distance et vérifiez-les avec les 5 signaux d''alerte du module 1.
>
> **À livrer** : CV, message, enregistrement de l''entretien avec vos 3 points d''amélioration, offre freelance et analyse des 3 offres.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('client-0-f', 4, 0, 'Quelle rubrique ajouter au CV d''un téléconseiller à distance ?', '["Films préférés","Numéro de compte bancaire","Installation de télétravail","Taille et poids"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('client-0-f', 4, 1, 'Que demander si un client propose un paiement uniquement au rendez-vous fixé ?', '["Le mot de passe de son CRM","Un minimum horaire ou un essai rémunéré","Rien, c''est toujours rentable","Un paiement en nature"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('client-0-f', 4, 2, 'Quel investissement est souvent le plus rentable pour progresser ?', '["Changer de prénom","Acheter un téléphone de luxe","Travailler sans pause","Améliorer son anglais oral"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Quel est le rôle d''un téléconseiller ?', '["Vendre des cartes SIM dans la rue","Installer des box internet","Réparer les téléphones","Régler la demande du client par téléphone, au nom de l''entreprise"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Qu''est-ce qu''un appel sortant ?', '["Un appel transféré","Un appel en attente","Un appel du client vers l''entreprise","Un appel du téléconseiller vers un client ou un prospect"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Que signifie BPO ?', '["Un type de casque","Un logiciel de comptabilité","Une connexion internet","L''externalisation de services, comme les centres d''appels"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Qu''est-ce que le ping ?', '["Le prix d''un forfait","Le temps d''aller-retour d''un signal, en millisecondes","Le volume du casque","Le nombre d''appels par jour"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Quel casque utiliser ?', '["Un casque filaire USB avec micro antibruit","Aucun casque","Les écouteurs du téléphone","Les haut-parleurs de l''ordinateur"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Quel est un signal d''alerte d''une fausse offre d''emploi ?', '["Un test d''orthographe","Une période de formation","Un entretien téléphonique","Un salaire très au-dessus des autres offres et une demande de paiement"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Pourquoi sourire au téléphone ?', '["Pour parler plus vite","Le sourire s''entend dans la voix","C''est obligatoire par la loi","Le client vous voit"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Comment dicter un numéro de téléphone ?', '["En l''envoyant par SMS uniquement","En groupant les chiffres par deux, lentement","Le plus vite possible","Chiffre par chiffre sans pause"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Combien de fois utiliser le nom du client pendant l''appel ?', '["Jamais","À chaque phrase","Au moins 2 fois","Seulement à la fin"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Par quel type de question commencer la découverte du besoin ?', '["Aucune question","Une question fermée","Une question piège","Une question ouverte"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Comment bien mettre un client en attente ?', '["Couper l''appel et rappeler","Dire « ne quittez pas » et partir","Le mettre en muet sans prévenir","Demander son accord, annoncer la durée et revenir à temps"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Que faire si un client insulte ?', '["L''insulter à son tour","Pleurer","Le prévenir une fois poliment, puis suivre la procédure de l''entreprise","Raccrocher immédiatement sans rien dire"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Que fait la touche muet ?', '["Elle enregistre l''appel","Elle coupe l''appel","Elle coupe votre micro","Elle transfère l''appel"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Quelles sont les 5 parties d''une note d''appel ?', '["Bonjour, nom, prénom, âge, merci","Date, heure, météo, humeur, durée","Prix, remise, taxe, total, paiement","Motif, vérifications, solution, suite, engagement"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Comment chercher dans une base de connaissances ?', '["Avec des mots-clés courts","On ne cherche jamais","En lisant tout depuis le début","En demandant au client"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Qu''est-ce qu''un transfert annoncé ?', '["Transférer sans rien dire","Envoyer un e-mail au client","Présenter la situation au collègue avant de lui passer le client","Annoncer au client qu''on raccroche"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Quelle formation gratuite en ligne aide à apprendre Salesforce ?', '["Duolingo","Trailhead","CapCut","Canva"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Dans quel fuseau horaire respecter les horaires d''appel autorisés ?', '["Peu importe","Celui de Londres","Celui du pays du client","Celui de Madagascar"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Que répondre à « C''est trop cher » pour un rendez-vous gratuit ?', '["Baisser le prix des panneaux","Insister jusqu''à ce qu''il accepte","Raccrocher","Rappeler que le rendez-vous est gratuit et sans engagement"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Que faire après un refus clair ?', '["Passer l''appel à un collègue pour réessayer","Rappeler 10 fois","Insister plus fort","Remercier, noter le refus et passer à l''appel suivant"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Que mesure le taux de résolution au premier appel ?', '["Le nombre de transferts","La part des demandes réglées sans que le client rappelle","Le nombre d''appels par heure","La durée des pauses"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Une DMT très basse avec beaucoup de clients qui rappellent est…', '["Impossible","Sans importance","Un excellent résultat","Un mauvais résultat"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Que faut-il pour commencer une mission ?', '["Une promesse orale suffit","Payer des frais d''inscription","Un contrat ou un accord écrit","Rien"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Avec un revenu visé de 1 000 000 Ar et 100 heures facturables, quel est le prix horaire ?', '["10 000 Ar","5 000 Ar","100 000 Ar","1 000 Ar"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('client-0-f', 'Comment protéger sa voix pendant une journée d''appels ?', '["Boire de l''eau et prendre ses pauses","Enchaîner sans pause","Boire très froid toute la journée","Parler plus fort"]'::jsonb, 0);

-- data-0-f
delete from public.exam_questions where course_id = 'data-0-f';
delete from public.module_questions where course_id = 'data-0-f';
delete from public.lessons where course_id = 'data-0-f' and module_index >= 5;
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('data-0-f', 0, 'Le métier d''annotateur de données IA depuis Madagascar', 'Pourquoi l''IA a besoin d''annotateurs, les 6 types de tâches, qui donne du travail, les réalités du métier et le poste de travail.', 'Les intelligences artificielles (IA) qui reconnaissent un visage, lisent un texte ou conduisent une voiture ont toutes appris à partir d''exemples **annotés par des humains**. L''annotateur de données est la personne qui prépare ces exemples : il entoure des objets sur des images, classe des textes, transcrit des sons. C''est un métier accessible depuis Madagascar, qui demande surtout de la rigueur et de la concentration. Ce premier module vous montre ce métier tel qu''il est vraiment.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Expliquer avec des mots simples pourquoi une IA a besoin de données annotées.
> 2. Citer les 6 grands types de tâches d''annotation.
> 3. Repérer qui donne du travail aux annotateurs.
> 4. Connaître les qualités demandées et les réalités du métier.
> 5. Préparer votre poste de travail.

## Pourquoi une IA a besoin d''annotateurs

Une IA n''apprend pas comme un enfant qui regarde le monde. Elle apprend à partir de **milliers d''exemples** dont on lui donne la bonne réponse.

> [!exemple] Apprendre à reconnaître un zébu
> Pour qu''une IA reconnaisse les zébus sur des photos, on lui montre 10 000 photos. Sur chacune, un annotateur a dessiné un cadre autour de chaque zébu et écrit « zébu ». L''IA compare ses propres réponses à ces annotations, corrige ses erreurs, et finit par reconnaître des zébus sur des photos qu''elle n''a jamais vues.

Si les annotations sont fausses ou imprécises, l''IA apprend des erreurs. C''est pour ça que les entreprises paient des annotateurs **rigoureux**.

> [!definition] Données annotées
> Des données (images, textes, sons, vidéos) auxquelles on a ajouté une information : une étiquette, un cadre, une catégorie, une transcription. On dit aussi données **étiquetées** ou **labellisées** (de l''anglais *label*, étiquette).

## Les 6 grands types de tâches

| N° | Type | Ce qu''on fait | Exemple |
| --- | --- | --- | --- |
| 1 | **Classification d''images** | Choisir une catégorie pour toute l''image | « Cette photo montre : un chat / un chien / autre » |
| 2 | **Cadres de délimitation** | Dessiner un rectangle autour de chaque objet | Entourer chaque voiture et chaque piéton sur une photo de rue |
| 3 | **Segmentation** | Suivre le contour exact d''un objet, au pixel près | Délimiter une route ou une rizière vue du ciel |
| 4 | **Annotation de texte** | Classer un texte ou marquer des mots | « Cet avis est positif » ; surligner les noms de villes |
| 5 | **Transcription audio** | Écrire ce qui est dit dans un enregistrement | Transcrire un appel au service client |
| 6 | **Évaluation de réponses d''IA** | Juger la qualité d''une réponse écrite par une IA | Noter si la réponse est exacte, utile et sans danger |

Les tâches **1, 2 et 4** sont les plus accessibles pour commencer.

## Qui donne du travail aux annotateurs ?

1. **Plateformes d''annotation en ligne** : elles reçoivent des projets d''entreprises du monde entier et les découpent en petites tâches pour des milliers d''annotateurs.
2. **Entreprises d''annotation et centres d''externalisation**, y compris à Madagascar : elles recrutent des annotateurs, souvent avec une formation sur le projet, sur place ou à distance.
3. **Laboratoires et startups d''IA** qui recrutent directement des annotateurs pour des projets précis.
4. **Projets en langues rares** : le malagasy est une langue peu présente dans les données des IA, ce qui peut créer des besoins spécifiques (transcription, traduction, évaluation).

> [!madagascar] Votre avantage
> Le français, parfois l''anglais, et le **malagasy** : des projets cherchent justement des locuteurs de langues moins représentées. Madagascar compte aussi des entreprises d''externalisation habituées aux projets de données.

## Les réalités du métier

| Avantages | Difficultés |
| --- | --- |
| Accessible sans diplôme spécialisé | Tâches répétitives, qui demandent une grande concentration |
| Travail depuis chez soi, horaires souvent flexibles | Travail parfois irrégulier sur les plateformes (des projets s''arrêtent sans prévenir) |
| On apprend comment fonctionne l''IA | Paiement à la tâche : il faut être rapide **et** précis |
| Possibilité d''évoluer (contrôle qualité, gestion de projet) | Tests d''entrée exigeants |

### Les qualités demandées

1. **Rigueur** : appliquer les consignes à la lettre, même sur la 500e image.
2. **Concentration** : repérer le petit détail qui change tout.
3. **Lecture attentive** : les consignes font souvent 10 à 30 pages.
4. **Régularité** : la qualité doit rester la même du début à la fin.
5. **Honnêteté** : ne pas cliquer au hasard pour aller plus vite (c''est détecté).

## Préparer son poste de travail

1. Un **ordinateur** (la plupart des tâches ne se font pas bien sur téléphone).
2. Une **souris** : indispensable pour dessiner des cadres précis.
3. Un **écran** le plus grand possible (un second écran pour les consignes, c''est l''idéal).
4. Une **connexion stable** et un forfait mobile de secours.
5. Un **casque** pour les tâches audio.
6. Un endroit **calme** pour rester concentré.

> [!astuce]
> Travaillez par blocs de 45 à 50 minutes avec 10 minutes de pause. Après 2 heures sans pause, la précision baisse nettement, et c''est elle qui fait votre réputation.

> [!attention] Erreurs fréquentes des débutants
> - Commencer à annoter sans avoir lu toutes les consignes.
> - Cliquer vite pour gagner plus : le contrôle qualité le détecte et peut exclure du projet.
> - Croire les annonces qui promettent de gros revenus sans effort.
> - Payer pour accéder à une plateforme ou à une « formation obligatoire » : les vraies plateformes ne font pas payer pour travailler.

> [!retenir]
> - Une IA apprend à partir d''exemples annotés par des humains.
> - 6 types de tâches : classification, cadres, segmentation, texte, audio, évaluation de réponses.
> - Plateformes, entreprises d''annotation et projets en langues rares donnent du travail.
> - Rigueur, concentration et honnêteté comptent plus que la vitesse.

## Exercice pratique : annoter à la main

> [!exercice] Exercice pratique · 45 minutes
> 1. Choisissez 10 photos de votre téléphone (rue, marché, maison).
> 2. Pour chacune, notez une **catégorie** (rue, intérieur, nature, nourriture, autre).
> 3. Sur 3 photos, listez **tous les objets** que vous entoureriez (personnes, véhicules, animaux) et comptez-les.
> 4. Écrivez 10 courts avis imaginaires sur un restaurant et classez-les : positif, négatif, neutre.
> 5. Notez les cas où vous avez hésité, et pourquoi.
>
> **À livrer** : votre tableau des 10 photos, vos comptages, vos 10 avis classés et votre liste d''hésitations. Ces hésitations sont exactement ce que les consignes d''un projet doivent régler (module 2).', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-0-f', 0, 0, 'Pourquoi une IA a-t-elle besoin de données annotées ?', '["Elle n''en a pas besoin","Elle apprend à partir d''exemples dont on lui donne la bonne réponse","Pour réduire la taille des fichiers","Pour décorer les images"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-0-f', 0, 1, 'Que fait-on dans une tâche de « cadres de délimitation » ?', '["On dessine un rectangle autour de chaque objet","On classe un texte","On transcrit un son","On traduit une phrase"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-0-f', 0, 2, 'Quelle qualité compte le plus pour un annotateur ?', '["La vitesse à tout prix","L''humour","La rigueur","La créativité"]'::jsonb, 2);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('data-0-f', 1, 'Les bases : consignes, cadres, texte et qualité', 'Lire des consignes en 5 étapes, les 6 règles des cadres, la segmentation, le texte et les entités nommées, les cas limites et la mesure de la qualité.', 'Un annotateur est jugé sur une seule chose : la **qualité** de ses annotations. Elle dépend de trois savoir-faire : lire et appliquer des consignes, maîtriser les règles de chaque type d''annotation, et gérer les cas difficiles. Ce module vous les enseigne avec des règles précises et des exemples.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Lire des consignes d''annotation avec une méthode en 5 étapes.
> 2. Dessiner des cadres de délimitation selon les 6 règles de base.
> 3. Classer des textes et marquer des entités nommées.
> 4. Traiter les cas limites sans deviner.
> 5. Comprendre comment votre qualité est mesurée.

## Lire les consignes : la méthode en 5 étapes

Chaque projet a ses **consignes** (en anglais *guidelines*). Elles disent exactement quoi annoter, comment, et que faire dans les cas difficiles. Deux projets qui se ressemblent peuvent avoir des règles opposées.

1. **Lisez tout une première fois**, sans rien annoter, pour comprendre le but du projet.
2. **Faites la liste des catégories** (les étiquettes possibles) avec leur définition.
3. **Étudiez les exemples** : ceux marqués « correct » et surtout ceux marqués « incorrect ».
4. **Notez les cas limites** : ce qu''il faut faire quand on hésite.
5. **Relisez les consignes** après vos 20 premières annotations : vous comprendrez des détails qui vous avaient échappé.

> [!astuce]
> Gardez une **fiche mémo** d''une page par projet, à côté de votre écran : les catégories, les 5 règles les plus importantes et les cas limites. Vous gagnerez du temps sans perdre en qualité.

## Les cadres de délimitation : 6 règles de base

> [!definition] Cadre de délimitation
> Un rectangle dessiné autour d''un objet sur une image. En anglais : *bounding box*. Le cadre doit contenir l''objet entier, le plus serré possible.

| N° | Règle | Pourquoi |
| --- | --- | --- |
| 1 | **Serré** : les bords du cadre touchent les bords de l''objet | Un cadre trop large apprend à l''IA que le fond fait partie de l''objet |
| 2 | **Complet** : tout l''objet visible est dans le cadre (rétroviseurs, bras, queue…) | Un cadre coupé apprend une forme fausse |
| 3 | **Un cadre par objet** : 5 personnes = 5 cadres | L''IA doit apprendre à compter et séparer |
| 4 | **Objets partiellement cachés** : on encadre la partie **visible** seulement, sauf consigne contraire | On n''invente pas ce qu''on ne voit pas |
| 5 | **Objets coupés par le bord de l''image** : on encadre jusqu''au bord | Même logique |
| 6 | **Bonne étiquette** pour chaque cadre | Un piéton étiqueté « voiture » est une grave erreur |

> [!exemple] Une photo de l''avenue de l''Indépendance
> Sur la photo, on voit 3 voitures, dont une à moitié cachée par un bus, 1 bus, 6 piétons dont 2 coupés par le bord de l''image, et un vélo. Annotation correcte : **11 cadres**, chacun serré autour de la partie visible, avec l''étiquette exacte (voiture, bus, piéton, vélo). Le cycliste est-il un « piéton » ? Ce sont les consignes qui le disent, pas vous.

## La segmentation

Pour la segmentation, on suit le contour de l''objet point par point (polygone) ou on « colorie » les pixels.

1. **Zoomez** pour placer les points sur le bord exact.
2. Placez **plus de points dans les courbes**, moins dans les lignes droites.
3. Ne laissez **ni trou ni débordement** entre deux objets voisins.

## L''annotation de texte

### Classer un texte

On choisit une catégorie pour un texte entier : sentiment (positif, négatif, neutre), sujet (livraison, prix, qualité), intention (question, plainte, remerciement).

| Texte | Sentiment | Pourquoi |
| --- | --- | --- |
| « Livraison rapide, produit conforme, merci ! » | Positif | Satisfaction claire |
| « Le colis est arrivé. » | Neutre | Simple constat |
| « Deuxième fois que la commande est en retard… » | Négatif | Plainte, même polie |
| « Super, encore une panne. Bravo. » | Négatif | **Ironie** : les mots sont positifs, le sens est négatif |

### Marquer des entités nommées

> [!definition] Entité nommée
> Un mot ou groupe de mots qui désigne une chose précise : une personne, un lieu, une organisation, une date, un montant. En anglais : *named entity*.

> [!exemple]
> « **Rasoa** [PERSONNE] a envoyé **50 000 Ar** [MONTANT] à **Toamasina** [LIEU] le **3 mars** [DATE] par **MVola** [ORGANISATION]. »

Règles habituelles : surligner le groupe de mots **entier** (« Banque centrale de Madagascar », pas seulement « Banque »), sans espace ni ponctuation en trop.

## Les cas limites : ne jamais deviner

Un **cas limite** est un exemple où les consignes ne disent pas clairement quoi faire. Ce sont eux qui font la différence entre un bon et un mauvais annotateur.

### Que faire face à un cas limite

1. **Relisez** les consignes et les exemples : la réponse y est souvent.
2. Cherchez dans la **foire aux questions** ou le forum du projet.
3. Si la plateforme le permet, utilisez l''option **« Je ne sais pas » / « Signaler »** plutôt que de deviner.
4. **Posez la question** au responsable du projet, avec l''exemple précis.
5. **Notez la réponse** dans votre fiche mémo, pour la prochaine fois.

> [!attention]
> Une réponse au hasard est **pire** qu''un signalement. Le signalement aide le projet à améliorer ses consignes ; l''erreur, elle, est apprise par l''IA.

## Comment votre qualité est mesurée

| Méthode | Comment ça marche |
| --- | --- |
| **Questions de contrôle** | Des exemples dont la bonne réponse est connue sont glissés parmi vos tâches, sans que vous le sachiez |
| **Consensus** | Plusieurs annotateurs font la même tâche ; on compare leurs réponses |
| **Relecture** | Un contrôleur qualité vérifie un échantillon de votre travail |
| **Mesure de recouvrement** (pour les cadres) | On compare la surface de votre cadre à celle du cadre de référence |

> [!definition] Taux de précision
> La part de vos annotations jugées correctes. Exemple : 188 bonnes réponses sur 200 contrôlées = 188 ÷ 200 × 100 = **94 %**. Beaucoup de projets exigent un taux élevé (souvent 90 % ou plus) pour rester sur le projet.

> [!madagascar]
> Pour les projets en malagasy, notez les variantes régionales (mots différents entre Antananarivo, Toamasina ou le Sud) et demandez aux consignes quelle forme utiliser. C''est souvent un vrai cas limite, et votre connaissance est précieuse.

> [!retenir]
> - Lisez toutes les consignes avant d''annoter, et relisez-les après 20 tâches.
> - Cadres : serrés, complets, un par objet, bonne étiquette.
> - Texte : attention à l''ironie ; entités surlignées en entier.
> - Face à un cas limite : chercher, signaler, demander, jamais deviner.
> - Votre qualité est contrôlée en permanence, souvent sans que vous le sachiez.

## Exercice pratique : appliquer des consignes

> [!exercice] Exercice pratique · 1 heure
> 1. Rédigez des consignes d''une page pour un projet fictif : « Repérer les véhicules sur des photos de rues malgaches » (catégories : voiture, taxi-be, moto, vélo, charrette à zébus, autre). Ajoutez 3 cas limites et leur règle.
> 2. Imprimez ou affichez 5 photos de rue et dessinez les cadres à la main (ou dans un logiciel de dessin), en suivant **vos** consignes.
> 3. Marquez les entités nommées dans 5 phrases d''un article de presse malgache.
> 4. Classez 10 commentaires Facebook réels (sentiment), en signalant ceux qui sont ironiques.
>
> **À livrer** : vos consignes, vos 5 photos annotées, vos 5 phrases et votre tableau de 10 commentaires.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-0-f', 1, 0, 'Comment doit être un cadre de délimitation ?', '["Un cadre pour tous les objets","Seulement autour de la moitié de l''objet","Large, avec beaucoup de fond","Serré autour de l''objet et complet"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-0-f', 1, 1, 'Que faire face à un cas limite ?', '["Sauter la tâche sans rien dire","Relire les consignes, signaler ou demander, mais ne jamais deviner","Choisir toujours la première catégorie","Choisir au hasard"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-0-f', 1, 2, '« Super, encore une panne. Bravo. » est un avis…', '["Impossible à classer","Neutre","Négatif, à cause de l''ironie","Positif"]'::jsonb, 2);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('data-0-f', 2, 'Les outils : CVAT, Label Studio, et pourquoi rien n''est à acheter', 'Annoter des images dans CVAT, du texte dans Label Studio, les raccourcis, les formats d''export, vitesse et précision.', 'Chaque plateforme d''annotation a son propre outil, mais ils fonctionnent tous de la même façon. En apprenant deux outils gratuits très utilisés, **CVAT** pour les images et **Label Studio** pour le texte et les images, vous serez à l''aise sur n''importe quel projet. Ce module vous montre comment les prendre en main et comment travailler vite sans perdre en précision.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Créer une tâche et annoter des images avec des cadres dans CVAT.
> 2. Créer un projet de classification de texte dans Label Studio.
> 3. Utiliser les raccourcis clavier pour gagner du temps.
> 4. Exporter vos annotations.
> 5. Savoir pourquoi, dans ce métier, vous n''avez rien à acheter.

## Les outils de l''annotateur

| N° | Outil | Pour quoi | Accès |
| --- | --- | --- | --- |
| 1 | **CVAT** | Images et vidéos : cadres, polygones, points | Version en ligne (cvat.ai) avec offre gratuite, ou installation sur ordinateur |
| 2 | **Label Studio** | Texte, images, audio : classification, entités, transcription | Logiciel libre à installer, ou version en ligne |
| 3 | **Tableur** (Google Sheets) | Suivre votre temps, votre production et vos cas limites | Gratuit |
| 4 | **Fiche mémo** (document) | Règles du projet, cas limites | Gratuit |

> [!definition] Logiciel libre (open source)
> Un logiciel dont le code est public et qui peut être utilisé gratuitement. CVAT et Label Studio sont tous deux libres : ce sont des références que beaucoup d''entreprises utilisent ou imitent.

## CVAT : annoter des images

### Créer votre première tâche

1. Créez un compte gratuit sur la version en ligne de CVAT.
2. Cliquez sur **Projects → Create a new project** (ou directement **Tasks → Create a new task**).
3. Donnez un nom : « Véhicules Tana ».
4. Ajoutez les **étiquettes** (*labels*) : voiture, taxi-be, moto, vélo, charrette, autre. Choisissez une couleur pour chacune.
5. Importez 10 à 20 photos.
6. Cliquez sur **Submit** : la tâche est créée. Ouvrez-la puis cliquez sur le **Job** pour commencer.

### Dessiner un cadre

1. Dans la barre de gauche, choisissez l''outil **rectangle**.
2. Sélectionnez l''étiquette (par exemple « voiture »).
3. Cliquez sur **Shape** (forme), puis cliquez sur un coin de l''objet et sur le coin opposé.
4. Ajustez les bords en tirant sur les poignées, en **zoomant** (molette de la souris).
5. Passez à l''objet suivant.
6. Enregistrez régulièrement (**Ctrl + S**).

### Les raccourcis utiles dans CVAT

| Touche | Action |
| --- | --- |
| **N** | Dessiner une nouvelle forme avec le dernier outil utilisé |
| **F** | Image suivante |
| **D** | Image précédente |
| **Ctrl + S** | Enregistrer |
| **Molette** | Zoom avant / arrière |
| **Suppr** | Supprimer la forme sélectionnée |

Les raccourcis peuvent changer selon les versions : la liste complète est dans le menu d''aide de l''outil (souvent touche **F1**).

## Label Studio : annoter du texte

### Installer et démarrer

Sur un ordinateur avec Python installé, ouvrez un terminal et tapez :

```
pip install label-studio
label-studio start
```

Label Studio s''ouvre dans votre navigateur. Créez un compte local (il reste sur votre ordinateur).

### Créer un projet de classification

1. Cliquez sur **Create Project**, nommez-le « Avis clients ».
2. Dans **Data Import**, importez un fichier CSV ou texte avec une phrase par ligne.
3. Dans **Labeling Setup**, choisissez le modèle **Text Classification**.
4. Remplacez les choix proposés par : Positif, Négatif, Neutre.
5. Enregistrez, puis cliquez sur **Label All Tasks**.
6. Pour chaque texte, choisissez la catégorie et cliquez sur **Submit**.

### Marquer des entités nommées

1. Créez un autre projet avec le modèle **Named Entity Recognition**.
2. Définissez les étiquettes : PERSONNE, LIEU, ORGANISATION, DATE, MONTANT.
3. Sélectionnez l''étiquette, puis surlignez le groupe de mots avec la souris.

> [!astuce] Travailler au clavier
> Dans Label Studio, les étiquettes reçoivent souvent un **numéro** (1, 2, 3…) : appuyez sur le chiffre au lieu de cliquer. **Ctrl + Entrée** valide la tâche. Sur des centaines de textes, vous gagnez beaucoup de temps.

## Exporter les annotations

Une fois le travail fini, on **exporte** les annotations dans un format que les ingénieurs de l''IA sauront lire.

| Format | Utilisé pour |
| --- | --- |
| **COCO** (JSON) | Cadres et segmentation d''images |
| **YOLO** | Cadres d''images, très utilisé pour la détection d''objets |
| **Pascal VOC** (XML) | Cadres d''images |
| **CSV / JSON** | Classification de textes |

Sur une plateforme, l''export est fait par l''équipe du projet : vous n''aurez souvent qu''à **valider** vos tâches. Mais savoir que ces formats existent montre que vous comprenez la suite du travail.

## Vitesse et précision

Dans ce métier, il faut être **rapide et précis** à la fois. Voici comment progresser sans sacrifier la qualité.

1. **Apprenez les raccourcis** dès le premier jour.
2. **Gardez la même routine** pour chaque image : d''abord les gros objets, puis les petits, de gauche à droite.
3. **Mesurez-vous** : notez chaque jour le nombre de tâches et votre taux de précision, s''il est affiché.
4. **Ralentissez** dès que votre précision baisse.
5. **Pauses régulières** : la fatigue est la première cause d''erreurs.

## Rien à acheter : les plateformes fournissent les outils

| Situation | Outils |
| --- | --- |
| Plateforme d''annotation | Son propre outil, dans le navigateur, fourni gratuitement |
| Entreprise d''annotation | Ses outils (souvent CVAT, Label Studio ou un outil maison) et parfois un ordinateur |
| Projet direct avec un client | Le client choisit l''outil et vous donne un accès |

Dans ce métier, vous **n''avez pas d''abonnement à payer**. Votre investissement, c''est votre équipement : ordinateur, souris, écran, connexion. Méfiez-vous de quiconque vous demande d''acheter un logiciel ou un « accès » pour pouvoir travailler.

> [!madagascar]
> Les outils en ligne consomment des données, surtout avec des images en haute définition. Pour vous entraîner, utilisez des images légères, et préférez une connexion fixe pour les vrais projets.

> [!retenir]
> - CVAT pour les images, Label Studio pour le texte : deux références gratuites.
> - Les raccourcis clavier font gagner un temps précieux.
> - Les annotations s''exportent en formats standard (COCO, YOLO, CSV).
> - Vitesse **et** précision : mesurez-vous et ralentissez si la qualité baisse.
> - Pas d''abonnement à payer : les outils sont fournis.

## Exercice pratique : vos deux premiers projets

> [!exercice] Exercice pratique · 2 heures
> 1. Dans CVAT, créez la tâche « Véhicules Tana » avec 15 photos de rues et annotez tous les véhicules avec des cadres, en suivant vos consignes du module 2.
> 2. Dans Label Studio, créez le projet « Avis clients » avec 30 avis (écrivez-les ou reprenez des commentaires publics) et classez-les.
> 3. Créez un projet d''entités nommées avec 10 phrases d''actualité malgache.
> 4. Notez le temps passé et le nombre de tâches pour chaque projet.
> 5. Exportez les annotations des cadres au format COCO ou YOLO.
>
> **À livrer** : des captures de chaque projet, vos fichiers d''export et votre tableau de temps.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-0-f', 2, 0, 'Quel outil gratuit est surtout utilisé pour annoter des images et des vidéos ?', '["Zoom","Canva","CVAT","Excel"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-0-f', 2, 1, 'Quel format sert à exporter des cadres d''images ?', '["COCO ou YOLO","PSD","DOCX","MP3"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-0-f', 2, 2, 'Faut-il payer un abonnement pour travailler sur une plateforme d''annotation ?', '["Non, les outils sont fournis","Oui, toujours","Seulement le premier mois","Oui, pour être prioritaire"]'::jsonb, 0);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('data-0-f', 3, 'Premier projet : un projet d''annotation complet', 'Les 5 phases d''un projet, la calibration, la production, le journal des cas limites, le contrôle qualité et le rapport.', 'Dans ce module, vous menez un projet d''annotation complet, comme dans une vraie entreprise : lecture des consignes, phase de test, production, contrôle qualité de votre propre travail et rapport final. Vous apprenez aussi à jouer le rôle de **contrôleur qualité**, première étape pour évoluer dans le métier.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Suivre les 5 phases d''un projet d''annotation.
> 2. Réussir une phase de test (calibration).
> 3. Tenir un journal des cas limites.
> 4. Contrôler la qualité d''un lot d''annotations.
> 5. Rédiger un rapport de projet.

## Le cas pratique : « Marché propre »

> [!exemple] Votre projet
> Une startup développe une application qui repère les déchets sur les photos des marchés pour aider les communes à organiser le ramassage. Elle vous confie **200 photos** de marchés malgaches à annoter avec des cadres, selon 4 catégories : **plastique**, **organique** (restes de fruits, légumes), **papier-carton**, **autre déchet**. Elle vous confie aussi **150 messages** d''habitants à classer : *signalement*, *question*, *remerciement*, *hors sujet*.

## Les 5 phases d''un projet d''annotation

| N° | Phase | Ce que vous faites | Résultat |
| --- | --- | --- | --- |
| 1 | **Consignes** | Lire, faire sa fiche mémo, poser ses questions | Fiche mémo d''une page |
| 2 | **Calibration** (test) | Annoter un petit lot que le client vérifie | Votre taux de précision de départ |
| 3 | **Production** | Annoter l''ensemble du lot | Annotations terminées |
| 4 | **Contrôle qualité** | Relire un échantillon, corriger | Taux d''erreurs mesuré |
| 5 | **Livraison** | Exporter, rédiger le rapport | Fichiers + rapport |

## Phase 1 : les consignes du projet « Marché propre »

Voici un extrait des consignes du client :

1. Encadrer chaque déchet **visible au sol ou sur les étals**, pas ceux dans une poubelle fermée.
2. Un **tas de déchets mélangés** reçoit un seul cadre « autre déchet » s''il est impossible de séparer les objets.
3. Les **sacs plastiques encore utilisés** (par un vendeur ou un client) ne sont **pas** des déchets.
4. Les objets de moins de 10 pixels de côté ne sont pas annotés.
5. En cas de doute entre deux catégories, choisir celle qui couvre **la plus grande partie** de l''objet.

> [!astuce]
> Transformez chaque règle en **question** pour votre fiche mémo : « Est-ce dans une poubelle fermée ? → ne pas annoter. » « Le sac est-il tenu par quelqu''un ? → ne pas annoter. » Vous décidez plus vite.

## Phase 2 : la calibration

> [!definition] Calibration
> Un petit lot de test (souvent 20 à 50 exemples) que tous les annotateurs font avant la production. Le client compare les réponses aux siennes et explique les erreurs. Sur les plateformes, on parle souvent de **test de qualification**.

### Réussir sa calibration en 4 points

1. Prenez **tout votre temps** : la vitesse ne compte pas encore.
2. Appliquez les consignes **à la lettre**, même si une règle vous semble étrange.
3. Signalez chaque hésitation.
4. Lisez **attentivement** les retours, et ajoutez chaque correction à votre fiche mémo.

## Phase 3 : la production

### Organiser son travail

1. Découpez le lot : 200 photos = **8 sessions de 25 photos**.
2. Après chaque session : pause de 10 minutes.
3. Notez dans votre **tableau de suivi** : date, nombre de tâches, temps passé, cas limites.

| Session | Photos | Temps | Cas limites rencontrés |
| --- | --- | --- | --- |
| 1 | 1 à 25 | 1 h 10 | 3 (sacs pendus à un étal) |
| 2 | 26 à 50 | 55 min | 1 (déchet dans l''eau) |
| … | … | … | … |

### Le journal des cas limites

Pour chaque cas limite, notez : le numéro de l''exemple, la description, ce que vous avez décidé, la règle utilisée, et la réponse du client s''il y en a une.

> [!exemple] Une ligne du journal
> **Photo 37** · Sac plastique accroché à un étal, personne ne le tient · Décision : non annoté (règle 3 : encore utilisé par le vendeur) · Question envoyée au client · Réponse : « Correct, un sac accroché à un étal est en usage. »

## Phase 4 : le contrôle qualité

Avant de livrer, contrôlez vous-même votre travail comme le ferait un contrôleur.

### La méthode

1. Tirez **au hasard 10 %** des tâches (20 photos et 15 messages).
2. Vérifiez chaque annotation avec la **grille de contrôle** ci-dessous.
3. Comptez les erreurs et calculez votre **taux de précision**.
4. Si vous trouvez une **erreur répétée** (la même règle mal appliquée), corrigez-la **dans tout le lot**, pas seulement dans l''échantillon.

### La grille de contrôle des cadres

| N° | Question | Oui / Non |
| --- | --- | --- |
| 1 | Tous les déchets visibles sont-ils encadrés ? | |
| 2 | Chaque cadre est-il serré ? | |
| 3 | Chaque cadre contient-il tout l''objet visible ? | |
| 4 | L''étiquette est-elle la bonne ? | |
| 5 | Les règles 1 à 5 du client sont-elles respectées ? | |

> [!exemple] Calcul du taux de précision
> Sur 20 photos contrôlées, vous comptez 160 cadres, dont 8 erreurs (oubli, cadre trop large, mauvaise étiquette). Précision : (160 − 8) ÷ 160 × 100 = **95 %**.

## Phase 5 : la livraison et le rapport

Le rapport tient sur une page :

1. **Volume** : nombre de photos et de messages annotés, nombre total de cadres.
2. **Temps passé** et temps moyen par tâche.
3. **Qualité** : votre taux de précision sur l''échantillon contrôlé, les erreurs corrigées.
4. **Cas limites** : les 3 à 5 plus fréquents, avec la décision prise.
5. **Propositions** pour améliorer les consignes.

> [!attention] Erreurs fréquentes des débutants
> - Sauter la relecture des consignes après la calibration.
> - Corriger seulement l''échantillon contrôlé et pas les mêmes erreurs dans le reste du lot.
> - Ne pas noter les cas limites, puis prendre des décisions différentes pour des cas identiques.
> - Travailler 4 heures d''affilée et livrer une fin de lot bâclée.

> [!retenir]
> - 5 phases : consignes, calibration, production, contrôle qualité, livraison.
> - La calibration se fait lentement, à la lettre, et ses retours vont dans la fiche mémo.
> - Un journal des cas limites garantit des décisions identiques pour des cas identiques.
> - Contrôlez 10 % de votre travail et corrigez les erreurs répétées partout.
> - Un rapport court : volume, temps, qualité, cas limites, propositions.

## Exercice pratique : le projet « Marché propre »

> [!exercice] Exercice pratique · 3 heures
> 1. Rassemblez 50 photos de marchés ou de rues (vos photos, ou des images libres de droits).
> 2. Rédigez votre fiche mémo à partir des 5 consignes du client.
> 3. Annotez les 10 premières photos lentement (calibration), puis relisez-les avec la grille.
> 4. Annotez les 40 photos suivantes dans CVAT, avec votre tableau de suivi et votre journal des cas limites.
> 5. Écrivez 50 messages d''habitants et classez-les dans Label Studio.
> 6. Contrôlez 10 % de votre travail, calculez votre taux de précision et rédigez le rapport.
>
> **À livrer** : la fiche mémo, les exports, le tableau de suivi, le journal des cas limites et le rapport. C''est votre projet de portfolio.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-0-f', 3, 0, 'Qu''est-ce que la calibration ?', '["Le paiement final","Un petit lot de test vérifié avant la production","L''export des fichiers","Le réglage de l''écran"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-0-f', 3, 1, 'Quelle part de votre travail contrôler vous-même avant de livrer ?', '["Seulement les images faciles","Seulement la première image","Aucune","Environ 10 %, tiré au hasard"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-0-f', 3, 2, 'Vous trouvez une erreur répétée dans l''échantillon. Que faire ?', '["La corriger seulement dans l''échantillon","L''ignorer","Recommencer tout le projet à zéro","La corriger dans tout le lot"]'::jsonb, 3);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('data-0-f', 4, 'Trouver des projets et se faire payer', 'Les 4 sources de travail, vérifier une offre, CV, tests de qualification, modes de rémunération, revenu réel, paiements et évolution.', 'Trouver du travail d''annotation, c''est surtout savoir **où chercher**, **réussir les tests d''entrée** et **éviter les arnaques**, qui sont nombreuses dans ce domaine. Ce dernier module vous donne une méthode complète pour décrocher vos premiers projets, être payé depuis Madagascar et évoluer vers des postes mieux rémunérés.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Identifier les 4 sources de travail et vérifier qu''elles sont sérieuses.
> 2. Préparer un profil et un CV d''annotateur.
> 3. Réussir les tests de qualification.
> 4. Comprendre les modes de rémunération et calculer votre revenu réel.
> 5. Vous faire payer depuis Madagascar.
> 6. Évoluer vers le contrôle qualité et l''évaluation d''IA.

## Les 4 sources de travail

| N° | Source | Comment ça marche | Points d''attention |
| --- | --- | --- | --- |
| 1 | **Plateformes d''annotation en ligne** | Inscription, tests, puis tâches disponibles selon les projets | Le travail peut être irrégulier ; vérifiez que la plateforme accepte les personnes résidant à Madagascar |
| 2 | **Entreprises d''annotation et d''externalisation** (à Madagascar et à l''étranger) | Recrutement classique : candidature, tests, formation, contrat | Revenu plus régulier ; horaires souvent fixés |
| 3 | **Plateformes de freelance** (Upwork et autres) | Des laboratoires et startups publient des missions d''annotation | Il faut un profil convaincant et des preuves |
| 4 | **Projets de langues** (malagasy, français) | Transcription, traduction, évaluation de réponses d''IA en malagasy | Missions plus rares mais où vous avez peu de concurrence |

### Vérifier qu''une offre est sérieuse : 6 questions

1. L''entreprise a-t-elle un **site officiel**, une adresse et des avis d''anciens travailleurs ?
2. Le recrutement passe-t-il par un **test** et une **formation**, plutôt que par une simple conversation WhatsApp ?
3. Les **modes de paiement** sont-ils clairs et écrits ?
4. Vous demande-t-on de **payer** quelque chose ? (Si oui : arnaque.)
5. Vous demande-t-on vos **codes** Mobile Money ou bancaires ? (Si oui : arnaque.)
6. Le revenu promis est-il **raisonnable** par rapport aux autres offres ?

> [!attention]
> Les arnaques les plus fréquentes : « frais d''inscription » pour accéder à une plateforme, « achat de compte » d''une plateforme au nom de quelqu''un d''autre, « tâches » qui consistent à aimer des vidéos contre de l''argent après avoir déposé un « dépôt ». **Ne louez et n''achetez jamais un compte** : c''est interdit par les plateformes et vous risquez de travailler sans jamais être payé.

## Le profil et le CV d''annotateur

### Ce que le recruteur cherche

1. **Rigueur** : un CV sans aucune faute, bien présenté.
2. **Langues** : niveau honnête en français, anglais, malagasy.
3. **Outils** : CVAT, Label Studio, tableur, raccourcis clavier.
4. **Preuves** : votre projet « Marché propre » avec vos chiffres (volume, temps, taux de précision).
5. **Disponibilité** : heures par semaine, horaires possibles.
6. **Équipement** : ordinateur, souris, connexion, connexion de secours.

> [!exemple] Phrase de présentation
> « Annotateur de données rigoureux, formé à l''annotation d''images (cadres, polygones) et de textes (classification, entités nommées) avec CVAT et Label Studio. Projet d''étude : 200 images annotées avec 95 % de précision au contrôle qualité. Français, malagasy, anglais intermédiaire. Disponible 30 heures par semaine. »

## Réussir les tests de qualification

1. **Choisissez le bon moment** : reposé, au calme, avec une bonne connexion.
2. **Lisez toutes les consignes**, même si le test semble simple.
3. **Prenez des notes** pendant la lecture (fiche mémo).
4. **Ne vous précipitez pas** : le test mesure surtout la précision.
5. **Vérifiez chaque réponse** avant de valider.
6. En cas d''échec, lisez les explications si elles sont données : beaucoup de plateformes permettent de repasser plus tard, ou de passer d''autres tests.

## Les modes de rémunération

| Mode | Comment | Avantages et risques |
| --- | --- | --- |
| **À la tâche** | Un montant par image, par texte ou par minute d''audio | Gagner plus si on est rapide ; mais revenu faible au début |
| **À l''heure** | Un montant par heure de travail suivie | Plus prévisible ; un minimum de productivité est exigé |
| **Salaire** | Montant mensuel fixe (entreprise) | Stable ; horaires et objectifs imposés |

### Calculer votre revenu réel à la tâche

Quand on est payé à la tâche, il faut toujours convertir en **revenu à l''heure** pour savoir si le projet vaut le coup.

> [!exemple] Calcul
> Une tâche est payée l''équivalent de 150 Ar. Vous en faites 40 par heure, mais vous passez aussi 1 heure non payée à lire les consignes pour chaque tranche de 10 heures de travail.
> - Revenu brut par heure de production : 40 × 150 = 6 000 Ar.
> - Sur 11 heures (10 de production + 1 de consignes) : 10 × 6 000 = 60 000 Ar, soit 60 000 ÷ 11 ≈ **5 450 Ar de l''heure réelle**.
>
> *(Montants donnés en exemple.)*

Comparez ce revenu réel entre projets, et privilégiez ceux où vous êtes à la fois précis et efficace.

## Se faire payer depuis Madagascar

| Situation | Moyens de paiement |
| --- | --- |
| Entreprise à Madagascar | Salaire par virement bancaire ou Mobile Money |
| Plateforme internationale | Selon la plateforme : souvent Payoneer, parfois virement bancaire ou autres services ; vérifiez **avant** de travailler que l''un d''eux fonctionne depuis Madagascar |
| Client direct à l''étranger | Virement international ou Payoneer |

> [!madagascar]
> Les possibilités de PayPal sont limitées pour Madagascar : ne travaillez pas pour une plateforme qui ne propose que PayPal sans avoir vérifié que vous pourrez retirer votre argent. Gardez une trace de chaque paiement et renseignez-vous sur vos obligations fiscales auprès du centre fiscal de votre ville.

## Évoluer dans le métier

| Étape | Ce qui change |
| --- | --- |
| **Annotateur confirmé** | Accès à des projets mieux payés (segmentation, vidéo, données médicales ou techniques) |
| **Contrôleur qualité** (*reviewer*) | Vous vérifiez le travail des autres annotateurs |
| **Évaluateur de réponses d''IA** | Vous jugez et comparez des réponses d''IA, souvent mieux rémunéré, exige un excellent niveau de langue |
| **Chef d''équipe d''annotation** | Vous formez et encadrez des annotateurs, rédigez les consignes |
| **Spécialiste par domaine** | Vos études (santé, droit, agriculture, informatique) donnent accès à des projets d''experts |

Votre **niveau de langue écrite** (français, anglais) et votre **taux de précision** sont les deux clés de la progression.

> [!retenir]
> - 4 sources : plateformes, entreprises, freelance, projets de langues.
> - Jamais de frais, jamais d''achat ou de location de compte.
> - Un CV avec des preuves chiffrées : volume, temps, précision.
> - Calculez toujours votre revenu réel à l''heure.
> - Vérifiez les moyens de paiement avant de commencer.

## Exercice pratique : votre plan de recherche

> [!exercice] Exercice pratique · 2 heures
> 1. Rédigez votre CV d''annotateur et votre phrase de présentation.
> 2. Trouvez 5 sources de travail (plateformes, entreprises à Madagascar, offres freelance) et vérifiez chacune avec les 6 questions.
> 3. Pour chaque source sérieuse, notez : le mode de paiement, le moyen de retrait depuis Madagascar, les tests demandés.
> 4. Faites le calcul du revenu réel pour 2 exemples de tarifs à la tâche.
> 5. Inscrivez-vous sur au moins une source sérieuse et passez le premier test.
>
> **À livrer** : votre CV, votre tableau des 5 sources avec la vérification, vos 2 calculs et la preuve de votre inscription.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-0-f', 4, 0, 'On vous propose d''acheter le compte d''une plateforme au nom de quelqu''un d''autre. Que faire ?', '["Demander une réduction","Accepter si le prix est bas","Refuser : c''est interdit et risqué","Accepter et partager les gains"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-0-f', 4, 1, 'Pourquoi calculer son revenu réel à l''heure ?', '["Pour payer moins d''impôts","Pour comparer les projets payés à la tâche","Ce n''est pas utile","Pour travailler moins"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-0-f', 4, 2, 'Que vérifier avant de travailler pour une plateforme internationale ?', '["Le nombre d''employés","Qu''un moyen de retrait fonctionne depuis Madagascar","Rien","La couleur de son logo"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Que fait un annotateur de données ?', '["Il vend des ordinateurs","Il répare les serveurs","Il ajoute des informations à des données pour entraîner une IA","Il écrit le code de l''IA"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Que se passe-t-il si les annotations sont fausses ?', '["L''IA les corrige toute seule","Les images sont supprimées","L''IA apprend des erreurs","Rien"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Quel type de tâche consiste à suivre le contour exact d''un objet ?', '["La segmentation","La transcription","La classification","Le cadre de délimitation"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Quel outil est indispensable pour dessiner des cadres précis ?', '["Un micro","Une imprimante","Une webcam","Une souris"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Pourquoi le malagasy peut-il être un avantage ?', '["Toutes les IA parlent déjà malagasy","C''est une langue peu présente dans les données des IA","Il n''est pas utile","Il remplace l''anglais"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Quand relire les consignes d''un projet ?', '["Seulement à la fin du projet","Jamais","Seulement si on est payé pour","Après les 20 premières annotations"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Un objet est en partie caché. Sauf consigne contraire, que faut-il encadrer ?', '["Rien","La partie visible","Tout le fond autour","L''objet entier imaginé"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', '5 personnes sur une photo : combien de cadres ?', '["5","1","10","2"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Qu''est-ce qu''une entité nommée ?', '["Un signe de ponctuation","Un mot qui désigne une chose précise : personne, lieu, organisation, date, montant","Un verbe","Un mot mal orthographié"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Comment surligner « Banque centrale de Madagascar » ?', '["Seulement « Madagascar »","Chaque mot séparément","Seulement « Banque »","Le groupe de mots entier"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Que sont les questions de contrôle ?', '["Des questions sur votre vie privée","Un examen scolaire","Des questions posées par le client au téléphone","Des exemples à la réponse connue glissés parmi vos tâches"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', '188 bonnes réponses sur 200 contrôlées : quel est le taux de précision ?', '["88 %","94 %","98 %","12 %"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Pourquoi signaler plutôt que deviner ?', '["Signaler rapporte plus d''argent","Deviner est plus lent","Le signalement améliore les consignes, l''erreur est apprise par l''IA","Il n''y a aucune différence"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Quel outil gratuit est adapté à la classification de textes ?', '["CapCut","Label Studio","Zoom","Photoshop"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Dans CVAT, que fait généralement la touche F ?', '["Exporter","Fermer le programme","Supprimer la forme","Passer à l''image suivante"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Que faire quand votre précision baisse ?', '["Ralentir et faire une pause","Accélérer","Changer de catégorie au hasard","Arrêter de contrôler"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Quelle routine de travail est conseillée ?', '["Travailler seulement la nuit","Des blocs de 45 à 50 minutes avec 10 minutes de pause","Une pause par jour","4 heures sans pause"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Quelles sont les 5 phases d''un projet d''annotation ?', '["Consignes, calibration, production, contrôle qualité, livraison","Appel, devis, facture, relance, fin","Photo, retouche, impression, vente, livraison","Inscription, paiement, attente, remboursement, fin"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Comment réussir une calibration ?', '["Copier les réponses d''un autre","Prendre son temps et appliquer les consignes à la lettre","Ignorer les règles étranges","Aller le plus vite possible"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'À quoi sert le journal des cas limites ?', '["Noter ses heures de sommeil","Écrire au client chaque jour","Remplacer les consignes","Prendre les mêmes décisions pour des cas identiques"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Sur 160 cadres contrôlés, 8 sont faux. Quel est le taux de précision ?', '["8 %","80 %","95 %","92 %"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Quel est un signe d''arnaque ?', '["On vous fait passer un test","On vous donne des consignes écrites","On vous forme au projet","On vous demande des frais d''inscription"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Que mettre en avant dans un CV d''annotateur ?', '["Un projet avec volume, temps et taux de précision","Le nombre d''amis sur Facebook","Une photo de profil retouchée","Ses loisirs uniquement"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Quel mode de rémunération est le plus prévisible ?', '["Le salaire ou le paiement à l''heure","Le paiement à la tâche","Les pourboires","Le paiement au hasard"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('data-0-f', 'Quelle évolution consiste à vérifier le travail des autres annotateurs ?', '["Comptable","Contrôleur qualité","Graphiste","Commercial"]'::jsonb, 1);

-- data-2-f
delete from public.exam_questions where course_id = 'data-2-f';
delete from public.module_questions where course_id = 'data-2-f';
delete from public.lessons where course_id = 'data-2-f' and module_index >= 5;
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('data-2-f', 0, 'Le métier d''opérateur de saisie depuis Madagascar', 'Ce que fait un opérateur de saisie, les 6 types de missions, qui donne du travail, les fausses offres, les qualités et le poste de travail.', 'Factures, bons de commande, formulaires, questionnaires, fiches clients : chaque jour, des entreprises ont des milliers de documents à transformer en données propres dans un tableau. L''opérateur de saisie fait ce travail avec **rapidité** et surtout **précision**. Madagascar compte de nombreuses entreprises de traitement de données, et une partie du travail se fait aujourd''hui à distance. Ce premier module vous présente le métier tel qu''il est vraiment.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Expliquer ce que fait un opérateur de saisie et pourquoi la précision est essentielle.
> 2. Citer les 6 types de missions les plus courants.
> 3. Repérer qui donne du travail de saisie.
> 4. Reconnaître les fausses offres de « saisie à domicile ».
> 5. Préparer un poste de travail confortable et efficace.

## Le métier d''opérateur de saisie en une phrase

Un opérateur de saisie **transforme des informations (papier, images, PDF, enregistrements) en données exactes, complètes et bien rangées dans un fichier ou un logiciel**.

Une seule erreur peut coûter cher : un montant mal saisi sur une facture, un numéro de téléphone faux dans un fichier clients, une date inversée dans un dossier. C''est pour ça que les entreprises paient des personnes **fiables**.

> [!definition] Donnée
> Une information enregistrée de façon à pouvoir être triée, comptée ou recherchée : un nom, une date, un montant, un numéro. Dans un tableau, chaque **ligne** est en général un élément (un client, une facture) et chaque **colonne** une information (nom, date, montant).

## Les 6 types de missions les plus courants

| N° | Mission | Exemple |
| --- | --- | --- |
| 1 | **Saisie de documents** | Recopier 500 factures scannées dans un tableau : numéro, date, fournisseur, montant |
| 2 | **Saisie de formulaires et questionnaires** | Enregistrer les réponses de 1 000 questionnaires papier d''une enquête d''ONG |
| 3 | **Mise à jour de fichiers** | Corriger les adresses et téléphones d''un fichier clients |
| 4 | **Nettoyage de données** | Supprimer les doublons, harmoniser les formats (dates, majuscules) |
| 5 | **Recherche et collecte** | Trouver sur Internet les coordonnées de 200 entreprises |
| 6 | **Saisie dans un logiciel** | Entrer les commandes dans un logiciel de gestion ou un site e-commerce |

> [!madagascar] Votre avantage
> Madagascar a une longue expérience des centres de traitement de données, surtout en français. Les entreprises connaissent la qualité de ce travail, et beaucoup de missions se font en **français**, un vrai atout face à d''autres pays.

## Qui donne du travail de saisie ?

1. **Entreprises de traitement de données et d''externalisation** à Madagascar : recrutement de salariés, parfois en télétravail après une période sur place.
2. **PME et cabinets** (comptables, médicaux, immobiliers) qui externalisent leur saisie.
3. **ONG et bureaux d''études** : saisie d''enquêtes et de questionnaires.
4. **Boutiques en ligne** : saisie de produits, de commandes, de stocks.
5. **Plateformes de freelance** : petites missions de saisie, de recherche et de nettoyage de fichiers.

## Reconnaître les fausses offres

Les annonces de « saisie à domicile » sont parmi les plus utilisées par les escrocs.

### Les 6 signaux d''alerte

1. On vous demande de **payer** : frais d''inscription, « kit de démarrage », logiciel obligatoire, formation.
2. Le revenu promis est **très élevé** pour un travail présenté comme facile.
3. On vous envoie un « travail test » puis on refuse de vous payer pour « trop d''erreurs », sans preuve.
4. Le contact se fait **uniquement par WhatsApp**, sans nom d''entreprise vérifiable.
5. On vous demande vos **codes** Mobile Money ou bancaires.
6. On vous propose de recevoir de l''argent sur votre compte pour le **renvoyer** à quelqu''un d''autre : c''est souvent du blanchiment, et c''est **illégal**.

> [!attention]
> Une vraie entreprise ne vous fait **jamais payer** pour travailler pour elle, et ne vous demande jamais de faire transiter de l''argent par votre compte.

## Les qualités demandées

| Qualité | Pourquoi |
| --- | --- |
| **Précision** | Une erreur peut coûter cher à l''entreprise |
| **Vitesse de frappe** | Plus vous êtes rapide (sans erreur), plus vous traitez de documents |
| **Concentration** | Garder la même qualité sur des centaines de lignes |
| **Respect des consignes** | Chaque client a ses règles de saisie |
| **Confidentialité** | Vous voyez des données personnelles et financières |
| **Régularité** | Les clients attendent des volumes constants |

## Le poste de travail

1. Un **ordinateur** avec un **clavier complet** (avec pavé numérique : très utile pour les montants).
2. Une **souris**.
3. Un **grand écran**, ou deux écrans : le document d''un côté, le tableau de l''autre. C''est un vrai gain de vitesse.
4. Une **chaise** réglable, l''écran à hauteur des yeux, les avant-bras à l''horizontale.
5. Une **bonne lumière**, sans reflet sur l''écran.
6. Une **connexion stable** pour les outils en ligne.

> [!astuce] Protéger son corps
> Toutes les 45 à 50 minutes : levez-vous, étirez les poignets et les épaules, regardez au loin pendant 20 secondes. Après des mois de saisie, les douleurs aux poignets et au dos sont fréquentes si l''on ne fait pas attention.

> [!retenir]
> - Un opérateur de saisie transforme des informations en données exactes et bien rangées.
> - La précision passe avant la vitesse.
> - Entreprises de traitement de données, PME, ONG, boutiques en ligne et plateformes donnent du travail.
> - On ne paie jamais pour travailler, et on ne fait jamais transiter d''argent pour quelqu''un.

## Exercice pratique : votre point de départ

> [!exercice] Exercice pratique · 45 minutes
> 1. Faites un test de vitesse de frappe gratuit en ligne en français (3 essais) et notez votre vitesse (mots par minute) et votre précision (%).
> 2. Faites un test de saisie de chiffres (pavé numérique) et notez le résultat.
> 3. Installez votre poste selon les 6 points et prenez une photo.
> 4. Trouvez une annonce de « saisie à domicile » et vérifiez-la avec les 6 signaux d''alerte.
>
> **À livrer** : vos résultats de tests, la photo de votre poste et votre analyse de l''annonce. Vous referez ces tests au module 5 pour mesurer vos progrès.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-2-f', 0, 0, 'Qu''est-ce qui compte le plus pour un opérateur de saisie ?', '["La précision","La vitesse à tout prix","La créativité","Le nombre d''écrans"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-2-f', 0, 1, 'On vous propose de recevoir de l''argent sur votre compte pour le renvoyer à quelqu''un. Que faire ?', '["Demander plus d''argent","Refuser : c''est souvent du blanchiment, illégal","Accepter si on vous paie une commission","Accepter une seule fois"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-2-f', 0, 2, 'Pourquoi un clavier avec pavé numérique est-il utile ?', '["Pour écrire en majuscules","Pour saisir vite les montants et les chiffres","Pour jouer","Il n''est pas utile"]'::jsonb, 1);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('data-2-f', 1, 'Les bases : frappe, règles de saisie et contrôles', 'La frappe à 10 doigts, le pavé numérique, les 8 règles de saisie, le tableau propre, les 6 erreurs fréquentes et 4 méthodes de contrôle.', 'Une saisie de qualité repose sur trois choses : une **frappe** rapide et sûre, des **règles de saisie** appliquées sans exception, et des **contrôles** qui attrapent les erreurs avant le client. Ce module vous donne ces bases, avec des règles précises et des exemples.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Taper avec les 10 doigts et utiliser le pavé numérique sans regarder.
> 2. Appliquer les 8 règles de saisie les plus courantes.
> 3. Organiser un tableau de données propre.
> 4. Repérer et éviter les 6 erreurs de saisie les plus fréquentes.
> 5. Contrôler votre travail avec 4 méthodes.

## La frappe : vitesse et précision

### La position des 10 doigts

1. Les index se posent sur les touches **F** et **J** (elles ont un petit relief).
2. Chaque doigt reste sur sa rangée de départ et revient à sa place après chaque touche.
3. Les pouces sont pour la barre d''espace.
4. **Ne regardez pas le clavier** : regardez le document et l''écran.

Sur un clavier français (AZERTY), la rangée de départ est : **Q S D F** pour la main gauche et **J K L M** pour la main droite.

### Le pavé numérique

1. Activez-le avec la touche **Verr Num**.
2. L''index de la main droite se pose sur le **4**, le majeur sur le **5** (petit relief), l''annulaire sur le **6**.
3. Le pouce est pour le **0**, l''auriculaire pour **Entrée**.

> [!definition] Frappes par heure
> La mesure habituelle de la vitesse en saisie de données : le nombre de touches tapées en une heure. On parle aussi de **mots par minute** pour le texte. Les deux ne valent rien sans la **précision** : 99 % de frappes justes est un minimum courant dans les entreprises.

### Progresser chaque jour

1. **15 minutes par jour** d''exercices gratuits de dactylographie en ligne.
2. Commencez **lentement, sans erreur**, puis accélérez.
3. Notez vos résultats chaque semaine.
4. En 4 à 8 semaines d''entraînement régulier, la progression est nette.

## Les 8 règles de saisie les plus courantes

Chaque client a ses consignes. Mais ces règles reviennent presque toujours, et il faut les appliquer **à chaque ligne**.

| N° | Règle | Correct | Incorrect |
| --- | --- | --- | --- |
| 1 | **Saisir exactement ce qui est écrit**, sans abréger, corriger ni deviner | Document : « Rakotomalala » → saisi « Rakotomalala » | « Rakoto » (abrégé) ; « Rakotomalal » (lettre oubliée) |
| 2 | **Un format de date unique**, celui du client | 14/03/2026 | 14-3-26 ; 14 mars 2026 ; 3/14/2026 |
| 3 | **Les nombres sans texte** dans les colonnes de montants | 125000 | 125 000 Ar ; cent vingt-cinq mille |
| 4 | **Majuscules** selon la consigne | RAKOTO Jean (nom en majuscules si demandé) | rakoto jean |
| 5 | **Pas d''espaces** au début ou à la fin | « Toamasina » | « Toamasina  » |
| 6 | **Numéros de téléphone** dans un format unique | 034 12 345 67 | 0341234567 dans une ligne, +261 34… dans la suivante |
| 7 | **Champ illisible** : un code convenu, jamais une invention | [ILLISIBLE] | Un chiffre deviné |
| 8 | **Champ vide** : laisser vide ou mettre le code convenu | (vide) ou [VIDE] | 0 (qui veut dire autre chose) |

> [!attention]
> La règle 7 est la plus importante : **ne devinez jamais**. Un champ marqué [ILLISIBLE] sera vérifié par le client. Un chiffre deviné sera pris pour vrai, et l''erreur ne sera découverte que bien plus tard, quand elle aura coûté cher.

## Un tableau de données propre

### Les 6 règles d''un bon tableau

1. **Une ligne = un élément** (une facture, un client, un questionnaire).
2. **Une colonne = une seule information** : séparez « Nom » et « Prénom », « Code postal » et « Ville ».
3. **Une seule ligne de titres**, en haut, sans cellules fusionnées.
4. **Pas de lignes vides** au milieu des données.
5. **Pas de mise en forme qui porte une information** (une couleur pour dire « payé ») : créez plutôt une colonne « Statut ».
6. **Un identifiant unique** par ligne quand c''est possible (numéro de facture, numéro de questionnaire).

> [!exemple] Avant / après
> **Avant** (une seule colonne) : « Facture 125 du 14/3 - Épicerie Soa Tana - 125.000 Ar payé »
> **Après** (5 colonnes) :
>
> | N° facture | Date | Client | Ville | Montant | Statut |
> | --- | --- | --- | --- | --- | --- |
> | 125 | 14/03/2026 | Épicerie Soa | Antananarivo | 125000 | Payé |

## Les 6 erreurs de saisie les plus fréquentes

| N° | Erreur | Exemple | Comment l''éviter |
| --- | --- | --- | --- |
| 1 | **Inversion** de chiffres | 1 254 au lieu de 1 524 | Relire les montants par groupes de 2 ou 3 chiffres |
| 2 | **Oubli** ou **ajout** d''un zéro | 12 500 au lieu de 125 000 | Contrôler les totaux |
| 3 | **Confusion** de caractères | O et 0, l et 1, S et 5 | Zoomer sur le document, connaître le contexte (un code postal ne contient pas de lettres) |
| 4 | **Décalage de ligne** | Les données d''une facture saisies sur la ligne de la suivante | Vérifier l''identifiant au début de chaque ligne |
| 5 | **Mauvaise colonne** | Le téléphone dans la colonne « Adresse » | Garder toujours le même ordre de saisie |
| 6 | **Saut de document** | Une facture oubliée | Numéroter les documents et compter |

## Contrôler son travail : 4 méthodes

1. **Le comptage** : le nombre de lignes du tableau = le nombre de documents.
2. **Le total de contrôle** : la somme des montants saisis = le total indiqué par le client (ou calculé sur les documents).
3. **L''échantillon** : relisez au hasard 5 à 10 % des lignes en les comparant aux documents.
4. **La double saisie** (pour les données très importantes) : deux personnes saisissent les mêmes documents, et on compare les deux tableaux ; chaque différence révèle une erreur.

> [!definition] Taux d''erreur
> Le nombre d''erreurs trouvées divisé par le nombre de champs contrôlés. Exemple : 3 erreurs sur 1 000 champs contrôlés = 3 ÷ 1 000 × 100 = **0,3 %** d''erreur, soit **99,7 %** de précision.

> [!madagascar]
> Les noms malgaches sont longs et les fautes de frappe y passent facilement inaperçues (« Andrianarivelo », « Razafindrakoto »). Relisez-les **syllabe par syllabe** dans votre échantillon de contrôle : c''est là que se cachent beaucoup d''erreurs.

> [!retenir]
> - 10 doigts, pavé numérique, et les yeux sur le document.
> - Saisir exactement ce qui est écrit ; jamais deviner : [ILLISIBLE].
> - Une ligne = un élément, une colonne = une information.
> - Inversions, zéros, confusions, décalages : les erreurs à traquer.
> - Comptage, total de contrôle, échantillon, double saisie.

## Exercice pratique : vos premières saisies

> [!exercice] Exercice pratique · 1 heure 30
> 1. Faites 15 minutes d''exercice de dactylographie à 10 doigts, puis 10 minutes de pavé numérique.
> 2. Rassemblez 20 tickets de caisse, factures ou reçus (les vôtres ou ceux de votre famille).
> 3. Créez un tableau avec les colonnes : N°, Date, Commerçant, Ville, Montant, Moyen de paiement.
> 4. Saisissez les 20 documents en respectant les 8 règles.
> 5. Contrôlez : comptage, total de contrôle (calculez la somme à la main ou à la calculatrice), et relecture de 4 lignes au hasard.
>
> **À livrer** : votre tableau, votre contrôle et votre taux d''erreur.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-2-f', 1, 0, 'Que faire d''un champ illisible ?', '["Supprimer toute la ligne","Deviner la valeur la plus probable","Laisser un zéro","Mettre le code convenu, comme [ILLISIBLE], sans deviner"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-2-f', 1, 1, 'Dans un tableau propre, que représente une ligne ?', '["Une information, par exemple la date","Un élément, par exemple une facture","Un titre","Une couleur"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-2-f', 1, 2, '3 erreurs sur 1 000 champs contrôlés : quel est le taux d''erreur ?', '["0,3 %","3 %","30 %","0,03 %"]'::jsonb, 0);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('data-2-f', 2, 'Les outils : Google Sheets, Excel, OCR, et les outils payants', 'Raccourcis, validation des données, 6 fonctions de nettoyage, doublons, tri et filtres, Google Forms, OCR, puis Microsoft 365 et ABBYY FineReader.', 'Le tableur est l''outil principal de l''opérateur de saisie. Bien utilisé, il **empêche** les erreurs avant qu''elles arrivent, **nettoie** les données en quelques secondes et **contrôle** le travail automatiquement. Ce module vous fait prendre en main Google Sheets et Excel, la reconnaissance de texte gratuite, puis les outils payants que demandent certains clients.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Saisir vite au clavier dans un tableur avec les bons raccourcis.
> 2. Empêcher les erreurs avec la validation des données et les listes déroulantes.
> 3. Nettoyer des données avec 6 fonctions et la suppression des doublons.
> 4. Trier, filtrer et contrôler un tableau.
> 5. Transformer une image ou un PDF en texte avec un outil gratuit.
> 6. Savoir quand passer à Microsoft 365 et ABBYY FineReader.

## Les outils gratuits

| N° | Outil | À quoi il sert |
| --- | --- | --- |
| 1 | **Google Sheets** | Tableur en ligne, partage avec le client, historique des versions |
| 2 | **Excel** (selon la version disponible) | Le tableur le plus utilisé en entreprise |
| 3 | **Google Forms** | Créer un formulaire de saisie qui remplit un tableau automatiquement |
| 4 | **Google Drive** (reconnaissance de texte) | Transformer une image ou un PDF scanné en texte modifiable |
| 5 | **Site d''exercices de dactylographie** | S''entraîner chaque jour |

Les menus et fonctions ci-dessous sont donnés en français. Ils sont presque identiques dans Google Sheets et Excel.

## Saisir vite dans un tableur

| Touche | Action |
| --- | --- |
| **Tab** | Valider et passer à la cellule de droite |
| **Entrée** | Valider et passer à la ligne suivante (en revenant à la première colonne saisie après une série de Tab, dans Excel) |
| **Ctrl + flèche** | Aller au bout des données dans une direction |
| **Ctrl + D** | Recopier la cellule du dessus |
| **Ctrl + Z** | Annuler |
| **F2** | Modifier la cellule sans effacer son contenu (Excel) |

> [!astuce] Figer la ligne de titres
> **Affichage → Figer** (Google Sheets) ou **Affichage → Figer les volets** (Excel) : la ligne de titres reste visible quand vous descendez dans le tableau. Vous ne vous trompez plus de colonne.

## Empêcher les erreurs : la validation des données

La validation des données refuse (ou signale) une saisie qui ne respecte pas la règle. C''est le meilleur moyen d''éviter les erreurs.

### Créer une liste déroulante

1. Sélectionnez la colonne (par exemple « Moyen de paiement »).
2. **Données → Validation des données**.
3. Choisissez **Liste** (ou « Menu déroulant ») et entrez les choix : Espèces, MVola, Orange Money, Airtel Money, Virement.
4. Choisissez de **refuser** les saisies hors liste.

### Les autres règles utiles

| Colonne | Règle |
| --- | --- |
| Date | Doit être une date valide |
| Montant | Doit être un nombre supérieur à 0 |
| Quantité | Nombre entier entre 1 et 1 000 |
| Téléphone | Longueur exacte du texte (selon le format choisi) |

## Nettoyer des données : 6 fonctions

Dans les fonctions en français, on sépare les éléments par un **point-virgule** ( ; ).

| Fonction | Ce qu''elle fait | Exemple | Résultat |
| --- | --- | --- | --- |
| **SUPPRESPACE** | Supprime les espaces en trop | `=SUPPRESPACE(A2)` sur « Toamasina  » | « Toamasina » |
| **MAJUSCULE** | Met tout en majuscules | `=MAJUSCULE(A2)` sur « rakoto » | « RAKOTO » |
| **NOMPROPRE** | Met une majuscule à chaque mot | `=NOMPROPRE(A2)` sur « jean RAKOTO » | « Jean Rakoto » |
| **NB.SI** | Compte combien de fois une valeur apparaît | `=NB.SI(A:A;A2)` | 2 si la valeur est en double |
| **SOMME** | Additionne | `=SOMME(E2:E101)` | Le total de contrôle |
| **RECHERCHEV** | Cherche une valeur dans un autre tableau | `=RECHERCHEV(B2;Clients!A:C;3;FAUX)` | La ville du client dont le code est en B2 |

> [!exemple] Nettoyer une colonne de noms en 4 étapes
> 1. Insérez une colonne vide à côté de la colonne « Nom ».
> 2. Tapez `=NOMPROPRE(SUPPRESPACE(A2))` dans la première cellule, puis recopiez vers le bas.
> 3. Copiez la nouvelle colonne, puis **Collage spécial → Valeurs uniquement** à la place de l''ancienne.
> 4. Supprimez la colonne de travail.

### Supprimer les doublons

- **Google Sheets** : **Données → Nettoyage des données → Supprimer les doublons**.
- **Excel** : **Données → Supprimer les doublons**.

**Attention** : faites toujours une **copie** de la feuille avant, et choisissez bien les colonnes qui définissent un doublon (par exemple le numéro de facture, pas le nom du client, qui peut revenir plusieurs fois normalement).

## Trier, filtrer, contrôler

1. **Trier** : sélectionnez tout le tableau, puis trier par une colonne (date, montant). Ne triez **jamais** une seule colonne : les lignes seraient mélangées.
2. **Filtrer** : **Données → Créer un filtre** (Sheets) ou **Données → Filtrer** (Excel). Vous affichez par exemple seulement les montants supérieurs à 1 000 000 Ar, ou les cellules vides.
3. **Contrôler** avec des formules :
   - `=NBVAL(A2:A1000)` compte les lignes remplies (comparez au nombre de documents).
   - `=SOMME(E2:E1000)` donne le total de contrôle.
   - `=NB.SI(A:A;A2)>1` repère les identifiants en double.
4. **Mise en forme conditionnelle** : colorez automatiquement les cellules vides ou les montants anormaux pour les voir d''un coup d''œil.

> [!attention]
> Gardez **toujours** une copie de la version d''origine avant de nettoyer, trier ou supprimer. Dans Google Sheets, l''**historique des versions** (Fichier → Historique des versions) permet aussi de revenir en arrière.

## Formulaires de saisie avec Google Forms

Pour saisir beaucoup de questionnaires identiques, un formulaire est souvent plus rapide et plus sûr qu''un tableau.

1. Créez un **Google Forms** avec une question par champ du questionnaire papier, dans le **même ordre**.
2. Utilisez des **choix multiples** et des **listes** dès que possible : moins de frappe, moins d''erreurs.
3. Rendez les champs importants **obligatoires**.
4. Reliez le formulaire à une **feuille Google Sheets** : chaque envoi crée une ligne.

## La reconnaissance de texte (OCR)

> [!definition] OCR
> *Optical Character Recognition*, ou reconnaissance optique de caractères : un logiciel qui « lit » le texte d''une image ou d''un PDF scanné et le transforme en texte que l''on peut copier.

### L''OCR gratuit de Google Drive

1. Importez l''image ou le PDF dans Google Drive.
2. **Clic droit → Ouvrir avec → Google Docs**.
3. Le document s''ouvre avec l''image en haut et le **texte reconnu** en dessous.
4. Copiez le texte dans votre tableau, puis **vérifiez chaque chiffre** : l''OCR confond souvent 0 et O, 1 et l, 5 et S, surtout sur des documents de mauvaise qualité.

L''OCR fait gagner du temps sur les documents **imprimés** et nets. Sur l''écriture manuscrite ou les documents abîmés, la saisie manuelle reste souvent plus sûre.

## Quand passer aux outils payants ?

| Outil payant | Ce qu''il apporte | Qui le paie en général |
| --- | --- | --- |
| **Microsoft Excel** (Microsoft 365) | Toutes les fonctions d''Excel, dont **Power Query** pour nettoyer et transformer de gros fichiers automatiquement ; compatibilité totale avec les fichiers des entreprises | Vous, si vos clients exigent Excel ; ou l''entreprise qui vous emploie |
| **ABBYY FineReader** | OCR professionnel très précis, conversion de PDF en Excel en gardant les tableaux, traitement de nombreux documents à la fois | Vous, si vous traitez de gros volumes de documents scannés ; ou le client |

Les prix changent : vérifiez-les sur les sites officiels. Dans les entreprises de traitement de données, les logiciels sont **fournis**. En freelance, commencez avec Google Sheets et l''OCR de Google Drive, et investissez quand un client régulier l''exige.

> [!madagascar]
> Google Sheets fonctionne en ligne, mais il peut aussi être utilisé **hors connexion** dans le navigateur Chrome si vous activez ce mode à l''avance dans Google Drive. Utile pendant les coupures de connexion : vos saisies sont synchronisées au retour d''Internet.

> [!retenir]
> - Tab, Entrée, Ctrl + D et une ligne de titres figée pour saisir vite.
> - Validation des données et listes déroulantes : les erreurs sont bloquées à la source.
> - SUPPRESPACE, NOMPROPRE, MAJUSCULE, NB.SI, SOMME, RECHERCHEV pour nettoyer et contrôler.
> - Toujours une copie avant de nettoyer ou de supprimer des doublons.
> - OCR pour gagner du temps, mais chaque chiffre est vérifié.

## Exercice pratique : un tableau qui se protège

> [!exercice] Exercice pratique · 2 heures
> 1. Reprenez votre tableau de 20 reçus du module 2 dans Google Sheets.
> 2. Ajoutez une liste déroulante pour « Moyen de paiement » et des règles pour « Date » et « Montant ».
> 3. Ajoutez volontairement 5 erreurs (espaces, minuscules, doublon), puis nettoyez-les avec les fonctions et la suppression des doublons.
> 4. Ajoutez les formules de contrôle (NBVAL, SOMME, NB.SI) et une mise en forme conditionnelle pour les cellules vides.
> 5. Prenez en photo un document imprimé (facture, page de livre), passez-le dans l''OCR de Google Drive et comptez les erreurs de reconnaissance.
> 6. Créez un Google Forms de 6 questions relié à une feuille.
>
> **À livrer** : le lien de votre tableau (en lecture seule), le lien du formulaire et votre compte rendu sur l''OCR.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-2-f', 2, 0, 'À quoi sert la validation des données ?', '["Envoyer le fichier","Imprimer le tableau","Refuser les saisies qui ne respectent pas une règle","Colorer les cellules"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-2-f', 2, 1, 'Quelle fonction supprime les espaces en trop ?', '["SOMME","SUPPRESPACE","NB.SI","MAJUSCULE"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-2-f', 2, 2, 'Que faire avant de supprimer des doublons ?', '["Fermer le fichier","Trier une seule colonne","Supprimer la ligne de titres","Faire une copie de la feuille"]'::jsonb, 3);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('data-2-f', 3, 'Premier projet : saisir et contrôler un lot de questionnaires', 'Analyse de la consigne, préparation du tableau et des documents, sessions de saisie, cas difficiles, 5 contrôles et rapport de livraison.', 'Dans ce module, vous traitez un vrai lot de saisie, comme ceux que confient les entreprises et les ONG : 100 questionnaires d''enquête à saisir, nettoyer, contrôler et livrer. Vous suivez la méthode d''un professionnel, du bon de commande au rapport de livraison.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Analyser une consigne de saisie et préparer le tableau.
> 2. Organiser un lot de documents pour ne rien perdre.
> 3. Saisir un lot avec un rythme régulier et un suivi.
> 4. Contrôler la qualité avec un échantillon et des totaux.
> 5. Livrer avec un rapport clair.

## Le cas pratique : l''enquête « Rano sy Fahasalamana »

> [!exemple] Votre mission
> Une ONG a mené une enquête sur l''accès à l''eau dans 4 communes de la région Analamanga. Elle vous confie **100 questionnaires** scannés (PDF), remplis à la main par les enquêteurs. Chaque questionnaire contient 15 questions : commune, date, nombre de personnes dans le foyer, source d''eau principale, distance jusqu''à la source, prix payé par mois, etc. Elle veut un tableau propre sous **5 jours**, avec un **taux d''erreur inférieur à 0,5 %**.

## Étape 1 : analyser la consigne

Avant de saisir la première ligne, lisez toute la consigne et posez vos questions **en une seule fois**.

### Les 8 questions à se poser

1. Quelles sont les **colonnes** attendues, dans quel **ordre** ?
2. Quel **format** pour les dates, les nombres, les noms ?
3. Les réponses à choix sont-elles à saisir en **texte** (« Puits ») ou en **code** (« 2 ») ?
4. Que faire d''une réponse **illisible** ? D''une réponse **vide** ? D''une **réponse incohérente** (12 personnes dans le foyer, mais 0 adulte) ?
5. Faut-il saisir les **commentaires** écrits en marge ?
6. Quel **format de fichier** livrer (Excel, Google Sheets, CSV) ?
7. Quel **taux d''erreur** est accepté, et comment sera-t-il contrôlé ?
8. Les données sont-elles **confidentielles** (noms, téléphones) ?

> [!exemple] Extrait du tableau de codes fourni par l''ONG
>
> | Question | Réponse | Code à saisir |
> | --- | --- | --- |
> | Source d''eau principale | Robinet dans la maison | 1 |
> | | Borne-fontaine | 2 |
> | | Puits | 3 |
> | | Rivière ou source | 4 |
> | | Autre | 9 |
> | Réponse illisible | — | 98 |
> | Pas de réponse | — | 99 |

## Étape 2 : préparer le tableau et les documents

### Le tableau

1. Une colonne **N° questionnaire** en premier (l''identifiant unique).
2. Les 15 colonnes dans **l''ordre du questionnaire papier** : vos yeux suivent le document de haut en bas, vos doigts suivent le tableau de gauche à droite.
3. Une colonne **Remarques** à la fin, pour signaler un problème.
4. La **ligne de titres figée**.
5. Les **validations** : listes de codes, dates valides, nombres entre des limites raisonnables (exemple : nombre de personnes entre 1 et 30).

### Les documents

1. Vérifiez que vous avez bien **100 fichiers**, et qu''ils s''ouvrent tous.
2. **Renommez**-les si besoin dans un ordre clair : `Q001.pdf`, `Q002.pdf`… `Q100.pdf`.
3. Créez une **liste de suivi** : numéro, saisi (oui / non), problème.

## Étape 3 : saisir le lot

### Organiser les sessions

| Session | Questionnaires | Temps | Problèmes notés |
| --- | --- | --- | --- |
| 1 | Q001 à Q020 | 1 h 40 | Q007 : âge illisible (98) ; Q015 : 2 sources cochées |
| 2 | Q021 à Q040 | 1 h 25 | Q033 : page 2 manquante |
| … | … | … | … |

1. Sessions de **20 questionnaires** environ, puis une pause.
2. Le document à **gauche** (ou sur le premier écran), le tableau à **droite**.
3. Toujours le **même ordre** de saisie, colonne par colonne.
4. Vérifiez le **N° questionnaire** au début de chaque ligne : c''est la protection contre les décalages.
5. Notez chaque problème dans la colonne **Remarques** et dans la liste de suivi.

> [!astuce] Le rythme
> Les premiers questionnaires sont lents : vous découvrez l''écriture des enquêteurs et les cas difficiles. Ne vous inquiétez pas : votre vitesse augmente nettement après une vingtaine de documents. Ne sacrifiez jamais la précision pour rattraper le temps.

### Les cas difficiles

| Cas | Ce qu''on fait |
| --- | --- |
| Réponse illisible | Code 98 et remarque, **jamais** une supposition |
| Deux réponses cochées pour une question à choix unique | Suivre la consigne ; si rien n''est prévu, saisir la première et le signaler en remarque |
| Réponse incohérente (prix de l''eau de 2 000 000 Ar par mois) | Saisir ce qui est écrit, et le signaler en remarque |
| Page manquante | Saisir ce qui existe, codes 99 pour le reste, et signaler |

## Étape 4 : contrôler la qualité

### Les 5 contrôles

1. **Comptage** : 100 lignes, 100 numéros différents (vérifiez avec NB.SI qu''il n''y a pas de doublon).
2. **Cellules vides** : la mise en forme conditionnelle les fait ressortir ; chaque vide doit être un 99 ou être justifié.
3. **Valeurs anormales** : triez chaque colonne de nombres et regardez les plus petites et les plus grandes valeurs.
4. **Échantillon** : tirez **10 questionnaires au hasard** et comparez **chaque champ** avec le document.
5. **Calcul du taux d''erreur** sur l''échantillon.

> [!exemple] Calcul du taux d''erreur
> 10 questionnaires × 15 champs = 150 champs contrôlés. Vous trouvez 1 erreur.
> Taux d''erreur : 1 ÷ 150 × 100 ≈ **0,67 %**. C''est **au-dessus** de l''objectif de 0,5 %.
> Que faire ? Corrigez l''erreur, cherchez si elle se répète (même type d''erreur sur d''autres lignes), puis contrôlez **10 autres questionnaires**. Si le nouvel échantillon est sans erreur : 1 erreur sur 300 champs ≈ 0,33 %, l''objectif est atteint.

## Étape 5 : livrer avec un rapport

Le rapport tient sur une page :

1. **Volume** : 100 questionnaires saisis, 1 500 champs.
2. **Temps** total et temps moyen par questionnaire.
3. **Qualité** : taille de l''échantillon contrôlé, erreurs trouvées et corrigées, taux d''erreur final.
4. **Problèmes** : la liste des questionnaires avec remarques (illisibles, pages manquantes, incohérences).
5. **Fichier livré** : nom, format, nombre de lignes et de colonnes.

> [!madagascar]
> Les questionnaires remplis par différents enquêteurs ont des écritures très différentes. Si un enquêteur a une écriture difficile, signalez-le à l''ONG dans le rapport, avec les numéros concernés : elle pourra vérifier auprès de lui. C''est une information précieuse pour elle.

> [!attention] Erreurs fréquentes des débutants
> - Commencer à saisir avant d''avoir posé ses questions.
> - Un ordre de colonnes différent de l''ordre du questionnaire.
> - Deviner une réponse illisible.
> - Contrôler seulement quelques champs au lieu de questionnaires complets.
> - Livrer sans rapport ni liste des problèmes.

> [!retenir]
> - Lire toute la consigne et poser ses questions en une fois.
> - Un tableau dans l''ordre du document, avec validations et colonne Remarques.
> - Des sessions régulières, un suivi, et le numéro vérifié à chaque ligne.
> - 5 contrôles, dont un échantillon complet et le calcul du taux d''erreur.
> - Un rapport d''une page avec la liste des problèmes.

## Exercice pratique : votre lot de saisie

> [!exercice] Exercice pratique · 4 heures
> 1. Créez un questionnaire papier de 10 questions (sur un sujet simple : habitudes de transport, usage du téléphone) et faites-le remplir à la main par 30 personnes de votre entourage, ou remplissez-en vous-même 30 en variant les écritures.
> 2. Rédigez la consigne de saisie et le tableau de codes.
> 3. Préparez le tableau avec validations, puis saisissez les 30 questionnaires en notant votre temps et les problèmes.
> 4. Faites les 5 contrôles, avec un échantillon de 5 questionnaires, et calculez votre taux d''erreur.
> 5. Rédigez le rapport de livraison.
>
> **À livrer** : la consigne, le tableau final, la liste de suivi, votre calcul du taux d''erreur et le rapport. C''est votre projet de portfolio.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-2-f', 3, 0, 'Dans quel ordre placer les colonnes du tableau ?', '["Au hasard","Les plus faciles d''abord","Dans l''ordre du questionnaire papier","Par ordre alphabétique"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-2-f', 3, 1, 'Une réponse semble incohérente. Que faire ?', '["Supprimer le questionnaire","Saisir ce qui est écrit et le signaler en remarque","La corriger selon votre idée","La laisser vide sans rien dire"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-2-f', 3, 2, 'Comment éviter les décalages de lignes ?', '["Vérifier le numéro du questionnaire au début de chaque ligne","Ne pas utiliser de numéros","Fusionner les cellules","Saisir plus vite"]'::jsonb, 0);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('data-2-f', 4, 'Trouver du travail et se faire payer', 'Sources sérieuses, CV chiffré, tests de recrutement, prix à l''heure et au document, devis, confidentialité, paiements et évolution.', 'La saisie de données est un des métiers à distance les plus accessibles, mais aussi un de ceux où les arnaques sont les plus nombreuses. Ce dernier module vous montre où trouver du vrai travail, comment vous présenter, comment fixer vos prix et vous faire payer, et comment évoluer vers des postes mieux rémunérés.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Identifier les sources de travail sérieuses.
> 2. Rédiger un CV d''opérateur de saisie avec des preuves chiffrées.
> 3. Réussir les tests de recrutement.
> 4. Fixer vos prix à l''heure, à la ligne ou au document.
> 5. Vous faire payer depuis Madagascar.
> 6. Évoluer vers le contrôle qualité, l''administration de données ou l''analyse.

## Où trouver du travail

| N° | Source | Comment ça marche | Points d''attention |
| --- | --- | --- | --- |
| 1 | **Entreprises de traitement de données à Madagascar** | Candidature, tests, formation, contrat ; télétravail parfois possible après une période sur place | Revenu régulier ; horaires et objectifs fixés |
| 2 | **PME et cabinets** (comptables, médicaux, immobiliers) | Missions directes de saisie et de mise à jour | Il faut aller les chercher : réseau, LinkedIn |
| 3 | **ONG et bureaux d''études** | Saisie d''enquêtes, souvent par lots | Missions ponctuelles mais régulières pendant les enquêtes |
| 4 | **Boutiques en ligne** | Saisie de produits, de commandes, mise à jour de catalogues | Apprenez aussi Shopify ou WooCommerce |
| 5 | **Plateformes de freelance** | Petites missions de saisie, de recherche et de nettoyage de fichiers | Beaucoup de concurrence ; vérifiez que la plateforme accepte les freelances basés à Madagascar |

### Vérifier une offre : rappel des règles

1. **Jamais de paiement** pour obtenir un travail (inscription, kit, logiciel, formation obligatoire).
2. **Jamais vos codes** Mobile Money ou bancaires.
3. **Jamais d''argent qui transite** par votre compte pour quelqu''un d''autre.
4. Une **entreprise vérifiable** : nom, adresse, site, avis.
5. Des **conditions écrites** : tâche, volume, prix, délai de paiement.

## Le CV d''opérateur de saisie

### Ce que le recruteur cherche

1. Votre **vitesse** et votre **précision**, chiffrées : « 45 mots par minute, 98 % de précision ; pavé numérique : 9 000 frappes par heure » (refaites les tests du module 1 pour avoir vos vrais chiffres).
2. Vos **outils** : Google Sheets, Excel, validation des données, fonctions de nettoyage, OCR, Google Forms.
3. Vos **langues** : français, malagasy, anglais (niveau honnête).
4. Vos **preuves** : le projet du module 4 (« 30 questionnaires, 300 champs, 0,3 % d''erreur après contrôle »).
5. Votre **disponibilité** et votre **équipement** (ordinateur, deuxième écran, connexion de secours).

> [!exemple] Phrase de présentation
> « Opératrice de saisie rigoureuse : 45 mots par minute avec 98 % de précision, maîtrise de Google Sheets et Excel (validation, nettoyage, contrôles), OCR et formulaires. Projet d''étude : 30 questionnaires d''enquête saisis et contrôlés avec un taux d''erreur de 0,3 %. Disponible 35 heures par semaine. »

## Réussir les tests de recrutement

Les entreprises font presque toujours passer des tests :

| Test | Ce qu''il mesure | Comment le préparer |
| --- | --- | --- |
| **Vitesse de frappe** | Mots par minute et précision | 15 minutes d''entraînement par jour pendant plusieurs semaines |
| **Saisie de chiffres** | Frappes par heure sur le pavé numérique | Exercices de pavé numérique |
| **Saisie de documents** | Respect des consignes et précision | Refaire l''exercice du module 4 avec un chronomètre |
| **Orthographe** | Français écrit | Dictées, exercices de grammaire |
| **Tableur** | Fonctions, tri, filtres | Refaire l''exercice du module 3 |

Le jour du test : reposé, au calme, et **la précision d''abord**. Une saisie rapide avec des erreurs est presque toujours éliminée.

## Fixer ses prix

### Les modes de paiement

| Mode | Pour quoi | Attention |
| --- | --- | --- |
| **Salaire** | Emploi en entreprise | Vérifiez le contrat, les horaires et les objectifs |
| **À l''heure** | Missions variées, nettoyage, recherche | Suivez précisément votre temps |
| **À la ligne ou au document** | Lots de documents identiques | Faites un test sur 10 documents avant de donner un prix |

### Calculer un prix au document

1. **Revenu mensuel visé** (exemple : 900 000 Ar) ÷ **heures facturables** (exemple : 120 h) = **7 500 Ar de l''heure**.
2. **Mesurez votre rythme** sur 10 documents du client, contrôle compris (exemple : 12 questionnaires par heure).
3. **Prix par document** : 7 500 ÷ 12 ≈ **625 Ar par questionnaire**.
4. Pour 100 questionnaires : 62 500 Ar, plus le temps de préparation et de rapport (exemple : 2 h, soit 15 000 Ar) = **77 500 Ar**.

Ces prix sont des **exemples**, à adapter à votre niveau, à la difficulté des documents et au client. Pour les clients étrangers, fixez vos prix en euros ou en dollars. Ne donnez **jamais** un prix au document sans avoir vu des exemples réels : un document facile et un document manuscrit difficile ne demandent pas le même temps.

### Le devis

1. Le **volume** (nombre de documents ou de lignes) et le **type** de documents.
2. Les **règles** de saisie convenues.
3. Le **taux d''erreur** garanti et la méthode de contrôle.
4. Le **délai**.
5. Le **prix** et les conditions : pour un client direct, **50 % au début**, 50 % à la livraison.
6. La **confidentialité** des données.

## La confidentialité des données

Vous saisissez souvent des **données personnelles** : noms, adresses, téléphones, revenus, santé.

1. Ne copiez **jamais** ces données ailleurs que dans le fichier du client.
2. Ne les envoyez **jamais** par WhatsApp ou par e-mail non demandé.
3. Travaillez sur un ordinateur **protégé par un mot de passe**, pas dans un cybercafé.
4. **Supprimez** les documents et fichiers à la fin de la mission si le client le demande, et confirmez-le par écrit.

## Se faire payer depuis Madagascar

| Situation | Moyens de paiement |
| --- | --- |
| Entreprise à Madagascar | Salaire par virement bancaire ou Mobile Money |
| Client local (PME, ONG) | Mobile Money (MVola, Orange Money, Airtel Money) ou virement |
| Plateforme internationale | Retrait selon la plateforme : souvent Payoneer ou virement vers une banque malgache |
| Client étranger en direct | Virement international ou Payoneer |

> [!madagascar]
> Les possibilités de PayPal sont limitées pour Madagascar : vérifiez avant de le proposer. Gardez une trace de chaque paiement et renseignez-vous sur le NIF et la carte statistique auprès du centre fiscal de votre ville si vous travaillez en indépendant.

## Évoluer dans le métier

| Étape | Ce qui change | Ce qu''il faut apprendre |
| --- | --- | --- |
| **Contrôleur qualité** | Vous vérifiez le travail des autres opérateurs | Méthodes d''échantillonnage, rigueur |
| **Chef d''équipe** | Vous organisez les lots et formez les nouveaux | Organisation, communication |
| **Administrateur de données** | Vous gérez des bases de données clients ou produits | Excel avancé, Power Query, bases de données |
| **Assistant comptable** | Vous saisissez et contrôlez la comptabilité | Bases de la comptabilité, logiciels comptables |
| **Analyste de données** | Vous transformez les données en tableaux de bord et en conclusions | Tableaux croisés dynamiques, graphiques, Power BI, SQL |

Le tableur est la porte d''entrée : chaque fonction apprise vous rapproche d''un métier mieux payé.

> [!retenir]
> - Sources sérieuses : entreprises de traitement de données, PME, ONG, boutiques en ligne, plateformes.
> - Un CV avec vitesse, précision et un projet chiffré.
> - La précision d''abord, aux tests comme au travail.
> - Prix au document = prix horaire ÷ documents par heure, après un test sur de vrais documents.
> - Confidentialité absolue des données personnelles.

## Exercice pratique : lancer votre recherche

> [!exercice] Exercice pratique · 2 heures
> 1. Refaites les tests de vitesse du module 1 et comparez avec vos premiers résultats.
> 2. Rédigez votre CV d''opérateur de saisie avec vos chiffres réels.
> 3. Trouvez 5 sources de travail (entreprises à Madagascar, ONG, offres en ligne) et vérifiez-les avec les 5 règles.
> 4. Calculez votre prix horaire et un prix au document à partir de votre exercice du module 4.
> 5. Envoyez au moins 2 candidatures ou propositions.
>
> **À livrer** : la comparaison de vos tests, votre CV, votre tableau des 5 sources, vos calculs et la preuve de vos 2 envois.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-2-f', 4, 0, 'À 7 500 Ar de l''heure et 12 questionnaires par heure, quel est le prix par questionnaire ?', '["Environ 625 Ar","12 Ar","90 000 Ar","7 500 Ar"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-2-f', 4, 1, 'Que faire avant de donner un prix au document ?', '["Tester sur de vrais documents du client","Donner le prix le plus bas possible","Copier le prix d''une annonce","Rien"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('data-2-f', 4, 2, 'Que mettre sur un CV d''opérateur de saisie ?', '["Ses mots de passe","Sa vitesse, sa précision et un projet chiffré","Rien de chiffré","Uniquement ses loisirs"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Que fait un opérateur de saisie ?', '["Il écrit des articles","Il répare les claviers","Il vend des ordinateurs","Il transforme des informations en données exactes et bien rangées"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Quel est un signal d''alerte d''une fausse offre de saisie ?', '["L''entreprise a un site et une adresse","On vous donne un contrat écrit","On vous demande de payer un kit de démarrage","On vous fait passer un test"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Pourquoi utiliser deux écrans ?', '["Pour taper plus fort","C''est obligatoire","Pour regarder des vidéos","Le document d''un côté, le tableau de l''autre"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Tous les combien faire une pause ?', '["Jamais","Toutes les 5 heures","Une fois par semaine","Toutes les 45 à 50 minutes"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Sur un clavier AZERTY, où se posent les index ?', '["Sur Entrée","Sur la barre d''espace","Sur F et J","Sur A et Z"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Quel doigt utilise le 0 du pavé numérique ?', '["L''index de la main gauche","L''auriculaire","Le pouce","Le majeur"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Comment saisir un montant dans une colonne de montants ?', '["125 000 ariary environ","125 000 Ar","cent vingt-cinq mille","Un nombre seul, comme 125000"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Que faut-il pour un champ vide ?', '["Le laisser vide ou mettre le code convenu","Supprimer la colonne","Inventer une valeur","Mettre 0"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Dans un tableau propre, combien d''informations par colonne ?', '["Une seule","Trois","Toutes","Deux"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Pourquoi éviter qu''une couleur porte une information ?', '["Ce n''est pas un problème","Les couleurs coûtent cher","On ne peut ni la trier ni la compter facilement : mieux vaut une colonne Statut","Les couleurs sont interdites"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', '1 524 saisi 1 254 est une erreur…', '["De date","De colonne","D''inversion","De doublon"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Qu''est-ce que le total de contrôle ?', '["Comparer la somme des montants saisis au total attendu","Le nombre de pauses","La note du client","Le salaire du mois"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Qu''est-ce que la double saisie ?', '["Saisir sur deux ordinateurs à la fois","Saisir deux fois plus vite","Copier-coller deux fois","Deux personnes saisissent les mêmes documents et on compare"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Quelle touche valide et passe à la cellule de droite ?', '["Tab","Maj","Suppr","Échap"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'À quoi sert de figer la ligne de titres ?', '["Garder les titres visibles en descendant dans le tableau","Supprimer les doublons","Imprimer plus vite","Empêcher toute modification"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Que fait NOMPROPRE sur « jean RAKOTO » ?', '["« JEAN RAKOTO »","« Jean Rakoto »","« J. R. »","« jean rakoto »"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Quelle fonction compte combien de fois une valeur apparaît ?', '["NB.SI","SOMME","SUPPRESPACE","NOMPROPRE"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Pourquoi ne jamais trier une seule colonne ?', '["Les lignes seraient mélangées","C''est trop lent","Le fichier se fermerait","Ce n''est pas possible"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Que veut dire OCR ?', '["Ordinateur central rapide","Reconnaissance optique de caractères","Outil de calcul rapide","Organisation des comptes"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Comment utiliser l''OCR gratuit de Google Drive ?', '["Renommer le fichier","Envoyer le fichier par SMS","Clic droit sur le fichier, Ouvrir avec, Google Docs","Imprimer le fichier"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Que doit-on toujours faire après une reconnaissance de texte ?', '["Livrer directement","Changer la police","Vérifier chaque chiffre","Supprimer l''original"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Quelle fonction d''Excel avancé permet de nettoyer de gros fichiers automatiquement ?', '["Power Query","WordArt","Paint","Le correcteur d''orthographe"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', '150 champs contrôlés, 1 erreur : le taux d''erreur est d''environ…', '["0,67 %","15 %","0,01 %","1,5 %"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Que contient le rapport de livraison ?', '["Seulement le prix","Rien, le fichier suffit","Vos mots de passe","Volume, temps, qualité, problèmes et description du fichier"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('data-2-f', 'Que faire des données personnelles à la fin d''une mission, si le client le demande ?', '["Les supprimer et le confirmer par écrit","Les vendre","Les publier","Les garder pour un autre client"]'::jsonb, 0);

-- design-0-a
delete from public.exam_questions where course_id = 'design-0-a';
delete from public.module_questions where course_id = 'design-0-a';
delete from public.lessons where course_id = 'design-0-a' and module_index >= 5;
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('design-0-a', 0, 'Se spécialiser et construire une offre haut de gamme', 'Les 6 spécialités, la méthode des 3 cercles, la phrase de positionnement, l''offre en 3 niveaux et l''étude de cas.', 'Un graphiste « qui fait de tout » est en concurrence avec des milliers d''autres, et il est souvent choisi pour son prix. Un graphiste **spécialisé** est choisi pour son expertise, et il peut demander plus. Ce module vous aide à choisir une spécialité rentable, à la présenter clairement et à construire une offre haut de gamme.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Comparer les 6 grandes spécialités du graphisme freelance.
> 2. Choisir la vôtre avec la méthode des 3 cercles.
> 3. Rédiger votre phrase de positionnement.
> 4. Construire une offre haut de gamme en 3 niveaux.
> 5. Présenter une étude de cas qui prouve votre expertise.

## Pourquoi se spécialiser

| Généraliste | Spécialiste |
| --- | --- |
| « Je fais des logos, des flyers, des sites, des vidéos… » | « Je crée l''identité visuelle des hôtels et lodges de l''océan Indien » |
| Comparé sur le prix | Choisi pour son expertise |
| Chaque projet est nouveau : il faut tout réapprendre | Les projets se ressemblent : on va plus vite et mieux |
| Difficile à recommander (« il fait un peu de tout ») | Facile à recommander (« c''est LE graphiste des hôtels ») |

Se spécialiser ne veut pas dire refuser tout le reste. Cela veut dire **mettre en avant** une spécialité dans votre portfolio et votre communication.

> [!definition] Niche
> Un petit segment précis du marché : un type de client (restaurants, ONG, coachs), un type de travail (packaging, présentations) ou les deux. Une niche a moins de clients, mais beaucoup moins de concurrents.

## Les 6 grandes spécialités

| N° | Spécialité | Ce qu''on fait | Clients typiques | Niveau de prix |
| --- | --- | --- | --- | --- |
| 1 | **Identité de marque** | Logo, charte graphique complète, déclinaisons | Nouvelles entreprises, marques qui se modernisent | Élevé |
| 2 | **Packaging** | Étiquettes, boîtes, emballages | Marques de vanille, épices, cosmétiques, boissons | Élevé |
| 3 | **Design pour réseaux sociaux** | Modèles, campagnes, carrousels | Marques, agences, créateurs | Moyen, mais régulier |
| 4 | **Édition et mise en page** | Rapports, magazines, catalogues, livres | ONG, institutions, éditeurs | Moyen à élevé |
| 5 | **Présentations** | Présentations commerciales, dossiers investisseurs | Startups, consultants, entreprises | Moyen à élevé |
| 6 | **Illustration et visuels sur mesure** | Illustrations, infographies, icônes | Médias, éducation, applications | Variable |

> [!madagascar] Des niches où vous avez un avantage
> - **Packaging des produits malgaches** exportés (vanille, girofle, cacao, huiles essentielles, artisanat) : vous connaissez les produits et leur histoire.
> - **Tourisme de l''océan Indien** : hôtels, lodges, agences, guides.
> - **Rapports d''ONG** en français : de nombreux projets à Madagascar et en Afrique francophone.

## Choisir sa spécialité : la méthode des 3 cercles

Votre spécialité se trouve au croisement de 3 cercles :

1. **Ce que vous faites bien** : regardez votre portfolio, quels projets sont les meilleurs ?
2. **Ce que vous aimez faire** : sur quels projets le temps passe vite ?
3. **Ce que les clients paient bien** : où y a-t-il de la demande et des budgets ?

### La méthode en 5 étapes

1. Listez vos **10 derniers projets** (ou exercices) et notez chacun de 1 à 5 sur les 3 cercles.
2. Repérez les **2 ou 3 types de projets** qui ont les meilleures notes.
3. **Vérifiez la demande** : cherchez ce type de projet sur les plateformes de freelance et dans les groupes d''entrepreneurs. Y a-t-il des offres régulières ?
4. **Regardez 5 concurrents** spécialisés : leurs prix, leur portfolio, ce qui manque.
5. **Choisissez une spécialité** pour les 6 prochains mois. Vous pourrez l''ajuster ensuite.

## La phrase de positionnement

> [!definition] Positionnement
> La place que vous voulez occuper dans l''esprit de vos clients : pour qui vous travaillez, quel problème vous résolvez, et en quoi vous êtes différent.

### Le modèle

« J''aide **[type de clients]** à **[résultat]** grâce à **[votre spécialité]**. »

> [!exemple] Trois phrases de positionnement
> - « J''aide les producteurs de vanille et d''épices de Madagascar à vendre à l''export grâce à des emballages qui racontent leur origine. »
> - « J''aide les lodges et petits hôtels de l''océan Indien à remplir leurs chambres grâce à une identité visuelle qui donne envie de voyager. »
> - « J''aide les ONG francophones à rendre leurs rapports clairs et lisibles grâce à une mise en page professionnelle. »

Cette phrase va partout : profil LinkedIn, Behance, page d''accueil de votre portfolio, signature d''e-mail.

## L''offre haut de gamme en 3 niveaux

Un client qui vient pour une spécialité est prêt à payer plus, à condition de comprendre ce qu''il achète.

> [!exemple] Offre « Identité de lodge »
>
> | | **Essentiel** | **Signature** | **Complète** |
> | --- | --- | --- | --- |
> | Atelier de découverte (visioconférence) | 1 h | 1 h 30 | 2 h |
> | Pistes de logo proposées | 2 | 3 | 3 |
> | Charte graphique | 2 pages | 8 pages | 15 pages |
> | Déclinaisons | Carte de visite | Carte de visite, signature e-mail, 5 modèles réseaux sociaux | Tout Signature + menu, plaquette, panneaux d''accueil |
> | Tours de retouches | 2 | 3 | 3 |
> | Délai | 2 semaines | 3 semaines | 5 semaines |

Le niveau du milieu est souvent le plus choisi. Le niveau le plus élevé rend le niveau du milieu raisonnable par comparaison.

## L''étude de cas qui prouve votre expertise

Un client haut de gamme ne veut pas seulement voir de belles images : il veut comprendre **votre façon de réfléchir**.

### Les 6 parties d''une étude de cas

1. **Le client** et son contexte (2 à 3 lignes).
2. **Le problème** : ce qui n''allait pas, ce qu''il voulait.
3. **La recherche** : concurrents analysés, planche d''inspiration, mots-clés de la marque.
4. **Les choix** : pourquoi cette typographie, ces couleurs, ce symbole.
5. **Le résultat** : le logo et ses déclinaisons **en situation** (enseigne, site, emballage).
6. **L''effet** : ce qui a changé pour le client (avis, retours, chiffres si vous en avez).

> [!astuce]
> 3 études de cas solides dans votre spécialité valent mieux que 30 images sans explication. Publiez-les sur Behance et dans un PDF de présentation.

> [!attention] Erreurs fréquentes
> - Choisir une spécialité uniquement parce qu''elle « paie bien », sans l''aimer : vous abandonnerez vite.
> - Changer de spécialité tous les mois.
> - Garder un portfolio généraliste après avoir choisi une spécialité.
> - Proposer une offre haut de gamme sans processus clair (atelier, étapes, livrables).

> [!retenir]
> - Un spécialiste est choisi pour son expertise, un généraliste pour son prix.
> - Choisissez avec les 3 cercles : talent, plaisir, demande.
> - Une phrase de positionnement claire, partout.
> - Une offre en 3 niveaux, avec un processus et des livrables précis.
> - Des études de cas qui montrent votre réflexion.

## Exercice pratique : votre positionnement

> [!exercice] Exercice pratique · 1 heure 30
> 1. Notez vos 10 derniers projets sur les 3 cercles et choisissez votre spécialité.
> 2. Analysez 5 concurrents spécialisés (portfolio, prix, présentation).
> 3. Rédigez votre phrase de positionnement.
> 4. Construisez votre offre en 3 niveaux, avec contenu, délai et prix.
> 5. Transformez votre meilleur projet en étude de cas en 6 parties.
>
> **À livrer** : votre tableau des 3 cercles, votre analyse des concurrents, votre phrase, votre offre et votre étude de cas.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-a', 0, 0, 'Pourquoi se spécialiser ?', '["Pour refuser tous les autres projets","Pour travailler moins","Pour être choisi pour son expertise plutôt que pour son prix","Parce que c''est obligatoire"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-a', 0, 1, 'Quels sont les 3 cercles pour choisir sa spécialité ?', '["Le prix, la couleur, la police","Ce qu''on fait bien, ce qu''on aime, ce que les clients paient bien","Facebook, Instagram, TikTok","Le matin, le midi, le soir"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-a', 0, 2, 'Que doit montrer une étude de cas ?', '["Le prix payé par le client","Votre réflexion : problème, recherche, choix et résultat","Votre CV","Seulement l''image finale"]'::jsonb, 1);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('design-0-a', 1, 'Les outils professionnels : Illustrator, Photoshop, InDesign, Canva Pro', 'Le bon logiciel pour chaque travail, plans de travail et couleurs globales, travail non destructif et mockups, documents longs et impression, kits Canva pour les clients.', 'Les agences et les clients internationaux travaillent presque tous avec les logiciels d''Adobe : **Illustrator**, **Photoshop** et **InDesign**. Ils vous enverront leurs fichiers et attendront les vôtres dans ces formats. Ce module vous apprend les fonctions professionnelles de chacun, ainsi que **Canva Pro** pour les clients qui veulent modifier eux-mêmes leurs visuels.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Choisir le bon logiciel pour chaque type de travail.
> 2. Utiliser les fonctions clés d''Illustrator : plans de travail, couleurs globales, Pathfinder.
> 3. Utiliser les fonctions clés de Photoshop : calques, masques, objets dynamiques, mockups.
> 4. Mettre en page un document long avec InDesign : gabarits, styles, contrôle en amont.
> 5. Créer un kit de marque et des modèles modifiables dans Canva Pro.
> 6. Décider quand et comment acheter ces logiciels.

## Quel logiciel pour quel travail ?

| Travail | Logiciel principal | Pourquoi |
| --- | --- | --- |
| Logo, icônes, illustrations vectorielles | **Illustrator** | Vectoriel : agrandissable sans perte |
| Retouche photo, montages, mockups | **Photoshop** | Travail sur les pixels |
| Rapports, catalogues, magazines, menus de plusieurs pages | **InDesign** | Mise en page de documents longs, préparation pour l''impression |
| Modèles que le client modifie lui-même | **Canva Pro** | Simple pour un client non graphiste |

> [!definition] Vectoriel et matriciel
> Une image **vectorielle** (Illustrator, SVG, PDF vectoriel) est faite de formes calculées : on peut l''agrandir à l''infini. Une image **matricielle** (Photoshop, JPG, PNG) est faite de pixels : agrandie, elle devient floue.

## Illustrator : les fonctions professionnelles

### 1. Les plans de travail

Un seul fichier peut contenir **plusieurs plans de travail** (pages) : logo en couleur, en noir, en blanc, version horizontale, icône seule. Vous les exportez tous en une fois (**Fichier → Exporter → Exporter pour les écrans**).

### 2. Les couleurs globales

1. Créez les couleurs de la marque dans le panneau **Nuancier**.
2. Cochez **Global** dans les options de chaque nuance.
3. Si le client change sa couleur principale, modifiez la nuance : **tous** les éléments qui l''utilisent changent en même temps.

### 3. Le Pathfinder

Le panneau **Pathfinder** combine des formes : unir, soustraire, intersecter. C''est l''outil principal pour construire un logo à partir de formes simples.

### 4. Vectoriser le texte

Avant d''envoyer un logo, transformez le texte en formes (**Texte → Vectoriser**), après avoir gardé une copie modifiable. Ainsi, le logo s''affiche correctement même chez quelqu''un qui n''a pas la police.

> [!astuce] Les raccourcis à connaître
> **V** sélection · **A** sélection directe · **P** plume · **M** rectangle · **Ctrl + G** grouper · **Ctrl + Maj + O** vectoriser le texte · **Ctrl + Alt + 3** (selon la version) afficher les éléments masqués.

## Photoshop : les fonctions professionnelles

| Fonction | À quoi elle sert | Règle professionnelle |
| --- | --- | --- |
| **Calques** | Séparer chaque élément | Nommez chaque calque, rangez-les dans des groupes |
| **Masques de fusion** | Cacher une partie d''un calque sans l''effacer | Ne jamais utiliser la gomme sur une photo originale |
| **Calques de réglage** | Corriger lumière et couleurs (niveaux, courbes, teinte) | Toujours en calque de réglage, jamais directement sur la photo |
| **Objets dynamiques** | Garder la qualité d''une image qu''on redimensionne | Convertir chaque image importée en objet dynamique |
| **Sélection du sujet** et outils d''IA | Détourer rapidement une personne ou un produit | Vérifier et affiner les contours à la main |

> [!definition] Travail non destructif
> Une façon de travailler où l''image originale n''est jamais abîmée : masques au lieu de gomme, calques de réglage au lieu de modifications directes. On peut toujours revenir en arrière, même des semaines plus tard, quand le client demande un changement.

### Les mockups

Un **mockup** montre votre création en situation : un logo sur une enseigne, une étiquette sur un pot de vanille, une affiche dans une rue.

1. Utilisez un mockup Photoshop avec un **objet dynamique** prévu pour la création.
2. Double-cliquez sur l''objet dynamique, collez votre création, enregistrez.
3. Le mockup se met à jour avec la perspective et les ombres.

Utilisez uniquement des mockups dont la **licence** permet l''usage commercial.

## InDesign : les documents longs

InDesign est le logiciel des rapports, catalogues et magazines. Ses 4 outils clés :

1. **Les gabarits** (pages types) : en-tête, numéro de page et grille, appliqués à toutes les pages.
2. **Les styles de paragraphe et de caractère** : titre 1, titre 2, texte courant, légende. Changez un style, et tout le document change.
3. **Les blocs liés** : le texte coule automatiquement d''une page à l''autre.
4. **Le contrôle en amont** (*Preflight*) : il signale les images en basse résolution, les polices manquantes et le texte en excès.

### Exporter pour l''imprimeur

1. **Fichier → Exporter → PDF Adobe (Impression)**.
2. Choisissez le profil demandé par l''imprimeur (souvent un PDF/X).
3. Ajoutez **les traits de coupe** et le **fond perdu** (souvent 3 mm, à vérifier avec l''imprimeur).
4. Vérifiez le PDF final page par page.

> [!definition] Fond perdu
> Une marge de quelques millimètres où l''on prolonge les images et couleurs au-delà du format final. Elle est coupée à l''impression et évite un liseré blanc sur les bords.

## Canva Pro : les modèles pour le client

Beaucoup de clients veulent modifier eux-mêmes leurs publications. Avec Canva Pro, vous leur livrez un système qu''ils ne peuvent pas « casser ».

1. Créez le **kit de marque** : logos, couleurs, polices.
2. Créez **10 à 20 modèles** : promotion, nouveauté, citation, événement, story.
3. **Verrouillez** les éléments qui ne doivent pas bouger (logo, position des titres).
4. Partagez les modèles avec le client par un **lien de modèle** : il obtient une copie modifiable, l''original reste intact.
5. Ajoutez un **guide d''une page** : quel modèle pour quel message.

> [!exemple] Une offre qui se vend bien
> « Kit réseaux sociaux » : 15 modèles Canva aux couleurs de la marque, verrouillés, avec guide d''utilisation et formation de 30 minutes. Le client gagne en autonomie, et vous vendez une prestation à forte valeur sans travail répété chaque semaine.

## Acheter les logiciels : comment décider

| Option | Pour qui | Points à vérifier |
| --- | --- | --- |
| **Abonnement Adobe à une seule application** | Spécialité centrée sur un logiciel (Illustrator pour l''identité) | Prix mensuel en devises |
| **Abonnement Adobe à toutes les applications** | Graphiste qui utilise Illustrator, Photoshop et InDesign chaque semaine | Prix plus élevé ; vérifiez les offres annuelles |
| **Canva Pro** | Graphistes réseaux sociaux, kits pour clients | Abonnement mensuel ou annuel |
| **Logiciels payés par le client ou l''agence** | Missions longues en agence | Licence au nom de l''agence |

Les prix et les offres changent : vérifiez-les sur les sites officiels. N''utilisez jamais de version piratée : en plus d''être illégal, c''est risqué (virus, comptes bloqués) et les agences peuvent le détecter.

> [!madagascar]
> Ces abonnements se paient par carte bancaire internationale, en euros ou en dollars. Calculez le coût **par mois et par client** : si l''abonnement vous permet de travailler avec une agence européenne, il est rentabilisé dès le premier projet. Commencez par l''application dont vous avez le plus besoin.

> [!retenir]
> - Illustrator pour le vectoriel, Photoshop pour l''image, InDesign pour les documents longs, Canva Pro pour l''autonomie du client.
> - Couleurs globales, plans de travail et texte vectorisé dans Illustrator.
> - Travail non destructif dans Photoshop : masques, calques de réglage, objets dynamiques.
> - Gabarits, styles et contrôle en amont dans InDesign.
> - Des modèles Canva verrouillés et un guide : une offre à forte valeur.

## Exercice pratique : un logo décliné dans 3 logiciels

> [!exercice] Exercice pratique · 3 heures
> 1. Dans Illustrator (version d''essai si besoin), reconstruisez votre logo d''étude avec des formes et le Pathfinder, sur 5 plans de travail (couleur, noir, blanc, horizontal, icône), avec des couleurs globales.
> 2. Dans Photoshop, placez le logo dans 2 mockups (enseigne et emballage).
> 3. Dans InDesign, mettez en page une charte graphique de 4 pages avec gabarit et styles, puis exportez en PDF pour l''impression.
> 4. Dans Canva, créez un kit de marque et 3 modèles verrouillés.
>
> **À livrer** : le fichier Illustrator, les 2 mockups, le PDF de la charte et les liens des modèles Canva.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-a', 1, 0, 'Quel logiciel pour un rapport de 40 pages ?', '["Canva gratuit","Paint","Photoshop","InDesign"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-a', 1, 1, 'À quoi servent les couleurs globales dans Illustrator ?', '["Exporter en JPG","Imprimer en noir et blanc","Changer une couleur partout en une seule fois","Ajouter des ombres"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-a', 1, 2, 'Qu''est-ce que le fond perdu ?', '["Une couleur de fond transparente","Un fond d''écran perdu","Une erreur d''impression","Une marge prolongée au-delà du format final, coupée à l''impression"]'::jsonb, 3);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('design-0-a', 2, 'Qualité et rapidité : les méthodes de studio', 'Le processus en 6 phases, la bibliothèque de ressources, la charte complète en 10 sections, la maîtrise des retours et la grille de 15 points.', 'Un graphiste avancé ne se distingue pas seulement par la beauté de son travail, mais par sa **fiabilité** : des projets livrés à l''heure, sans erreur, avec des retours maîtrisés. Ce module vous donne les méthodes des studios professionnels pour travailler plus vite sans baisser la qualité.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Suivre un processus de projet en 6 phases avec des validations.
> 2. Construire une bibliothèque de ressources réutilisables.
> 3. Rédiger une charte graphique complète.
> 4. Maîtriser les retours du client et limiter les allers-retours.
> 5. Contrôler chaque livraison avec une grille de 15 points.

## Le processus en 6 phases

| N° | Phase | Ce que vous faites | Validation du client |
| --- | --- | --- | --- |
| 1 | **Découverte** | Atelier ou questionnaire, analyse des concurrents | Le brief écrit |
| 2 | **Direction** | Planche d''inspiration (*moodboard*), mots-clés, palette | La direction choisie |
| 3 | **Création** | 2 ou 3 pistes, présentées en situation | Une piste |
| 4 | **Affinage** | Retouches sur la piste choisie | La version finale |
| 5 | **Déclinaisons** | Charte, supports, modèles | Les supports |
| 6 | **Livraison** | Fichiers rangés, guide, mot de passation | — |

**La règle d''or** : on ne passe à la phase suivante **qu''après validation écrite**. Si le client change d''avis sur la direction pendant l''affinage, c''est un changement de projet, à facturer.

> [!definition] Planche d''inspiration (moodboard)
> Une page qui rassemble des images, couleurs, textures et typographies pour montrer l''**ambiance** visée, avant de dessiner quoi que ce soit. Elle évite de travailler des jours dans une direction que le client n''aime pas.

## Une bibliothèque de ressources

Ne repartez jamais de zéro. Construisez votre propre bibliothèque, rangée et réutilisable :

| Ressource | Contenu |
| --- | --- |
| **Modèles de présentation** | Présentation des pistes de logo, de la charte, du devis |
| **Gabarits de supports** | Carte de visite, flyer A5, affiche A3, publications réseaux sociaux, aux bonnes dimensions avec fond perdu |
| **Mockups** | 20 à 30 mockups sous licence commerciale, classés par usage |
| **Polices** | Polices sous licence, avec la licence enregistrée |
| **Éléments** | Grilles, icônes, textures |
| **Textes types** | Brief, devis, e-mails de présentation, de relance, de livraison |

> [!astuce] Le gain réel
> Préparer un gabarit de présentation prend 3 heures une fois. Il en fait gagner une à chaque projet. Après 10 projets, vous avez gagné 7 heures, et vos présentations sont toutes cohérentes et professionnelles.

## La charte graphique complète

Une charte complète permet à n''importe qui (imprimeur, développeur, community manager) d''utiliser la marque sans erreur. C''est un livrable haut de gamme.

### Les 10 sections

1. **L''histoire et les valeurs** de la marque, en quelques lignes.
2. **Le logo** : versions (principale, secondaire, icône), construction.
3. **La zone de protection** : l''espace vide minimum autour du logo.
4. **La taille minimale** du logo, à l''écran et à l''impression.
5. **Les interdits** : déformer, changer les couleurs, ajouter des effets, poser sur un fond chargé.
6. **Les couleurs** : codes RVB et hexadécimal (écran), CMJN (impression), et Pantone si besoin.
7. **La typographie** : polices de titres et de texte, tailles, interlignage.
8. **Les éléments graphiques** : motifs, icônes, style photo.
9. **Les applications** : carte de visite, papier à en-tête, réseaux sociaux, enseigne.
10. **Les fichiers** : liste et usage de chaque fichier livré.

> [!definition] CMJN et RVB
> **RVB** (rouge, vert, bleu) est le mode des écrans. **CMJN** (cyan, magenta, jaune, noir) est le mode de l''impression. Une même couleur n''a pas les mêmes valeurs dans les deux : la charte doit donner les deux.

## Maîtriser les retours du client

Les allers-retours sans fin sont la première cause de perte d''argent en graphisme.

### Avant les retours

1. **Limitez le nombre de tours** dans le devis (souvent 2 ou 3).
2. **Présentez vos choix** : un client qui comprend pourquoi vous avez choisi une couleur la remet moins en question.
3. **Montrez en situation** : un logo seul sur fond blanc paraît vide ; sur une enseigne, il prend vie.

### Recevoir les retours

1. Demandez des retours **regroupés**, en une seule fois, idéalement sous forme de liste numérotée.
2. Demandez des **problèmes**, pas des solutions : « Qu''est-ce qui vous gêne dans cette couleur ? » plutôt que d''appliquer « mettez du rouge ».
3. **Reformulez** et proposez une solution de professionnel.

> [!exemple] Transformer un retour flou
> Client : « Je ne sais pas, ça ne me parle pas trop. »
> Vous : « Merci. Pour bien comprendre, est-ce plutôt les couleurs, la forme du symbole ou la police qui ne vous correspondent pas ? Et quelle impression aimeriez-vous que le logo donne en premier : sérieux, chaleureux, moderne ? »

### Le tableau de suivi des retours

| N° | Retour | Décision | Statut |
| --- | --- | --- | --- |
| 1 | Le vert est trop sombre | Éclairci de 15 % | Fait |
| 2 | Ajouter « depuis 1998 » | Ajouté sous le nom, en petit | Fait |
| 3 | Mettre une étoile | Proposé en variante ; déconseillé (charge le logo) | À valider |

## Travailler plus vite

1. **Raccourcis clavier** : apprenez-en 5 nouveaux par semaine.
2. **Actions et scripts** : dans Photoshop, une **action** enregistre une suite d''opérations (redimensionner, exporter) et la répète sur des dizaines d''images.
3. **Exports en lot** : exportez tous les plans de travail ou toutes les pages d''un coup.
4. **Blocs de travail** : 90 minutes sans téléphone ni messages, pour la création.
5. **Moments fixes pour les échanges** : répondez aux messages 2 ou 3 fois par jour, pas en continu.

## La grille de contrôle en 15 points

| N° | Point à vérifier | Oui / Non |
| --- | --- | --- |
| 1 | Orthographe et noms propres vérifiés | |
| 2 | Coordonnées (téléphone, adresse, site) vérifiées une par une | |
| 3 | Couleurs conformes à la charte | |
| 4 | Polices conformes et licences en règle | |
| 5 | Logo dans la bonne version et à la bonne taille | |
| 6 | Alignements et marges réguliers | |
| 7 | Images en résolution suffisante (300 ppp à taille réelle pour l''impression) | |
| 8 | Mode colorimétrique correct (RVB écran, CMJN impression) | |
| 9 | Fond perdu et traits de coupe pour l''impression | |
| 10 | Texte vectorisé ou polices incorporées dans le PDF | |
| 11 | Formats et dimensions demandés | |
| 12 | Fichiers nommés clairement | |
| 13 | Dossier de livraison rangé | |
| 14 | Retours du client tous traités | |
| 15 | Vérification sur téléphone pour les visuels numériques | |

> [!madagascar]
> Pour les impressions faites à Madagascar, demandez à l''**imprimeur** ses exigences avant de commencer (fond perdu, profil de couleur, format de fichier). Un bon rapport avec 2 ou 3 imprimeurs fiables à Antananarivo est un vrai atout : vous pouvez proposer à vos clients un service complet.

> [!retenir]
> - 6 phases, et jamais de phase suivante sans validation écrite.
> - Une bibliothèque de gabarits, mockups et textes types.
> - Une charte complète en 10 sections, avec RVB et CMJN.
> - Des retours regroupés, compris, et suivis dans un tableau.
> - Une grille de 15 points avant chaque livraison.

## Exercice pratique : votre système de travail

> [!exercice] Exercice pratique · 3 heures
> 1. Créez votre gabarit de présentation de pistes de logo (5 à 8 pages).
> 2. Créez 5 gabarits de supports aux bonnes dimensions, avec fond perdu.
> 3. Rédigez la charte graphique complète (10 sections) de votre projet de spécialité.
> 4. Enregistrez une action Photoshop qui redimensionne et exporte une image pour 3 réseaux sociaux.
> 5. Préparez vos textes types : brief, présentation, relance, livraison.
>
> **À livrer** : vos gabarits, la charte en PDF, une capture de votre action et vos textes types.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-a', 2, 0, 'Quand passer à la phase suivante d''un projet ?', '["Après une validation écrite du client","Après le paiement final seulement","Dès qu''on en a envie","Jamais"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-a', 2, 1, 'À quoi sert une planche d''inspiration (moodboard) ?', '["Valider l''ambiance avant de dessiner","Remplacer la charte","Facturer le client","Imprimer le logo"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-a', 2, 2, 'Quel mode de couleur pour l''impression ?', '["Niveaux de gris uniquement","Hexadécimal","RVB","CMJN"]'::jsonb, 3);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('design-0-a', 3, 'Clients internationaux : canaux, anglais, contrat et formats', 'Où trouver des clients étrangers, vocabulaire anglais, contrat et cession de droits, formats selon les pays, communication et prix en devises.', 'Les clients internationaux, en Europe, au Canada ou ailleurs, paient souvent mieux que le marché local. Mais ils ont leurs habitudes : la langue, les contrats, les droits d''auteur, les formats de fichiers, la façon de communiquer. Ce module vous prépare à travailler avec eux de façon professionnelle, en français comme en anglais.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Choisir les bons canaux pour trouver des clients internationaux.
> 2. Comprendre un brief en anglais et répondre avec le bon vocabulaire.
> 3. Rédiger un contrat avec une cession de droits claire.
> 4. Respecter les formats et normes des différents pays.
> 5. Fixer un prix en devises et vous faire payer.

## Où trouver des clients internationaux

| Canal | Pour qui | Conseil |
| --- | --- | --- |
| **Behance** | Agences et entreprises qui cherchent des graphistes | Publiez vos études de cas complètes, avec des titres clairs en français et en anglais |
| **Dribbble** | Clients du numérique (startups, applications) | Montrez des extraits soignés de vos projets |
| **LinkedIn** | Directeurs marketing, fondateurs, agences | Positionnement clair, publications sur votre spécialité |
| **Plateformes de freelance** (Upwork, Malt et autres) | PME de nombreux pays | Vérifiez qu''elles acceptent les freelances basés à Madagascar ; profil centré sur votre spécialité |
| **Agences francophones** | Sous-traitance régulière | Candidature directe avec 3 études de cas |

> [!attention] Les concours de design
> Certaines plateformes organisent des « concours » : des dizaines de graphistes travaillent, un seul est payé. Pour un graphiste avancé, c''est rarement rentable : préférez les missions où vous êtes choisi **avant** de travailler.

## Le vocabulaire anglais du graphiste

| Anglais | Français |
| --- | --- |
| brief | cahier des charges, brief |
| brand identity | identité de marque |
| brand guidelines | charte graphique |
| deliverables | livrables |
| draft / concept | piste, proposition |
| revision / round of revisions | retouche / tour de retouches |
| mockup | maquette en situation |
| bleed | fond perdu |
| final files / source files | fichiers finaux / fichiers sources |
| deadline | date limite |
| invoice | facture |
| deposit / upfront payment | acompte |
| scope | périmètre (ce qui est inclus) |

> [!exemple] Répondre à une demande en anglais
> « Hi Sarah, thank you for reaching out! Based on your brief, I suggest my **Signature** package: a discovery call, 3 logo concepts, 3 rounds of revisions, an 8-page brand guidelines document and social media templates. Timeline: 3 weeks. Price: [montant] EUR, with a 50% deposit to start. Here are two similar projects: [lien]. Would you be available for a 20-minute call this week? »

Des phrases simples et claires suffisent. Faites relire vos messages importants par un correcteur (LanguageTool, par exemple).

## Le contrat et les droits d''auteur

En tant que créateur, vous êtes **auteur** de vos créations. Le client a besoin d''un droit d''utilisation. Ce point doit être **écrit**.

> [!definition] Cession de droits
> Le document (ou la clause du contrat) par lequel vous autorisez le client à utiliser votre création : pour quels usages (impression, web, publicité), dans quels pays, pour combien de temps. Pour un logo, le client attend en général une cession large et définitive, **après paiement complet**.

### Les 8 clauses essentielles du contrat

1. **Les parties** : vos coordonnées et celles du client.
2. **Le périmètre** (*scope*) : livrables précis, nombre de pistes et de retouches.
3. **Le calendrier** : étapes et dates.
4. **Le prix et les paiements** : acompte, échéances, devise.
5. **Les droits** : quels droits sont cédés, et **à partir du paiement complet**.
6. **Les fichiers sources** : inclus ou non (on peut les facturer en plus).
7. **Le portfolio** : votre droit de montrer le projet (sauf accord de confidentialité).
8. **L''annulation** : ce qui est dû si le client arrête en cours de route (l''acompte reste acquis).

Le droit d''auteur varie selon les pays : pour les gros contrats, faites relire par un professionnel du droit.

## Les formats et normes selon les pays

| Élément | Europe et Madagascar | États-Unis et Canada |
| --- | --- | --- |
| Format de papier | A4 (210 × 297 mm), A5, A3 | Letter (8,5 × 11 pouces), Tabloid |
| Unités | Millimètres | Pouces (inches) |
| Carte de visite | Souvent 85 × 55 mm | Souvent 3,5 × 2 pouces |
| Dates sur les supports | 14/03/2026 | 03/14/2026 (États-Unis) |

Demandez toujours **le format exact** et, pour l''impression, les **exigences de l''imprimeur** du client. Pour les couleurs, certaines marques internationales utilisent un **nuancier Pantone** : la charte doit alors indiquer les références Pantone.

## Communiquer à distance avec des clients étrangers

1. **Fixez les heures d''échange** dans le fuseau du client : pour l''Europe, votre après-midi correspond à leur matinée ou midi ; pour le Canada, votre soirée correspond à leur matinée.
2. **Résumez chaque appel par écrit** : décisions, prochaines étapes, dates.
3. **Envoyez des nouvelles régulières**, même courtes : un client étranger s''inquiète vite s''il n''a pas de nouvelles.
4. **Présentez en visioconférence** les étapes importantes (pistes, charte) : vous expliquez vos choix et le client valide plus facilement.

## Prix en devises et paiement

1. Fixez vos prix **en euros ou en dollars** pour les clients étrangers, adaptés à leur marché et à votre niveau. Renseignez-vous sur les prix de graphistes spécialisés de niveau comparable sur les plateformes.
2. Demandez **50 % d''acompte** au démarrage pour un nouveau client.
3. Précisez **qui paie les frais** de transfert.
4. Utilisez un moyen de paiement qui fonctionne depuis Madagascar : virement international, Payoneer, ou le système de la plateforme.

> [!madagascar]
> Le taux de change varie. Gardez vos prix en devises sans les convertir à chaque projet, et suivez le montant réellement reçu en ariary après frais pour connaître votre revenu réel. Gardez une trace de chaque paiement pour votre comptabilité.

> [!retenir]
> - Behance, LinkedIn, plateformes et agences ; prudence avec les concours.
> - Un vocabulaire anglais de base suffit pour des échanges clairs.
> - Un contrat écrit, avec une cession de droits après paiement complet.
> - Les formats changent selon les pays : A4 ou Letter, mm ou pouces.
> - Prix en devises, acompte, frais de transfert précisés.

## Exercice pratique : prêt pour l''international

> [!exercice] Exercice pratique · 2 heures 30
> 1. Publiez une de vos études de cas sur Behance, avec un titre et une description en français et en anglais.
> 2. Rédigez votre contrat type avec les 8 clauses.
> 3. Écrivez en anglais une réponse à cette demande : « We are opening a small eco-lodge in Madagascar and need a logo and brand guidelines. »
> 4. Déclinez une carte de visite de votre projet au format européen et au format américain.
> 5. Fixez les prix en euros de vos 3 niveaux d''offre.
>
> **À livrer** : le lien Behance, le contrat, votre réponse en anglais, les 2 cartes de visite et votre grille de prix.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-a', 3, 0, 'Quand céder les droits d''un logo au client ?', '["Après le paiement complet","Jamais","Avant de commencer","Après l''acompte seulement"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-a', 3, 1, 'Quel format de papier est courant aux États-Unis ?', '["A5","A4","Letter","B2"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-a', 3, 2, 'Que veut dire « deliverables » ?', '["Les factures","Les délais","Les livrables","Les retouches"]'::jsonb, 2);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('design-0-a', 4, 'Développer son activité', 'Augmenter ses prix, prix à la valeur, offres mensuelles, collaboration avec d''autres freelances et pilotage par les chiffres.', 'Arrivé à un certain niveau, un graphiste freelance se heurte à une limite : le nombre d''heures dans une journée. Pour gagner plus, il faut **augmenter la valeur** de chaque heure, créer des revenus réguliers et, parfois, s''entourer. Ce dernier module vous montre comment développer votre activité de façon durable.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Augmenter vos prix sans perdre vos bons clients.
> 2. Fixer un prix selon la valeur apportée au client.
> 3. Créer des revenus réguliers avec des contrats mensuels.
> 4. Collaborer avec d''autres freelances pour proposer des projets complets.
> 5. Suivre vos chiffres et piloter votre activité.

## Augmenter ses prix

### Les signes qu''il est temps

1. Vous êtes **complet** plusieurs semaines à l''avance.
2. Presque **tous** vos devis sont acceptés sans discussion.
3. Vos clients vous **recommandent** régulièrement.
4. Votre portfolio est nettement meilleur qu''il y a un an.

### Augmenter en 4 étapes

1. **Nouveaux clients d''abord** : appliquez le nouveau tarif à toutes les nouvelles demandes.
2. **Clients actuels ensuite** : prévenez-les **1 à 2 mois à l''avance**.
3. **Expliquez la valeur**, pas vos besoins : nouveaux services, meilleure qualité, délais tenus.
4. **Augmentez par paliers** raisonnables (par exemple 10 à 20 %), plutôt que de doubler d''un coup.

> [!exemple] Message à un client régulier
> « Bonjour Monsieur Rabe, merci pour votre confiance depuis deux ans. À partir du 1er mars, mes tarifs évoluent de 15 % pour refléter l''élargissement de mes services (modèles Canva, charte complète, mockups). Pour les projets confirmés avant cette date, l''ancien tarif reste appliqué. Je reste à votre disposition pour en parler. »

## Fixer un prix selon la valeur

Le prix à l''heure (Fondamentaux, module 5) reste votre **plancher**. Mais pour certains projets, la valeur pour le client est bien plus grande que le temps passé.

> [!definition] Prix à la valeur
> Un prix fixé selon ce que le travail **rapporte ou fait gagner** au client, et non seulement selon votre temps. Un emballage qui permet à un producteur de vanille de vendre en Europe a une grande valeur, même s''il vous a pris 25 heures.

### Les 4 questions pour estimer la valeur

1. Combien le client espère-t-il **vendre** ou **gagner** grâce à ce projet ?
2. Combien de **temps** le visuel sera-t-il utilisé (un logo : des années ; un flyer : une semaine) ?
3. Sur combien de **supports** et dans combien de **pays** ?
4. Que lui coûterait une **erreur** (emballage refusé, image de marque abîmée) ?

Plus la valeur, la durée d''utilisation et le risque sont grands, plus le prix peut monter au-dessus de votre plancher horaire.

## Créer des revenus réguliers

Les projets ponctuels donnent des mois irréguliers. Les **contrats mensuels** stabilisent vos revenus.

| Offre mensuelle | Contenu | Pour qui |
| --- | --- | --- |
| **Abonnement visuels** | 12 à 20 visuels par mois, délai de 48 h | Marques actives sur les réseaux sociaux |
| **Graphiste à temps partagé** | 10 à 20 heures par mois, toutes demandes | PME sans graphiste interne |
| **Suivi de marque** | Contrôle de la cohérence, nouveaux supports, mise à jour des modèles | Entreprises en croissance |
| **Partenariat d''agence** | Volume réservé chaque mois pour une agence | Agences de communication |

> [!astuce]
> Proposez l''offre mensuelle **à la fin d''un projet réussi** : le client vient de voir la qualité de votre travail, et il aura besoin de nouveaux supports. « Pour que votre nouvelle identité reste cohérente sur tous vos supports, je vous propose un suivi mensuel… »

## Collaborer avec d''autres freelances

Beaucoup de clients veulent un **projet complet** : identité, site internet, textes, photos, réseaux sociaux. Seul, vous ne pouvez pas tout faire. En réseau, si.

### Les partenaires naturels du graphiste

1. **Développeur web** (WordPress, Shopify) : site aux couleurs de la marque.
2. **Rédacteur** : textes du site, slogan, plaquette.
3. **Photographe** ou **vidéaste** : images de la marque.
4. **Community manager** : utilisation des visuels au quotidien.
5. **Imprimeur** : supports physiques.

### Les 4 règles d''une bonne collaboration

1. **Un seul interlocuteur** pour le client (souvent celui qui a apporté le projet).
2. **Des rôles écrits** : qui fait quoi, quand, pour quel prix.
3. **Une commission** claire pour celui qui gère le projet (souvent 10 à 20 %, à convenir).
4. **Une qualité vérifiée** : ne recommandez que des personnes dont vous connaissez le travail.

> [!madagascar]
> Un petit collectif de freelances malgaches (graphiste, développeur, rédacteur, community manager) peut répondre à des projets que chacun ne pourrait pas prendre seul, pour des clients locaux comme étrangers. Commencez par un projet test entre vous avant de vous présenter ensemble.

## Piloter son activité avec des chiffres

Chaque mois, suivez 6 chiffres dans un tableau simple :

| N° | Indicateur | Pourquoi |
| --- | --- | --- |
| 1 | **Chiffre d''affaires** du mois | Savoir si vous atteignez votre objectif |
| 2 | **Revenu horaire réel** (chiffre d''affaires ÷ heures travaillées, prospection comprise) | Voir si vos prix sont assez élevés |
| 3 | **Part des 2 plus gros clients** | Plus de 50 % : danger si l''un part |
| 4 | **Taux d''acceptation des devis** | Plus de 80 % : vos prix sont peut-être trop bas |
| 5 | **Revenus mensuels réguliers** | La base sûre de votre mois |
| 6 | **Dépenses** (logiciels, matériel, connexion) | Connaître votre bénéfice réel |

> [!exemple] Lecture des chiffres
> Ce mois-ci : 2 400 000 Ar de chiffre d''affaires pour 160 heures travaillées, soit **15 000 Ar de l''heure réelle**. Un seul client représente 60 % du total. Action : prospecter 2 nouveaux clients réguliers dans votre spécialité pour réduire ce risque.

## Prendre soin de soi et de son activité

1. **Une épargne de précaution** : l''équivalent de 3 mois de dépenses, pour les mois creux.
2. **Du temps de formation** chaque semaine : nouvelles fonctions, tendances, anglais.
3. **Des congés prévus**, annoncés aux clients à l''avance.
4. **Votre propre communication** : publiez régulièrement votre travail, même quand vous êtes complet.
5. **Une situation administrative en règle** : NIF, carte statistique, déclarations, selon votre situation (renseignez-vous auprès du centre fiscal de votre ville).

> [!retenir]
> - Augmentez vos prix par paliers, d''abord pour les nouveaux clients.
> - Le prix horaire est un plancher ; la valeur pour le client peut justifier plus.
> - Les contrats mensuels stabilisent vos revenus.
> - Un réseau de freelances permet de proposer des projets complets.
> - 6 chiffres à suivre chaque mois pour piloter votre activité.

## Exercice pratique : votre plan de développement

> [!exercice] Exercice pratique · 2 heures
> 1. Faites le bilan de vos 3 derniers mois avec les 6 indicateurs.
> 2. Rédigez votre nouvelle grille de prix et le message d''annonce à vos clients actuels.
> 3. Créez une offre mensuelle adaptée à votre spécialité, avec contenu et prix.
> 4. Identifiez 3 freelances partenaires possibles et proposez à l''un d''eux un projet test.
> 5. Fixez 3 objectifs chiffrés pour les 6 prochains mois.
>
> **À livrer** : votre tableau d''indicateurs, votre grille de prix, votre message, votre offre mensuelle, votre liste de partenaires et vos 3 objectifs.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-a', 4, 0, 'Comment augmenter ses prix sans perdre ses bons clients ?', '["En doublant sans prévenir","Par paliers, en prévenant 1 à 2 mois à l''avance","En baissant la qualité","En ne répondant plus"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-a', 4, 1, 'Qu''est-ce que le prix à la valeur ?', '["Le prix le plus bas du marché","Le prix d''un logiciel","Un prix fixé selon ce que le travail rapporte au client","Un prix tiré au hasard"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('design-0-a', 4, 2, 'Pourquoi suivre la part des 2 plus gros clients ?', '["Pour leur envoyer un cadeau","Ce n''est pas utile","Au-delà de 50 %, le départ de l''un est un danger","Pour payer moins d''impôts"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Qu''est-ce qu''une niche ?', '["Un segment précis du marché, avec moins de concurrents","Un format de fichier","Un type de police","Un logiciel de dessin"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Quelle niche donne un avantage à un graphiste malgache ?', '["Les jeux vidéo japonais","Les logos de banques suisses uniquement","Le packaging des produits malgaches exportés","Aucune"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Quel est le modèle de phrase de positionnement ?', '["Je suis le moins cher","J''aide [clients] à [résultat] grâce à [spécialité]","J''ai un ordinateur","Je fais tout pour tout le monde"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Dans une offre en 3 niveaux, quel niveau est souvent le plus choisi ?', '["Le moins cher","Celui du milieu","Le plus cher","Aucun"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Une image vectorielle…', '["Est toujours une photo","Ne s''imprime pas","Peut être agrandie sans perte","Devient floue quand on l''agrandit"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Que sert le Pathfinder d''Illustrator ?', '["Exporter une vidéo","Mettre en page un livre","Retoucher les photos","Combiner des formes : unir, soustraire, intersecter"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Pourquoi vectoriser le texte d''un logo avant l''envoi ?', '["Pour qu''il s''affiche même sans la police","Pour le traduire","Pour le rendre plus lourd","Pour changer sa couleur"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Qu''est-ce que le travail non destructif dans Photoshop ?', '["Fusionner tous les calques","Utiliser la gomme","Supprimer les calques inutiles","Travailler sans jamais abîmer l''image originale"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'À quoi sert un objet dynamique ?', '["Garder la qualité d''une image redimensionnée","Supprimer un fond","Animer une image","Changer la langue"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Que vérifie le contrôle en amont d''InDesign ?', '["L''orthographe en anglais","La météo","Le prix de l''impression","Images en basse résolution, polices manquantes, texte en excès"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Pourquoi verrouiller des éléments dans un modèle Canva pour le client ?', '["Pour qu''il ne déplace pas le logo et les titres","Ce n''est pas possible","Pour l''empêcher d''utiliser le modèle","Pour le faire payer plus"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Que faire avant d''utiliser un mockup pour un client ?', '["Vérifier que sa licence permet l''usage commercial","Le vendre","Le modifier au hasard","Rien"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Si le client change de direction pendant l''affinage…', '["On recommence gratuitement","C''est un changement de projet, à facturer","On ignore sa demande","On abandonne le projet"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Que contient la zone de protection d''un logo ?', '["Le mot de passe du fichier","La signature du graphiste","L''espace vide minimum autour du logo","Une bordure noire"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Que faire face à un retour flou comme « ça ne me parle pas » ?', '["Poser des questions précises sur ce qui gêne","Changer toutes les couleurs au hasard","Tout recommencer sans question","Refuser le retour"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Que permet une action dans Photoshop ?', '["Imprimer en couleur","Répéter une suite d''opérations sur de nombreuses images","Créer un contrat","Envoyer un e-mail"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Quelle résolution pour une image imprimée à taille réelle ?', '["1 000 000 ppp","10 ppp","300 ppp","72 ppp"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Pourquoi les concours de design sont-ils rarement rentables ?', '["Ils sont trop bien payés","Ils sont interdits","Ils durent un an","Beaucoup travaillent, un seul est payé"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Que veut dire « deposit » ?', '["Facture finale","Retouche","Acompte","Fichier source"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Qu''est-ce que la cession de droits ?', '["La vente de votre ordinateur","L''autorisation donnée au client d''utiliser la création","Un type de police","Le droit de refuser un projet"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Que dit la clause d''annulation habituelle ?', '["Le projet continue quand même","L''acompte reste acquis si le client arrête","Le graphiste rembourse tout","Le client ne paie rien"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Que faire après chaque appel avec un client étranger ?', '["Envoyer un résumé écrit des décisions","Envoyer une facture","Rien","Changer de client"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Quel est le premier signe qu''il est temps d''augmenter ses prix ?', '["Vos devis sont tous refusés","Vous avez changé d''ordinateur","Vous êtes complet plusieurs semaines à l''avance","Vous n''avez aucun client"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Qu''est-ce qu''une offre « graphiste à temps partagé » ?', '["Un logiciel gratuit","Un graphiste qui partage son ordinateur","Un concours","Un nombre d''heures fixes chaque mois pour une PME"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('design-0-a', 'Combien d''épargne de précaution est conseillée ?', '["10 ans","1 jour","Environ 3 mois de dépenses","Aucune"]'::jsonb, 2);

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

-- dev-3-f
delete from public.exam_questions where course_id = 'dev-3-f';
delete from public.module_questions where course_id = 'dev-3-f';
delete from public.lessons where course_id = 'dev-3-f' and module_index >= 5;
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('dev-3-f', 0, 'Le métier de développeur WordPress et Shopify depuis Madagascar', 'Ce que fait ce développeur, les 6 types de missions, WordPress ou Shopify, vos clients, les compétences et le poste de travail.', 'Une grande partie des sites internet du monde sont construits avec **WordPress**, et des millions de boutiques en ligne utilisent **Shopify** ou **WooCommerce**. Le développeur WordPress et Shopify crée, personnalise et entretient ces sites pour des entreprises, sans forcément écrire beaucoup de code. C''est un métier très demandé, qui se pratique entièrement à distance. Ce premier module vous le présente tel qu''il est vraiment.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Expliquer ce que fait un développeur WordPress et Shopify.
> 2. Citer les 6 types de missions les plus demandés.
> 3. Choisir entre WordPress et Shopify selon le projet du client.
> 4. Repérer vos premiers clients possibles.
> 5. Préparer votre poste de travail et votre organisation.

## Le métier en une phrase

Un développeur WordPress et Shopify **construit des sites internet et des boutiques en ligne fiables, faciles à gérer par le client, avec des outils prêts à l''emploi qu''il sait adapter**.

Le client ne veut pas « du code » : il veut un site qui présente bien son activité, qui fonctionne sur téléphone, qui apparaît sur Google et qu''il peut mettre à jour lui-même.

> [!definition] CMS
> *Content Management System*, ou système de gestion de contenu. Un logiciel qui permet de créer et de modifier un site sans programmer chaque page. WordPress est le CMS le plus utilisé au monde. Shopify est une plateforme spécialisée dans les boutiques en ligne.

## Les 6 types de missions les plus demandés

| N° | Mission | Exemple | Durée habituelle |
| --- | --- | --- | --- |
| 1 | **Site vitrine** | Site de 5 pages pour un restaurant, un hôtel, un cabinet | 1 à 3 semaines |
| 2 | **Boutique en ligne** | Boutique WooCommerce ou Shopify de 20 à 200 produits | 2 à 6 semaines |
| 3 | **Refonte** | Moderniser un vieux site lent et pas adapté au téléphone | 2 à 4 semaines |
| 4 | **Modifications ponctuelles** | Ajouter une page, un formulaire, changer un menu | Quelques heures |
| 5 | **Dépannage** | Site en panne, page blanche, site piraté | Quelques heures à quelques jours |
| 6 | **Maintenance mensuelle** | Mises à jour, sauvegardes, sécurité, petites modifications | Chaque mois |

Les missions **4, 5 et 6** sont idéales pour commencer : courtes, très demandées, et la maintenance apporte un **revenu régulier**.

## WordPress ou Shopify ?

| Critère | **WordPress** (+ WooCommerce pour vendre) | **Shopify** |
| --- | --- | --- |
| Type de site | Tout type : vitrine, blog, boutique, site d''école… | Boutique en ligne avant tout |
| Hébergement | À choisir et payer à part | Inclus dans l''abonnement |
| Coût du logiciel | Gratuit (open source) ; extensions et thèmes parfois payants | Abonnement mensuel ; applications souvent payantes |
| Liberté | Très grande | Plus encadrée, mais plus simple |
| Maintenance technique | À faire (mises à jour, sécurité, sauvegardes) | Gérée par Shopify |
| Pour qui | Sites vitrines, blogs, budgets serrés, besoins particuliers | Commerçants qui veulent vendre vite, sans gérer la technique |

> [!exemple] Quel outil pour quel client ?
> - Un hôtel à Nosy Be qui veut présenter ses chambres et recevoir des demandes de réservation : **WordPress**.
> - Une marque française de cosmétiques qui veut vendre en ligne 80 produits, avec paiement par carte : **Shopify** (ou WooCommerce si le client veut éviter l''abonnement).
> - Une ONG qui publie des actualités et des rapports : **WordPress**.

## Qui sont vos clients ?

### Clients à l''étranger

1. **Petites entreprises francophones** (France, Belgique, Suisse, Canada) qui ont besoin d''un site ou d''une boutique.
2. **Agences web** qui sous-traitent l''intégration, les modifications et la maintenance.
3. **E-commerçants** qui ont besoin d''aide régulière sur leur boutique Shopify.

### Clients à Madagascar

1. **Hôtels, restaurants, agences de voyage**.
2. **Écoles, centres de formation, ONG**.
3. **Entreprises et marques** qui veulent un site professionnel.
4. **Professions libérales** : avocats, cliniques, architectes.

> [!madagascar] Votre avantage
> Les agences web francophones cherchent des développeurs fiables qui comprennent parfaitement le français de leurs clients. Et à Madagascar, beaucoup d''entreprises n''ont qu''une page Facebook : un site professionnel bien référencé est un vrai plus pour elles.

## Les qualités et compétences du métier

| Compétence | Pourquoi |
| --- | --- |
| **Logique et méthode** | Chercher la cause d''une panne étape par étape |
| **Sens du design** | Un site doit être beau **et** clair |
| **Bases du HTML et du CSS** | Pour les petites retouches que les outils ne permettent pas (module 2) |
| **Communication** | Comprendre le besoin du client, lui expliquer simplement |
| **Rigueur** | Sauvegardes, mises à jour, sécurité : une erreur peut faire tomber un site |
| **Curiosité** | Les outils évoluent sans cesse |

## Le poste de travail

1. Un **ordinateur** récent, même modeste (8 Go de mémoire vive sont confortables).
2. Un **navigateur** à jour (Chrome ou Firefox) avec ses outils de développement.
3. Un **téléphone** pour tester chaque site sur petit écran.
4. Une **connexion stable** et un forfait mobile de secours.
5. Un **gestionnaire de mots de passe** : vous aurez beaucoup d''accès clients.

> [!astuce]
> Travaillez d''abord **sur votre ordinateur**, sur un site local (module 3) : vous pouvez tout essayer sans connexion, sans risque et sans payer d''hébergement. Vous ne mettez en ligne qu''à la fin.

> [!attention] Erreurs fréquentes des débutants
> - Modifier le site d''un client en ligne sans sauvegarde.
> - Installer des dizaines d''extensions « pour voir ».
> - Utiliser des thèmes ou extensions payants « piratés » (*nulled*) : ils contiennent souvent des virus.
> - Promettre un site « en 3 jours » sans avoir reçu les textes et les photos du client.

> [!retenir]
> - Le développeur construit des sites fiables que le client peut gérer seul.
> - Modifications, dépannage et maintenance sont les meilleures missions pour débuter.
> - WordPress pour presque tout ; Shopify pour vendre vite sans gérer la technique.
> - Rigueur : sauvegardes, sécurité, jamais de logiciels piratés.

## Exercice pratique : analyser 5 sites

> [!exercice] Exercice pratique · 45 minutes
> 1. Choisissez 5 sites d''entreprises malgaches (hôtels, restaurants, écoles, boutiques).
> 2. Pour chacun, notez : s''il s''affiche bien sur téléphone, s''il se charge vite, si les informations essentielles (adresse, téléphone, prix) sont faciles à trouver.
> 3. Essayez de deviner s''il est fait avec WordPress, Shopify ou autre chose (indice : regardez le bas de page, ou des adresses contenant « wp-content »).
> 4. Pour chacun, écrivez 3 améliorations précises.
>
> **À livrer** : votre tableau des 5 sites avec vos observations et vos 15 améliorations. Ces entreprises sont peut-être vos futurs clients.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('dev-3-f', 0, 0, 'Qu''est-ce qu''un CMS ?', '["Un moyen de paiement","Un type d''ordinateur","Un logiciel pour créer et modifier un site sans programmer chaque page","Un réseau social"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('dev-3-f', 0, 1, 'Quelles missions sont idéales pour commencer ?', '["Créer un réseau social complet","Créer un jeu vidéo 3D","Modifications, dépannage et maintenance","Développer un système bancaire"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('dev-3-f', 0, 2, 'Pourquoi ne jamais installer de thèmes payants « piratés » ?', '["Ils contiennent souvent des virus","Ils sont trop jolis","Ils sont trop lents à télécharger","Ils ne s''affichent qu''en anglais"]'::jsonb, 0);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('dev-3-f', 1, 'Les bases : comment marche un site, WordPress, Shopify, HTML et CSS', 'Domaine, hébergement, DNS et HTTPS, l''organisation de WordPress et de Shopify, l''arborescence, et les bases du HTML et du CSS.', 'Avant de construire un site, il faut comprendre comment Internet l''affiche, et comment WordPress et Shopify sont organisés. Ce module vous donne ces bases : nom de domaine, hébergement, sécurité, structure d''un site, et les notions de HTML et de CSS qui vous serviront tous les jours.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Expliquer le rôle du nom de domaine, de l''hébergement et du HTTPS.
> 2. Décrire l''organisation de WordPress : thèmes, extensions, pages, articles, menus.
> 3. Décrire l''organisation de Shopify : thèmes, applications, produits, collections.
> 4. Construire l''arborescence d''un site.
> 5. Lire et modifier du HTML et du CSS simples.

## Comment un site arrive à l''écran

| Élément | Comparaison | Rôle |
| --- | --- | --- |
| **Nom de domaine** | L''adresse de la maison | Le nom que l''on tape : `hotel-baobab.com` |
| **Hébergement** | Le terrain où la maison est construite | L''ordinateur (serveur) qui garde les fichiers du site et les envoie aux visiteurs |
| **DNS** | L''annuaire | Le système qui relie le nom de domaine au bon serveur |
| **HTTPS** (certificat SSL) | Le cadenas de la porte | Chiffre les échanges ; le navigateur affiche « non sécurisé » sans lui |

> [!definition] Serveur
> Un ordinateur allumé en permanence, relié à Internet, qui envoie les pages du site à chaque visiteur.

### Ce que le client doit posséder

1. Le **nom de domaine** doit être **au nom du client**, sur son compte. Jamais sur le vôtre.
2. L''**hébergement** aussi, de préférence. Vous recevez un accès.
3. Vous gardez les **accès** dans un gestionnaire de mots de passe, et vous les rendez à la fin de la mission.

> [!attention]
> Si le domaine est à votre nom et que vous disparaissez (maladie, changement de métier), le client perd son site. C''est une source fréquente de conflits : faites toujours enregistrer le domaine au nom du client.

## L''organisation de WordPress

| Élément | Ce que c''est | Exemple |
| --- | --- | --- |
| **Tableau de bord** | L''espace d''administration (`/wp-admin`) | Là où tout se gère |
| **Thème** | L''apparence générale du site | Astra, Kadence, GeneratePress (thèmes gratuits populaires) |
| **Extensions** (*plugins*) | Des fonctions ajoutées | Formulaire de contact, référencement, sécurité, boutique (WooCommerce) |
| **Pages** | Contenus fixes | Accueil, À propos, Services, Contact |
| **Articles** | Contenus datés, classés par catégories | Actualités, blog |
| **Médias** | Images, PDF, vidéos | Photos des chambres |
| **Menus** | La navigation du site | Accueil · Chambres · Activités · Contact |
| **Utilisateurs** | Les comptes, avec des rôles | Administrateur, Éditeur, Auteur |

> [!astuce] La règle des extensions
> Chaque extension ajoute du poids et un risque de sécurité. Avant d''en installer une : est-elle **vraiment nécessaire** ? Est-elle **mise à jour récemment** ? A-t-elle **beaucoup d''installations et de bons avis** ? Si une réponse est non, cherchez une autre solution.

## L''organisation de Shopify

| Élément | Ce que c''est |
| --- | --- |
| **Thème** | L''apparence de la boutique (Dawn est le thème gratuit de base) |
| **Applications** | Des fonctions ajoutées (avis clients, traduction, e-mails) |
| **Produits** | Chaque article vendu, avec photos, prix, variantes (taille, couleur), stock |
| **Collections** | Des groupes de produits (« Robes », « Nouveautés », « Promotions ») |
| **Pages** | Contenus fixes (À propos, Livraison, Contact) |
| **Navigation** | Menus du haut et du bas de page |
| **Paramètres** | Paiements, livraison, taxes, langues |

## Construire l''arborescence d''un site

> [!definition] Arborescence
> Le plan du site : la liste des pages et la façon dont elles sont reliées. On la fait **avant** de construire, et on la fait valider par le client.

> [!exemple] Arborescence du site d''un hôtel
> ```
> Accueil
> ├── Chambres
> │   ├── Bungalow vue mer
> │   └── Chambre jardin
> ├── Restaurant
> ├── Activités
> ├── Galerie
> └── Contact et réservation
> ```
> En bas de chaque page : mentions légales, politique de confidentialité, réseaux sociaux.

### Les 5 règles d''une bonne arborescence

1. Chaque information importante est accessible en **3 clics maximum**.
2. **6 à 7 éléments** maximum dans le menu principal.
3. Des noms de pages **simples** : « Chambres » plutôt que « Nos espaces de repos ».
4. Une page **Contact** visible partout.
5. Sur téléphone, le bouton principal (« Réserver », « Commander », « Appeler ») toujours facile à toucher.

## Les bases du HTML et du CSS

Vous n''avez pas besoin d''être programmeur, mais savoir lire un peu de code vous sauvera souvent.

> [!definition] HTML et CSS
> Le **HTML** décrit le contenu d''une page (titres, paragraphes, images, liens). Le **CSS** décrit son apparence (couleurs, tailles, espacements).

### Le HTML à connaître

```
<h1>Bienvenue au Baobab Lodge</h1>
<h2>Nos chambres</h2>
<p>Six bungalows face à la mer.</p>
<a href="/contact">Réserver</a>
<img src="bungalow.jpg" alt="Bungalow face à la mer">
```

| Balise | Rôle |
| --- | --- |
| `<h1>` à `<h3>` | Titres (un seul `h1` par page) |
| `<p>` | Paragraphe |
| `<a href="…">` | Lien |
| `<img src="…" alt="…">` | Image, avec une description (`alt`) pour l''accessibilité et Google |

### Le CSS à connaître

```
.bouton-reserver {
  background-color: #0B7A55;
  color: white;
  padding: 12px 24px;
  border-radius: 8px;
}
```

Cette règle donne un fond vert, un texte blanc, de l''espace intérieur et des coins arrondis à tous les éléments qui ont la classe `bouton-reserver`.

> [!astuce] Les outils de développement du navigateur
> Dans Chrome ou Firefox, faites un **clic droit → Inspecter** sur n''importe quel élément d''une page : vous voyez son HTML et son CSS, et vous pouvez les modifier pour essayer (les changements disparaissent quand vous rechargez). C''est le meilleur moyen d''apprendre.

> [!madagascar]
> Beaucoup de visiteurs malgaches naviguent sur téléphone avec une connexion mobile. Pensez **léger** dès le départ : peu d''extensions, images compressées, pas de vidéo qui démarre seule en arrière-plan.

> [!retenir]
> - Domaine, hébergement, DNS, HTTPS : le domaine toujours au nom du client.
> - WordPress : thème, extensions, pages, articles, menus, utilisateurs.
> - Shopify : thème, applications, produits, collections, paramètres.
> - Une arborescence validée avant de construire.
> - Un peu de HTML et de CSS, et l''outil « Inspecter » du navigateur.

## Exercice pratique : préparer un site

> [!exercice] Exercice pratique · 1 heure
> 1. Choisissez un des 5 sites analysés au module 1 et dessinez la nouvelle arborescence que vous proposeriez.
> 2. Sur une page de ce site, utilisez « Inspecter » pour trouver le `h1`, un lien et une image, et notez leur code.
> 3. Toujours avec « Inspecter », changez la couleur d''un bouton et le texte d''un titre ; faites une capture d''écran.
> 4. Écrivez une petite page HTML (un titre, deux paragraphes, une image, un lien) dans un fichier `test.html` et ouvrez-la dans votre navigateur.
>
> **À livrer** : votre arborescence, vos notes de code, la capture modifiée et votre fichier `test.html`.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('dev-3-f', 1, 0, 'Au nom de qui doit être enregistré le nom de domaine ?', '["Du développeur","De l''hébergeur","Du client","De Vitako"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('dev-3-f', 1, 1, 'Dans WordPress, qu''est-ce qu''une extension ?', '["Un nom de domaine","L''apparence du site","Une page de contact","Une fonction ajoutée au site"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('dev-3-f', 1, 2, 'Quelle balise HTML sert à créer un lien ?', '["<a href=\"…\">","<h1>","<img>","<p>"]'::jsonb, 0);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('dev-3-f', 2, 'Les outils : WordPress, WooCommerce, Shopify, et les outils payants', 'LocalWP, les 10 réglages essentiels, l''éditeur de blocs, WooCommerce, la boutique de développement Shopify, puis Elementor Pro, thèmes premium et abonnement Shopify.', 'Ce module vous fait prendre en main les trois outils du métier : **WordPress** pour les sites, **WooCommerce** pour vendre avec WordPress, et **Shopify** pour les boutiques clés en main. Vous apprenez à travailler en local sans payer d''hébergement, à créer une boutique de test gratuite, puis vous découvrez les outils payants que vos clients vous demanderont.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Installer WordPress sur votre ordinateur avec LocalWP.
> 2. Configurer un site WordPress en 10 réglages essentiels.
> 3. Construire des pages avec l''éditeur de blocs.
> 4. Installer et configurer WooCommerce.
> 5. Créer une boutique Shopify de développement et y ajouter des produits.
> 6. Savoir quand utiliser Elementor Pro, un thème premium ou un abonnement Shopify.

## Les outils gratuits

| N° | Outil | Pour quoi |
| --- | --- | --- |
| 1 | **LocalWP** | Installer des sites WordPress sur votre ordinateur, sans hébergement ni connexion |
| 2 | **WordPress** | Le CMS, gratuit et libre |
| 3 | **Un thème gratuit léger** (Astra, Kadence, GeneratePress) | L''apparence du site |
| 4 | **WooCommerce** | Extension gratuite pour vendre avec WordPress |
| 5 | **Shopify Partners** | Programme gratuit pour les développeurs : il permet de créer des boutiques de développement pour s''entraîner et préparer les boutiques des clients |
| 6 | **Squoosh** ou **TinyPNG** | Compresser les images avant de les mettre en ligne |

## WordPress en local avec LocalWP

1. Téléchargez et installez **LocalWP** (gratuit) sur votre ordinateur.
2. Cliquez sur **Create a new site**, donnez un nom (« baobab-lodge »).
3. Gardez l''environnement proposé (*Preferred*).
4. Choisissez un identifiant et un mot de passe administrateur.
5. Cliquez sur **WP Admin** : vous êtes dans le tableau de bord de votre site local.

Tout fonctionne sur votre ordinateur. Quand le site est prêt, on le **met en ligne** chez l''hébergeur du client (avec une extension de migration ou l''outil de l''hébergeur).

## Les 10 réglages essentiels d''un nouveau site WordPress

| N° | Réglage | Où | Pourquoi |
| --- | --- | --- | --- |
| 1 | Titre et slogan du site | Réglages → Général | Affichés dans Google et l''onglet du navigateur |
| 2 | Langue et fuseau horaire | Réglages → Général | Dates correctes, interface en français |
| 3 | Permaliens « Titre de la publication » | Réglages → Permaliens | Adresses lisibles : `/chambres/` au lieu de `/?p=12` |
| 4 | Page d''accueil statique | Réglages → Lecture | L''accueil est une vraie page, pas la liste des articles |
| 5 | Supprimer le contenu d''exemple | Pages, Articles, Commentaires | Pas de « Bonjour tout le monde » en ligne |
| 6 | Désactiver les commentaires si inutiles | Réglages → Discussion | Évite les messages indésirables |
| 7 | Installer le thème | Apparence → Thèmes | L''apparence générale |
| 8 | Extension de référencement | Extensions | Balise titre et méta-description de chaque page |
| 9 | Extension de sécurité et de sauvegarde | Extensions | Protéger et pouvoir restaurer le site |
| 10 | Logo, couleurs, polices | Apparence → Personnaliser (ou éditeur du thème) | L''identité du client |

## Construire une page avec l''éditeur de blocs

WordPress utilise un éditeur de **blocs** : chaque élément (titre, paragraphe, image, bouton, colonnes) est un bloc que l''on ajoute avec le bouton **+**.

### Construire la page d''accueil d''un hôtel en 7 blocs

1. **Couverture** : grande photo avec le titre « Baobab Lodge, Morondava » et un bouton « Réserver ».
2. **Paragraphe** : 2 phrases de présentation.
3. **Colonnes** (3) : « Chambres », « Restaurant », « Activités », chacune avec une image, un court texte et un lien.
4. **Titre** + **Galerie** : 6 photos.
5. **Citation** ou **Colonnes** : 2 avis de clients.
6. **Bouton** : « Demander une réservation ».
7. **Carte** ou adresse, et horaires.

> [!astuce] Les modèles de blocs
> La plupart des thèmes gratuits proposent des **compositions** toutes prêtes (sections d''accueil, tarifs, témoignages). Partez d''une composition et remplacez le contenu : vous gagnez beaucoup de temps.

### Les constructeurs de pages

Certains clients et agences utilisent **Elementor**, un constructeur visuel par glisser-déposer. Sa version gratuite suffit pour s''entraîner. Retenez la règle : **un seul constructeur par site**, et ne mélangez pas les outils.

## Vendre avec WooCommerce

1. **Extensions → Ajouter** : installez et activez **WooCommerce**.
2. Suivez l''assistant : adresse de la boutique, monnaie, types de produits.
3. **Produits → Ajouter** : nom, description, prix, images, catégorie, stock.
4. **Réglages → Livraison** : zones (Antananarivo, provinces, étranger) et tarifs.
5. **Réglages → Paiements** : activez les moyens de paiement adaptés au pays du client.
6. Passez une **commande de test** du début à la fin.

> [!madagascar] Les paiements à Madagascar
> Beaucoup de solutions de paiement par carte en ligne ne sont pas disponibles pour un commerçant installé à Madagascar : vérifiez toujours selon le pays du client. Pour une boutique malgache, les solutions courantes sont le **paiement à la livraison**, le **virement**, et le **Mobile Money** : soit par une solution de paiement locale compatible, soit avec un paiement manuel (le client paie, envoie la référence, le commerçant valide la commande). Expliquez ces options au client **avant** de construire la boutique.

## Shopify : la boutique de développement

### Créer une boutique de test gratuite

1. Inscrivez-vous gratuitement au programme **Shopify Partners**.
2. Dans votre tableau de bord partenaire, créez une **boutique de développement** (*development store*).
3. Elle fonctionne comme une vraie boutique, sans abonnement, mais ne peut pas encaisser de vraies ventes : parfaite pour apprendre et préparer la boutique d''un client.

### Construire une boutique en 7 étapes

1. **Paramètres** : nom, adresse, monnaie, langue.
2. **Thème** : personnalisez le thème gratuit **Dawn** (logo, couleurs, polices, sections de la page d''accueil).
3. **Produits** : titre, description, photos, prix, **variantes** (taille, couleur), stock.
4. **Collections** : regroupez les produits (« Robes », « Nouveautés »).
5. **Pages** : À propos, Livraison et retours, Contact.
6. **Navigation** : menu principal et menu du bas de page.
7. **Livraison et paiements** : zones, tarifs, moyens de paiement disponibles dans le pays du client.

> [!definition] Variante
> Une version d''un même produit : une robe en 3 tailles et 2 couleurs a 6 variantes, chacune avec son propre stock et parfois son propre prix.

## Les outils payants

| Outil | Ce qu''il apporte | Qui le paie |
| --- | --- | --- |
| **Elementor Pro** | Constructeur de pages avancé : modèles d''en-tête et pied de page, formulaires, pages de boutique personnalisées | Le client (licence sur son site), ou l''agence |
| **Thèmes premium** (pour WordPress ou Shopify) | Designs plus complets, fonctions supplémentaires, assistance | Le client, sur son compte |
| **Abonnement Shopify** | La boutique en ligne avec hébergement, sécurité et paiements selon les pays | Le client, toujours |
| **Applications Shopify payantes** | Avis clients, traduction, abonnements, filtres avancés | Le client |

Les prix changent : vérifiez-les sur les sites officiels. **Règle d''or** : les licences et abonnements sont achetés **au nom du client**, sur son compte. Vous lui expliquez ce qui est nécessaire et pourquoi, il paie, vous installez.

> [!attention]
> N''installez **jamais** de versions « gratuites » de thèmes ou d''extensions payants trouvées sur des sites non officiels (*nulled*). Elles contiennent souvent du code malveillant qui pirate le site du client.

> [!retenir]
> - LocalWP pour travailler en local, gratuitement et sans connexion.
> - 10 réglages essentiels sur chaque nouveau site WordPress.
> - Éditeur de blocs et compositions pour construire vite ; un seul constructeur par site.
> - WooCommerce et Shopify : vérifier les moyens de paiement selon le pays du client.
> - Licences et abonnements toujours au nom du client.

## Exercice pratique : vos premiers sites

> [!exercice] Exercice pratique · 3 heures
> 1. Installez LocalWP et créez le site « Baobab Lodge ».
> 2. Faites les 10 réglages essentiels.
> 3. Construisez la page d''accueil en 7 blocs, plus les pages Chambres et Contact.
> 4. Installez WooCommerce et ajoutez 3 produits (par exemple des excursions), avec une commande de test.
> 5. Créez une boutique de développement Shopify et ajoutez 5 produits dont un avec variantes, une collection et une page.
>
> **À livrer** : des captures d''écran de chaque étape et le lien de prévisualisation de votre boutique Shopify.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('dev-3-f', 2, 0, 'À quoi sert LocalWP ?', '["Héberger un site en ligne","Payer un abonnement Shopify","Compresser des vidéos","Installer des sites WordPress sur son ordinateur, sans hébergement"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('dev-3-f', 2, 1, 'Quel réglage donne des adresses lisibles comme /chambres/ ?', '["Les commentaires","Les permaliens","Le fuseau horaire","Le titre du site"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('dev-3-f', 2, 2, 'Qui paie l''abonnement Shopify d''une boutique ?', '["Personne, c''est gratuit","Le développeur","Le client, sur son compte","L''hébergeur"]'::jsonb, 2);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('dev-3-f', 3, 'Premier projet : le site d''un restaurant avec commande en ligne', 'Le projet en 8 étapes, la liste des contenus, la construction, vitesse, référencement et sécurité, la grille de 15 points, la mise en ligne et la formation.', 'Place à un vrai projet de client : le site d''un restaurant avec commande en ligne, construit avec WordPress et WooCommerce. Vous suivez toutes les étapes d''un projet professionnel, de la collecte des contenus à la formation du client, avec les vérifications de sécurité, de vitesse et de référencement qui font la différence.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Mener un projet de site en 8 étapes.
> 2. Recueillir les contenus du client avec une liste précise.
> 3. Optimiser la vitesse, le référencement et la sécurité.
> 4. Tester un site avec une grille de 15 points.
> 5. Mettre en ligne et former le client.

## Le cas pratique : « Chez Lalao »

> [!exemple] Votre client
> **Chez Lalao** est un restaurant de cuisine malgache à Antananarivo (Isoraka). Il veut un site pour :
> 1. présenter le restaurant, le menu et les horaires ;
> 2. permettre de **commander des plats à emporter ou en livraison** à Tana, avec paiement à la livraison ou par Mobile Money ;
> 3. apparaître sur Google quand on cherche « restaurant malgache Isoraka ».
> La gérante, Mme Lalao, veut pouvoir modifier le menu elle-même.

## Le projet en 8 étapes

| N° | Étape | Résultat | Validé par le client ? |
| --- | --- | --- | --- |
| 1 | **Cadrage** | Objectifs, pages, fonctions, budget, délai | Oui |
| 2 | **Contenus** | Textes, photos, menu, logo, informations pratiques | Oui (le client les fournit) |
| 3 | **Arborescence et maquette** | Plan du site et croquis de la page d''accueil | Oui |
| 4 | **Construction** | Site complet en local | — |
| 5 | **Optimisation** | Vitesse, référencement, sécurité | — |
| 6 | **Tests** | Grille de 15 points | — |
| 7 | **Mise en ligne** | Site sur l''hébergement du client, HTTPS actif | Oui |
| 8 | **Formation et remise** | Formation du client, guide, accès rendus | Oui |

## Étape 2 : recueillir les contenus

Le retard n° 1 des projets web, c''est le client qui n''envoie pas ses contenus. Envoyez une **liste précise** dès le début, avec une date limite.

### La liste des contenus

1. **Logo** en bonne qualité (PNG ou SVG).
2. **Textes** : présentation du restaurant (5 à 10 lignes), histoire, spécialités.
3. **Menu** : nom de chaque plat, description courte, prix, catégorie (entrées, plats, desserts, boissons).
4. **Photos** : salle, plats, équipe (photos nettes, à la lumière du jour).
5. **Informations pratiques** : adresse, horaires, téléphone, zones et frais de livraison.
6. **Réseaux sociaux** : liens vers la page Facebook et Instagram.
7. **Accès** : nom de domaine et hébergement (au nom du client).

> [!astuce]
> Créez un **dossier partagé** Google Drive avec un sous-dossier par type de contenu et une liste à cocher. Le client voit ce qui manque, et vous aussi.

## Étape 4 : construire

### Les pages du site

1. **Accueil** : photo d''ambiance, phrase d''accroche, bouton « Commander », 3 plats vedettes, horaires.
2. **Menu** : la boutique WooCommerce, avec les catégories de plats.
3. **Le restaurant** : histoire, photos, équipe.
4. **Contact et accès** : adresse, carte, horaires, téléphone, WhatsApp.
5. **Pages légales** : mentions légales, conditions de vente, politique de confidentialité.

### La commande en ligne avec WooCommerce

1. Chaque plat est un **produit**, rangé dans sa **catégorie**.
2. **Livraison** : une zone « Antananarivo » avec un tarif fixe, et l''option « Retrait sur place » gratuite.
3. **Paiements** : « Paiement à la livraison » et « Mobile Money » (instructions : numéro, nom du titulaire, envoi de la référence ; le restaurant valide la commande après vérification).
4. **E-mails** : vérifiez que le restaurant reçoit bien un e-mail à chaque commande, et que le client reçoit sa confirmation.
5. **Horaires de commande** : indiquez clairement les heures où les commandes sont traitées.

## Étape 5 : optimiser

### La vitesse

| N° | Action | Pourquoi |
| --- | --- | --- |
| 1 | Compresser les images (moins de 200 à 300 Ko pour une photo pleine largeur) | Les images sont la première cause de lenteur |
| 2 | Redimensionner les images à la taille d''affichage | Inutile d''envoyer une photo de 4 000 px de large |
| 3 | Limiter les extensions au strict nécessaire | Chaque extension ajoute du code |
| 4 | Installer une extension de cache | Les pages se chargent plus vite |
| 5 | Tester avec **PageSpeed Insights** (gratuit, de Google) | Mesurer et voir ce qui reste à améliorer |

### Le référencement de base

1. Une **balise titre** et une **méta-description** pour chaque page (« Restaurant malgache à Isoraka | Chez Lalao »).
2. Un seul **titre H1** par page.
3. Un **texte alternatif** pour chaque image.
4. Des **adresses** lisibles (`/menu/`, `/contact/`).
5. Créer la fiche **Google Business Profile** du restaurant (gratuite) avec un lien vers le site.

### La sécurité

1. **Identifiant administrateur** qui n''est pas « admin », et mot de passe long.
2. **Double authentification** pour l''administrateur.
3. **Mises à jour** de WordPress, du thème et des extensions.
4. **Sauvegardes automatiques** régulières, stockées **hors** du serveur (par exemple dans le Google Drive du client).
5. **HTTPS** actif sur tout le site.

## Étape 6 : la grille de tests en 15 points

| N° | Point à tester | Oui / Non |
| --- | --- | --- |
| 1 | Toutes les pages s''affichent correctement sur ordinateur | |
| 2 | Toutes les pages s''affichent correctement sur téléphone | |
| 3 | Le menu fonctionne sur téléphone | |
| 4 | Tous les liens fonctionnent (aucune page introuvable) | |
| 5 | Le formulaire de contact envoie bien un e-mail | |
| 6 | Une commande de test passe du panier à la confirmation | |
| 7 | Le restaurant reçoit l''e-mail de commande | |
| 8 | Les frais de livraison sont corrects | |
| 9 | Les instructions de paiement Mobile Money sont claires | |
| 10 | Aucune faute dans les textes | |
| 11 | Toutes les images sont compressées et ont un texte alternatif | |
| 12 | Score PageSpeed correct sur mobile (et problèmes principaux corrigés) | |
| 13 | Balises titre et méta-descriptions remplies | |
| 14 | Sauvegarde automatique active et testée | |
| 15 | HTTPS actif, aucun avertissement de sécurité | |

## Étapes 7 et 8 : mise en ligne et formation

### Mettre en ligne

1. Faites une **sauvegarde complète** du site local.
2. Transférez-le chez l''hébergeur du client (extension de migration ou outil de l''hébergeur).
3. Vérifiez que le **nom de domaine** pointe vers l''hébergement.
4. Activez le **HTTPS**.
5. Refaites les tests **1 à 9** et **15** sur le site en ligne.

### Former le client

1. Une **séance de 45 minutes** en visioconférence (enregistrée, avec son accord) : modifier un plat et son prix, ajouter une photo, voir et traiter une commande.
2. Un **guide écrit** de 2 à 3 pages avec captures d''écran.
3. Un **compte** pour le client avec le rôle adapté (Gestionnaire de boutique ou Éditeur), et non votre propre compte.
4. Le **document des accès** : domaine, hébergement, WordPress, e-mails, à conserver en lieu sûr.

> [!attention] Erreurs fréquentes des débutants
> - Commencer à construire sans contenus : le site reste vide des semaines.
> - Mettre en ligne des photos de 5 Mo.
> - Oublier de tester une vraie commande.
> - Ne pas activer les sauvegardes.
> - Laisser le client utiliser le compte administrateur du développeur.

> [!retenir]
> - 8 étapes, avec validation du client aux moments clés.
> - Une liste de contenus précise, avec une date limite.
> - Vitesse, référencement et sécurité font partie du travail, pas d''une option.
> - Une grille de 15 points avant et après la mise en ligne.
> - Un client formé, avec un guide et son propre compte.

## Exercice pratique : le site « Chez Lalao »

> [!exercice] Exercice pratique · 6 heures
> 1. Rédigez le document de cadrage et la liste des contenus.
> 2. Créez de faux contenus réalistes : 15 plats avec prix, textes, photos libres de droits.
> 3. Construisez le site complet en local avec LocalWP et WooCommerce.
> 4. Optimisez les images, réglez le référencement et la sécurité.
> 5. Passez la grille de 15 points et corrigez.
> 6. Rédigez le guide client de 2 pages.
>
> **À livrer** : le cadrage, une vidéo de 3 minutes qui présente le site (écran enregistré), la grille remplie et le guide client. C''est votre projet de portfolio.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('dev-3-f', 3, 0, 'Quelle est la première cause de lenteur d''un site ?', '["La longueur des textes","Le nombre de pages","Les images trop lourdes","La couleur du fond"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('dev-3-f', 3, 1, 'Où stocker les sauvegardes du site ?', '["Dans un e-mail au client","Nulle part","Uniquement sur le même serveur","Hors du serveur, par exemple dans le Drive du client"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('dev-3-f', 3, 2, 'Quel compte donner au client à la fin du projet ?', '["Son propre compte avec le rôle adapté","Le compte administrateur du développeur","Un compte partagé avec d''autres clients","Aucun compte"]'::jsonb, 0);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('dev-3-f', 4, 'Trouver des clients et se faire payer', 'Portfolio, 5 canaux de prospection, prix des sites et modifications, forfaits de maintenance, devis par étapes et paiements.', 'Le métier de développeur WordPress et Shopify a un grand avantage : après la création d''un site, le client a besoin de **maintenance** chaque mois. Ce dernier module vous montre comment présenter votre travail, trouver des clients, fixer vos prix pour les sites, les modifications et la maintenance, et vous faire payer depuis Madagascar.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Construire un portfolio de sites convaincant.
> 2. Trouver des clients grâce à 5 canaux, avec un message de prospection prêt à l''emploi.
> 3. Calculer le prix d''un site, d''une modification et d''un forfait de maintenance.
> 4. Rédiger un devis par étapes avec des acomptes.
> 5. Vous faire payer en local et depuis l''étranger.
> 6. Construire un revenu régulier avec la maintenance.

## Le portfolio du développeur

### Les 4 éléments d''un bon portfolio

1. **2 ou 3 sites complets** : le site « Chez Lalao » (module 4), le site « Baobab Lodge » (module 3), une boutique Shopify de démonstration.
2. Pour chaque site : le **besoin** du client, les **fonctions** réalisées (commande en ligne, réservation, multilingue), des **captures sur ordinateur et téléphone**, et le **score de vitesse**.
3. Une **vidéo de 2 à 3 minutes** par projet, où vous présentez le site en partageant votre écran.
4. Votre **propre site**, fait avec WordPress : c''est votre première carte de visite.

> [!astuce]
> Les sites d''exercice ne sont pas en ligne ? Publiez-les sur un hébergement gratuit de démonstration ou montrez-les en vidéo. Indiquez honnêtement « projet de démonstration ».

## Où trouver des clients : 5 canaux

| N° | Canal | Pour qui | Comment s''y prendre |
| --- | --- | --- | --- |
| 1 | **Entreprises malgaches** sans site ou avec un vieux site | Hôtels, restaurants, écoles, cliniques | Montrez une maquette de leur future page d''accueil (exercice du module 1) |
| 2 | **Agences web francophones** | Sous-traitance d''intégration et de maintenance | Proposez votre aide pour les modifications et la maintenance de leurs clients |
| 3 | **Plateformes de freelance** (Upwork, Fiverr, Malt et autres) | Petites entreprises, e-commerçants | Offre précise : « Correction de votre site WordPress en 24 h » ; vérifiez que la plateforme accepte les freelances basés à Madagascar |
| 4 | **Communauté Shopify** et groupes d''e-commerçants | Boutiques Shopify | Répondez aux questions, proposez des améliorations |
| 5 | **Bouche-à-oreille** | Clients satisfaits | Demandez systématiquement une recommandation |

### Le message de prospection, prêt à l''emploi

> [!exemple] Message à un hôtel malgache
> « Bonjour Madame, je suis développeur web à Antananarivo. En cherchant "hôtel Ambositra" sur Google, je n''ai pas trouvé votre site, alors que vos avis sur Facebook sont excellents. Je crée des sites rapides, adaptés au téléphone, avec un formulaire de réservation. J''ai préparé une maquette de ce que pourrait être votre page d''accueil : [lien]. Seriez-vous disponible pour en parler 15 minutes cette semaine ? »

Personnalisé, court, un problème précis, une preuve, une proposition. Envoyez **5 messages bien préparés par jour**.

## Calculer ses prix

### Étape 1 : votre prix horaire

**Revenu mensuel visé** (exemple : 1 800 000 Ar) ÷ **heures facturables** (exemple : 100 h) = **18 000 Ar de l''heure**.

### Étape 2 : le temps par type de projet

| Projet | Temps estimé (débutant) | Exemple de prix (18 000 Ar/h) |
| --- | --- | --- |
| Modification simple (ajouter une page, changer un menu) | 1 à 2 h | 18 000 à 36 000 Ar |
| Dépannage (site en panne, erreur) | 2 à 4 h | 36 000 à 72 000 Ar |
| Site vitrine de 5 pages | 25 à 35 h | 450 000 à 630 000 Ar |
| Boutique WooCommerce ou Shopify de 30 produits | 40 à 60 h | 720 000 à 1 080 000 Ar |

Ajoutez **20 % de marge** pour les imprévus et les échanges avec le client. Ces prix sont des **exemples** à adapter à votre niveau et à vos clients. Pour les clients étrangers, fixez vos prix en euros ou en dollars, adaptés à leur marché.

> [!attention]
> Les coûts **du client** ne font pas partie de votre prix : nom de domaine, hébergement, abonnement Shopify, licences de thèmes et d''extensions. Indiquez-les à part dans le devis, avec une estimation, et faites-les payer par le client sur **son** compte.

### Étape 3 : le forfait de maintenance

| Formule | Contenu | Temps par mois | Exemple de prix |
| --- | --- | --- | --- |
| **Essentiel** | Mises à jour, sauvegardes, surveillance de sécurité | 1 h | 18 000 Ar / mois |
| **Standard** | Essentiel + 1 h de petites modifications + rapport mensuel | 2 h | 36 000 Ar / mois |
| **Complet** | Standard + 3 h de modifications + optimisation de vitesse | 5 h | 90 000 Ar / mois |

Avec 15 clients en maintenance, vous avez une base de revenu régulier chaque mois.

## Le devis par étapes

Pour un site, le paiement se fait en plusieurs fois, liées aux étapes du projet :

| Étape | Paiement |
| --- | --- |
| Signature du devis | **40 %** d''acompte |
| Validation de la maquette et de l''arborescence | **30 %** |
| Mise en ligne | **30 %** restants |

### Ce que contient le devis

1. La liste des **pages** et des **fonctions** (formulaire, commande en ligne, langues).
2. Ce que le client **fournit** (contenus, accès) et la date limite.
3. Ce qui n''est **pas** inclus (rédaction des textes, photos, traduction, coûts du client).
4. Le **nombre de tours de modifications** à chaque étape (souvent 2).
5. Le **délai**, calculé à partir de la réception de tous les contenus.
6. Le **prix** et l''échéancier de paiement.
7. La **formation** et la **garantie** (exemple : correction gratuite des bugs pendant 30 jours après la mise en ligne).

> [!madagascar]
> Pour un client malgache, prévoyez une ligne claire pour le **nom de domaine** (`.mg` ou `.com`) et l''**hébergement** : beaucoup de clients découvrent ces coûts annuels après coup. Rappelez-leur la date de renouvellement : un domaine non renouvelé, c''est un site qui disparaît.

## Se faire payer

| Situation | Moyens de paiement |
| --- | --- |
| Client local | Mobile Money (MVola, Orange Money, Airtel Money) ou virement bancaire |
| Plateforme internationale | Retrait selon la plateforme : souvent Payoneer ou virement vers une banque malgache |
| Agence ou client étranger en direct | Virement international ou Payoneer |

Les possibilités de PayPal sont limitées pour Madagascar : vérifiez avant de le proposer. Gardez une trace de chaque paiement et renseignez-vous sur le NIF et la carte statistique auprès du centre fiscal de votre ville.

## Fidéliser : la maintenance et le suivi

1. **Proposez la maintenance** au moment de la mise en ligne, pas après la première panne.
2. **Envoyez un rapport mensuel** court : mises à jour faites, sauvegardes, temps de chargement, modifications.
3. **Rappelez les renouvellements** (domaine, hébergement, licences) un mois à l''avance.
4. **Proposez des améliorations** : une page de plus, une langue, un blog, une boutique.
5. **Demandez un avis** et une recommandation après la mise en ligne.

> [!retenir]
> - Un portfolio avec 2 ou 3 sites, captures sur téléphone et vidéos.
> - Prospection personnalisée, avec une maquette pour le client.
> - Prix = temps estimé × prix horaire + 20 % ; coûts du client à part.
> - Paiement en 3 fois : 40 %, 30 %, 30 %.
> - La maintenance mensuelle construit un revenu régulier.

## Exercice pratique : lancer votre activité

> [!exercice] Exercice pratique · 3 heures
> 1. Créez votre propre site professionnel avec WordPress (en local ou en ligne) : accueil, services, portfolio, contact.
> 2. Ajoutez vos 2 ou 3 projets avec captures et vidéos.
> 3. Calculez votre prix horaire, vos prix types et vos 3 formules de maintenance.
> 4. Rédigez votre modèle de devis avec échéancier.
> 5. Préparez une maquette de page d''accueil pour 3 entreprises analysées au module 1 et envoyez au moins un message de prospection pour de vrai.
>
> **À livrer** : votre site, vos calculs, vos formules de maintenance, votre devis et vos 3 messages avec maquettes.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('dev-3-f', 4, 0, 'Comment découper le paiement d''un site ?', '["100 % après un an","Aucun acompte","Tout à la fin, si le client est content","40 % à la signature, 30 % à la maquette, 30 % à la mise en ligne"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('dev-3-f', 4, 1, 'Le nom de domaine et l''hébergement font-ils partie du prix du développeur ?', '["Oui, toujours","Non, ce sont des coûts du client, indiqués à part","Oui, pour toujours","Seulement pour Shopify"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('dev-3-f', 4, 2, 'Qu''apporte la maintenance mensuelle au développeur ?', '["Aucun avantage","Des impôts en moins","Un revenu régulier","Moins de clients"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Que fait un développeur WordPress et Shopify ?', '["Il gère la publicité télévisée","Il construit des sites fiables que le client peut gérer seul","Il répare les ordinateurs","Il écrit des livres"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Quel outil choisir pour un site vitrine d''hôtel ?', '["WordPress","Shopify obligatoirement","Canva","Excel"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Quel est un avantage de Shopify ?', '["L''hébergement et la maintenance technique sont gérés par Shopify","Il est gratuit pour toujours","Il ne demande aucun produit","Il ne sert que pour les blogs"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Que fait le DNS ?', '["Il écrit les textes","Il envoie les e-mails de commande","Il relie le nom de domaine au bon serveur","Il compresse les images"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Que se passe-t-il sans HTTPS ?', '["Rien du tout","Le site est plus rapide","Le site devient premier sur Google","Le navigateur affiche « non sécurisé »"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Dans WordPress, quelle est la différence entre une page et un article ?', '["Il n''y a aucune différence","La page est un contenu fixe, l''article un contenu daté","L''article est payant","La page n''a pas de texte"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Avant d''installer une extension, que vérifier ?', '["Rien","Qu''elle est nécessaire, mise à jour récemment et bien notée","Qu''elle est la plus lourde","Qu''elle a un joli logo"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Dans Shopify, qu''est-ce qu''une collection ?', '["Un groupe de produits","Un moyen de paiement","Un thème","Une facture"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Combien d''éléments maximum dans le menu principal ?', '["1","50","20","6 à 7"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Que décrit le CSS ?', '["Le nom de domaine","Le contenu de la page","Les mots de passe","L''apparence de la page"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'À quoi sert l''outil « Inspecter » du navigateur ?', '["Supprimer un site","Voir et essayer de modifier le HTML et le CSS d''une page","Acheter un domaine","Pirater un site"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Quel programme gratuit permet de créer des boutiques Shopify de développement ?', '["LocalWP","WooCommerce","Elementor","Shopify Partners"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Une robe en 3 tailles et 2 couleurs a combien de variantes ?', '["2","6","3","5"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Combien de constructeurs de pages utiliser sur un site ?', '["Aucun n''est jamais autorisé","Trois au minimum","Le plus possible","Un seul"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Pour une boutique malgache, quels moyens de paiement sont courants ?', '["Uniquement les cartes américaines","Les bitcoins obligatoires","Paiement à la livraison, virement et Mobile Money","Uniquement les chèques"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Quel est le retard n° 1 des projets web ?', '["Les contenus non envoyés par le client","Le choix des couleurs","La vitesse de l''ordinateur","Le nom du développeur"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Quel outil gratuit de Google mesure la vitesse d''un site ?', '["Google Agenda","PageSpeed Insights","Google Docs","Google Traduction"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Quel identifiant administrateur éviter ?', '["Un identifiant avec double authentification","admin","Un identifiant unique","Un identifiant long"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Que tester absolument dans une boutique avant la mise en ligne ?', '["Seulement la page À propos","Seulement la couleur du logo","Une commande complète, du panier à la confirmation","Rien"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Quelle fiche gratuite aide un restaurant à apparaître sur Google Maps ?', '["Google Sheets","Google Meet","Google Business Profile","Google Drive"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Que remettre au client à la fin du projet ?', '["Seulement la facture","Une formation, un guide et le document des accès","Le mot de passe du développeur","Rien, il se débrouille"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Avec 1 800 000 Ar visés et 100 heures facturables, quel est le prix horaire ?', '["18 000 Ar","180 000 Ar","8 000 Ar","1 800 Ar"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Quelle marge ajouter au prix estimé d''un site ?', '["200 %","Environ 20 % pour les imprévus","1 %","Aucune"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Quand proposer la maintenance mensuelle ?', '["Au moment de la mise en ligne","Avant même le devis du site","Jamais","Après la première panne seulement"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('dev-3-f', 'Pourquoi rappeler au client le renouvellement de son domaine ?', '["Un domaine non renouvelé, c''est un site qui disparaît","C''est inutile","Pour lui vendre un autre site","Pour changer son nom"]'::jsonb, 0);

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

-- lang-0-f
delete from public.exam_questions where course_id = 'lang-0-f';
delete from public.module_questions where course_id = 'lang-0-f';
delete from public.lessons where course_id = 'lang-0-f' and module_index >= 5;
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('lang-0-f', 0, 'Le métier de rédacteur web et copywriter depuis Madagascar', 'Rédacteur web et copywriter, les 7 textes les plus commandés, vos clients, le français écrit et la place de l''IA.', 'Chaque site internet, chaque fiche produit, chaque e-mail de promotion a été écrit par quelqu''un. Le rédacteur web écrit des textes pour Internet : articles de blog, pages de site, fiches produits, newsletters. Le copywriter écrit des textes qui font **agir** : acheter, s''inscrire, appeler. Les deux métiers se pratiquent très bien depuis Madagascar, pour des clients du monde francophone. Ce premier module vous montre ces métiers tels qu''ils sont vraiment.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Expliquer la différence entre rédacteur web et copywriter.
> 2. Citer les 7 types de textes les plus commandés.
> 3. Repérer vos premiers clients possibles.
> 4. Évaluer votre niveau de français écrit et le travailler.
> 5. Comprendre la place des outils d''intelligence artificielle dans le métier.

## Rédacteur web et copywriter

| | **Rédacteur web** | **Copywriter** |
| --- | --- | --- |
| But principal | Informer et être trouvé sur Google | Convaincre et faire agir |
| Textes typiques | Articles de blog, guides, pages d''information | Pages de vente, publicités, e-mails promotionnels, slogans |
| Mesure du succès | Visites venues de Google, temps de lecture | Ventes, inscriptions, clics |
| Compétence clé | Clarté, structure, référencement | Psychologie du client, persuasion |

Dans la pratique, beaucoup de freelances font **les deux** : un article qui informe peut se terminer par une invitation à acheter.

> [!definition] Référencement naturel (SEO)
> L''ensemble des techniques qui aident une page à apparaître dans les premiers résultats de Google, sans payer de publicité. SEO vient de l''anglais *Search Engine Optimization*. Le rédacteur web écrit des textes qui répondent aux questions que les gens tapent dans Google.

## Les 7 types de textes les plus commandés

| N° | Type | Longueur habituelle | Exemple de client |
| --- | --- | --- | --- |
| 1 | Article de blog | 800 à 2 000 mots | Agence de voyage, coach, boutique en ligne |
| 2 | Fiche produit | 100 à 300 mots | Boutique de cosmétiques, d''artisanat |
| 3 | Pages de site (accueil, à propos, services) | 300 à 800 mots par page | Hôtel, cabinet, PME |
| 4 | Newsletter et e-mail | 150 à 500 mots | Boutique, formateur |
| 5 | Page de vente | 800 à 3 000 mots | Formation en ligne, logiciel |
| 6 | Publications pour réseaux sociaux | 30 à 200 mots | Toute entreprise |
| 7 | Textes publicitaires courts | Quelques mots à quelques lignes | Annonce Facebook ou Google |

Commencez par les types **1, 2 et 6** : ils sont très demandés et faciles à montrer dans un portfolio.

## Qui sont vos clients ?

### Clients à l''étranger (la majorité)

1. **Petites entreprises francophones** (France, Belgique, Suisse, Canada) qui ont un site mais pas le temps d''écrire.
2. **Agences de marketing et de référencement** qui sous-traitent des dizaines d''articles par mois.
3. **Boutiques en ligne** qui ont des centaines de fiches produits à rédiger.
4. **Créateurs de formations et coachs** qui ont besoin de pages de vente et d''e-mails.

### Clients à Madagascar

1. **Tourisme** : hôtels, agences, guides qui veulent attirer des voyageurs francophones (textes de site, articles sur les destinations).
2. **Entreprises et ONG** : site internet, rapports, communiqués.
3. **Boutiques en ligne malgaches** : fiches produits, textes publicitaires.

> [!madagascar] Votre avantage
> Un bon français écrit et une connaissance réelle de Madagascar. Un article sur « Que voir à Isalo en 3 jours » écrit par quelqu''un qui connaît le pays a plus de valeur que le même article écrit à partir de recherches sur Internet.

## Votre outil principal : le français écrit

Les clients francophones sont **très exigeants** sur l''orthographe et le style. Un texte avec 3 fautes peut faire perdre un client.

### Les 6 erreurs à traquer

1. Les **accords** du participe passé (« les articles que j''ai écrit**s** »).
2. Les **homophones** : a / à, ou / où, ce / se, ces / ses, leur / leurs.
3. Les **majuscules** et la **ponctuation** (espace avant « : ; ! ? » en français).
4. Les **anglicismes** inutiles (« faire un call » → « faire un appel »).
5. Les **phrases trop longues** : plus de 25 mots, la phrase se perd.
6. Les **répétitions** du même mot dans deux phrases qui se suivent.

> [!astuce] Progresser chaque jour
> Lisez 20 minutes par jour un journal ou un blog francophone de qualité. Copiez à la main un paragraphe que vous trouvez bien écrit. Faites une dictée par semaine (on en trouve gratuitement en ligne). En 3 mois, la différence est nette.

## Les outils d''IA : un outil, pas un remplaçant

Les outils d''intelligence artificielle (assistants conversationnels) savent produire du texte en quelques secondes. Ils changent le métier, mais ne le suppriment pas.

| Ce que l''IA fait bien | Ce que le rédacteur apporte |
| --- | --- |
| Proposer un plan, des idées de titres | La connaissance réelle du sujet et du client |
| Reformuler une phrase | Un style, une voix propre à la marque |
| Résumer un document | La vérification des faits (l''IA peut inventer) |
| Corriger certaines fautes | Des exemples vécus, des témoignages, des chiffres vérifiés |

### Les 3 règles d''un usage honnête

1. **Respectez la consigne du client** : certains interdisent l''IA, d''autres l''acceptent. Demandez.
2. **Vérifiez tout** : chiffres, noms, dates, citations.
3. **Réécrivez** : un texte simplement copié d''une IA est souvent plat, répétitif et facile à reconnaître.

> [!attention] Erreurs fréquentes des débutants
> - Envoyer un texte sans l''avoir relu à voix haute.
> - Copier des passages d''autres sites : c''est du **plagiat**, interdit et détecté par des outils.
> - Livrer un texte généré par IA sans vérification ni accord du client.
> - Accepter un tarif ridiculement bas « pour commencer » pendant des mois.

> [!retenir]
> - Le rédacteur web informe et fait trouver ; le copywriter convainc et fait agir.
> - Premiers textes à proposer : articles, fiches produits, publications.
> - La plupart des clients sont francophones et exigeants sur l''orthographe.
> - L''IA est un outil : vérification, réécriture et accord du client.

## Exercice pratique : votre diagnostic d''écriture

> [!exercice] Exercice pratique · 1 heure
> 1. Écrivez un texte de 300 mots : « Pourquoi visiter Antsirabe ? ».
> 2. Passez-le dans un correcteur gratuit (LanguageTool ou BonPatron) et notez chaque type d''erreur trouvée.
> 3. Classez vos erreurs selon les 6 erreurs à traquer : laquelle revient le plus ?
> 4. Réécrivez le texte en corrigeant tout et en coupant chaque phrase de plus de 25 mots.
> 5. Lisez la version finale à voix haute.
>
> **À livrer** : votre premier texte, la liste de vos erreurs classées, et la version corrigée.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-0-f', 0, 0, 'Quel est le but principal d''un copywriter ?', '["Convaincre et faire agir","Traduire des documents","Créer des logos","Corriger les livres"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-0-f', 0, 1, 'Que signifie SEO ?', '["Un logiciel de traitement de texte","Une méthode de copywriting","Les techniques pour apparaître dans les premiers résultats de Google sans payer","Un format d''image"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-0-f', 0, 2, 'Comment utiliser un outil d''IA honnêtement ?', '["Pour copier les textes des concurrents","Sans jamais le dire, même si le client l''interdit","Avec l''accord du client, en vérifiant et en réécrivant","En copiant le texte tel quel"]'::jsonb, 2);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('lang-0-f', 1, 'Les bases : écrire pour le web, référencer, convaincre', 'La pyramide inversée, les 8 règles de lisibilité, mot-clé et intention de recherche, balises, AIDA, PAS et avantages.', 'On ne lit pas sur un écran comme on lit un livre : on **survole**, on cherche une information, on part au bout de quelques secondes si on ne la trouve pas. Ce module vous donne les règles de l''écriture web, les bases du référencement et deux méthodes de copywriting utilisées partout dans le monde.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Écrire avec la pyramide inversée.
> 2. Structurer un texte pour qu''il se lise en survol.
> 3. Choisir un mot-clé et comprendre l''intention de recherche.
> 4. Rédiger une balise titre et une méta-description.
> 5. Écrire un texte persuasif avec les méthodes AIDA et PAS.

## La pyramide inversée

Dans un texte web, on donne **l''essentiel d''abord**, puis les détails. Si le lecteur s''arrête après le premier paragraphe, il a déjà la réponse.

| Ordre | Contenu | Exemple : « Quand partir à Nosy Be ? » |
| --- | --- | --- |
| 1 | La réponse directe | « La meilleure période est d''avril à novembre, pendant la saison sèche. » |
| 2 | Les explications importantes | Climat mois par mois, températures, pluies |
| 3 | Les détails | Fêtes locales, observation des baleines, prix selon la saison |

## Écrire pour être lu en survol

### Les 8 règles de lisibilité

1. **Un titre** qui dit exactement ce que le lecteur va trouver.
2. **Des intertitres** (H2, H3) tous les 200 à 300 mots, qui résument chaque partie.
3. **Des paragraphes courts** : 2 à 4 phrases.
4. **Des phrases courtes** : 15 à 20 mots en moyenne.
5. **Des listes** à puces ou numérotées pour les énumérations et les étapes.
6. **Du gras** sur 1 ou 2 idées clés par paragraphe, pas plus.
7. **Des mots simples** : « utiliser » plutôt que « procéder à l''utilisation ».
8. **Le lecteur au centre** : « vous » plutôt que « nous ».

> [!definition] H1, H2, H3
> Les niveaux de titres d''une page web. **H1** est le titre principal (un seul par page), **H2** les grandes parties, **H3** les sous-parties. Google les utilise pour comprendre la structure du texte.

> [!exemple] Avant / après
> **Avant** : « Notre établissement hôtelier, situé dans un cadre exceptionnel, propose à sa clientèle un ensemble de prestations de grande qualité visant à garantir un séjour des plus agréables. »
> **Après** : « Face à la mer, à 10 minutes de l''aéroport, nos 12 bungalows vous offrent calme, petit-déjeuner local et plongée sur réservation. »

## Les bases du référencement

### Le mot-clé et l''intention de recherche

> [!definition] Mot-clé
> L''expression que les internautes tapent dans Google, par exemple « visiter Madagascar en juillet ». Chaque article vise **un mot-clé principal** et quelques mots-clés proches.

> [!definition] Intention de recherche
> Ce que la personne veut vraiment en tapant sa recherche. Pour écrire le bon texte, il faut la deviner.

| Intention | Ce que veut l''internaute | Exemple de recherche | Texte à écrire |
| --- | --- | --- | --- |
| **Informationnelle** | Apprendre, comprendre | « comment cuisiner le romazava » | Guide, recette, article |
| **Commerciale** | Comparer avant d''acheter | « meilleur hôtel Nosy Be famille » | Comparatif, sélection |
| **Transactionnelle** | Acheter ou réserver | « réserver hôtel Nosy Be » | Page de vente, page de réservation |
| **Navigationnelle** | Trouver un site précis | « Madagascar Airlines réservation » | Page officielle |

> [!astuce] Trouver l''intention en 1 minute
> Tapez le mot-clé dans Google et regardez les 5 premiers résultats. Ce sont des guides ? des pages de vente ? des listes ? Google vous montre ce que les gens attendent : écrivez le même type de texte, en mieux.

### Où placer le mot-clé

1. Dans le **titre H1**, de préférence au début.
2. Dans le **premier paragraphe**.
3. Dans **un ou deux intertitres**, si c''est naturel.
4. Dans l''**adresse de la page** (URL), si vous la choisissez.
5. Dans la **balise titre** et la **méta-description**.

Ne le répétez pas à chaque phrase : Google sanctionne le « bourrage de mots-clés », et le lecteur part.

### La balise titre et la méta-description

Ce sont les textes qui apparaissent dans les résultats de Google.

| Élément | Longueur conseillée | Exemple |
| --- | --- | --- |
| **Balise titre** (*title*) | Environ 50 à 60 caractères | « Quand partir à Nosy Be ? Le guide mois par mois » |
| **Méta-description** | Environ 140 à 160 caractères | « Saison sèche, baleines, budget : découvrez la meilleure période pour votre voyage à Nosy Be, avec nos conseils mois par mois. » |

## Le copywriting : deux méthodes à connaître

### La méthode AIDA

| Lettre | Étape | Exemple pour une formation en ligne d''anglais |
| --- | --- | --- |
| **A** | **Attention** : une accroche qui arrête | « Vous comprenez l''anglais écrit, mais vous bloquez à l''oral ? » |
| **I** | **Intérêt** : montrer qu''on comprend le problème | « Vous n''êtes pas seul : à l''école, on lit beaucoup et on parle peu. » |
| **D** | **Désir** : décrire le résultat et les avantages | « En 8 semaines, 20 minutes par jour, vous tenez une conversation de travail. » |
| **A** | **Action** : dire quoi faire | « Inscrivez-vous avant dimanche et recevez le premier mois offert. » |

### La méthode PAS

| Lettre | Étape | Exemple pour un service de livraison à Antananarivo |
| --- | --- | --- |
| **P** | **Problème** | « Encore 2 heures d''embouteillages pour aller faire vos courses ? » |
| **A** | **Agitation** : rendre le problème plus présent | « Pendant ce temps, le travail attend et la soirée passe. » |
| **S** | **Solution** | « Commandez avant midi, recevez vos courses le soir même. » |

### Avantage plutôt que caractéristique

| Caractéristique (ce que c''est) | Avantage (ce que ça change pour le client) |
| --- | --- |
| Batterie de 5 000 mAh | Une journée entière sans recharger, même pendant les coupures |
| Formation de 12 modules | Un métier appris pas à pas, à votre rythme |
| Hôtel à 50 m de la plage | Vous êtes dans l''eau 2 minutes après le petit-déjeuner |

> [!attention] Erreurs fréquentes des débutants
> - Commencer un article par une longue introduction générale (« Depuis la nuit des temps… »).
> - Écrire des blocs de texte sans intertitres.
> - Répéter le mot-clé de façon artificielle.
> - Lister des caractéristiques sans dire ce qu''elles apportent.
> - Promettre des résultats impossibles ou mensongers.

> [!retenir]
> - L''essentiel d''abord : la pyramide inversée.
> - Intertitres, paragraphes courts, listes : un texte qui se survole.
> - Un mot-clé principal, une intention de recherche, un texte qui y répond.
> - Balise titre (50 à 60 caractères) et méta-description (140 à 160).
> - AIDA et PAS pour convaincre ; toujours l''avantage pour le client.

## Exercice pratique : écrire pour le web

> [!exercice] Exercice pratique · 1 heure 30
> 1. Choisissez un mot-clé, par exemple « que faire à Toamasina ». Tapez-le dans Google et notez l''intention de recherche et le type des 5 premiers résultats.
> 2. Écrivez le plan de l''article : H1, 4 à 6 H2, avec la réponse directe dans l''introduction.
> 3. Rédigez la balise titre et la méta-description.
> 4. Réécrivez le texte « Avant » de l''hôtel en version « Après », pour un hôtel imaginaire de votre région.
> 5. Écrivez un court texte publicitaire avec la méthode AIDA et un autre avec PAS, pour un produit ou service malgache.
>
> **À livrer** : votre analyse de l''intention, le plan, les deux balises, le texte réécrit et vos 2 textes publicitaires.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-0-f', 1, 0, 'Que dit la pyramide inversée ?', '["Commencer par l''histoire du sujet","Écrire le plus long possible","Donner l''essentiel d''abord, puis les détails","Garder la réponse pour la fin"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-0-f', 1, 1, 'Combien de titres H1 par page ?', '["Au moins cinq","Aucun","Un par paragraphe","Un seul"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-0-f', 1, 2, 'Quelle phrase est un avantage et non une caractéristique ?', '["« Batterie de 5 000 mAh »","« Écran de 6,5 pouces »","« Poids : 180 g »","« Une journée entière sans recharger, même pendant les coupures »"]'::jsonb, 3);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('lang-0-f', 2, 'Les outils : Google Docs, correcteurs, mots-clés, et les outils payants', 'Google Docs professionnel, correction en 4 passages, recherche de mots-clés, brief, originalité, puis Semrush et correcteurs payants.', 'Un rédacteur web utilise peu d''outils, mais il doit bien les maîtriser : un traitement de texte collaboratif, des correcteurs, des outils pour trouver les bons mots-clés et vérifier l''originalité de ses textes. Ce module vous les fait prendre en main, puis vous présente les outils payants utilisés par les professionnels.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Utiliser Google Docs comme un professionnel : styles, mode suggestion, historique.
> 2. Corriger un texte avec deux correcteurs gratuits.
> 3. Trouver des mots-clés et des questions d''internautes avec des outils gratuits.
> 4. Vérifier qu''un texte est original.
> 5. Savoir quand passer à Semrush et à un correcteur payant.

## Les outils gratuits indispensables

| N° | Outil | À quoi il sert |
| --- | --- | --- |
| 1 | **Google Docs** | Écrire, partager avec le client, recevoir ses corrections |
| 2 | **LanguageTool** (offre gratuite) | Correcteur d''orthographe, de grammaire et de style, en français et en anglais |
| 3 | **BonPatron** | Correcteur gratuit en ligne, avec explications des règles du français |
| 4 | **Google** (suggestions et « Autres questions posées ») | Trouver ce que les gens cherchent vraiment |
| 5 | **Google Trends** | Comparer la popularité des recherches dans le temps et par pays |
| 6 | **Ubersuggest** (offre gratuite limitée) | Volume de recherche approximatif et idées de mots-clés |

## Google Docs comme un professionnel

### Les styles de titres

1. Sélectionnez le titre de l''article et choisissez **Titre 1** dans le menu des styles.
2. Pour chaque grande partie, choisissez **Titre 2** ; pour les sous-parties, **Titre 3**.
3. Le **plan du document** (icône à gauche) se remplit tout seul : vous voyez la structure d''un coup d''œil.

Le client pourra copier votre texte dans son site (WordPress, Shopify…) en gardant les niveaux de titres.

### Le mode suggestion

Quand le client relit votre texte, il passe en mode **Suggestion** (en haut à droite) : ses modifications apparaissent en couleur, et vous les **acceptez** ou les **refusez** une par une. C''est le moyen le plus clair de travailler les corrections ensemble.

### L''historique des versions

**Fichier → Historique des versions** : vous retrouvez toutes les versions du texte. Donnez un nom aux versions importantes (« V1 envoyée au client », « V2 après corrections »).

### Partager avec les bons droits

1. **Commentateur** pour une relecture : le client peut commenter et suggérer.
2. **Éditeur** seulement si le client doit modifier directement.
3. Une fois le texte validé, envoyez aussi une version **PDF** ou **Word** si le client le demande.

## Corriger un texte : la méthode en 4 passages

| N° | Passage | Comment |
| --- | --- | --- |
| 1 | **Fond** | Relisez le texte entier : le plan est-il logique ? La réponse est-elle au début ? |
| 2 | **Correcteurs** | Passez le texte dans LanguageTool, puis dans BonPatron : chacun trouve des erreurs que l''autre ne voit pas |
| 3 | **Voix haute** | Lisez à voix haute : les phrases trop longues et les répétitions s''entendent |
| 4 | **Dernière vérification** | Noms propres, chiffres, liens, majuscules, espaces avant « : ; ! ? » |

> [!attention]
> Un correcteur automatique **propose**, il ne décide pas. Lisez chaque suggestion et vérifiez la règle avant d''accepter : les outils se trompent parfois, surtout sur les noms propres et les mots malgaches.

## Trouver des mots-clés et des questions

### La méthode en 5 étapes

1. **Partez du sujet** du client : « hôtel à Ifaty ».
2. **Tapez-le dans Google** et notez les **suggestions** qui apparaissent pendant que vous tapez.
3. **Regardez « Autres questions posées »** dans les résultats : ce sont des questions réelles, parfaites pour des intertitres.
4. **Comparez** 2 ou 3 formulations dans **Google Trends** (par pays : France, Belgique, Canada…).
5. **Vérifiez le volume** approximatif dans **Ubersuggest** pour choisir le mot-clé principal.

> [!exemple] Résultat pour « hôtel à Ifaty »
> - Mot-clé principal : « hôtel Ifaty ».
> - Mots-clés proches : « Ifaty plage », « Ifaty que faire », « Ifaty Tuléar distance ».
> - Questions (futurs H2) : « Comment aller à Ifaty depuis Tuléar ? », « Quelle est la meilleure saison pour Ifaty ? », « Peut-on faire de la plongée à Ifaty ? ».

### Le brief de rédaction

Avant d''écrire un article, beaucoup d''agences envoient un **brief**. Si le client n''en a pas, faites-le vous-même et faites-le valider :

1. Le **sujet** et le **mot-clé principal**.
2. Le **lecteur visé** et l''**intention de recherche**.
3. La **longueur** demandée.
4. Le **plan** (H1, H2).
5. Les **sources** à utiliser et les **liens** à placer.
6. L''**appel à l''action** de la fin.

## Vérifier l''originalité

Un texte livré doit être **original** : jamais copié, même partiellement.

1. Écrivez toujours **avec vos propres mots**, même à partir de plusieurs sources.
2. Citez entre guillemets et avec la source quand vous reprenez une phrase exacte.
3. Vérifiez avec un **outil de détection de plagiat** (plusieurs existent en version gratuite limitée) avant de livrer les textes importants.
4. Gardez la liste de vos **sources** : le client peut vous la demander.

## Quand passer aux outils payants ?

| Outil payant | Ce qu''il apporte | Quand le prendre |
| --- | --- | --- |
| **Semrush** | Volumes de recherche précis, mots-clés des concurrents, idées de sujets, audit de contenu | Quand vous travaillez régulièrement pour des clients qui misent sur le référencement ; souvent fourni par l''agence |
| **Grammarly Premium** | Correction avancée du style et du ton, **surtout pour les textes en anglais** | Si vous écrivez en anglais |
| **Antidote** (alternative pour le français) | Correcteur et dictionnaires de référence pour le français | Quand vous écrivez beaucoup en français : c''est l''outil de nombreux professionnels francophones |

Les prix changent souvent : consultez le site officiel de chaque outil. Beaucoup d''agences de référencement ont déjà un abonnement Semrush : demandez un accès avant d''en acheter un.

> [!madagascar]
> Ces abonnements se paient par carte bancaire internationale. Commencez avec les outils gratuits, et investissez quand vos revenus sont réguliers. Un bon correcteur est souvent le premier achat rentable : il réduit les allers-retours avec les clients.

> [!retenir]
> - Google Docs : styles de titres, mode suggestion, historique des versions.
> - 4 passages de correction : fond, correcteurs, voix haute, dernière vérification.
> - Suggestions Google, « Autres questions posées », Trends et Ubersuggest pour les mots-clés.
> - Un brief validé avant d''écrire ; un texte toujours original.
> - Semrush et un correcteur payant quand l''activité devient régulière.

## Exercice pratique : préparer un article

> [!exercice] Exercice pratique · 1 heure 30
> 1. Choisissez un sujet pour un client imaginaire (un hôtel, une boutique, une école de langues à Madagascar).
> 2. Appliquez la méthode en 5 étapes et notez : mot-clé principal, 3 mots-clés proches, 5 questions d''internautes.
> 3. Rédigez le brief complet (les 6 points).
> 4. Dans Google Docs, créez le document de l''article avec le H1 et les H2 en styles de titres.
> 5. Écrivez l''introduction (pyramide inversée) et faites les 4 passages de correction.
>
> **À livrer** : votre recherche de mots-clés, le brief, et le lien du Google Docs en mode commentateur.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-0-f', 2, 0, 'À quoi sert le mode suggestion de Google Docs ?', '["Proposer des modifications que l''auteur accepte ou refuse","Traduire le texte","Écrire le texte automatiquement","Supprimer le document"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-0-f', 2, 1, 'Où trouver des questions réelles d''internautes pour vos intertitres ?', '["Nulle part","Dans « Autres questions posées » sur Google","Dans les paramètres de Google Docs","Dans le dictionnaire"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-0-f', 2, 2, 'Pour quels textes Grammarly Premium est-il surtout utile ?', '["Les images","Les textes en anglais","Les textes en malagasy","Les vidéos"]'::jsonb, 1);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('lang-0-f', 3, 'Premier projet : un article optimisé et un e-mail de promotion', 'La commande en 8 étapes, plan validé, rédaction, optimisation, grille de 12 points, e-mail AIDA, livraison et corrections.', 'Place à un vrai projet. Une agence de voyage vous commande un article de blog optimisé pour Google et un e-mail de promotion. Vous suivez toutes les étapes d''une commande professionnelle : brief, recherche, plan, rédaction, optimisation, relecture, livraison et corrections. Les deux textes rejoindront votre portfolio.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Mener une commande en 8 étapes.
> 2. Rédiger un article de 1 200 mots bien structuré et optimisé.
> 3. Vérifier votre article avec une grille de 12 points.
> 4. Écrire un e-mail de promotion avec la méthode AIDA.
> 5. Gérer les corrections du client sans conflit.

## Le cas pratique : « Mora Mora Voyages »

> [!exemple] Votre commande
> **Mora Mora Voyages** est une petite agence basée à Antananarivo qui organise des circuits pour des voyageurs français et belges. Elle vous commande :
> 1. Un **article de blog** de 1 200 mots environ sur le mot-clé « circuit RN7 Madagascar », pour attirer des voyageurs qui préparent leur séjour.
> 2. Un **e-mail de promotion** pour ses abonnés : 10 % de réduction sur le circuit RN7 pour les réservations faites avant la fin du mois.

## La commande en 8 étapes

| N° | Étape | Résultat |
| --- | --- | --- |
| 1 | **Brief** | Les 6 points validés par le client (module 3) |
| 2 | **Recherche** | Mots-clés, questions, intention, sources fiables |
| 3 | **Plan** | H1, H2, H3 et idées principales, validés par le client |
| 4 | **Rédaction** | Un premier jet complet, sans s''arrêter pour corriger |
| 5 | **Optimisation** | Mot-clé, balises, liens, appel à l''action |
| 6 | **Relecture** | Les 4 passages de correction |
| 7 | **Livraison** | Google Docs + balises + message d''accompagnement |
| 8 | **Corrections** | Le nombre de tours de corrections prévu |

> [!astuce] Faites valider le plan
> Envoyez le plan **avant** de rédiger. Corriger un plan prend 5 minutes ; réécrire 1 200 mots parce que le client attendait autre chose prend des heures.

## Étapes 2 et 3 : recherche et plan

### Les questions à couvrir

En appliquant la méthode du module 3, vous trouvez les questions que se posent les voyageurs :

1. Quel est l''itinéraire de la RN7 ?
2. Combien de jours faut-il ?
3. Quelles sont les étapes incontournables ?
4. Quand partir ?
5. Faut-il un chauffeur ?
6. Quel budget prévoir ?

### Le plan

> [!exemple] Plan de l''article
> **H1** : Circuit RN7 à Madagascar : itinéraire, étapes et conseils
> *Introduction* : la réponse directe (de Tana à Tuléar, environ 900 km, 10 à 15 jours conseillés).
> **H2** : L''itinéraire de la RN7, étape par étape
> - H3 : Antananarivo – Antsirabe
> - H3 : Ranomafana
> - H3 : Fianarantsoa et Ambalavao
> - H3 : Parc national de l''Isalo
> - H3 : Tuléar, Ifaty et Anakao
> **H2** : Combien de jours prévoir ?
> **H2** : Quand partir sur la RN7 ?
> **H2** : Avec chauffeur ou en autonomie ?
> **H2** : Quel budget prévoir ?
> *Conclusion et appel à l''action* : « Découvrez notre circuit RN7 de 12 jours avec chauffeur-guide. »

### Les sources fiables

1. Les sites **officiels** (office du tourisme, parcs nationaux).
2. Les **informations du client** : il connaît ses circuits, ses prix, ses conseils.
3. Votre **expérience** et celle de personnes qui ont fait le voyage.

Vérifiez chaque **chiffre** (distances, prix, horaires) et notez la source. N''inventez jamais un prix : demandez-le au client.

## Étape 4 : rédiger le premier jet

1. Écrivez **d''une traite**, partie par partie, sans vous arrêter sur chaque mot.
2. Commencez chaque partie par la **phrase qui résume** la réponse.
3. Ajoutez des **détails concrets** : distances, durées, ce qu''on voit, une anecdote.
4. Gardez le **lecteur** en tête : un voyageur français qui ne connaît pas Madagascar.
5. Laissez reposer le texte au moins **une heure** avant de le relire.

## Étape 5 : optimiser

1. Mot-clé dans le **H1**, l''**introduction** et un ou deux **H2**.
2. **Balise titre** et **méta-description** rédigées (longueurs du module 2).
3. **Liens internes** : vers 2 ou 3 autres pages du site du client (page du circuit, page de contact).
4. **Liens externes** : vers 1 ou 2 sources officielles.
5. **Images** proposées, avec un texte alternatif qui les décrit (« Allée des baobabs au coucher du soleil »).
6. **Appel à l''action** clair à la fin.

## Étape 6 : la grille de vérification en 12 points

| N° | Point à vérifier | Oui / Non |
| --- | --- | --- |
| 1 | La réponse principale est dans l''introduction | |
| 2 | Un seul H1, des H2 et H3 logiques | |
| 3 | Paragraphes de 4 phrases maximum | |
| 4 | Phrases de 20 mots en moyenne | |
| 5 | Mot-clé placé naturellement aux bons endroits | |
| 6 | Balise titre et méta-description aux bonnes longueurs | |
| 7 | Chaque chiffre vérifié, avec sa source | |
| 8 | Liens internes et externes ajoutés | |
| 9 | Appel à l''action à la fin | |
| 10 | Aucune faute (correcteurs + voix haute) | |
| 11 | Texte 100 % original | |
| 12 | Longueur conforme à la commande (environ 1 200 mots) | |

## L''e-mail de promotion avec AIDA

> [!exemple] E-mail pour Mora Mora Voyages
> **Objet** : -10 % sur la RN7, jusqu''au 31 mars
>
> **A** · Et si votre prochain voyage commençait sur la route la plus belle de Madagascar ?
>
> **I** · De Tana à Tuléar, la RN7 traverse les hautes terres, les forêts de Ranomafana et les canyons de l''Isalo. En 12 jours, vous voyez les mille visages de l''île.
>
> **D** · Avec votre chauffeur-guide, pas de souci d''itinéraire : vous profitez, il s''occupe du reste. Et jusqu''au 31 mars, le circuit est **10 % moins cher**.
>
> **A** · [Je réserve mon circuit RN7]
>
> L''équipe Mora Mora Voyages

### Les 5 règles d''un e-mail qui marche

1. Un **objet court** (environ 40 caractères) qui donne envie d''ouvrir.
2. **Un seul message** et **un seul bouton**.
3. L''**offre** visible dès le début.
4. Une **date limite** claire.
5. Un texte **court** : il se lit sur téléphone.

## Étapes 7 et 8 : livraison et corrections

### Le message de livraison

« Bonjour Madame Rasoa, voici l''article "Circuit RN7 à Madagascar" (1 230 mots) et l''e-mail de promotion : [lien Google Docs]. Vous y trouverez aussi la balise titre, la méta-description et mes propositions d''images. Les prix des circuits sont à confirmer (surlignés en jaune). Vous pouvez faire vos remarques directement en mode suggestion. »

### Recevoir les corrections sans conflit

1. **Remerciez** pour le retour.
2. **Acceptez** les corrections justes sans discuter.
3. **Expliquez** calmement celles qui posent problème (« Cette phrase répète le mot-clé 3 fois, ce qui peut être pénalisé par Google. Je vous propose plutôt… »).
4. Respectez le **nombre de tours** prévu (souvent 1 ou 2) ; au-delà, c''est une nouvelle prestation.

> [!attention] Erreurs fréquentes des débutants
> - Rédiger sans plan validé.
> - Inventer un chiffre ou un prix.
> - Livrer le texte sans balises ni appel à l''action.
> - Prendre les corrections du client comme une critique personnelle.

> [!retenir]
> - 8 étapes : brief, recherche, plan, rédaction, optimisation, relecture, livraison, corrections.
> - Faites valider le plan avant d''écrire.
> - Vérifiez tout avec la grille de 12 points.
> - Un e-mail : un objet court, une offre, un bouton, une date limite.
> - Corrections : remercier, accepter, expliquer, respecter les tours prévus.

## Exercice pratique : la commande Mora Mora Voyages

> [!exercice] Exercice pratique · 4 heures
> 1. Rédigez le brief et faites votre recherche de mots-clés pour « circuit RN7 Madagascar ».
> 2. Rédigez l''article complet (environ 1 200 mots) d''après le plan, avec balise titre, méta-description et propositions d''images.
> 3. Passez l''article dans la grille de 12 points et corrigez.
> 4. Rédigez l''e-mail de promotion avec la méthode AIDA.
> 5. Demandez à un proche de jouer le client et de faire 3 corrections en mode suggestion ; traitez-les.
>
> **À livrer** : le brief, l''article final, la grille remplie et l''e-mail. Ce sont vos premières pièces de portfolio.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-0-f', 3, 0, 'Pourquoi faire valider le plan avant de rédiger ?', '["Parce que Google l''exige","Corriger un plan est bien plus rapide que réécrire un article","Pour être payé plus","Ce n''est pas utile"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-0-f', 3, 1, 'Que faire si vous ne connaissez pas le prix d''un circuit ?', '["Ne rien écrire et ne pas le signaler","L''inventer","Prendre le prix d''un concurrent","Le demander au client"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-0-f', 3, 2, 'Combien de boutons dans un e-mail de promotion efficace ?', '["Au moins cinq","Un seul","Un par paragraphe","Aucun"]'::jsonb, 1);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('lang-0-f', 4, 'Trouver des clients et se faire payer', 'Portfolio de 5 textes, 5 canaux de prospection, prix au mot, à l''article et au forfait, devis, paiements et spécialité.', 'Un rédacteur web qui écrit bien, livre à l''heure et comprend le référencement trouve des clients fidèles, souvent pour des commandes régulières. Ce dernier module vous montre comment présenter votre travail, trouver vos premiers clients, fixer vos prix (au mot, à l''article ou au forfait) et vous faire payer depuis Madagascar.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Construire un portfolio de rédacteur avec 5 textes variés.
> 2. Trouver des clients grâce à 5 canaux, avec un message de prospection prêt à l''emploi.
> 3. Calculer un prix au mot, à l''article et au forfait mensuel.
> 4. Rédiger un devis et des conditions claires.
> 5. Vous faire payer en local et depuis l''étranger.
> 6. Développer une spécialité.

## Le portfolio du rédacteur

Le client veut voir **comment vous écrivez**, sur des sujets proches du sien.

### Les 5 textes à présenter

1. **Un article de blog optimisé** : l''article Mora Mora Voyages (module 4).
2. **Une page de site** : page d''accueil ou « À propos » pour une entreprise imaginaire ou réelle.
3. **3 fiches produits** : par exemple pour des produits d''artisanat malgache (raphia, vanille, pierres).
4. **Un e-mail ou une page de vente courte** avec la méthode AIDA ou PAS.
5. **Un texte dans votre spécialité** (voir plus bas).

### Où le présenter

1. Un **Google Drive** en lecture seule, bien rangé, avec un document d''accueil qui présente chaque texte.
2. Un **blog personnel** gratuit (sur WordPress.com ou une plateforme similaire) : il montre aussi que vous savez publier.
3. Un **profil LinkedIn** avec vos textes en « Sélection ».

Pour chaque texte, indiquez : le client (ou « projet d''étude »), l''objectif, le mot-clé et, si vous l''avez, un résultat.

## Où trouver des clients : 5 canaux

| N° | Canal | Pour qui | Comment s''y prendre |
| --- | --- | --- | --- |
| 1 | **Agences de contenu et de référencement** | Commandes régulières d''articles | Proposez un article test sur un sujet de leur choix |
| 2 | **Plateformes de rédaction et de freelance** (Upwork, Malt, plateformes de rédaction francophones) | Clients francophones de toutes tailles | Vérifiez que la plateforme accepte les freelances basés à Madagascar ; profil soigné et offre précise |
| 3 | **LinkedIn** | PME, responsables marketing, consultants | Publiez des conseils d''écriture, contactez directement |
| 4 | **Entreprises du tourisme malgache** | Hôtels, agences, guides | Proposez de réécrire une page de leur site |
| 5 | **Boutiques en ligne** | Fiches produits en nombre | Montrez une fiche avant/après |

### Le message de prospection, prêt à l''emploi

> [!exemple] Message à un hôtel
> « Bonjour Monsieur Rakoto, je suis rédacteur web spécialisé dans le tourisme à Madagascar. En visitant votre site, j''ai vu que votre page "Nos bungalows" fait seulement 3 lignes : les voyageurs qui cherchent "hôtel Mahambo plage" sur Google ont peu de chances de la trouver. Je vous propose de la réécrire pour qu''elle donne envie et qu''elle soit mieux trouvée. Voici un exemple de mon travail : [lien]. Puis-je vous envoyer une proposition gratuite pour le premier paragraphe ? »

Personnalisé, court, un problème précis, une preuve, une proposition. Envoyez **5 messages soignés par jour**.

## Calculer ses prix

### Les 3 façons de facturer

| Mode | Comment | Pour quoi |
| --- | --- | --- |
| **Au mot** | Un prix par mot livré | Articles et fiches en volume, surtout avec les agences |
| **À l''article ou à la page** | Un prix fixe par texte | Pages de site, articles longs, pages de vente |
| **Forfait mensuel** | Un nombre de textes par mois, payé d''avance | Clients réguliers |

### Calculer à partir de votre prix horaire

1. **Revenu mensuel visé** (exemple : 1 500 000 Ar) ÷ **heures facturables** (exemple : 100 h) = **15 000 Ar de l''heure**.
2. **Mesurez votre vitesse réelle**, recherche et correction comprises (exemple : un article de 1 000 mots vous prend 4 heures).
3. **Prix de l''article** : 4 × 15 000 = 60 000 Ar, soit **60 Ar le mot**.

| Texte | Temps estimé | Exemple de prix (15 000 Ar/h) |
| --- | --- | --- |
| Fiche produit de 150 mots | 30 min | 7 500 Ar |
| Article de blog de 1 000 mots | 4 h | 60 000 Ar |
| Page de vente de 1 500 mots | 8 h | 120 000 Ar |
| Forfait : 4 articles de 1 000 mots par mois | 16 h | 240 000 Ar par mois |

Ces prix sont des **exemples**, à adapter à votre niveau, à la difficulté du sujet et au client. Pour les clients étrangers, fixez vos prix en euros ou en dollars, adaptés à leur marché. Avec l''expérience, vous écrirez plus vite : votre revenu horaire augmentera.

> [!astuce]
> Un texte **technique** (santé, finance, droit, informatique) demande plus de recherche : facturez-le plus cher. Une **page de vente** influence directement le chiffre d''affaires du client : c''est un des textes les mieux payés.

## Le devis et les conditions

### Ce que contient un devis

1. Les textes commandés, leur **longueur** et leur **mot-clé**.
2. Ce qui est **inclus** : recherche, balise titre, méta-description, propositions d''images.
3. Ce qui n''est **pas inclus** : mise en ligne sur le site, photos, traduction.
4. Le **délai** de livraison.
5. Le **nombre de tours de corrections** (souvent 1 ou 2).
6. Le **prix** et les conditions de paiement : **50 % à la commande, 50 % à la livraison**, ou paiement d''avance pour un forfait.

### Les droits sur le texte

Une fois payé, le texte appartient en général au client : il peut le publier sous son nom. Précisez si vous souhaitez pouvoir le montrer dans votre portfolio. Certains clients exigent la **confidentialité** (vous ne pouvez pas dire que vous avez écrit pour eux) : respectez-la.

## Se faire payer depuis Madagascar

| Situation | Moyens de paiement |
| --- | --- |
| Client local | Mobile Money (MVola, Orange Money, Airtel Money) ou virement bancaire |
| Plateforme internationale | Retrait selon la plateforme : souvent Payoneer ou virement vers une banque malgache |
| Client étranger en direct | Virement international ou Payoneer |

> [!madagascar]
> Les possibilités de PayPal sont limitées pour Madagascar : vérifiez avant de le proposer. Gardez une trace de chaque paiement et renseignez-vous sur le NIF et la carte statistique auprès du centre fiscal de votre ville.

## Développer une spécialité

Un rédacteur « qui écrit sur tout » est en concurrence avec des milliers d''autres. Un rédacteur **spécialisé** est recherché et mieux payé.

| Spécialité | Pourquoi depuis Madagascar |
| --- | --- |
| **Tourisme et voyage** | Connaissance réelle du pays, de l''océan Indien et de l''Afrique |
| **Agriculture, environnement** | Vanille, épices, biodiversité, développement durable |
| **Santé, éducation** | Si vous avez fait des études dans ces domaines |
| **Technologie, numérique** | Si vous connaissez les outils et les logiciels |
| **Finance, Mobile Money** | Sujet en pleine croissance en Afrique |

Choisissez **une** spécialité liée à vos études, votre expérience ou votre passion, et écrivez 3 textes de portfolio dans ce domaine.

> [!retenir]
> - Un portfolio de 5 textes variés, avec objectif et mot-clé.
> - Prospection : personnalisée, courte, un problème précis, une proposition.
> - Prix = temps réel × prix horaire ; au mot, à l''article ou au forfait.
> - Un devis clair : longueur, inclus, délai, corrections, 50 % d''acompte.
> - Une spécialité vous rend plus visible et mieux payé.

## Exercice pratique : lancer votre activité

> [!exercice] Exercice pratique · 2 heures 30
> 1. Rassemblez vos 5 textes de portfolio dans un Google Drive avec un document d''accueil.
> 2. Choisissez votre spécialité et écrivez une phrase de présentation : « Rédacteur web spécialisé en… ».
> 3. Mesurez votre vitesse réelle sur un article et calculez vos prix (au mot, à l''article, forfait).
> 4. Rédigez votre modèle de devis.
> 5. Écrivez 5 messages de prospection personnalisés et envoyez-en au moins 2 pour de vrai.
>
> **À livrer** : le lien de votre portfolio, votre présentation, vos calculs, votre devis et vos 5 messages.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-0-f', 4, 0, 'Un article de 1 000 mots vous prend 4 heures à 15 000 Ar de l''heure. Quel est son prix ?', '["4 000 Ar","150 000 Ar","15 000 Ar","60 000 Ar"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-0-f', 4, 1, 'Pourquoi choisir une spécialité ?', '["Pour éviter les clients","Pour être plus visible et mieux payé","Pour écrire moins","Parce que c''est obligatoire"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-0-f', 4, 2, 'Quelles conditions de paiement proposer pour une commande ponctuelle ?', '["50 % à la commande, 50 % à la livraison","Paiement quand le client y pense","Aucun acompte, jamais","100 % après publication sur le site"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Quel est le but principal d''un rédacteur web ?', '["Dessiner des illustrations","Monter des vidéos","Informer et être trouvé sur Google","Gérer la comptabilité"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Quels textes proposer en premier quand on débute ?', '["Thèses universitaires","Contrats juridiques","Romans et poésie","Articles, fiches produits et publications pour réseaux sociaux"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Quelle phrase contient une erreur d''accord ?', '["« J''ai écrit les articles »","« Les articles que j''ai écrits »","« Les articles que j''ai écrit »","« Les articles sont écrits »"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Qu''est-ce que le plagiat ?', '["Citer une source entre guillemets","Réécrire avec ses propres mots","Corriger ses fautes","Copier le texte de quelqu''un d''autre sans le dire"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Combien de mots en moyenne par phrase sur le web ?', '["Plus de 80","50 à 60","15 à 20","3 à 4"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Tous les combien de mots placer un intertitre ?', '["Jamais","Tous les 2 000 mots","À chaque phrase","Tous les 200 à 300 mots"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Qu''est-ce que l''intention de recherche ?', '["Le nom du site","Le prix d''un mot-clé","Ce que l''internaute veut vraiment en tapant sa recherche","Le nombre de mots d''un article"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', '« réserver hôtel Nosy Be » est une recherche…', '["Navigationnelle","Sans intention","Informationnelle","Transactionnelle"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Comment trouver rapidement l''intention de recherche ?', '["Regarder le type des premiers résultats de Google","Compter les lettres du mot-clé","Demander à un ami","Deviner"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Quelle longueur pour une balise titre ?', '["Environ 50 à 60 caractères","Environ 500 caractères","Un seul mot","Plus de 300 caractères"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Que se passe-t-il si on répète le mot-clé à chaque phrase ?', '["La page devient première","Le texte est traduit","Rien","Google peut pénaliser la page et le lecteur part"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Que signifient les lettres AIDA ?', '["Accueil, Information, Départ, Arrivée","Article, Image, Document, Annexe","Attention, Intérêt, Désir, Action","Analyse, Idée, Débat, Avis"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Que signifient les lettres PAS ?', '["Page, Accueil, Site","Prix, Avantage, Service","Problème, Agitation, Solution","Plan, Article, Signature"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Quelle est la première étape de correction ?', '["Le fond : plan logique et réponse au début","La virgule","La mise en page","L''envoi au client"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Pourquoi lire son texte à voix haute ?', '["Pour le mémoriser","C''est inutile","Pour le traduire","Les phrases trop longues et les répétitions s''entendent"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'À quoi sert Google Trends ?', '["Comparer la popularité des recherches dans le temps et par pays","Envoyer des e-mails","Corriger l''orthographe","Héberger un site"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Que contient un brief de rédaction ?', '["La biographie du rédacteur","Seulement le prix","Sujet, mot-clé, lecteur, longueur, plan, sources et appel à l''action","Le mot de passe du site"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Quel outil payant donne des volumes de recherche précis et les mots-clés des concurrents ?', '["Canva","BonPatron","Google Docs","Semrush"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Quelle est la dernière étape d''une commande ?', '["La recherche","Le plan","Le brief","Les corrections demandées par le client"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Que décrit le texte alternatif d''une image ?', '["La taille du fichier","Le prix de l''image","Ce que montre l''image","Le nom du photographe uniquement"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Que faire face à une correction du client qui poserait problème ?', '["Ignorer la correction","Expliquer calmement et proposer une alternative","Supprimer le texte","Refuser sans explication"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Quel est un bon objet d''e-mail de promotion ?', '["« -10 % sur la RN7, jusqu''au 31 mars »","« (sans objet) »","« Lisez ce message très long et important s''il vous plaît »","« Bonjour »"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Avec 1 500 000 Ar visés et 100 heures facturables, quel est le prix horaire ?', '["1 500 Ar","100 000 Ar","150 000 Ar","15 000 Ar"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'Quel texte est en général parmi les mieux payés ?', '["La relecture d''une ligne","La fiche produit très courte","La page de vente","La publication de 30 mots"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-0-f', 'À qui appartient en général le texte une fois payé ?', '["Au rédacteur, pour toujours","À la plateforme de paiement","Au client","À Google"]'::jsonb, 2);

-- lang-1-f
delete from public.exam_questions where course_id = 'lang-1-f';
delete from public.module_questions where course_id = 'lang-1-f';
delete from public.lessons where course_id = 'lang-1-f' and module_index >= 5;
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('lang-1-f', 0, 'Le métier de traducteur depuis Madagascar', 'Ce que fait un traducteur, les mots du métier, le sens de traduction, les 6 types de traduction, les clients et la place des outils automatiques.', 'Sites internet, applications, documents d''entreprise, rapports d''ONG, sous-titres : chaque jour, des millions de mots doivent passer d''une langue à une autre. Le traducteur fait ce passage en gardant le **sens**, le **ton** et la **précision** du texte d''origine. À Madagascar, où l''on grandit souvent avec le malagasy et le français, et où l''anglais progresse, ce métier est une vraie possibilité de travail à distance. Ce premier module vous le présente tel qu''il est vraiment.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Expliquer ce que fait un traducteur et ce qui le distingue d''un outil automatique.
> 2. Définir votre combinaison de langues et votre sens de traduction.
> 3. Citer les 6 types de traduction les plus demandés.
> 4. Repérer vos premiers clients possibles.
> 5. Évaluer honnêtement votre niveau et savoir comment progresser.

## Le métier de traducteur en une phrase

Un traducteur **fait passer un texte d''une langue à une autre, de façon que le lecteur ne sente pas qu''il s''agit d''une traduction**.

Traduire, ce n''est pas remplacer chaque mot par un autre. C''est comprendre parfaitement le texte de départ, puis l''écrire comme l''aurait écrit un auteur dont c''est la langue maternelle.

> [!exemple] Mot à mot ou sens ?
> Anglais : « It''s raining cats and dogs. »
> Mot à mot : « Il pleut des chats et des chiens. » (incompréhensible)
> Traduction : « Il pleut des cordes. »

## Les mots du métier

| Terme | Définition |
| --- | --- |
| **Langue source** | La langue du texte de départ |
| **Langue cible** | La langue dans laquelle on traduit |
| **Combinaison de langues** | Les paires que vous traduisez, par exemple anglais → français |
| **Traduction** | Passer un texte écrit d''une langue à une autre |
| **Interprétation** | Passer un discours **oral** d''une langue à une autre (un autre métier) |
| **Post-édition** | Corriger et améliorer un texte traduit par une machine |
| **Localisation** | Adapter un texte à un pays : monnaie, dates, références, culture |

### Le sens de traduction

La règle professionnelle : **on traduit vers sa langue la plus forte**, souvent sa langue maternelle. Un francophone traduit de l''anglais **vers** le français, car c''est dans la langue cible que les fautes et maladresses se voient.

| Combinaison | Pour qui depuis Madagascar | Demande |
| --- | --- | --- |
| Anglais → français | Ceux qui écrivent un français excellent | Très forte : énormément de contenus anglais à traduire |
| Français → malagasy | Ceux qui écrivent un malagasy soigné | ONG, santé, institutions, entreprises locales, applications |
| Malagasy → français | Bon niveau dans les deux langues | Documents, recherches, médias |
| Français → anglais | Seulement avec un anglais écrit de très haut niveau | Forte, mais beaucoup de concurrence de traducteurs anglophones |

> [!madagascar] Votre avantage
> Peu de traducteurs professionnels travaillent avec le **malagasy**. Pour les ONG, les organisations internationales, les applications et les entreprises qui s''adressent aux Malgaches, un traducteur fiable vers le malagasy est précieux.

## Les 6 types de traduction les plus demandés

| N° | Type | Exemple | Ce qu''il faut |
| --- | --- | --- | --- |
| 1 | **Générale** | Articles, e-mails, présentations | Bonne culture générale |
| 2 | **Marketing et sites web** | Site d''hôtel, fiches produits, publicités | Écrire de façon vivante et convaincante |
| 3 | **Technique** | Modes d''emploi, fiches techniques | Précision, recherche de vocabulaire |
| 4 | **Institutionnelle** (ONG, santé, éducation) | Rapports, brochures de prévention | Clarté pour un large public |
| 5 | **Localisation** (applications, logiciels, jeux) | Boutons, messages d''erreur | Phrases courtes, respect des contraintes d''espace |
| 6 | **Post-édition** de traduction automatique | Corriger un texte traduit par DeepL | Œil très attentif, rapidité |

> [!definition] Traduction assermentée
> Une traduction officielle de documents (actes de naissance, diplômes, jugements) qui a une valeur légale. Elle est réservée aux traducteurs **agréés** par les autorités. Ce n''est pas l''objet de cette formation : ne proposez jamais une « traduction certifiée » sans cet agrément.

## Qui sont vos clients ?

1. **Agences de traduction** (en France, au Canada, en Belgique, à Maurice et ailleurs) : elles reçoivent les commandes et les confient à des traducteurs freelances.
2. **Entreprises** qui traduisent leur site, leurs documents ou leur application.
3. **ONG et organisations internationales** présentes à Madagascar : rapports, brochures, formulaires, en français et en malagasy.
4. **Créateurs de contenu et formateurs** qui veulent toucher un public dans une autre langue.
5. **Plateformes de freelance** où des particuliers et des PME publient des petites missions.

## Les outils automatiques : concurrents ou alliés ?

Les outils de traduction automatique (DeepL, Google Traduction) et les assistants d''IA produisent des traductions correctes en quelques secondes. Ils ont changé le métier :

| Ce que la machine fait bien | Ce que le traducteur apporte |
| --- | --- |
| Textes simples et répétitifs | Le sens exact quand une phrase est ambiguë |
| Vitesse | Le ton juste (marketing, humour, émotion) |
| Premier jet | La terminologie précise du client |
| | La vérification : la machine peut inverser un sens, oublier une négation, inventer |
| | La confidentialité et la responsabilité |

Les clients demandent de plus en plus de **post-édition** : le traducteur qui sait corriger rapidement une traduction automatique a donc un avantage. Mais il doit **savoir traduire** d''abord, sinon il ne voit pas les erreurs.

> [!attention] Erreurs fréquentes des débutants
> - Traduire vers une langue qu''on n''écrit pas parfaitement.
> - Traduire mot à mot.
> - Copier une traduction automatique sans la vérifier.
> - Mettre un texte confidentiel du client dans un outil gratuit en ligne (module 3).
> - Proposer des « traductions certifiées » sans agrément.

> [!retenir]
> - Traduire, c''est rendre le sens et le ton, pas les mots.
> - On traduit vers sa langue la plus forte.
> - Anglais → français et français → malagasy sont deux combinaisons porteuses depuis Madagascar.
> - La post-édition est très demandée, mais exige de savoir traduire.

## Exercice pratique : votre profil de traducteur

> [!exercice] Exercice pratique · 1 heure
> 1. Écrivez votre combinaison de langues et votre sens de traduction, en expliquant pourquoi.
> 2. Traduisez ce court texte vers votre langue cible, sans outil automatique :
>    « Our eco-lodge sits on a quiet beach, a short boat ride from the village. Wake up to the sound of the waves, enjoy a breakfast of fresh tropical fruit, and spend your day snorkeling with turtles. »
> 3. Comparez ensuite avec une traduction de DeepL : notez 3 différences, et dites quelle version est la meilleure pour chacune.
> 4. Faites la liste de 3 sujets que vous connaissez bien (études, travail, passions) : ce seront vos domaines de départ.
>
> **À livrer** : votre profil (combinaison, sens, domaines), votre traduction et votre comparaison.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-1-f', 0, 0, 'Vers quelle langue un traducteur doit-il traduire ?', '["Toujours l''anglais","N''importe quelle langue qu''il a étudiée","La langue la mieux payée","Sa langue la plus forte, souvent sa langue maternelle"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-1-f', 0, 1, 'Quelle est la différence entre traduction et interprétation ?', '["L''interprétation concerne l''écrit","La traduction concerne l''écrit, l''interprétation l''oral","Il n''y a aucune différence","La traduction est toujours automatique"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-1-f', 0, 2, 'Peut-on proposer une « traduction certifiée » sans agrément ?', '["Oui, avec un tampon personnel","Oui, si on est bon","Oui, pour les clients étrangers","Non, elle est réservée aux traducteurs agréés"]'::jsonb, 3);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('lang-1-f', 1, 'Les bases : méthode, pièges, registre et typographie', 'La méthode en 5 étapes, contresens, faux amis et calques, registre et ton, conventions typographiques et localisation.', 'Une bonne traduction ne doit rien au hasard. Les traducteurs professionnels suivent une méthode, connaissent les pièges classiques entre les langues et respectent des règles d''écriture précises. Ce module vous les enseigne, avec des exemples entre l''anglais, le français et le malagasy.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Traduire avec une méthode en 5 étapes.
> 2. Éviter les faux amis et le calque.
> 3. Adapter le registre et le ton au public.
> 4. Respecter les conventions typographiques de la langue cible.
> 5. Localiser dates, nombres, monnaies et références culturelles.

## La méthode en 5 étapes

| N° | Étape | Ce que vous faites |
| --- | --- | --- |
| 1 | **Lire** | Lisez tout le texte avant de traduire : sujet, public, ton, mots difficiles |
| 2 | **Rechercher** | Cherchez les termes inconnus ; consultez les documents du client et ses traductions précédentes |
| 3 | **Traduire** | Phrase par phrase, en pensant au **sens**, pas aux mots |
| 4 | **Réviser** | Comparez la traduction avec l''original, phrase par phrase : rien d''oublié, rien d''ajouté, aucun contresens |
| 5 | **Relire** | Lisez la traduction **seule**, comme un lecteur : est-elle naturelle et sans faute ? |

> [!astuce]
> Laissez passer quelques heures (ou une nuit) entre la traduction et la relecture. Avec un regard neuf, vous voyez immédiatement les phrases qui « sentent la traduction ».

## Les erreurs à connaître

| Erreur | Définition | Exemple |
| --- | --- | --- |
| **Contresens** | Le sens est faux | « He was not unhappy » traduit par « Il était malheureux » |
| **Faux sens** | Le sens est proche mais inexact | « Eventually » traduit par « éventuellement » au lieu de « finalement » |
| **Omission** | Une information a disparu | Une négation ou un chiffre oublié |
| **Ajout** | Une information a été inventée | Ajouter « gratuitement » qui n''était pas dans l''original |
| **Calque** | La structure de la langue source est copiée | « Il est facile de voir pourquoi » pour « It''s easy to see why » au lieu de « On comprend aisément pourquoi » |

### Les faux amis anglais / français les plus courants

| Mot anglais | Ne veut **pas** dire | Veut dire |
| --- | --- | --- |
| actually | actuellement | en fait |
| eventually | éventuellement | finalement |
| library | librairie | bibliothèque |
| sensible | sensible | raisonnable |
| to realize | réaliser | se rendre compte |
| to attend | attendre | assister à |
| currently | couramment | actuellement |
| achievement | achèvement | réussite, accomplissement |

> [!definition] Faux ami
> Un mot qui ressemble à un mot de l''autre langue mais n''a pas le même sens. C''est la cause la plus fréquente de faux sens chez les débutants.

## Le registre et le ton

> [!definition] Registre
> Le niveau de langue : **soutenu** (documents officiels), **courant** (la plupart des textes), **familier** (conversations, certaines publicités).

### Les 4 questions à se poser

1. **Qui lit ?** Un expert, le grand public, des jeunes, des enfants ?
2. **Tutoiement ou vouvoiement ?** L''anglais « you » peut devenir « tu » ou « vous » : demandez au client ou suivez ses textes existants.
3. **Quel ton ?** Sérieux, chaleureux, enthousiaste, technique ?
4. **Quel effet** le texte doit-il produire ? Informer, rassurer, faire acheter, faire rire ?

> [!exemple] Même phrase, deux publics
> Anglais : « Don''t miss out — grab yours today! »
> Pour une marque de vêtements pour jeunes : « Ne la rate pas : fonce, c''est aujourd''hui ! »
> Pour une banque : « Profitez de cette offre dès aujourd''hui. »

### Traduire vers le malagasy

1. Choisissez le **malagasy officiel** (*ofisialy*) sauf demande contraire : c''est la forme comprise dans tout le pays.
2. Pour les termes techniques récents (numérique, santé), vérifiez s''il existe un terme établi ; sinon, demandez au client s''il préfère un emprunt au français ou une explication.
3. Gardez des phrases **claires et courtes** pour les textes destinés au grand public (prévention, santé, consignes).
4. Faites relire par un **locuteur d''une autre région** les textes importants : il repérera les mots moins bien compris ailleurs.

## Les conventions typographiques

Chaque langue a ses règles d''écriture. Les ignorer trahit une traduction amateur.

| Élément | Anglais | Français |
| --- | --- | --- |
| Guillemets | "quote" | « citation » (avec espaces) |
| Ponctuation double (: ; ! ?) | Pas d''espace avant | Espace (insécable) avant |
| Nombres décimaux | 3.5 | 3,5 |
| Milliers | 25,000 | 25 000 |
| Dates | 03/14/2026 (États-Unis), 14/03/2026 (Royaume-Uni) | 14/03/2026 ou 14 mars 2026 |
| Heures | 3:30 PM | 15 h 30 |
| Majuscules dans les titres | Souvent sur chaque mot important (« How To Save Money ») | Seulement le premier mot et les noms propres (« Comment économiser ») |
| Jours et mois | Avec majuscule (Monday, March) | Sans majuscule (lundi, mars) |

> [!attention]
> La date « 03/04/2026 » veut dire **4 mars** pour un Américain et **3 avril** pour un Français. Dans un texte important, vérifiez le pays d''origine et écrivez le mois en lettres si nécessaire.

## Localiser

Localiser, c''est adapter le texte au **pays** du lecteur, pas seulement à sa langue.

| Élément | Exemple de localisation pour Madagascar |
| --- | --- |
| Monnaie | « $10 » → montant en ariary si le client le demande, ou conservé en dollars avec mention |
| Unités | Miles → kilomètres ; °F → °C ; pieds → mètres |
| Références culturelles | « Thanksgiving » → expliquer, ou remplacer par une fête connue si le client l''accepte |
| Exemples | Un exemple avec une carte de crédit → un exemple avec le Mobile Money |
| Formats | Numéros de téléphone, adresses |

Ne localisez **jamais** sans l''accord du client : certains veulent une traduction fidèle, d''autres une adaptation complète. Demandez-le dans le brief.

> [!madagascar]
> Un texte destiné au grand public à Madagascar gagne souvent à remplacer des références étrangères par des références locales (marché, taxi-be, Mobile Money). Proposez-le au client avec des exemples : c''est une vraie valeur ajoutée.

> [!retenir]
> - Lire, rechercher, traduire, réviser, relire.
> - Traquez contresens, faux sens, omissions, ajouts et calques.
> - Méfiez-vous des faux amis.
> - Adaptez le registre et le ton au lecteur.
> - Respectez la typographie de la langue cible ; localisez seulement avec l''accord du client.

## Exercice pratique : traduire et réviser

> [!exercice] Exercice pratique · 1 heure 30
> 1. Trouvez un texte de 300 mots en anglais (page « About us » d''une entreprise, article de blog) et traduisez-le vers votre langue cible avec la méthode en 5 étapes.
> 2. Faites une liste de tous les faux amis et termes difficiles rencontrés, avec votre solution.
> 3. Corrigez toutes les conventions typographiques (guillemets, espaces, nombres, dates).
> 4. Traduisez la même phrase publicitaire pour deux publics différents (jeunes / entreprise).
> 5. Si vous traduisez vers le malagasy, faites relire votre texte par une personne d''une autre région et notez ses remarques.
>
> **À livrer** : le texte source, votre traduction, votre liste de termes et vos deux versions de la phrase publicitaire.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-1-f', 1, 0, 'Que veut dire « actually » en français ?', '["Actuellement","En fait","Exactement","Activement"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-1-f', 1, 1, 'Comment écrit-on 25,000 (anglais) en français ?', '["25.000,00","25 000","25,000","25000,0"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-1-f', 1, 2, 'Quand localiser un texte (monnaie, références) ?', '["Seulement les titres","Jamais","Toujours, sans demander","Seulement avec l''accord du client"]'::jsonb, 3);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('lang-1-f', 2, 'Les outils : TAO, Matecat, glossaires, et les outils payants', 'Segments, mémoire de traduction, Matecat en 8 étapes, glossaire, traduction automatique et confidentialité, puis Trados, memoQ et DeepL Pro.', 'Les traducteurs professionnels ne travaillent pas dans un simple traitement de texte. Ils utilisent des **outils de traduction assistée par ordinateur** (TAO) qui découpent le texte en segments, mémorisent chaque traduction et vérifient la cohérence de la terminologie. Ce module vous fait prendre en main un outil gratuit, Matecat, vous apprend à utiliser la traduction automatique sans risque, puis vous présente les logiciels payants demandés par les agences.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Expliquer ce que sont la TAO, une mémoire de traduction et un glossaire.
> 2. Traduire un document dans Matecat, de l''import à l''export.
> 3. Créer et utiliser un glossaire.
> 4. Utiliser la traduction automatique en respectant la confidentialité.
> 5. Trouver la bonne terminologie avec des ressources gratuites.
> 6. Savoir quand passer à Trados Studio, memoQ et DeepL Pro.

## Les mots de la TAO

| Terme | Définition |
| --- | --- |
| **TAO** (en anglais *CAT tool*) | Logiciel de traduction assistée par ordinateur |
| **Segment** | Un morceau de texte, en général une phrase, que l''on traduit l''un après l''autre |
| **Mémoire de traduction** (*TM*) | Base qui enregistre chaque segment source avec sa traduction ; elle propose la traduction quand une phrase identique ou proche revient |
| **Correspondance** (*match*) | Le pourcentage de ressemblance entre une nouvelle phrase et une phrase de la mémoire (100 % = identique) |
| **Glossaire** (ou base terminologique) | Liste des termes à traduire toujours de la même façon |
| **Contrôle qualité** (*QA*) | Vérification automatique : chiffres, ponctuation, termes du glossaire, segments vides |

> [!exemple] Pourquoi la mémoire de traduction fait gagner du temps
> Un mode d''emploi contient 30 fois la phrase « Débranchez l''appareil avant de le nettoyer. » Vous la traduisez une fois : la mémoire la propose automatiquement les 29 autres fois. Et si la version 2 du mode d''emploi arrive, seules les phrases **nouvelles** sont à traduire.

## Les outils gratuits

| N° | Outil | À quoi il sert |
| --- | --- | --- |
| 1 | **Matecat** | Outil de TAO gratuit, en ligne : segments, mémoire, glossaire, contrôle qualité |
| 2 | **DeepL** (version gratuite) | Traduction automatique pour des textes **non confidentiels** |
| 3 | **IATE** | Base terminologique officielle de l''Union européenne, gratuite, multilingue |
| 4 | **Linguee** | Exemples de traductions réelles en contexte |
| 5 | **Dictionnaires de référence** | Le Robert ou Larousse en ligne pour le français ; Tenymalagasy pour le malagasy |
| 6 | **Tableur** (Google Sheets) | Construire et partager vos glossaires |

## Traduire dans Matecat en 8 étapes

1. Créez un compte gratuit sur Matecat.
2. Choisissez la **langue source** et la **langue cible**.
3. Dans les réglages de mémoire, créez une **clé de mémoire privée** : vos traductions ne seront alors pas partagées publiquement.
4. **Importez** le document (Word, Excel, PowerPoint, HTML et de nombreux autres formats).
5. Traduisez **segment par segment** : la traduction se tape dans la case de droite. Les propositions de la mémoire et de la traduction automatique apparaissent en dessous.
6. Validez chaque segment (**Ctrl + Entrée** : le segment passe au statut « traduit » et vous passez au suivant).
7. Lancez le **contrôle qualité** et corrigez les alertes.
8. **Téléchargez** le document traduit : il garde la mise en forme de l''original.

> [!astuce] Les balises
> Dans les segments, des petits symboles représentent la mise en forme (gras, liens, sauts de ligne). On les appelle **balises** (*tags*). Placez-les au bon endroit dans votre traduction, sinon le document final aura une mise en forme cassée.

## Le glossaire

### Créer un glossaire en 4 étapes

1. Lisez le texte et les documents du client, et relevez les **termes importants** : noms de produits, termes techniques, expressions de la marque.
2. Pour chacun, choisissez la traduction (recherche dans IATE, Linguee, le site du client).
3. Notez-les dans un tableau : **terme source**, **terme cible**, **remarque** (contexte, terme à ne pas utiliser).
4. Importez le glossaire dans Matecat (ou ajoutez les termes au fil du travail) : l''outil les signale dans chaque segment où ils apparaissent.

| Terme source | Terme cible | Remarque |
| --- | --- | --- |
| booking | réservation | Ne pas laisser « booking » |
| eco-lodge | écolodge | Terme utilisé par le client sur son site |
| snorkeling | randonnée palmée | Le client préfère ce terme à « snorkeling » |
| check-in | arrivée | Dans les textes pour clients ; « check-in » accepté sur les panneaux |

> [!definition] Cohérence terminologique
> Le même terme source doit être traduit **toujours de la même façon** dans un document et entre les documents d''un même client. Le glossaire sert à ça.

## La traduction automatique sans risque

### La confidentialité d''abord

Quand vous collez un texte dans un outil gratuit en ligne, il peut être **conservé** et utilisé par le service. Or beaucoup de clients interdisent de mettre leurs documents dans ces outils (contrats, données personnelles, documents médicaux, projets non publiés).

1. **Lisez votre contrat** ou demandez au client : la traduction automatique est-elle autorisée ?
2. **Jamais de texte confidentiel** dans un outil gratuit.
3. Pour les clients qui l''autorisent, utilisez une **version professionnelle** (comme DeepL Pro), dont les conditions prévoient en général que les textes ne sont pas conservés : vérifiez-le dans les conditions de l''offre.

### Bien post-éditer

> [!definition] Post-édition
> Corriger une traduction automatique pour qu''elle atteigne la qualité demandée par le client.

1. **Lisez l''original d''abord**, puis la proposition de la machine.
2. Vérifiez le **sens** : négations, chiffres, noms, sujets inversés.
3. Vérifiez la **terminologie** du glossaire : la machine ne la connaît pas.
4. Corrigez le **naturel** : la machine fait souvent des calques.
5. Si la proposition est trop mauvaise, **effacez-la et traduisez** : c''est plus rapide.

> [!attention]
> La traduction automatique fait des erreurs **graves et invisibles** : une phrase fluide peut dire le contraire de l''original. Ne validez jamais un segment sans l''avoir comparé avec la source.

## Quand passer aux outils payants ?

| Outil payant | Ce qu''il apporte | Quand le prendre |
| --- | --- | --- |
| **Trados Studio** | L''outil de TAO le plus utilisé par les agences ; compatibilité totale avec leurs fichiers de projet | Quand des agences vous envoient régulièrement des projets Trados |
| **memoQ** | Outil de TAO très complet, apprécié pour sa gestion de la terminologie et des projets | Quand vos clients l''utilisent, ou comme alternative à Trados |
| **DeepL Pro** | Traduction automatique avec des conditions de confidentialité professionnelles, glossaires, traduction de documents entiers | Quand vos clients autorisent la traduction automatique et que vous traduisez beaucoup |

Les prix et les formules changent souvent : vérifiez sur les sites officiels. Plusieurs agences fournissent un **accès en ligne** à leur propre outil, ou acceptent un travail fait dans Matecat : demandez avant d''acheter une licence.

> [!madagascar]
> Ces licences coûtent cher et se paient en devises. Commencez avec Matecat et les ressources gratuites ; investissez quand une agence vous donne du travail régulier qui l''exige. Une licence s''amortit vite avec des commandes régulières.

> [!retenir]
> - La TAO découpe en segments et mémorise : vous ne traduisez jamais deux fois la même phrase.
> - Un glossaire garantit la cohérence des termes.
> - Clé de mémoire privée dans Matecat, et jamais de texte confidentiel dans un outil gratuit.
> - Post-éditer : comparer avec la source, vérifier le sens, la terminologie et le naturel.
> - Trados, memoQ et DeepL Pro quand vos clients les exigent ou que votre volume le justifie.

## Exercice pratique : votre premier projet en TAO

> [!exercice] Exercice pratique · 2 heures
> 1. Créez un compte Matecat et une clé de mémoire privée.
> 2. Prenez un document Word de 500 mots environ (un texte non confidentiel : page d''information d''une ONG, article, présentation d''entreprise).
> 3. Créez un glossaire de 10 termes avec IATE, Linguee et des dictionnaires.
> 4. Traduisez le document dans Matecat en appliquant la méthode en 5 étapes du module 2.
> 5. Lancez le contrôle qualité, corrigez, et téléchargez le document traduit.
> 6. Comparez 5 segments avec la proposition de traduction automatique : notez les erreurs de la machine.
>
> **À livrer** : le document traduit, votre glossaire et votre tableau de comparaison.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-1-f', 2, 0, 'À quoi sert une mémoire de traduction ?', '["Proposer automatiquement les phrases déjà traduites","Compter les heures de travail","Traduire sans traducteur","Retenir le mot de passe du client"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-1-f', 2, 1, 'Peut-on mettre un contrat confidentiel dans un outil de traduction gratuit en ligne ?', '["Oui, si on le supprime après","Non, jamais","Oui, toujours","Oui, la nuit"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-1-f', 2, 2, 'Quel outil de TAO est le plus utilisé par les agences ?', '["Canva","Trados Studio","Google Agenda","CapCut"]'::jsonb, 1);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('lang-1-f', 3, 'Premier projet : un site d''hôtel et une brochure d''ONG', 'Analyse de la demande, estimation du délai, projet en 7 étapes, tableau de questions, grille de 10 points et livraison.', 'Dans ce module, vous traitez une commande complète, comme celles qu''envoient les agences et les clients directs : la traduction d''un site d''hôtel et d''une brochure d''ONG. Vous suivez toutes les étapes d''un traducteur professionnel, du devis au contrôle final, et vous apprenez à gérer les questions au client et les délais.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Analyser une demande et poser les bonnes questions avant d''accepter.
> 2. Estimer le volume et le délai d''une traduction.
> 3. Gérer un projet de traduction en 7 étapes.
> 4. Envoyer des questions claires au client pendant le travail.
> 5. Vérifier une traduction avec une grille de 10 points avant livraison.

## Le cas pratique : deux commandes

> [!exemple] Commande 1 : l''hôtel « Baobab Lodge »
> Un hôtel de Morondava veut traduire son site de l''anglais vers le français : page d''accueil, chambres, activités, conditions de réservation. **1 800 mots** au total, fournis dans un fichier Word. Le client veut un texte « chaleureux, qui donne envie », et le vouvoiement.

> [!exemple] Commande 2 : l''ONG « Rano Madio »
> Une ONG qui travaille sur l''accès à l''eau potable veut traduire une brochure de prévention du français vers le malagasy : **600 mots**, pour des familles en milieu rural. Phrases simples, consignes claires, illustrations déjà prêtes.

## Avant d''accepter : analyser la demande

### Les 8 questions à se poser (ou à poser au client)

1. Quelle est la **combinaison** et le **sens** ? Est-ce bien vers ma langue la plus forte ?
2. Le **sujet** est-il dans mes compétences ?
3. Quel est le **volume** exact (nombre de mots) ?
4. Quel est le **délai** ?
5. Quel est le **format** du fichier (Word, Excel, site web) et du fichier à livrer ?
6. Qui est le **public** ? Quel **ton** ?
7. Y a-t-il des **documents de référence** : anciennes traductions, glossaire, site du client ?
8. La **traduction automatique** est-elle autorisée ?

> [!attention]
> Refuser une commande hors de vos compétences (un contrat juridique complexe, un rapport médical spécialisé) est un signe de **professionnalisme**. Une mauvaise traduction livrée peut faire perdre un client pour toujours, et parfois avoir des conséquences graves.

## Estimer le volume et le délai

### Le comptage

Le prix et le délai se calculent sur le **nombre de mots du texte source**. Matecat et les traitements de texte comptent les mots automatiquement. Les outils de TAO indiquent aussi les **répétitions** et les correspondances avec la mémoire, que les agences paient souvent moins cher.

### Le rythme de travail

Un traducteur traduit en général **plusieurs centaines à quelques milliers de mots par jour**, selon le sujet, son expérience et la qualité demandée. Mesurez **votre** rythme réel sur vos exercices.

> [!exemple] Calcul du délai pour l''hôtel
> - Votre rythme mesuré : environ 1 500 mots par jour de traduction, plus du temps pour réviser.
> - 1 800 mots → environ 1,5 jour de traduction + 0,5 jour de révision et relecture = **2 jours de travail**.
> - Avec une marge pour les coupures et les questions au client : proposer **3 jours ouvrés**.

## Le projet en 7 étapes

| N° | Étape | Commande 1 (hôtel) | Commande 2 (ONG) |
| --- | --- | --- | --- |
| 1 | **Préparation** | Lire tout le site, regarder le site actuel et les sites d''hôtels francophones similaires | Lire la brochure, comprendre chaque consigne de santé |
| 2 | **Glossaire** | « lodge », « check-in », « pirogue trip », « Avenue of the Baobabs » (Allée des Baobabs) | « eau potable », « filtre », « diarrhée », « se laver les mains » : termes simples et compréhensibles en milieu rural |
| 3 | **Questions** | Garder « lodge » ou dire « écolodge » ? Prix en euros ou en ariary ? | Faut-il des termes de dialecte régional ? Qui relira ? |
| 4 | **Traduction** | Dans Matecat, segment par segment | Dans Matecat ou Word, avec des phrases courtes |
| 5 | **Révision** | Comparer avec la source, phrase par phrase | Idem, en vérifiant chaque chiffre et chaque consigne |
| 6 | **Relecture** | Lire comme un voyageur français : est-ce que ça donne envie ? | Faire lire à une personne qui ressemble au public visé |
| 7 | **Livraison** | Fichier Word au même format + glossaire + notes | Fichier + remarques sur les termes choisis |

## Poser des questions au client

Pendant la traduction, des questions vont apparaître. Regroupez-les dans **un seul message**, le plus tôt possible, pour ne pas retarder la livraison.

### Le tableau de questions

| N° | Segment / page | Texte source | Question | Ma proposition |
| --- | --- | --- | --- | --- |
| 1 | Accueil, ligne 3 | « Our lodge » | Garder « lodge » ou traduire ? | « Notre écolodge » (terme compris par les voyageurs français) |
| 2 | Tarifs | « $85 per night » | Prix en dollars, en euros ou en ariary ? | Garder les dollars, comme sur la page de réservation |
| 3 | Activités | « Kirindy day trip » | Le nom officiel est-il « forêt de Kirindy » ? | « Excursion d''une journée dans la forêt de Kirindy » |

Proposez **toujours** une solution avec chaque question : le client répond plus vite, et voit que vous avez réfléchi.

## La grille de vérification en 10 points

| N° | Point à vérifier | Oui / Non |
| --- | --- | --- |
| 1 | Aucun segment oublié ni laissé dans la langue source | |
| 2 | Aucun contresens, faux sens, ajout ni omission | |
| 3 | Chiffres, prix, dates, noms propres identiques ou correctement convertis | |
| 4 | Termes du glossaire respectés partout | |
| 5 | Registre et tutoiement / vouvoiement cohérents | |
| 6 | Typographie de la langue cible respectée | |
| 7 | Mise en forme identique à l''original (titres, gras, listes, liens) | |
| 8 | Contrôle qualité automatique lancé et alertes traitées | |
| 9 | Relecture de la traduction seule : texte naturel, sans faute | |
| 10 | Réponses du client intégrées | |

## La livraison

> [!exemple] Message de livraison
> « Bonjour Madame Andriamasy, vous trouverez ci-joint la traduction française de votre site (1 800 mots), au même format que le fichier d''origine. J''ai suivi vos réponses du 12 mars (écolodge, prix en dollars). Je joins aussi le glossaire des 15 termes utilisés, pour vos prochaines traductions. Une remarque : la page "Conditions" mentionne une politique d''annulation de 7 jours, et la page "Réservation" de 10 jours : je l''ai traduit tel quel, mais vous voudrez peut-être vérifier. Bonne journée ! »

Signaler une **incohérence dans le texte d''origine** est un vrai service rendu au client : il voit que vous lisez avec attention.

> [!madagascar]
> Pour la brochure en malagasy, proposez au client de **tester** la traduction auprès de quelques familles ou d''agents de terrain avant l''impression. Une consigne de santé mal comprise peut avoir des conséquences réelles.

> [!retenir]
> - Analysez chaque demande avec 8 questions ; refusez ce qui dépasse vos compétences.
> - Estimez le délai à partir de votre rythme réel, avec une marge.
> - 7 étapes : préparation, glossaire, questions, traduction, révision, relecture, livraison.
> - Regroupez vos questions et proposez toujours une solution.
> - Vérifiez avec la grille de 10 points et signalez les incohérences de l''original.

## Exercice pratique : les deux commandes

> [!exercice] Exercice pratique · 4 heures
> 1. Trouvez la page d''un site d''hôtel ou d''agence en anglais (environ 800 mots) et traduisez-la vers votre langue cible, comme pour la commande 1.
> 2. Rédigez une courte brochure de prévention en français (300 mots, sur l''hygiène ou l''eau potable) et traduisez-la vers le malagasy, ou choisissez un autre texte grand public si vous ne traduisez pas vers le malagasy.
> 3. Pour chaque commande : faites le glossaire, le tableau de questions avec vos propositions, la traduction dans Matecat et la grille de 10 points.
> 4. Rédigez les deux messages de livraison.
>
> **À livrer** : les deux traductions, les glossaires, les tableaux de questions, les grilles et les messages. Ce sont vos premières pièces de portfolio.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-1-f', 3, 0, 'Sur quoi se calculent en général le prix et le délai d''une traduction ?', '["Le nombre d''images","Le nombre de mots du texte source","Le poids du fichier","Le nombre de pages imprimées"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-1-f', 3, 1, 'Comment poser vos questions au client ?', '["Jamais, il faut deviner","Après la livraison","Une par une, toutes les heures","Regroupées dans un seul message, avec une proposition pour chacune"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-1-f', 3, 2, 'Que faire si le texte d''origine contient une incohérence ?', '["La signaler au client","Ne pas la traduire","Refuser toute la commande","La corriger sans rien dire"]'::jsonb, 0);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('lang-1-f', 4, 'Trouver des clients et se faire payer', 'CV de traducteur, 5 canaux, test de traduction, tarifs au mot, devis, confidentialité, paiements et spécialité.', 'Les traducteurs freelances travaillent surtout avec des **agences** qui leur envoient des projets réguliers, et avec quelques **clients directs**. Ce dernier module vous montre comment vous présenter, réussir les tests de traduction, fixer vos prix au mot, protéger la confidentialité de vos clients et vous faire payer depuis Madagascar.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Rédiger un CV de traducteur et un profil en ligne.
> 2. Trouver des clients grâce à 5 canaux.
> 3. Réussir un test de traduction.
> 4. Calculer vos tarifs au mot, à l''heure et le forfait minimum.
> 5. Rédiger un devis et respecter la confidentialité.
> 6. Vous faire payer et développer une spécialité.

## Le CV et le profil de traducteur

Les agences reçoivent beaucoup de candidatures. Le vôtre doit montrer en 30 secondes ce que vous traduisez, dans quels domaines et avec quels outils.

### Les 7 rubriques du CV

1. **Combinaisons de langues et sens** : « Anglais → français ; français → malagasy ».
2. **Langue maternelle** (ou langue la plus forte).
3. **Domaines** : tourisme, ONG et développement, santé grand public, marketing…
4. **Services** : traduction, révision, post-édition, localisation.
5. **Outils** : Matecat, et les autres outils maîtrisés (Trados, memoQ si vous les avez appris).
6. **Expérience et projets** : vos projets du module 4, avec le volume (« 2 400 mots traduits pour un site d''hôtel »).
7. **Formation et capacité** : études, cette formation, nombre de mots par jour, disponibilité.

> [!exemple] Phrase de présentation
> « Traductrice anglais → français et français → malagasy, spécialisée dans le tourisme et les projets de développement. Traductions naturelles, terminologie vérifiée, délais respectés. Outils : Matecat, glossaires clients, post-édition. »

**Une règle importante** : votre CV doit être **sans aucune faute**. Une agence de traduction élimine immédiatement un CV de traducteur avec des fautes.

## Où trouver des clients : 5 canaux

| N° | Canal | Pour qui | Comment s''y prendre |
| --- | --- | --- | --- |
| 1 | **Agences de traduction** | Projets réguliers | Candidature spontanée sur leur page « Devenir traducteur », souvent avec un test |
| 2 | **Sites spécialisés pour traducteurs** (ProZ.com, TranslatorsCafé) | Agences et clients du monde entier | Profil complet, réponse aux offres, participation aux forums |
| 3 | **Plateformes de freelance** (Upwork et autres) | Entreprises, créateurs | Offre précise ; vérifiez que la plateforme accepte les freelances basés à Madagascar |
| 4 | **ONG et organisations internationales à Madagascar** | Traductions français ↔ malagasy | Contactez les responsables de communication ; répondez aux appels d''offres |
| 5 | **Entreprises du tourisme et du commerce** | Sites, brochures, menus | Proposez de traduire une page de leur site en anglais ou en français |

> [!astuce] Vérifier une agence
> Avant de travailler pour une agence, regardez son site, ses coordonnées et les avis d''autres traducteurs (par exemple sur les forums de ProZ, qui recensent la réputation de paiement des agences). Une agence sérieuse ne vous demande **jamais de payer** pour être inscrite.

## Réussir un test de traduction

Les agences demandent souvent de traduire **gratuitement un court texte** (en général 200 à 300 mots) pour évaluer votre niveau. C''est normal, tant que le test reste court.

1. Traitez le test **comme une vraie commande** : méthode en 5 étapes, glossaire, grille de 10 points.
2. Respectez **exactement** les consignes (format, délai, typographie).
3. Ne laissez **aucune faute** : un test est souvent éliminé pour une seule erreur.
4. N''utilisez **pas** de traduction automatique, sauf si c''est un test de post-édition.
5. Ajoutez une courte **note** si vous avez fait un choix délicat (« J''ai traduit "lodge" par "écolodge" car… »).

> [!attention]
> Un « test » de plusieurs milliers de mots n''est pas un test : c''est du travail gratuit. Refusez poliment au-delà de 300 à 500 mots.

## Fixer ses tarifs

### Les modes de facturation

| Mode | Pour quoi |
| --- | --- |
| **Au mot** (du texte source) | La grande majorité des traductions |
| **À l''heure** | Révision, relecture, post-édition légère, tâches difficiles à compter |
| **Forfait minimum** | Les très petites commandes (une phrase, un slogan) : un prix minimum par commande |

### Calculer votre tarif au mot

1. **Revenu mensuel visé** (exemple : 1 500 000 Ar) ÷ **heures facturables** (exemple : 100 h) = **15 000 Ar de l''heure**.
2. **Votre rythme réel**, révision comprise (exemple : 300 mots par heure).
3. **Tarif au mot** : 15 000 ÷ 300 = **50 Ar le mot**.

| Commande | Calcul | Exemple de prix |
| --- | --- | --- |
| Site d''hôtel de 1 800 mots | 1 800 × 50 Ar | 90 000 Ar |
| Brochure de 600 mots | 600 × 50 Ar | 30 000 Ar |
| Slogan de 8 mots | Forfait minimum | 15 000 Ar |

Ces prix sont des **exemples**. Les tarifs varient beaucoup selon la combinaison, le domaine et le client : un texte technique ou une combinaison rare se facture plus cher. Pour les agences et clients étrangers, fixez vos tarifs **en euros ou en dollars**, en vous renseignant sur les tarifs pratiqués pour votre combinaison (forums et enquêtes de tarifs sur les sites pour traducteurs). Les agences paient souvent moins cher les **répétitions** et les correspondances de la mémoire : renseignez-vous sur leur grille.

## Le devis et la confidentialité

### Ce que contient un devis

1. Le **document** à traduire, la combinaison et le nombre de mots.
2. Le **service** : traduction, révision, post-édition.
3. Le **tarif** et le **total**.
4. Le **délai** de livraison et le format du fichier livré.
5. Les **conditions de paiement** : pour un client direct, 50 % à la commande ; pour une agence, paiement à 30 jours fin de mois est fréquent.
6. Ce qui n''est **pas** inclus : mise en page complexe, saisie de textes en image, traduction assermentée.

### La confidentialité

1. Ne parlez **jamais** des documents de vos clients.
2. Ne les mettez **jamais** dans un outil gratuit en ligne (module 3).
3. Stockez-les sur un ordinateur protégé par un mot de passe, et supprimez-les quand le client le demande.
4. Signez l''**accord de confidentialité** quand une agence le propose, après l''avoir lu.

## Se faire payer depuis Madagascar

| Situation | Moyens de paiement |
| --- | --- |
| Client local, ONG | Virement bancaire ou Mobile Money (MVola, Orange Money, Airtel Money) |
| Agence étrangère | Virement international, Payoneer ou autre service proposé par l''agence |
| Plateforme internationale | Retrait selon la plateforme : souvent Payoneer ou virement vers une banque malgache |

> [!madagascar]
> Les possibilités de PayPal sont limitées pour Madagascar : indiquez à l''agence les moyens que vous pouvez recevoir **avant** le premier projet. Envoyez une **facture** pour chaque commande, gardez une trace de chaque paiement et renseignez-vous sur le NIF et la carte statistique auprès du centre fiscal de votre ville.

## Développer une spécialité

| Spécialité | Pourquoi depuis Madagascar |
| --- | --- |
| **Tourisme** | Forte demande, connaissance du terrain |
| **Développement et ONG** | Nombreux projets à Madagascar, besoin de malagasy |
| **Santé grand public** | Brochures, campagnes de prévention |
| **Agriculture et environnement** | Vanille, girofle, biodiversité, climat |
| **Localisation d''applications** | Applications de Mobile Money, de services, de jeux |

Choisissez **un ou deux** domaines, construisez un glossaire pour chacun et traduisez des textes de portfolio dans ces domaines.

> [!retenir]
> - Un CV sans faute : combinaisons, domaines, services, outils, projets.
> - Agences, sites pour traducteurs, plateformes, ONG et entreprises locales.
> - Un test court se traite comme une vraie commande ; refusez les tests trop longs.
> - Tarif au mot = prix horaire ÷ mots par heure ; un forfait minimum pour les petites commandes.
> - Confidentialité absolue et moyens de paiement vérifiés avant de commencer.

## Exercice pratique : lancer votre activité

> [!exercice] Exercice pratique · 2 heures 30
> 1. Rédigez votre CV de traducteur avec les 7 rubriques, et faites-le relire.
> 2. Créez votre profil sur un site pour traducteurs.
> 3. Mesurez votre rythme réel et calculez votre tarif au mot et votre forfait minimum.
> 4. Rédigez votre modèle de devis.
> 5. Trouvez 5 agences ou organisations qui travaillent avec votre combinaison, vérifiez leur sérieux et envoyez au moins 2 candidatures.
>
> **À livrer** : votre CV, le lien de votre profil, vos calculs, votre devis et la liste des 5 clients possibles avec vos candidatures.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-1-f', 4, 0, 'À 15 000 Ar de l''heure et 300 mots par heure, quel est le tarif au mot ?', '["50 Ar","5 000 Ar","300 Ar","15 Ar"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-1-f', 4, 1, 'Une agence demande un « test » gratuit de 5 000 mots. Que faire ?', '["Le faire avec une traduction automatique","Refuser poliment : c''est du travail gratuit","Le faire en 1 heure","Accepter sans discuter"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('lang-1-f', 4, 2, 'Quel est le premier critère d''un CV de traducteur ?', '["Une police originale","Une photo en couleur","Aucune faute","Une longueur de 5 pages"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'Qu''est-ce que traduire ?', '["Rendre le sens et le ton d''un texte dans une autre langue","Remplacer chaque mot par un autre","Résumer un texte","Corriger les fautes d''un texte"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'Qu''est-ce que la langue cible ?', '["Une langue étrangère au hasard","La langue du texte de départ","La langue du client","La langue dans laquelle on traduit"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'Qu''est-ce que la post-édition ?', '["Traduire après la date limite","Envoyer la traduction par la poste","Écrire un article","Corriger et améliorer une traduction automatique"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'Quelle combinaison est rare et recherchée depuis Madagascar ?', '["Allemand → italien","Anglais → espagnol","Français → malagasy","Chinois → russe"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'Quelle est la première étape de la méthode de traduction ?', '["Traduire la première phrase","Envoyer la facture","Lire tout le texte","Relire la traduction"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'Qu''est-ce qu''un contresens ?', '["Un mot ajouté","Une traduction dont le sens est faux","Une faute de frappe","Une traduction très fidèle"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', '« Library » se traduit par…', '["Bibliothèque","Liberté","Librairie","Livret"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'Qu''est-ce qu''un calque ?', '["Un dessin","Copier la structure de la langue source","Une traduction parfaite","Une mémoire de traduction"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'En français, que met-on avant « : ; ! ? » ?', '["Rien","Un tiret","Une espace","Une virgule"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', '« 3:30 PM » s''écrit en français…', '["3 h 30","3:30 PM","15 h 30","15:30 PM"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'Pourquoi écrire le mois en lettres dans une date importante ?', '["03/04 peut être le 4 mars ou le 3 avril selon le pays","C''est plus joli","Pour allonger le texte","C''est obligatoire"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'Pour un texte grand public en malagasy, que privilégier ?', '["Des phrases très longues","Un dialecte rare","Le malagasy officiel et des phrases courtes","Le français"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'Que signifie TAO ?', '["Traduction assistée par ordinateur","Texte à ordonner","Traduction automatique obligatoire","Tarif au octet"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'Qu''est-ce qu''un segment ?', '["Un morceau de texte, souvent une phrase, traduit l''un après l''autre","Une facture","Un fichier audio","Un glossaire"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'À quoi sert un glossaire ?', '["Compter les mots","Corriger l''orthographe","Traduire toujours les mêmes termes de la même façon","Envoyer les fichiers"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'Que créer dans Matecat pour ne pas partager vos traductions ?', '["Rien","Un mot de passe Wi-Fi","Un deuxième compte","Une clé de mémoire privée"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'Que sont les balises dans un segment ?', '["Des publicités","Des fautes de frappe","Des mots à ne pas traduire","Des symboles qui représentent la mise en forme"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'Quelle ressource gratuite donne la terminologie officielle de l''Union européenne ?', '["Canva","Trello","Zoom","IATE"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'Que faire si la proposition de la traduction automatique est très mauvaise ?', '["La valider quand même","L''effacer et traduire soi-même","La corriger mot par mot pendant une heure","La signaler au client comme sa traduction"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'Quand refuser une commande ?', '["Quand le texte est court","Jamais","Quand le client est poli","Quand elle dépasse vos compétences ou votre sens de traduction"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'Votre rythme est de 1 500 mots par jour. Combien de jours de traduction pour 1 800 mots, sans la révision ?', '["10 jours","5 jours","Environ 1,2 jour","Une demi-heure"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'Que vérifier en premier dans la grille avant livraison ?', '["La date de naissance du client","Qu''aucun segment n''est oublié","Le nom du fichier uniquement","La couleur du texte"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'Quelle longueur est raisonnable pour un test de traduction gratuit ?', '["50 pages","5 000 mots","200 à 300 mots","Un livre entier"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'À quoi sert un forfait minimum ?', '["Payer moins d''impôts","Réduire le prix des gros projets","Remplacer le devis","Facturer correctement les très petites commandes"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('lang-1-f', 'Où vérifier la réputation de paiement d''une agence ?', '["Sur les forums de sites pour traducteurs comme ProZ","Sur sa propre publicité uniquement","En lui demandant si elle paie","Nulle part"]'::jsonb, 0);

-- media-0-f
delete from public.exam_questions where course_id = 'media-0-f';
delete from public.module_questions where course_id = 'media-0-f';
delete from public.lessons where course_id = 'media-0-f' and module_index >= 5;
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('media-0-f', 0, 'Le métier de monteur vidéo depuis Madagascar', 'Ce que fait un monteur, les 6 types de vidéos, vos clients, l''ordinateur nécessaire, gros fichiers et coupures.', 'YouTube, TikTok, Instagram, formations en ligne, publicités : jamais on n''a publié autant de vidéos. Derrière chacune, quelqu''un a choisi les meilleurs moments, coupé les hésitations, ajouté la musique et les sous-titres. C''est le monteur vidéo. Ce métier se pratique très bien à distance, et beaucoup de créateurs francophones cherchent un monteur fiable. Ce premier module vous montre le métier tel qu''il est vraiment.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Expliquer en une phrase ce que fait un monteur vidéo.
> 2. Citer les 6 types de vidéos les plus commandés.
> 3. Repérer vos premiers clients possibles.
> 4. Vérifier que votre ordinateur peut faire du montage.
> 5. Organiser votre travail malgré les coupures et une connexion limitée.

## Le métier de monteur vidéo en une phrase

Un monteur vidéo **transforme des heures d''images brutes en une vidéo qui retient l''attention jusqu''au bout**.

Le client vous envoie ses **rushes** : tout ce qui a été filmé, avec les erreurs, les silences et les répétitions. Vous choisissez, coupez, assemblez, ajoutez le son, la musique, les textes et les effets. Le résultat doit raconter une histoire claire, au bon rythme.

> [!definition] Rushes
> Les images et sons bruts filmés, avant montage. Pour une vidéo YouTube de 10 minutes, il y a souvent 30 minutes à 2 heures de rushes.

## Les 6 types de vidéos les plus commandés

| N° | Type | Durée habituelle | Exemple de client |
| --- | --- | --- | --- |
| 1 | **Vidéo YouTube** (« face caméra », tutoriel, vlog) | 8 à 20 min | Créateur de contenu, coach, formateur |
| 2 | **Vidéos courtes verticales** (Shorts, Reels, TikTok) | 15 à 60 s | Créateurs, marques, restaurants |
| 3 | **Vidéo publicitaire** | 15 à 60 s | Boutique, entreprise, application |
| 4 | **Cours en ligne** | 5 à 15 min par leçon | Formateur, école en ligne |
| 5 | **Podcast vidéo** et interviews | 30 à 90 min | Podcasteur, média |
| 6 | **Événements** (mariage, conférence, concert) | 3 à 30 min | Particuliers, associations, entreprises à Madagascar |

Pour commencer en télétravail, les types **1 et 2** sont les plus demandés : les créateurs publient chaque semaine et ont besoin d''un monteur **régulier**.

## Qui sont vos clients ?

### Clients à l''étranger

1. **Créateurs YouTube francophones** (France, Belgique, Canada, Afrique de l''Ouest) qui publient une ou plusieurs vidéos par semaine.
2. **Coachs et formateurs** qui transforment leurs vidéos longues en dizaines de vidéos courtes.
3. **Agences** de marketing qui sous-traitent le montage.
4. **Podcasteurs** qui veulent une version vidéo et des extraits courts.

### Clients à Madagascar

1. **Entreprises et marques** qui font de la publicité sur Facebook et TikTok.
2. **Hôtels et agences de tourisme** : vidéos de présentation.
3. **ONG** : vidéos de projets, témoignages.
4. **Événements** : mariages, concerts, conférences.
5. **Artistes** : clips musicaux.

> [!madagascar] Votre avantage
> Les créateurs francophones veulent un monteur qui comprend parfaitement le français, l''humour et les références de leurs vidéos. Avec un faible décalage horaire avec l''Europe, vous pouvez livrer « pendant la nuit » du client s''il vous envoie les rushes le soir.

## L''ordinateur du monteur

Le montage demande plus de puissance que la plupart des métiers à distance.

| Élément | Minimum pour commencer | Confortable |
| --- | --- | --- |
| Processeur | Processeur récent à 4 cœurs | 6 à 8 cœurs ou plus |
| Mémoire vive (RAM) | 8 Go | 16 Go ou plus |
| Carte graphique | Intégrée récente (pour CapCut et projets simples) | Carte graphique dédiée (pour DaVinci Resolve) |
| Stockage | Disque SSD pour le système et les logiciels | SSD + disque externe pour les rushes |
| Écran | Écran de l''ordinateur portable | Écran externe de 24 pouces |
| Son | Casque | Casque fermé de bonne qualité |

> [!astuce] Commencer avec un ordinateur modeste
> Si votre ordinateur est lent, commencez par les **vidéos courtes** avec CapCut, travaillez avec des **fichiers de travail allégés** (module 3) et économisez pour améliorer votre matériel avec vos premiers revenus.

## Travailler à distance depuis Madagascar

### 1. Les gros fichiers

Les rushes pèsent lourd : souvent plusieurs gigaoctets (Go) pour une seule vidéo.

1. Demandez au client un **lien de téléchargement** (Google Drive, Dropbox, WeTransfer).
2. Téléchargez la nuit ou pendant les heures où votre connexion est la meilleure.
3. Pour la livraison, envoyez d''abord une **version de prévisualisation légère** pour validation, puis la version finale.

### 2. Les coupures d''électricité

1. Activez l''**enregistrement automatique** du logiciel (toutes les 5 minutes).
2. Utilisez un **onduleur** : une coupure pendant un export peut corrompre un fichier.
3. Gardez une **sauvegarde** des projets sur un disque externe.

### 3. Les délais

Une vidéo YouTube de 10 minutes demande souvent **4 à 10 heures** de travail au début. Annoncez des délais avec une marge : coupures, téléchargements lents et corrections du client prennent du temps.

> [!attention] Erreurs fréquentes des débutants
> - Accepter une commande sans savoir si l''ordinateur pourra la traiter.
> - Utiliser des musiques à succès sans droits : la vidéo du client peut être bloquée ou démonétisée.
> - Promettre « livré demain » sans avoir téléchargé les rushes.
> - Ne garder aucune sauvegarde du projet.

> [!retenir]
> - Un monteur transforme des rushes en une vidéo qui retient l''attention.
> - Vidéos YouTube et vidéos courtes : les commandes les plus régulières.
> - Clients : créateurs et formateurs francophones, marques et événements à Madagascar.
> - Un ordinateur suffisant, un onduleur et des sauvegardes sont indispensables.

## Exercice pratique : analyser 3 vidéos

> [!exercice] Exercice pratique · 45 minutes
> 1. Choisissez 3 vidéos de créateurs francophones : une vidéo YouTube longue, un Short ou Reel, une publicité.
> 2. Pour chacune, notez : la durée, le nombre de coupes dans la première minute (comptez !), les textes à l''écran, la musique, les effets sonores.
> 3. Notez à quel moment vous avez eu envie d''arrêter de regarder, et pourquoi.
> 4. Vérifiez la configuration de votre ordinateur (processeur, mémoire, carte graphique, stockage) et comparez-la au tableau du module.
>
> **À livrer** : votre tableau d''analyse des 3 vidéos et la fiche de votre ordinateur.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('media-0-f', 0, 0, 'Que sont les rushes ?', '["Les sous-titres","Les vidéos déjà publiées","Les images et sons bruts filmés, avant montage","Les musiques libres de droits"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('media-0-f', 0, 1, 'Quelles commandes sont les plus régulières en télétravail ?', '["Les vidéos de surveillance","Les dessins animés longs","Les vidéos YouTube et les vidéos courtes","Les films de cinéma"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('media-0-f', 0, 2, 'Pourquoi utiliser un onduleur ?', '["Pour améliorer les couleurs","Une coupure pendant un export peut corrompre un fichier","Pour accélérer Internet","Ce n''est pas utile"]'::jsonb, 1);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('media-0-f', 1, 'Les bases : formats, rythme, coupes et son', 'Vocabulaire, résolution, orientation, cadence d''images, les 6 règles du rythme, les types de coupes, le son et les droits de la musique.', 'Avant d''ouvrir un logiciel, il faut comprendre ce qui fait un bon montage : le rythme, les coupes, le son et les formats. Ce module vous donne le vocabulaire et les règles que tout monteur professionnel utilise, avec des exemples concrets.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Utiliser le vocabulaire de base du montage.
> 2. Choisir le bon format : résolution, cadence d''images, orientation.
> 3. Appliquer les 6 règles du rythme.
> 4. Utiliser les principaux types de coupes.
> 5. Traiter le son : voix, musique, effets, niveaux.

## Le vocabulaire de base

| Terme | Définition |
| --- | --- |
| **Plan** | Un morceau de vidéo filmé sans interruption |
| **Coupe** | Le passage d''un plan à un autre |
| **Timeline** (ligne de temps) | La zone du logiciel où l''on place les plans dans l''ordre |
| **Piste** | Une ligne de la timeline : pistes vidéo (V1, V2…) et pistes audio (A1, A2…) |
| **B-roll** (plans de coupe) | Images d''illustration placées par-dessus la personne qui parle |
| **Transition** | Effet entre deux plans (fondu, glissement) |
| **Export** (ou rendu) | La création du fichier vidéo final |

## Les formats : bien les choisir dès le début

### La résolution

| Nom | Dimensions (pixels) | Usage |
| --- | --- | --- |
| **HD** (720p) | 1280 × 720 | Vidéos légères |
| **Full HD** (1080p) | 1920 × 1080 | Le standard pour YouTube et la plupart des clients |
| **4K** | 3840 × 2160 | Clients exigeants, gros ordinateur nécessaire |

### L''orientation

| Orientation | Rapport | Dimensions courantes | Usage |
| --- | --- | --- | --- |
| **Horizontale** | 16:9 | 1920 × 1080 | YouTube, cours en ligne, télévision |
| **Verticale** | 9:16 | 1080 × 1920 | TikTok, Reels, Shorts, stories |
| **Carrée** | 1:1 | 1080 × 1080 | Certaines publicités |

### La cadence d''images

> [!definition] Cadence d''images (images par seconde, i/s ou fps)
> Le nombre d''images affichées chaque seconde. 24 ou 25 i/s donne un rendu « cinéma », 30 i/s est courant sur Internet, 50 ou 60 i/s donne un mouvement très fluide (sport, jeux vidéo).

**Règle d''or** : réglez votre projet sur la **même cadence que les rushes**. Si les rushes sont à 30 i/s, le projet est à 30 i/s. Mélanger les cadences crée des saccades.

## Les 6 règles du rythme

Sur Internet, le spectateur peut partir à chaque seconde. Le rythme le retient.

1. **Les 3 premières secondes décident de tout** : commencez par le moment le plus fort, une question ou une promesse.
2. **Coupez les silences et les hésitations** (« euh », respirations longues, phrases recommencées).
3. **Changez d''image souvent** : dans une vidéo face caméra, un changement (zoom, plan de coupe, texte) toutes les 5 à 10 secondes.
4. **Adaptez au contenu** : rapide pour l''énergie et l''humour, plus lent pour l''émotion et les explications.
5. **Ne coupez pas au milieu d''une idée** : laissez la phrase se terminer.
6. **Regardez sans le son**, puis **écoutez sans l''image** : chaque version doit tenir seule.

> [!exemple] La découpe d''une phrase
> Rush : « Alors euh… aujourd''hui… non attendez. Aujourd''hui je vais vous montrer euh… trois astuces pour… pour économiser sur votre forfait. »
> Après montage : « Aujourd''hui, je vais vous montrer trois astuces pour économiser sur votre forfait. »
> Une coupe est placée à chaque hésitation. Pour la cacher, on alterne légèrement le cadrage (zoom de 10 à 15 %) ou on pose un plan de coupe par-dessus.

## Les principaux types de coupes

| Coupe | Comment | Quand l''utiliser |
| --- | --- | --- |
| **Coupe franche** | Un plan, puis l''autre, sans effet | Dans 90 % des cas |
| **Jump cut** | Coupe dans le même plan, qui fait « sauter » l''image | Vidéos YouTube face caméra, pour enlever les hésitations |
| **Coupe en L** (*L-cut*) | Le son du plan A continue sur l''image du plan B | Interviews, documentaires : fluide et naturel |
| **Coupe en J** (*J-cut*) | Le son du plan B commence avant son image | Annoncer une nouvelle scène |
| **Fondu** | Transition progressive | Passage du temps, fin de vidéo ; à utiliser rarement |

> [!attention]
> Les débutants mettent trop de **transitions** spectaculaires (étoiles, cubes qui tournent). Les professionnels utilisent surtout des coupes franches. Une transition doit avoir une raison.

## Le son : la moitié de la vidéo

Un spectateur supporte une image moyenne, mais il quitte une vidéo dont le son est mauvais.

### Les 3 types de son

1. **La voix** : la priorité, toujours claire et compréhensible.
2. **La musique** : elle crée l''ambiance, mais reste **sous** la voix.
3. **Les effets sonores** : « whoosh » sur une transition, « pop » sur un texte ; ils donnent du rythme.

### Les niveaux de volume (repères)

| Élément | Niveau habituel (repère) |
| --- | --- |
| Voix | Entre environ −12 et −6 dB sur l''indicateur du logiciel |
| Musique sous la voix | Environ −25 à −20 dB |
| Musique seule (introduction, fin) | Environ −15 à −10 dB |
| Pics maximums | Ne jamais dépasser 0 dB (le son « sature ») |

Ces valeurs sont des **repères** : écoutez toujours avec un casque **et** avec un haut-parleur de téléphone.

> [!definition] Saturation
> Un son trop fort qui dépasse le maximum : il grésille et devient désagréable. Une fois enregistré saturé, il est presque impossible à réparer.

### Les droits de la musique

1. N''utilisez **jamais** une chanson connue sans licence : la vidéo peut être bloquée ou rapporter l''argent à l''artiste.
2. Utilisez des bibliothèques **libres de droits** : la Bibliothèque audio de YouTube (gratuite), ou les musiques fournies dans CapCut pour TikTok.
3. Le client peut avoir un abonnement à une bibliothèque payante : demandez-lui.

> [!madagascar]
> Pour un clip ou une vidéo d''un artiste malgache, la musique appartient à l''artiste : vous montez avec **sa** musique et son accord. Pour une vidéo d''entreprise, ne prenez pas une chanson à la mode « parce que tout le monde le fait » : utilisez une musique libre de droits.

> [!retenir]
> - Projet réglé sur la résolution et la cadence des rushes.
> - 16:9 pour YouTube, 9:16 pour TikTok, Reels et Shorts.
> - 3 premières secondes fortes, silences coupés, changement d''image régulier.
> - Coupes franches et jump cuts surtout ; transitions rares.
> - Voix d''abord, musique dessous, jamais de saturation, jamais de musique sans droits.

## Exercice pratique : découper au papier

> [!exercice] Exercice pratique · 1 heure
> 1. Filmez-vous 2 minutes avec votre téléphone en expliquant un sujet que vous connaissez, sans préparation.
> 2. Regardez la vidéo et notez à quelle seconde se trouvent toutes les hésitations, silences et phrases recommencées.
> 3. Écrivez le texte « propre » après montage, comme dans l''exemple.
> 4. Notez où vous placeriez 4 plans de coupe et 3 textes à l''écran.
> 5. Choisissez 2 musiques dans la Bibliothèque audio de YouTube qui conviendraient.
>
> **À livrer** : votre vidéo brute, votre liste de coupes avec les temps, le texte final et vos idées de plans de coupe, textes et musiques.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('media-0-f', 1, 0, 'Quel format pour TikTok, Reels et Shorts ?', '["Carré 1:1, 500 × 500","Vertical 9:16, 1080 × 1920","Horizontal 16:9, 1920 × 1080","4:3, 640 × 480"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('media-0-f', 1, 1, 'Quelle cadence choisir pour le projet ?', '["Toujours 24 i/s","La même que celle des rushes","N''importe laquelle","Toujours 60 i/s"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('media-0-f', 1, 2, 'Peut-on utiliser une chanson connue sans licence ?', '["Oui, si elle est courte","Oui, sur TikTok uniquement","Oui, si on cite l''artiste","Non, la vidéo peut être bloquée ou démonétisée"]'::jsonb, 3);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('media-0-f', 2, 'Les outils : DaVinci Resolve, CapCut, et les logiciels payants', 'Arborescence de projet, les pages de DaVinci Resolve, montage en 8 étapes, raccourcis, CapCut, export, puis Premiere Pro, Final Cut Pro et Resolve Studio.', 'Bonne nouvelle : vous pouvez devenir monteur professionnel avec des logiciels gratuits. **DaVinci Resolve** est utilisé jusque dans le cinéma, et **CapCut** est devenu l''outil de référence pour les vidéos courtes. Ce module vous les fait prendre en main, vous montre comment organiser vos fichiers et exporter correctement, puis vous présente les logiciels payants que demandent certains clients.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Organiser les fichiers d''un projet avec une arborescence standard.
> 2. Monter une vidéo dans DaVinci Resolve : importer, couper, ajouter son et textes.
> 3. Utiliser les raccourcis de base du montage.
> 4. Monter une vidéo verticale avec sous-titres dans CapCut.
> 5. Exporter au bon format pour YouTube et les réseaux sociaux.
> 6. Savoir quand passer à Premiere Pro, Final Cut Pro ou DaVinci Resolve Studio.

## Les outils gratuits

| N° | Outil | Pour quoi |
| --- | --- | --- |
| 1 | **DaVinci Resolve** (version gratuite) | Montage complet, étalonnage des couleurs, son, export : vidéos longues et projets clients |
| 2 | **CapCut** (ordinateur et téléphone) | Vidéos courtes verticales, sous-titres, effets à la mode |
| 3 | **Bibliothèque audio de YouTube** | Musiques et effets sonores libres de droits |
| 4 | **Google Drive** ou **Dropbox** | Recevoir les rushes, livrer les vidéos |
| 5 | **HandBrake** | Compresser une vidéo pour l''envoyer plus facilement |

## Organiser les fichiers d''un projet

Un projet mal rangé, c''est des fichiers « hors ligne » et des heures perdues. Créez cette arborescence pour **chaque** projet :

```
2026-03-14 - Client Dupont - Vidéo 12
├── 01 Rushes (vidéos brutes du client)
├── 02 Audio (voix, musiques, effets)
├── 03 Images (logos, photos, captures)
├── 04 Projet (fichier DaVinci ou CapCut)
└── 05 Exports (versions envoyées au client)
```

> [!attention]
> Ne déplacez **jamais** les rushes après les avoir importés dans le logiciel : le projet ne les retrouvera plus (fichiers « hors ligne »). Rangez tout **avant** de commencer.

## DaVinci Resolve : la prise en main

### Les pages du logiciel

DaVinci Resolve est organisé en **pages**, accessibles en bas de l''écran :

| Page | À quoi elle sert |
| --- | --- |
| **Media** | Importer et ranger les fichiers |
| **Cut** | Montage rapide |
| **Edit** | Montage complet et précis (la page principale) |
| **Fusion** | Effets visuels et animations |
| **Color** | Étalonnage : corriger et harmoniser les couleurs |
| **Fairlight** | Travail du son |
| **Deliver** | Exporter la vidéo |

### Monter une vidéo en 8 étapes

1. **Créez un projet** et réglez-le (**Paramètres du projet**) : résolution et cadence identiques à celles des rushes.
2. Dans la page **Media**, importez les dossiers Rushes, Audio et Images.
3. Passez dans la page **Edit** et glissez le rush principal dans la timeline.
4. **Coupez** les hésitations et les silences (raccourcis ci-dessous), puis supprimez les morceaux inutiles.
5. Ajoutez les **plans de coupe** sur la piste V2, au-dessus de la personne qui parle.
6. Ajoutez la **musique** sur une piste audio séparée et baissez son volume sous la voix.
7. Ajoutez les **textes** (titres, mots-clés à l''écran) depuis la bibliothèque d''effets (*Titles*).
8. Regardez la vidéo **entière** du début à la fin avant d''exporter.

### Les raccourcis de base

| Touche | Action |
| --- | --- |
| **Espace** | Lecture / pause |
| **J, K, L** | Reculer / pause / avancer (appuyer plusieurs fois accélère) |
| **I** et **O** | Marquer le début et la fin d''un passage |
| **B** | Outil lame, pour couper |
| **A** | Outil de sélection |
| **Ctrl + B** (ou **Ctrl + \** selon la version) | Couper le plan à la position du curseur |
| **Maj + Suppr** | Supprimer et refermer le trou (*ripple delete*) |
| **Ctrl + Z** | Annuler |

Apprendre ces raccourcis, c''est diviser par deux le temps de montage. Les raccourcis peuvent varier selon les versions : vérifiez-les dans le menu des raccourcis clavier du logiciel.

> [!astuce] Les fichiers de travail allégés
> Si votre ordinateur rame, demandez à DaVinci Resolve de créer des **médias optimisés** ou des **proxys** (clic droit sur les rushes). Le logiciel travaille avec des copies légères, puis utilise les originaux pour l''export final.

### L''étalonnage de base

Dans la page **Color**, corrigez au minimum :

1. L''**exposition** : ni trop sombre ni trop clair.
2. La **balance des blancs** : un mur blanc doit paraître blanc, pas jaune ni bleu.
3. L''**harmonie** entre les plans : tous doivent avoir des couleurs proches.

## CapCut : les vidéos courtes

### Monter un Short ou un Reel en 7 étapes

1. Créez un projet au format **9:16**.
2. Importez la vidéo (ou les extraits de la vidéo longue du client).
3. Coupez pour ne garder que **15 à 60 secondes** fortes, avec une accroche dans les 2 premières secondes.
4. Générez les **sous-titres automatiques**, puis **corrigez chaque mot** (les erreurs sont fréquentes, surtout sur les noms propres).
5. Choisissez un style de sous-titres lisible : gros, contrasté, au centre ou au tiers bas de l''écran.
6. Ajoutez musique et effets sonores.
7. Exportez en **1080 × 1920**.

> [!definition] Sous-titres incrustés
> Des sous-titres qui font partie de l''image. Sur les réseaux sociaux, une grande partie des vidéos est regardée **sans le son** : les sous-titres sont indispensables.

Selon les versions et les pays, certaines fonctions de CapCut passent en offre payante : vérifiez ce qui est inclus dans la version gratuite.

## Exporter correctement

| Destination | Format | Résolution | Codec habituel |
| --- | --- | --- | --- |
| YouTube | MP4 | 1920 × 1080 (ou 4K) | H.264 |
| TikTok, Reels, Shorts | MP4 | 1080 × 1920 | H.264 |
| Version de validation pour le client | MP4 léger | 1280 × 720 | H.264, débit réduit |

Dans DaVinci Resolve, la page **Deliver** propose des réglages tout prêts (par exemple « YouTube ») : c''est un bon point de départ.

> [!definition] Codec
> La méthode de compression de la vidéo. **H.264** est le plus utilisé : bonne qualité, fichier raisonnable, lu partout.

## Quand passer aux logiciels payants ?

| Logiciel | Ce qu''il apporte | Points à connaître |
| --- | --- | --- |
| **Adobe Premiere Pro** | Logiciel standard dans beaucoup d''agences ; échange facile avec After Effects et Photoshop | Abonnement mensuel ou annuel ; Windows et Mac |
| **Final Cut Pro** | Montage très rapide et fluide | Uniquement sur Mac ; achat en une fois |
| **DaVinci Resolve Studio** | Toutes les fonctions de la version gratuite, plus des outils avancés (réduction de bruit, effets, accélération matérielle selon les configurations) | Achat en une fois |

Les prix changent : vérifiez-les sur les sites officiels. **Ne payez que si un client l''exige** (certaines agences demandent de rendre un projet Premiere Pro) ou si une fonction vous fait vraiment gagner du temps. La version gratuite de DaVinci Resolve suffit pour la grande majorité des projets de débutant.

> [!madagascar]
> Ces logiciels se paient par carte bancaire internationale. DaVinci Resolve Studio et Final Cut Pro s''achètent **une seule fois**, ce qui évite un abonnement à payer chaque mois en devises.

> [!retenir]
> - Une arborescence de projet identique, rangée avant d''importer.
> - DaVinci Resolve : pages Media, Edit, Color, Fairlight, Deliver ; les raccourcis J, K, L, I, O, B.
> - CapCut pour les vidéos verticales, avec sous-titres corrigés à la main.
> - Export MP4 en H.264, aux dimensions de la destination.
> - Les logiciels payants seulement quand un client ou un vrai besoin l''exige.

## Exercice pratique : vos deux premiers montages

> [!exercice] Exercice pratique · 2 heures 30
> 1. Installez DaVinci Resolve et CapCut sur votre ordinateur.
> 2. Créez l''arborescence de projet pour votre vidéo de 2 minutes du module 2.
> 3. Dans DaVinci Resolve, montez-la : coupez toutes les hésitations, ajoutez 3 plans de coupe, une musique libre de droits et 2 textes, puis corrigez les couleurs.
> 4. Exportez en 1080p pour YouTube.
> 5. Dans CapCut, faites-en une version verticale de 30 secondes avec sous-titres corrigés.
>
> **À livrer** : les deux vidéos exportées et une capture de votre timeline DaVinci Resolve.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('media-0-f', 2, 0, 'Que se passe-t-il si on déplace les rushes après les avoir importés ?', '["La vidéo s''exporte plus vite","Rien","Les couleurs changent","Le projet ne les retrouve plus (fichiers hors ligne)"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('media-0-f', 2, 1, 'Dans DaVinci Resolve, quelle page sert à exporter ?', '["Color","Media","Fusion","Deliver"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('media-0-f', 2, 2, 'Quel logiciel payant fonctionne uniquement sur Mac ?', '["Adobe Premiere Pro","DaVinci Resolve Studio","CapCut","Final Cut Pro"]'::jsonb, 3);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('media-0-f', 3, 'Premier projet : une vidéo YouTube et 3 vidéos courtes', 'Brief en 10 questions, montage en 7 passes, introduction, extraits verticaux, retours avec repères de temps et grille de 12 points.', 'Dans ce module, vous traitez une vraie commande de créateur : une vidéo YouTube de 8 minutes et 3 vidéos courtes tirées de cette vidéo, à partir des rushes. Vous suivez toutes les étapes d''un monteur professionnel, du brief à la version finale, en passant par les retours du client.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Recueillir un brief de montage complet.
> 2. Mener un montage en 7 passes, de l''ours à l''export.
> 3. Choisir les meilleurs extraits pour des vidéos courtes.
> 4. Recevoir et traiter les retours du client avec des repères de temps.
> 5. Vérifier une vidéo avec une grille de 12 points avant livraison.

## Le cas pratique : la chaîne « Vola Malina »

> [!exemple] Votre client
> **Tiana** anime la chaîne YouTube « Vola Malina » : des conseils d''argent pour les jeunes francophones (épargne, budget, Mobile Money). Il publie une vidéo chaque mardi. Il vous envoie **45 minutes de rushes** filmés face caméra pour une vidéo intitulée « 5 erreurs qui vident votre compte chaque mois », plus 10 images d''illustration et son logo. Il veut aussi **3 vidéos courtes** pour TikTok et Reels.

## Le brief de montage

Avant de commencer, posez ces 10 questions (ou envoyez-les par écrit) :

1. Quelle **durée** pour la vidéo finale ?
2. Quel **style** ? Donnez-moi 1 ou 2 vidéos de référence que vous aimez.
3. Quel **rythme** ? Très dynamique, ou posé ?
4. Faut-il des **sous-titres** ? Incrustés ou en fichier séparé ?
5. Quelles **couleurs et polices** pour les textes (charte de la chaîne) ?
6. Avez-vous une **musique** ou une bibliothèque musicale ?
7. Y a-t-il une **introduction** et une **fin** (générique, logo, appel à s''abonner) standard ?
8. Quels passages sont **à garder absolument** ou **à couper** ?
9. Quelle **date de livraison**, et combien de **tours de retours** ?
10. Qui fait la **miniature** et le texte de description ?

> [!astuce]
> Les vidéos de référence valent mieux que de longues explications. Regardez-les avec attention : rythme des coupes, style des textes, effets sonores, musique. Votre premier montage sera beaucoup plus proche de ce que le client imagine.

## Le montage en 7 passes

Un monteur ne fait pas tout en une seule fois : il repasse plusieurs fois sur la vidéo, avec un objectif différent à chaque passe.

| N° | Passe | Objectif | Durée de la vidéo après la passe (exemple) |
| --- | --- | --- | --- |
| 1 | **Dérushage** | Regarder les rushes, marquer les bonnes prises, noter les meilleurs passages | 45 min de rushes |
| 2 | **Ours** (premier assemblage) | Mettre les bonnes prises dans l''ordre, couper les grosses erreurs | 15 min |
| 3 | **Montage serré** | Couper tous les silences, hésitations, répétitions ; vérifier la logique | 8 min 30 |
| 4 | **Habillage** | Plans de coupe, textes, zooms, effets sonores, logo | 8 min 30 |
| 5 | **Son** | Niveaux de voix, réduction du bruit, musique, fondus | 8 min 30 |
| 6 | **Couleur** | Exposition, balance des blancs, harmonie | 8 min 30 |
| 7 | **Vérification et export** | Grille de 12 points, export de validation | 8 min 30 |

> [!definition] Dérushage
> Le visionnage complet des rushes pour repérer les bonnes prises, les erreurs et les moments forts. On note les repères de temps (« 12:35 – très bonne explication de l''erreur n° 3 »). C''est une étape souvent négligée, mais elle fait gagner beaucoup de temps.

### L''introduction : les 30 premières secondes

1. **0 à 5 secondes** : l''accroche, la phrase la plus forte (« Chaque mois, ces 5 erreurs vous coûtent plus que votre forfait internet. »).
2. **5 à 20 secondes** : la promesse (« Dans cette vidéo, je vous montre comment les éviter, avec un exemple chiffré. »).
3. **20 à 30 secondes** : le titre de la chaîne ou le générique court, puis directement la première erreur.

N''y mettez pas de long générique : beaucoup de spectateurs partent avant qu''il soit fini.

## Les vidéos courtes tirées de la vidéo longue

### Choisir les bons extraits

Un bon extrait de 30 à 60 secondes :

1. **Se comprend seul**, sans avoir vu la vidéo longue.
2. Commence par une **accroche** forte dans les 2 premières secondes.
3. Contient **une seule idée** complète.
4. Se termine sur une phrase qui donne envie d''en savoir plus.

> [!exemple] 3 extraits pour « Vola Malina »
> 1. **« L''erreur que tout le monde fait le jour de la paie »** (de 03:12 à 03:58 dans la vidéo longue).
> 2. **« Le calcul qui fait peur : vos petits achats sur un an »** (de 05:40 à 06:25).
> 3. **« La règle 50-30-20 en 40 secondes »** (de 07:05 à 07:45).

### Adapter au format vertical

1. **Recadrez** sur le visage : la personne doit rester au centre.
2. Ajoutez des **sous-titres** gros et lisibles.
3. Ajoutez un **titre** en haut les 2 ou 3 premières secondes.
4. Laissez de la marge en bas et à droite : les boutons des applications cachent cette zone.

## Recevoir et traiter les retours

Envoyez une **version de validation** légère (720p) avec un message clair :

« Bonjour Tiana, voici la V1 de "5 erreurs qui vident votre compte" (8 min 30) : [lien]. Pouvez-vous m''envoyer vos retours avec le **repère de temps** de chaque remarque, par exemple : "02:15 – couper cette phrase" ? Je les intègre sous 24 h. »

### Un tableau de retours

| Repère | Retour du client | Statut |
| --- | --- | --- |
| 00:04 | Accroche trop longue, commencer à « Chaque mois » | Fait |
| 02:15 | Couper la phrase sur la banque | Fait |
| 05:10 | Ajouter le texte « 365 × 2 000 Ar = 730 000 Ar » | Fait |
| 07:50 | Musique trop forte | Fait |

Traitez **chaque** retour, cochez-le, et renvoyez une V2 avec le tableau. Le client voit que rien n''a été oublié.

## La grille de vérification en 12 points

| N° | Point à vérifier | Oui / Non |
| --- | --- | --- |
| 1 | L''accroche est dans les 5 premières secondes | |
| 2 | Plus aucun silence ni hésitation gênante | |
| 3 | Aucun saut d''image involontaire (fin de phrase coupée, image noire) | |
| 4 | Textes sans faute d''orthographe | |
| 5 | Sous-titres corrigés mot par mot | |
| 6 | Voix claire, jamais couverte par la musique | |
| 7 | Aucune saturation du son | |
| 8 | Couleurs harmonisées entre les plans | |
| 9 | Musiques et images libres de droits ou fournies par le client | |
| 10 | Logo et fin conformes à la charte | |
| 11 | Format et résolution conformes (16:9 ou 9:16, 1080p) | |
| 12 | Vidéo regardée entièrement, une fois avec casque et une fois sur téléphone | |

> [!attention] Erreurs fréquentes des débutants
> - Sauter le dérushage et chercher les bonnes prises pendant le montage.
> - Envoyer une version finale lourde avant la validation.
> - Laisser des fautes dans les textes à l''écran.
> - Oublier un retour du client dans la V2.
> - Ne regarder la vidéo que par morceaux avant de l''envoyer.

> [!retenir]
> - Un brief complet avec des vidéos de référence.
> - 7 passes : dérushage, ours, montage serré, habillage, son, couleur, vérification.
> - Les 30 premières secondes : accroche, promesse, entrée rapide dans le sujet.
> - Des extraits courts qui se comprennent seuls, au format vertical.
> - Des retours avec repères de temps, traités un par un.

## Exercice pratique : la commande « Vola Malina »

> [!exercice] Exercice pratique · 5 heures
> 1. Filmez-vous (ou filmez un proche) 20 à 30 minutes en expliquant 5 conseils sur un sujet que vous connaissez : ce seront vos rushes.
> 2. Rédigez le brief en répondant vous-même aux 10 questions.
> 3. Faites le dérushage avec une liste de repères de temps.
> 4. Montez la vidéo de 6 à 8 minutes en 7 passes, dans DaVinci Resolve.
> 5. Créez 3 vidéos courtes verticales avec sous-titres dans CapCut.
> 6. Demandez à un proche de faire 5 retours avec repères de temps, traitez-les et remplissez la grille de 12 points.
>
> **À livrer** : le brief, la liste de dérushage, la vidéo finale, les 3 vidéos courtes, le tableau des retours et la grille. C''est votre projet de portfolio.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('media-0-f', 3, 0, 'Qu''est-ce que le dérushage ?', '["Regarder tous les rushes et noter les bonnes prises","Exporter la vidéo","Supprimer tous les rushes","Ajouter la musique"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('media-0-f', 3, 1, 'Où placer l''accroche d''une vidéo YouTube ?', '["À la fin","Dans les 5 premières secondes","Au milieu","Après le générique de 1 minute"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('media-0-f', 3, 2, 'Comment le client doit-il envoyer ses retours ?', '["Il ne doit pas en envoyer","Avec le repère de temps de chaque remarque","Par appel sans notes","En une phrase générale"]'::jsonb, 1);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('media-0-f', 4, 'Trouver des clients et se faire payer', 'Bande démo, portfolio avant / après, 5 canaux, prix et forfaits, devis, livraison de gros fichiers, paiements et fidélisation.', 'Un créateur qui trouve un bon monteur le garde longtemps : il publie chaque semaine et n''a pas envie de tout réexpliquer à quelqu''un de nouveau. Ce dernier module vous montre comment présenter votre travail, trouver vos premiers clients, fixer vos prix et organiser les échanges de gros fichiers et les paiements depuis Madagascar.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Construire une bande démo et un portfolio de monteur.
> 2. Trouver des clients grâce à 5 canaux, avec un message de prospection prêt à l''emploi.
> 3. Calculer le prix d''une vidéo et d''un forfait mensuel.
> 4. Rédiger un devis avec les tours de retours et les conditions.
> 5. Livrer de gros fichiers et vous faire payer depuis Madagascar.
> 6. Fidéliser un créateur.

## La bande démo et le portfolio

### La bande démo

> [!definition] Bande démo (ou *showreel*)
> Une vidéo de 30 à 90 secondes qui montre vos meilleurs moments de montage, à la suite, sur une musique rythmée. C''est la première chose qu''un client regarde.

1. Gardez **seulement les meilleurs passages** : 2 à 5 secondes chacun.
2. Montrez de la **variété** : face caméra, vidéos courtes, publicité, événement.
3. Commencez et finissez par **vos plans les plus forts**.
4. Terminez par votre **nom**, votre métier et votre contact.

### Le portfolio

1. **3 à 5 vidéos complètes** : votre projet « Vola Malina » (module 4), une publicité, un clip ou une vidéo d''événement.
2. Pour chaque vidéo : le **brief**, ce que vous avez fait, et le **résultat** si vous l''avez (vues, durée moyenne de visionnage).
3. Une version **avant / après** : 20 secondes de rushes, puis le même passage monté. Rien ne montre mieux votre travail.

Publiez-le sur une chaîne **YouTube** (vidéos non répertoriées si besoin) ou sur **Vimeo**, avec une page qui regroupe les liens.

## Où trouver des clients : 5 canaux

| N° | Canal | Pour qui | Comment s''y prendre |
| --- | --- | --- | --- |
| 1 | **Créateurs YouTube francophones** | Vidéos chaque semaine | Contactez des chaînes de 5 000 à 100 000 abonnés qui publient régulièrement ; proposez un extrait monté gratuitement |
| 2 | **Plateformes de freelance** (Fiverr, Upwork, plateformes francophones) | Clients internationaux | Offre précise : « Montage de votre vidéo YouTube de 10 minutes, livré en 48 h » ; vérifiez que la plateforme accepte les freelances basés à Madagascar |
| 3 | **Groupes de créateurs** (Facebook, Discord) | Créateurs qui cherchent un monteur | Participez, aidez, montrez votre travail |
| 4 | **Entreprises et marques à Madagascar** | Publicités, vidéos de présentation | Montrez une publicité avant/après pour une marque locale |
| 5 | **Agences de communication et de production** | Sous-traitance | Proposez de les aider sur les montages en période chargée |

### Le message de prospection, prêt à l''emploi

> [!exemple] Message à une créatrice YouTube
> « Bonjour Laura, je regarde votre chaîne de cuisine depuis quelques mois, j''adore votre vidéo sur les sauces. Je suis monteur vidéo et j''ai remarqué que vous ne publiez pas encore de Shorts : votre vidéo sur la mayonnaise ratée contient au moins 3 passages parfaits pour ça. Je me suis permis d''en monter un pour vous montrer : [lien]. Si ça vous plaît, je peux vous proposer un forfait vidéo longue + 3 Shorts par semaine. Bonne journée ! »

Un **exemple réel monté pour le client** convainc bien plus qu''un long message. Ne le faites que sur un court extrait (moins de 30 minutes de travail).

## Calculer ses prix

### Étape 1 : votre prix horaire

1. **Revenu mensuel visé** (exemple : 1 500 000 Ar) ÷ **heures facturables** (exemple : 100 h) = **15 000 Ar de l''heure**.

### Étape 2 : le temps par type de vidéo

Mesurez votre temps réel sur vos exercices. Au début, voici des ordres de grandeur :

| Vidéo | Temps estimé (débutant) | Exemple de prix (15 000 Ar/h) |
| --- | --- | --- |
| Vidéo courte de 30 à 60 s, avec sous-titres | 1 h | 15 000 Ar |
| Vidéo YouTube de 8 à 10 min, face caméra | 6 h | 90 000 Ar |
| Publicité de 30 s, avec habillage soigné | 5 h | 75 000 Ar |
| Vidéo d''événement de 5 min | 8 h | 120 000 Ar |

### Étape 3 : le forfait mensuel

> [!exemple] Forfait « Créateur »
> 4 vidéos YouTube + 12 vidéos courtes par mois = (4 × 6 h) + (12 × 1 h) = 36 h, soit **540 000 Ar par mois** (exemple), payé en début de mois.

Ces prix sont des **exemples** à adapter à votre niveau et à vos clients. Pour les clients étrangers, fixez vos prix en euros ou en dollars, adaptés à leur marché. Avec l''expérience et des modèles (intros, styles de textes enregistrés), vous travaillerez plus vite.

## Le devis et les conditions

1. **Ce qui est livré** : nombre de vidéos, durée, format, sous-titres.
2. **Ce qui n''est pas inclus** : tournage, miniature, achat de musique, traduction.
3. **Le délai** à partir de la réception de **tous** les rushes.
4. **Le nombre de tours de retours** (souvent 2) ; au-delà, facturé en plus.
5. **Le prix** et les conditions : 50 % à la commande et 50 % à la livraison, ou forfait mensuel payé d''avance.
6. **La livraison** : la version finale en haute qualité est envoyée **après le paiement** du solde ; avant, le client reçoit des versions de validation légères ou avec un filigrane.
7. **Les fichiers de projet** (DaVinci, Premiere) : inclus ou non, à préciser.

## Livrer de gros fichiers depuis Madagascar

| Besoin | Solution |
| --- | --- |
| Envoyer une version de validation | MP4 720p léger, compressé avec HandBrake ; lien Google Drive |
| Envoyer la version finale | Google Drive, Dropbox ou WeTransfer, envoi la nuit si votre connexion est meilleure |
| Envoyer à une plateforme de freelance | Directement sur la plateforme, ou lien de téléchargement dans le message de livraison |
| Recevoir les rushes | Demander un lien de dossier partagé, avec les fichiers d''origine |

> [!astuce]
> Prévenez le client du **temps d''envoi** quand il est long : « La version finale fait 3 Go, l''envoi prendra environ 2 heures, vous l''aurez avant 10 h (heure de Paris). »

## Se faire payer

| Situation | Moyens de paiement |
| --- | --- |
| Client local | Mobile Money (MVola, Orange Money, Airtel Money) ou virement bancaire |
| Plateforme internationale | Retrait selon la plateforme : souvent Payoneer ou virement vers une banque malgache |
| Client étranger en direct | Virement international ou Payoneer |

> [!madagascar]
> Les possibilités de PayPal sont limitées pour Madagascar : vérifiez avant de le proposer. Gardez une trace de chaque paiement et renseignez-vous sur le NIF et la carte statistique auprès du centre fiscal de votre ville.

## Fidéliser un créateur

1. **Livrez toujours à l''heure**, chaque semaine.
2. Créez une **fiche de style** du client : polices, couleurs, effets sonores, intro, fin. Il n''a jamais à répéter ses préférences.
3. **Regardez les statistiques** de ses vidéos avec lui (durée moyenne de visionnage) et proposez des améliorations.
4. **Proposez des idées** : nouveaux formats courts, nouvelles intros.
5. **Demandez un avis** et une recommandation après 2 ou 3 mois réussis.

> [!retenir]
> - Une bande démo courte et un portfolio avec un avant / après.
> - Un extrait monté pour le client convainc mieux qu''un long message.
> - Prix = temps réel × prix horaire ; un forfait mensuel pour les créateurs réguliers.
> - Un devis avec délai, tours de retours, 50 % d''acompte et version finale après paiement.
> - Des envois de gros fichiers organisés et annoncés.

## Exercice pratique : lancer votre activité

> [!exercice] Exercice pratique · 3 heures
> 1. Montez votre bande démo de 30 à 60 secondes.
> 2. Créez votre page de portfolio avec 3 vidéos et un avant / après.
> 3. Calculez vos prix et un forfait « Créateur ».
> 4. Rédigez votre modèle de devis avec les 7 points.
> 5. Choisissez 3 créateurs francophones, montez un court extrait de leur vidéo et envoyez au moins un message de prospection pour de vrai.
>
> **À livrer** : votre bande démo, le lien du portfolio, vos prix, votre devis et vos 3 messages.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('media-0-f', 4, 0, 'Quelle durée pour une bande démo ?', '["1 heure","5 secondes","10 minutes","30 à 90 secondes"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('media-0-f', 4, 1, 'Quand envoyer la version finale en haute qualité ?', '["Jamais","Avant tout paiement","Avant même le montage","Après le paiement du solde"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('media-0-f', 4, 2, 'Un forfait de 36 heures à 15 000 Ar de l''heure coûte…', '["150 000 Ar","36 000 Ar","5 400 000 Ar","540 000 Ar"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Quel est le rôle d''un monteur vidéo ?', '["Réparer les caméras","Filmer les vidéos","Écrire les scénarios uniquement","Transformer des rushes en une vidéo qui retient l''attention"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Quelle mémoire vive minimum pour commencer le montage ?', '["512 Mo","1 Go","Aucune","8 Go"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Comment recevoir des rushes lourds ?', '["Par un lien de téléchargement (Drive, Dropbox, WeTransfer)","Par e-mail en pièce jointe de 10 Go","Par WhatsApp vocal","Par SMS"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Qu''est-ce que le B-roll ?', '["La musique de fond","Un bug du logiciel","Des images d''illustration placées par-dessus la personne qui parle","La deuxième caméra"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Quelle résolution est le standard pour YouTube ?', '["8K obligatoire","Full HD 1920 × 1080","640 × 480","320 × 240"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Dans une vidéo face caméra, tous les combien changer d''image ?', '["Toutes les 5 à 10 secondes","À chaque mot","Jamais","Toutes les 5 minutes"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Qu''est-ce qu''un jump cut ?', '["Une transition en forme d''étoile","Un saut en parachute filmé","Un effet sonore","Une coupe dans le même plan qui fait sauter l''image"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Dans une coupe en L…', '["L''image devient noire","Le son du plan A continue sur l''image du plan B","Le son est coupé","On ajoute un fondu"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Quelle coupe utilise-t-on dans la grande majorité des cas ?', '["La coupe franche","La transition en cube","Le volet","Le fondu enchaîné"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Quel élément du son est prioritaire ?', '["Les effets sonores","Le bruit de fond","La voix","La musique"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Qu''est-ce que la saturation du son ?', '["Un son trop fort qui grésille","Un format de fichier","Une musique libre de droits","Un son trop faible"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Où trouver des musiques libres de droits gratuites ?', '["Les clips d''artistes connus","La Bibliothèque audio de YouTube","N''importe quel site","Les chansons du moment à la radio"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Dans DaVinci Resolve, quelle page sert à corriger les couleurs ?', '["Cut","Media","Deliver","Color"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Que font les touches J, K, L ?', '["Ouvrir, fermer, enregistrer","Couper, copier, coller","Reculer, pause, avancer","Zoomer, dézoomer, exporter"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Que faire si l''ordinateur rame pendant le montage ?', '["Utiliser des médias optimisés ou des proxys","Exporter en 8K","Supprimer les rushes","Ajouter plus d''effets"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Pourquoi les sous-titres sont-ils indispensables sur les réseaux sociaux ?', '["Ils sont obligatoires par la loi","Ils rendent la vidéo plus courte","Beaucoup de vidéos sont regardées sans le son","Ils remplacent la musique"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Que faire après avoir généré des sous-titres automatiques ?', '["Les traduire en anglais","Les supprimer","Corriger chaque mot","Les publier sans relire"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Quel codec est le plus utilisé pour l''export web ?', '["MP3","JPEG","H.264","ZIP"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Quand acheter un logiciel de montage payant ?', '["Quand un client l''exige ou qu''un vrai besoin le justifie","Chaque mois, pour chaque client","Jamais, sous aucun prétexte","Avant même d''apprendre"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Qu''est-ce que l''ours en montage ?', '["Le premier assemblage des bonnes prises","Le logo du client","La version finale","Un effet spécial"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Qu''est-ce qu''un bon extrait pour une vidéo courte ?', '["Un passage pris au hasard","Un passage qui se comprend seul, avec une seule idée et une accroche","La fin de la vidéo sans contexte","Le générique de début"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Pourquoi laisser de la marge en bas et à droite d''une vidéo verticale ?', '["Ce n''est pas utile","Les boutons des applications cachent cette zone","Pour mettre une publicité","Pour économiser des données"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Quelle version envoyer pour la validation ?', '["Le fichier de projet","Les rushes complets","Une version légère en 720p","Une version 8K"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Combien de tours de retours prévoit-on souvent dans un devis ?', '["0","20","2","Illimités"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('media-0-f', 'Qu''est-ce qu''une fiche de style client ?', '["Sa liste de vidéos préférées sur Netflix","Sa fiche de paie","Son contrat de travail","Un document avec ses polices, couleurs, effets, intro et fin"]'::jsonb, 3);

-- mkt-0-a
delete from public.exam_questions where course_id = 'mkt-0-a';
delete from public.module_questions where course_id = 'mkt-0-a';
delete from public.lessons where course_id = 'mkt-0-a' and module_index >= 5;
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('mkt-0-a', 0, 'Se spécialiser et construire une stratégie', 'Spécialité par secteur ou par réseau, piliers de contenu, objectifs liés aux ventes, liens suivis, veille et stratégie en 8 parties.', 'Au niveau Fondamentaux, vous avez appris à faire vivre une page. Au niveau Avancé, vous devenez le **stratège** des réseaux sociaux d''une marque : vous choisissez un secteur où vous excellez, vous construisez une stratégie de contenu complète et vous vendez des résultats plutôt que des publications. Ce module vous aide à choisir votre spécialité et à bâtir une stratégie solide.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Choisir une spécialité par secteur ou par réseau.
> 2. Construire une stratégie de contenu avec des piliers.
> 3. Fixer des objectifs liés aux résultats de l''entreprise.
> 4. Organiser une veille et une écoute des réseaux sociaux.
> 5. Présenter une stratégie au client en 8 parties.

## Choisir sa spécialité

### Deux façons de se spécialiser

| Spécialisation | Exemples | Avantage |
| --- | --- | --- |
| **Par secteur** | Restauration, tourisme, beauté, immobilier, écoles, ONG | Vous connaissez les clients, le vocabulaire, les saisons fortes |
| **Par réseau** | TikTok et vidéo courte, LinkedIn pour les entreprises, Instagram pour la mode | Vous maîtrisez les formats et les tendances d''un réseau mieux que personne |

> [!exemple] Des spécialités qui se vendent bien
> - « Community manager des restaurants et snacks d''Antananarivo » : menus, plats du jour, livraisons, avis.
> - « Community manager LinkedIn pour dirigeants et cabinets de conseil francophones » : publications professionnelles, image de dirigeant.
> - « Community manager tourisme océan Indien » : hôtels, lodges, guides, saisons touristiques.

### Vérifier qu''une spécialité est viable : 4 questions

1. Y a-t-il **assez de clients** possibles (au moins une centaine que vous pourriez contacter) ?
2. Ont-ils un **budget** pour un community manager ?
3. Les réseaux sociaux ont-ils un **impact direct** sur leurs ventes ?
4. Avez-vous déjà **un projet** ou une expérience dans ce secteur ?

## La stratégie de contenu

Au niveau avancé, on ne remplit plus un calendrier « au jour le jour ». On construit une **stratégie** qui guide toutes les publications pendant 3 à 6 mois.

> [!definition] Piliers de contenu
> Les 3 à 5 grands thèmes sur lesquels la marque publie régulièrement. Chaque publication appartient à un pilier. Ils donnent une identité claire à la page et facilitent la création.

> [!exemple] Les piliers d''un hôtel à Nosy Be
>
> | Pilier | Objectif | Exemples de contenus | Part |
> | --- | --- | --- | --- |
> | **L''expérience** | Faire rêver | Couchers de soleil, chambres, plage, Reels d''ambiance | 35 % |
> | **La destination** | Aider à préparer le voyage | Que faire à Nosy Be, saisons, excursions | 25 % |
> | **Les gens** | Créer un lien humain | Portraits de l''équipe, savoir-faire local | 15 % |
> | **La preuve** | Rassurer | Avis de clients, photos partagées par les voyageurs | 15 % |
> | **L''offre** | Faire réserver | Promotions, forfaits, dates disponibles | 10 % |

### Construire les piliers en 5 étapes

1. **Relisez la fiche client type** et ses questions (Fondamentaux, module 2).
2. **Analysez** les 20 publications les plus réussies de la page et de 3 concurrents : de quoi parlent-elles ?
3. **Regroupez** ces sujets en 3 à 5 thèmes.
4. **Donnez un objectif** à chaque pilier : faire connaître, créer la confiance, faire vendre.
5. **Fixez la répartition** en pourcentage.

## Des objectifs liés aux résultats de l''entreprise

Un client avancé ne veut pas seulement « plus de mentions J''aime ». Il veut savoir ce que les réseaux sociaux **rapportent**.

| Objectif de l''entreprise | Indicateur sur les réseaux sociaux |
| --- | --- |
| Plus de réservations | Messages de demande de réservation, clics vers la page de réservation |
| Plus de clients en boutique | Demandes d''itinéraire, utilisation d''un code promo « vu sur Facebook » |
| Plus de ventes en ligne | Clics vers le site, ventes avec lien suivi |
| Recrutement | Candidatures reçues après une publication |
| Image de marque | Taux d''interaction, commentaires positifs, partages |

> [!definition] Lien suivi (paramètres UTM)
> Un lien vers le site du client auquel on ajoute des informations (source, campagne) pour que les outils de statistiques du site indiquent combien de visites et de ventes viennent de chaque publication. Exemple : `site.com/offre?utm_source=facebook&utm_campaign=paques`.

> [!astuce] Le code promo
> Pour un commerce sans site, créez un code promo propre aux réseaux sociaux (« FB10 ») : chaque client qui l''utilise en boutique est un client venu par les réseaux. C''est la preuve la plus simple de votre impact.

## La veille et l''écoute sociale

> [!definition] Écoute sociale
> Surveiller ce qui se dit sur la marque, ses concurrents et son secteur, en dehors de sa propre page : commentaires, groupes, avis, mentions.

### La routine hebdomadaire de veille (30 minutes)

1. **La marque** : recherchez son nom sur Facebook, Instagram, TikTok et Google (avis).
2. **Les concurrents** : nouvelles offres, publications qui marchent, plaintes de leurs clients.
3. **Le secteur** : tendances, nouveaux formats, sons à la mode, événements à venir.
4. **Notez** 3 idées de contenus ou d''actions dans un document partagé.

## Présenter une stratégie au client

Une stratégie se présente dans un document de 8 à 15 pages, en visioconférence.

### Les 8 parties

1. **Le diagnostic** : audit de la page et des concurrents (chiffres de départ).
2. **Les objectifs** : 3 objectifs liés à l''entreprise, chiffrés, sur 3 mois.
3. **La cible** : 1 à 3 fiches client type.
4. **Les réseaux choisis** et le rôle de chacun.
5. **Les piliers de contenu** et leur répartition.
6. **Les formats et le rythme** : nombre de publications, Reels, stories, directs par semaine.
7. **Les indicateurs** et le rapport mensuel.
8. **Le budget** : votre forfait, le budget publicitaire conseillé, les outils.

> [!madagascar]
> Pour les clients malgaches, prévoyez dans la stratégie les **moments forts locaux** : rentrée scolaire, fête de l''Indépendance (26 juin), fêtes de fin d''année, période des vacances des expatriés et de la diaspora, saisons touristiques. Ce sont souvent les meilleurs moments pour les offres.

> [!attention] Erreurs fréquentes
> - Choisir une spécialité où les clients n''ont pas de budget.
> - Présenter une stratégie sans chiffres de départ.
> - Des objectifs qui ne parlent qu''aux spécialistes (« portée organique ») au lieu des résultats de l''entreprise.
> - Une stratégie trop ambitieuse que vous ne pourrez pas produire chaque semaine.

> [!retenir]
> - Spécialisez-vous par secteur ou par réseau, après avoir vérifié la demande.
> - 3 à 5 piliers de contenu, avec un objectif et une répartition.
> - Des objectifs liés aux ventes, réservations ou clients du commerce.
> - Liens suivis et codes promo pour prouver votre impact.
> - Une stratégie en 8 parties, présentée en visioconférence.

## Exercice pratique : une stratégie de 3 mois

> [!exercice] Exercice pratique · 3 heures
> 1. Choisissez votre spécialité et vérifiez-la avec les 4 questions.
> 2. Choisissez un vrai commerce de cette spécialité et faites son diagnostic.
> 3. Construisez ses piliers de contenu avec la méthode en 5 étapes.
> 4. Fixez 3 objectifs liés à l''entreprise et la façon de les mesurer (lien suivi ou code promo).
> 5. Rédigez la stratégie complète en 8 parties dans Canva ou Google Slides.
>
> **À livrer** : la stratégie de 8 à 15 pages. Elle deviendra une pièce maîtresse de votre portfolio.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-a', 0, 0, 'Que sont les piliers de contenu ?', '["Les colonnes d''un tableau","Les mots de passe des comptes","Les 3 à 5 grands thèmes sur lesquels la marque publie","Les heures de publication"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-a', 0, 1, 'Comment prouver simplement l''impact des réseaux sur un commerce sans site ?', '["Un code promo propre aux réseaux sociaux","Une capture d''écran","Demander aux employés","Le nombre de « J''aime »"]'::jsonb, 0);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-a', 0, 2, 'Qu''est-ce que l''écoute sociale ?', '["Écouter de la musique en travaillant","Surveiller ce qui se dit sur la marque, ses concurrents et son secteur","Appeler les clients","Lire les messages privés des abonnés"]'::jsonb, 1);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('mkt-0-a', 1, 'Outils professionnels : Metricool, Hootsuite, Canva Pro et publicité', 'Choisir son outil, programmer sur plusieurs réseaux, boîte unifiée, rapports automatiques, concurrents, production par lots et première campagne publicitaire.', 'Quand vous gérez plusieurs clients sur plusieurs réseaux, Meta Business Suite ne suffit plus. Les community managers professionnels utilisent des outils qui centralisent la programmation, les messages, les statistiques et les rapports : **Metricool** ou **Hootsuite**, avec **Canva Pro** pour produire vite. Ils savent aussi piloter un petit budget de **publicité** pour amplifier les meilleures publications. Ce module vous apprend à les utiliser comme un professionnel.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Choisir entre Metricool et Hootsuite selon vos clients.
> 2. Programmer sur plusieurs réseaux et gérer les messages depuis un seul outil.
> 3. Générer un rapport automatique et analyser les concurrents.
> 4. Produire plus vite avec Canva Pro : kits de marque, redimensionnement, planificateur.
> 5. Lancer une publicité simple avec le budget du client.

## Metricool ou Hootsuite ?

| Critère | **Metricool** | **Hootsuite** |
| --- | --- | --- |
| Pour qui | Freelances et petites agences | Agences et grandes équipes |
| Points forts | Programmation multi-réseaux, statistiques claires, rapports automatiques, analyse des concurrents | Gestion de nombreux comptes, travail en équipe, circuits de validation, écoute sociale avancée |
| Prise en main | Simple | Plus complète, donc plus longue |
| Prix | Offre gratuite limitée, puis abonnements | Abonnements, généralement plus chers |

Les offres et les prix changent : vérifiez sur les sites officiels. Pour un freelance qui gère 3 à 10 clients, **Metricool** est souvent le meilleur point de départ. Certaines agences vous donneront un accès à **leur** Hootsuite.

## Programmer sur plusieurs réseaux

### La méthode en 6 étapes (Metricool)

1. Créez une **marque** par client et connectez ses réseaux (Facebook, Instagram, TikTok, LinkedIn…). Le client vous donne l''accès depuis ses comptes, sans vous confier ses mots de passe quand c''est possible.
2. Ouvrez le **planificateur** : la vue calendrier montre tous les réseaux.
3. Créez une publication, cochez les réseaux visés.
4. **Adaptez le texte** à chaque réseau : plus court sur X, plus professionnel sur LinkedIn, avec hashtags sur Instagram et TikTok.
5. Utilisez les **meilleurs horaires** proposés par l''outil d''après l''activité réelle des abonnés.
6. Programmez et vérifiez la vue calendrier de la semaine.

> [!attention]
> Ne publiez jamais exactement le même texte et le même format partout. Une vidéo horizontale avec un long texte marche sur Facebook, mais pas sur TikTok. Adaptez le format, pas seulement le texte.

### La boîte de réception unifiée

Les outils professionnels regroupent les messages et commentaires de tous les réseaux et de tous les clients. Règles de travail :

1. **2 à 3 passages par jour** à heures fixes, plus les urgences.
2. **Étiquettes** : question, réclamation, commande, partenariat.
3. **Réponses enregistrées** par client.
4. **Transfert** au client des messages qu''il doit traiter lui-même.

## Rapports automatiques et analyse des concurrents

### Le rapport automatique

1. Créez un **modèle de rapport** : logo du client, période, indicateurs choisis.
2. Choisissez les indicateurs **liés aux objectifs** (module 1), pas tous ceux que l''outil propose.
3. Programmez l''envoi automatique **chaque début de mois**.
4. **Ajoutez toujours votre analyse** : 5 lignes sur ce qui a marché, ce qui n''a pas marché, et vos propositions. Un rapport sans analyse n''a presque pas de valeur pour le client.

### L''analyse des concurrents

Ajoutez 3 concurrents du client dans l''outil. Comparez chaque mois :

| Indicateur | Client | Concurrent A | Concurrent B |
| --- | --- | --- | --- |
| Abonnés gagnés | +320 | +150 | +600 |
| Publications | 14 | 8 | 22 |
| Taux d''interaction moyen | 3,8 % | 2,1 % | 2,9 % |
| Format le plus performant | Reels | Photos | Carrousels |

*(Chiffres donnés en exemple.)*

## Produire plus vite avec Canva Pro

| Fonction | Gain |
| --- | --- |
| **Kits de marque** (un par client) | Couleurs, polices et logos en un clic, sans erreur |
| **Redimensionnement magique** | Une publication carrée devient story, Reel ou bannière en quelques secondes |
| **Suppression d''arrière-plan** | Photos de produits détourées instantanément |
| **Modèles d''équipe** | Vos gabarits par client, réutilisables chaque semaine |
| **Planificateur de contenu** | Programmation directe depuis Canva vers certains réseaux |
| **Dossiers par client** | Tout est rangé et partageable |

> [!astuce] La production par lots
> Une demi-journée par semaine et par client suffit souvent : le lundi matin, vous créez dans Canva **tous** les visuels de la semaine à partir de vos modèles, vous les redimensionnez pour chaque réseau, puis vous programmez tout dans Metricool. C''est la méthode du **batching** (travail par lots).

## Lancer une publicité simple

Les publications gratuites touchent une partie limitée des abonnés. Un petit budget publicitaire permet de toucher **plus de personnes ciblées**.

> [!definition] Publicité ciblée
> Une publication payante montrée à un public choisi : âge, ville, centres d''intérêt. Sur Facebook et Instagram, elle se gère dans le **Gestionnaire de publicités** de Meta.

### Booster ou créer une publicité ?

| Option | Pour quoi | Limite |
| --- | --- | --- |
| **Booster une publication** | Mettre en avant une publication qui marche déjà, en quelques clics | Peu d''options de ciblage et d''objectif |
| **Créer une publicité** dans le Gestionnaire de publicités | Choisir un objectif précis (messages, trafic, ventes), un public et un budget | Demande plus de méthode |

### Une première campagne en 7 étapes

1. **Objectif** : par exemple « messages » pour un restaurant qui prend les commandes sur Messenger.
2. **Public** : ville (Antananarivo, rayon de quelques kilomètres), âge, centres d''intérêt.
3. **Budget** : un petit budget quotidien pour tester, sur 5 à 7 jours.
4. **Visuel** : la publication qui a le mieux marché naturellement ce mois-ci.
5. **Texte** : court, avec l''offre et l''appel à l''action.
6. **Suivi** : après 3 jours, regardez le coût par message reçu.
7. **Bilan** : gardez ce qui marche, arrêtez ce qui ne marche pas.

> [!attention]
> Le budget publicitaire est **payé par le client**, avec **sa** carte, dans **son** compte publicitaire, auquel il vous donne accès. Ne payez jamais une publicité de votre poche pour la refacturer ensuite : en cas de litige, vous perdez l''argent. Pour aller plus loin, la formation « Gestionnaire de publicités en ligne » est entièrement consacrée à ce sujet.

> [!madagascar]
> Les paiements de publicités Meta se font en général par carte bancaire internationale. Vérifiez avec le client quel moyen de paiement il peut utiliser avant de lui proposer une campagne.

> [!retenir]
> - Metricool pour les freelances, Hootsuite pour les grandes équipes.
> - Un texte et un format adaptés à chaque réseau.
> - Des rapports automatiques, toujours complétés par votre analyse.
> - Canva Pro et la production par lots pour gagner des heures chaque semaine.
> - Une publicité simple, avec le budget et le compte du client.

## Exercice pratique : votre poste de pilotage

> [!exercice] Exercice pratique · 2 heures 30
> 1. Créez un compte Metricool (offre gratuite) et connectez votre page d''essai.
> 2. Programmez une semaine de 5 publications adaptées à 2 réseaux.
> 3. Ajoutez 3 concurrents et remplissez le tableau de comparaison.
> 4. Créez dans Canva un kit de marque et 5 modèles, puis redimensionnez une publication en 3 formats.
> 5. Rédigez le plan d''une première campagne publicitaire en 7 étapes pour un restaurant (sans la lancer).
>
> **À livrer** : captures du planificateur et du tableau des concurrents, vos modèles Canva et votre plan de campagne.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-a', 1, 0, 'Quel outil convient souvent le mieux à un freelance qui gère 3 à 10 clients ?', '["Paint","Aucun outil","Metricool","Un simple carnet"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-a', 1, 1, 'Que faut-il ajouter à un rapport automatique ?', '["Des emojis","Votre analyse et vos propositions","Rien, il suffit","Votre CV"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-a', 1, 2, 'Qui paie le budget publicitaire ?', '["Meta, gratuitement","Le client, avec sa carte, dans son compte publicitaire","Le community manager, pour le refacturer","Vitako"]'::jsonb, 1);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('mkt-0-a', 2, 'Qualité et rapidité : organisation, vidéo courte et crise', 'Semaine à plusieurs clients, vidéo courte en 4 temps, recyclage en 5 formats, circuit de validation et gestion de crise en 6 étapes.', 'Gérer 5 ou 10 clients exige une organisation de professionnel : des contenus produits en série sans perdre en qualité, une vidéo courte maîtrisée, des validations rapides et une gestion de crise prête à l''emploi. Ce module vous donne ces méthodes.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Organiser votre semaine pour gérer plusieurs clients.
> 2. Produire des vidéos courtes efficaces avec une structure en 4 temps.
> 3. Recycler un contenu en 5 formats.
> 4. Mettre en place un circuit de validation rapide.
> 5. Gérer une crise sur les réseaux sociaux en 6 étapes.

## Organiser une semaine à plusieurs clients

> [!exemple] Semaine type pour 5 clients
>
> | Jour | Matin | Après-midi |
> | --- | --- | --- |
> | Lundi | Production par lots : clients A et B | Production : client C |
> | Mardi | Production : clients D et E | Programmation de toute la semaine |
> | Mercredi | Tournage de vidéos courtes (ou montage des vidéos reçues) | Messages et commentaires |
> | Jeudi | Veille, idées, publicités | Messages, ajustements |
> | Vendredi | Rapports (en début de mois), stratégie | Prospection et formation |
>
> Chaque jour : 2 à 3 passages de 30 minutes dans la boîte de réception unifiée.

### Les règles d''organisation

1. **Un dossier par client** (Drive et Canva) avec la même structure.
2. **Un tableau de suivi** général : clients, publications prévues, validations en attente, rapports.
3. **Des créneaux fixes** pour chaque tâche, plutôt que de passer d''un client à l''autre toute la journée.
4. **Une avance de 1 semaine** minimum sur les publications programmées : une coupure ou une maladie ne crée pas de trou.

## La vidéo courte : le format qui domine

Sur la plupart des réseaux, les vidéos courtes verticales (Reels, TikTok, Shorts) touchent beaucoup plus de personnes que les photos.

### La structure en 4 temps (30 à 45 secondes)

| Temps | Durée | Contenu | Exemple pour un restaurant |
| --- | --- | --- | --- |
| **1. Accroche** | 0 à 3 s | Une image forte ou une phrase qui arrête le défilement | « Le romazava le plus généreux d''Isoraka ? » |
| **2. Promesse** | 3 à 8 s | Ce que la personne va voir ou apprendre | « On vous montre comment on le prépare chaque matin. » |
| **3. Contenu** | 8 à 35 s | Les images, rapides, avec du texte à l''écran | Brèdes, viande, cuisson, service |
| **4. Appel à l''action** | Dernières secondes | Ce qu''il faut faire | « Commandez par message avant 11 h. » |

### Les 6 règles de la vidéo courte

1. **Sous-titres** toujours : beaucoup regardent sans le son.
2. **Format vertical** 9:16, personne ou produit au centre.
3. **Un changement d''image** toutes les 1 à 3 secondes.
4. **Un son tendance** quand c''est adapté à la marque (et autorisé pour un compte d''entreprise).
5. **Des personnes réelles** : l''équipe, le patron, les clients (avec leur accord) font plus de vues que des produits seuls.
6. **Une série** : « Le plat de la semaine », « Un jour au lodge » : les abonnés attendent l''épisode suivant.

> [!astuce] Quand le client filme lui-même
> Envoyez-lui une **liste de plans** précise : « Filmez à la verticale, 5 secondes chacun : 1. la marmite de face, 2. la main qui coupe les brèdes, 3. le service à table, 4. un client qui goûte. » Vous montez ensuite avec CapCut. Vous obtenez des vidéos authentiques sans vous déplacer.

## Recycler un contenu en 5 formats

Un bon contenu ne doit pas servir une seule fois.

> [!exemple] Une interview du chef de 2 minutes devient…
> 1. **Un Reel** de 30 secondes avec la meilleure phrase.
> 2. **Un carrousel** « 5 secrets du chef » avec les points clés.
> 3. **Une citation** en visuel avec sa photo.
> 4. **Des stories** avec un sondage (« Vous préférez le romazava ou le ravitoto ? »).
> 5. **Une publication LinkedIn** sur l''histoire du restaurant, si le client y est présent.

## Le circuit de validation rapide

Les validations lentes du client sont la première cause de retard.

1. **Validez le calendrier mensuel** en une fois (thèmes et dates), avant le début du mois.
2. **Envoyez les contenus par lot**, une fois par semaine, dans un seul message ou un seul lien (aperçu Metricool, dossier Canva, document partagé).
3. **Fixez un délai** : « Sans retour de votre part sous 48 h, les publications partent comme prévu. » Écrivez cette règle dans votre contrat.
4. **Distinguez** ce qui doit être validé (prix, promotions, annonces importantes) de ce qui ne doit pas l''être (contenus d''ambiance, conseils).

## La gestion de crise

> [!definition] Crise sur les réseaux sociaux
> Une situation où de nombreux messages négatifs arrivent en peu de temps : plainte qui devient virale, erreur dans une publication, problème de qualité, rumeur.

### Les 6 étapes

1. **Ne supprimez rien** et ne répondez pas sous le coup de l''émotion.
2. **Prévenez le client immédiatement**, par téléphone.
3. **Comprenez les faits** : que s''est-il passé exactement ? Qui est concerné ?
4. **Mettez en pause** les publications programmées (une promotion joyeuse en pleine crise aggrave la situation).
5. **Publiez une réponse validée par le client** : reconnaître, expliquer, dire ce qui est fait pour corriger.
6. **Répondez individuellement** aux messages avec un texte commun, puis faites un bilan après la crise.

> [!exemple] Message de crise d''un restaurant
> « Plusieurs clients nous ont signalé hier soir des retards de livraison de plus d''une heure. Nous vous présentons nos excuses. Un de nos livreurs était absent et nous n''avons pas réduit les commandes à temps. À partir d''aujourd''hui, nous limitons les commandes du soir à notre capacité réelle. Les clients concernés seront contactés pour un geste commercial. »

Préparez dès le début de la collaboration un **document de crise** : numéros à appeler, qui valide les messages, modèles de réponse.

> [!madagascar]
> Les rumeurs circulent très vite dans les groupes Facebook malgaches. Surveillez les groupes de votre ville ou de votre secteur pendant une crise : une réponse calme et factuelle dans ces groupes peut arrêter une rumeur.

> [!attention] Erreurs fréquentes
> - Passer d''un client à l''autre toute la journée sans organisation.
> - Publier la même vidéo horizontale sur tous les réseaux.
> - Attendre la validation du client pour chaque publication, une par une.
> - Supprimer des commentaires négatifs pendant une crise.

> [!retenir]
> - Des journées organisées par lots, avec une semaine d''avance.
> - Vidéo courte : accroche, promesse, contenu, appel à l''action.
> - Un contenu recyclé en 5 formats.
> - Des validations par lot avec un délai écrit.
> - Un document de crise prêt avant la crise.

## Exercice pratique : votre organisation

> [!exercice] Exercice pratique · 3 heures
> 1. Construisez votre semaine type pour 4 clients.
> 2. Rédigez une liste de plans pour un client qui filme lui-même, puis montez un Reel de 30 secondes en 4 temps avec CapCut.
> 3. Recyclez ce contenu en 4 autres formats.
> 4. Rédigez votre règle de validation pour votre contrat.
> 5. Rédigez le document de crise d''un restaurant : contacts, circuit de validation et 3 modèles de messages.
>
> **À livrer** : votre semaine type, le Reel, les 4 formats recyclés, votre règle de validation et le document de crise.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-a', 2, 0, 'Quelle est la structure d''une vidéo courte efficace ?', '["Prix, prix, prix, prix","Musique seule","Accroche, promesse, contenu, appel à l''action","Générique, silence, logo, fin"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-a', 2, 1, 'Comment accélérer les validations du client ?', '["Envoyer chaque publication une par une","Envoyer par lot avec un délai écrit de 48 h","Ne jamais lui demander","Attendre qu''il pense à répondre"]'::jsonb, 1);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-a', 2, 2, 'Pendant une crise, que faire des publications programmées ?', '["Les publier comme prévu","Les supprimer toutes définitivement","Les mettre en pause","Les doubler"]'::jsonb, 2);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('mkt-0-a', 3, 'Clients internationaux et LinkedIn', 'Adapter le travail au pays du client, LinkedIn pour entreprises et dirigeants, données personnelles et jeux-concours, anglais professionnel, offre et contrat.', 'Les entreprises francophones d''Europe, du Canada ou d''Afrique de l''Ouest cherchent des community managers fiables, et paient souvent mieux que le marché local. Mais leurs abonnés, leurs habitudes et leurs règles sont différents. Ce module vous prépare à gérer les réseaux sociaux de clients étrangers, en français et en anglais.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Adapter votre travail à un public étranger : culture, horaires, ton.
> 2. Gérer LinkedIn pour des entreprises et des dirigeants.
> 3. Respecter les règles sur les données personnelles et les jeux-concours.
> 4. Communiquer et rédiger en anglais professionnel simple.
> 5. Présenter une offre et un contrat adaptés aux clients étrangers.

## Adapter son travail à un public étranger

| Élément | Ce qui change | Exemple pour un client français |
| --- | --- | --- |
| **Horaires** | Programmer à l''heure des abonnés | 12 h 30 à Paris = 13 h 30 ou 14 h 30 à Antananarivo selon la saison |
| **Calendrier** | Fêtes et moments forts du pays | Soldes de janvier et de juillet, rentrée de septembre, Black Friday, Noël |
| **Références** | Culture, humour, actualité | Éviter les références que le public ne comprend pas |
| **Ton** | Tutoiement ou vouvoiement, emojis | Souvent vouvoiement pour les marques « sérieuses », tutoiement pour les marques jeunes |
| **Orthographe** | Exigence très élevée | Une faute dans une publication de marque est vite remarquée |

> [!astuce]
> Abonnez-vous aux pages de 10 marques du pays de votre client. Regardez pendant 2 semaines ce qu''elles publient, à quelle heure, sur quel ton : vous comprendrez vite les codes de ce public.

## LinkedIn : le réseau des entreprises

Beaucoup de clients étrangers (cabinets, consultants, entreprises de services, recruteurs) veulent être présents sur LinkedIn. C''est une compétence bien payée et encore peu maîtrisée.

### Page d''entreprise et profil de dirigeant

| | **Page d''entreprise** | **Profil du dirigeant** |
| --- | --- | --- |
| Rôle | Présenter l''entreprise, recruter, annoncer | Construire la confiance, partager une expertise |
| Portée | Souvent plus faible | Souvent beaucoup plus forte |
| Contenus | Actualités, offres d''emploi, réalisations | Avis, conseils, histoires, coulisses |

### La publication LinkedIn qui marche

1. **Une accroche** de 1 à 2 lignes avant le « voir plus ».
2. **Des paragraphes très courts**, une idée par ligne.
3. **Une histoire ou une leçon** concrète.
4. **Une question** à la fin pour inviter à commenter.
5. **Peu de hashtags** (3 au maximum) et pas de lien dans le texte principal si la portée baisse (on peut le mettre en commentaire, selon ce qui marche pour le compte).

> [!exemple] Publication pour une consultante
> « J''ai perdu mon plus gros client il y a 3 ans.
>
> Ce jour-là, j''ai compris une chose : 70 % de mon chiffre dépendait d''une seule entreprise.
>
> Depuis, je m''impose une règle simple : aucun client ne dépasse 30 % de mon activité.
>
> Et vous, comment répartissez-vous vos risques ? »

**Important** : quand vous écrivez pour le profil d''un dirigeant, le texte doit refléter **ses** idées et **ses** expériences, validées par lui. Vous l''aidez à les formuler, vous n''inventez pas sa vie.

## Les règles sur les données et les jeux-concours

### Les données personnelles

En Europe, le **RGPD** (Règlement général sur la protection des données) encadre l''utilisation des données personnelles. Pour un community manager, cela veut dire notamment :

1. Ne pas **copier** les coordonnées des abonnés dans un fichier sans leur accord.
2. **Demander l''accord** avant de publier la photo ou le témoignage d''un client.
3. **Protéger** les accès aux comptes (double authentification, pas de partage de mots de passe).
4. **Supprimer** les données d''un jeu-concours (adresse du gagnant) une fois le lot envoyé.

Ce résumé ne remplace pas un avis juridique : le client reste responsable de ses obligations, mais il attend de vous des pratiques sérieuses.

### Les jeux-concours

1. Un **règlement** écrit, accessible depuis la publication.
2. Le respect des **règles de chaque réseau** (Meta, TikTok, LinkedIn ont leurs propres conditions).
3. Les **règles du pays** : certains pays encadrent strictement les jeux et loteries. Demandez au client de les vérifier.

## L''anglais professionnel du community manager

| Anglais | Français |
| --- | --- |
| content calendar | calendrier éditorial |
| post / caption | publication / texte de la publication |
| reach / impressions | couverture / impressions |
| engagement rate | taux d''interaction |
| followers | abonnés |
| scheduling | programmation |
| approval | validation |
| brand voice | ton de la marque |
| monthly report | rapport mensuel |
| ad spend | budget publicitaire |

> [!exemple] Message de rapport en anglais
> « Hi Mark, please find attached the October report. Key results: reach +42 %, 63 direct messages (+18), and our best post was the behind-the-scenes Reel (12,400 views). For November, I suggest two changes: more Reels featuring your team, and a small ad budget to promote the Black Friday offer. Happy to discuss on our call on Thursday. »

## L''offre et le contrat pour les clients étrangers

1. **Prix en euros ou en dollars**, adaptés au marché du client et à votre spécialité. Renseignez-vous sur les tarifs de community managers freelances de votre niveau dans son pays et sur les plateformes.
2. **Paiement mensuel d''avance**, par virement international, Payoneer ou la plateforme.
3. **Horaires de réponse** exprimés dans le fuseau du client.
4. **Délai de validation** (48 h) et ce qui se passe sans réponse.
5. **Budget publicitaire** à part, payé par le client.
6. **Durée** : 3 mois d''engagement initial, puis renouvellement mensuel avec préavis.
7. **Confidentialité** et propriété des contenus (les contenus créés appartiennent au client après paiement).

> [!madagascar]
> Pour un client européen, votre décalage horaire est un atout : vous pouvez programmer et répondre tôt le matin (heure de Paris), avant que l''équipe du client commence sa journée. Mettez-le en avant dans votre offre : « Vos messages du matin traités avant 9 h, heure de Paris. »

> [!retenir]
> - Adaptez horaires, calendrier, références et ton au pays du client.
> - LinkedIn : page d''entreprise et profil de dirigeant, avec ses vraies idées.
> - Données personnelles et jeux-concours : accord, protection, règlement.
> - Un anglais simple et clair suffit pour les échanges et les rapports.
> - Prix en devises, paiement d''avance, délai de validation écrit.

## Exercice pratique : un client étranger

> [!exercice] Exercice pratique · 2 heures 30
> 1. Choisissez une marque d''un pays francophone (France, Belgique, Canada) dans votre spécialité et analysez 10 de ses publications.
> 2. Construisez son calendrier de moments forts sur 3 mois.
> 3. Rédigez 3 publications LinkedIn pour son dirigeant (fictif) à partir d''idées que vous inventez pour l''exercice.
> 4. Rédigez en anglais un rapport mensuel court avec des chiffres d''exemple.
> 5. Rédigez votre offre en euros et votre contrat type avec les 7 points.
>
> **À livrer** : l''analyse, le calendrier, les 3 publications, le rapport en anglais, l''offre et le contrat.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-a', 3, 0, 'Sur LinkedIn, qu''est-ce qui a souvent la plus forte portée ?', '["La page d''entreprise","Les publicités imprimées","Les messages privés","Le profil du dirigeant"]'::jsonb, 3);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-a', 3, 1, 'Que faut-il avant de publier le témoignage d''un client ?', '["Un paiement","Rien","Son accord","Son mot de passe"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-a', 3, 2, 'Que veut dire « engagement rate » ?', '["Taux de change","Taux d''interaction","Taux d''abonnés perdus","Budget publicitaire"]'::jsonb, 1);
insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values ('mkt-0-a', 4, 'Développer son activité', 'Formules et prix avancés, services complémentaires, recruter un assistant, procédures d''équipe et rentabilité par client.', 'Un community manager seul peut gérer environ 5 à 10 clients selon les formules. Au-delà, il faut changer de modèle : mieux vendre, déléguer une partie du travail, ou créer une petite agence. Ce dernier module vous montre comment faire grandir votre activité sans vous épuiser.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Faire évoluer vos formules et vos prix.
> 2. Vendre des services complémentaires à forte valeur.
> 3. Recruter et former un assistant community manager.
> 4. Organiser une petite équipe avec des procédures claires.
> 5. Piloter la rentabilité de chaque client.

## Faire évoluer ses formules et ses prix

### Passer du « nombre de publications » aux résultats

Au début, on vend « 12 publications par mois ». Au niveau avancé, on vend un **résultat** et une **stratégie** :

| Formule débutant | Formule avancée |
| --- | --- |
| « 12 publications et réponses aux messages » | « Gestion complète de votre présence : stratégie trimestrielle, contenus, vidéos courtes, réponses 7 jours sur 7, rapport avec recommandations » |
| Prix calculé sur les heures | Prix calculé sur les heures, **plus** la valeur de la stratégie et de l''expertise sectorielle |

### Augmenter ses prix

1. Appliquez le nouveau tarif **aux nouveaux clients** d''abord.
2. Pour les clients actuels, prévenez **1 à 2 mois** à l''avance, en rappelant les résultats obtenus ensemble.
3. Augmentez **par paliers** (par exemple 10 à 20 %).
4. Proposez une **formule plus légère** au client qui ne peut pas suivre, plutôt que de le perdre sans solution.

## Les services complémentaires à forte valeur

| Service | Ce que c''est | Pourquoi c''est rentable |
| --- | --- | --- |
| **Audit et stratégie** | Diagnostic complet et stratégie de 3 mois, livrés en une fois | Bien payé, pas de travail quotidien ensuite |
| **Formation** | Former l''équipe du client à gérer ses réseaux | Une demi-journée, valeur élevée |
| **Lancement** | Ouverture ou relance d''une page : identité, 30 premiers contenus, campagne | Projet ponctuel bien défini |
| **Gestion des publicités** | Campagnes avec le budget du client | Forte valeur, résultats mesurables |
| **Création de vidéos** | Tournage et montage de vidéos courtes | Le format le plus demandé |
| **Animation de communauté privée** | Groupe Facebook, WhatsApp ou Telegram de clients | Fidélise les clients de la marque |

## Recruter et former un assistant

Quand vous êtes complet, déléguer les tâches répétitives vous libère pour la stratégie et la prospection.

### Quelles tâches déléguer ?

| Déléguer | Garder |
| --- | --- |
| Création de visuels à partir de modèles | Stratégie et relation avec le client |
| Programmation | Validation finale avant publication |
| Premier niveau de réponse aux messages (avec réponses enregistrées) | Gestion des crises et des réclamations sensibles |
| Recherche de tendances | Rapports et recommandations |

### Recruter en 5 étapes

1. **Décrivez la mission** : tâches, heures par semaine, outils, rémunération.
2. **Cherchez** parmi les personnes formées (par exemple les diplômés du niveau Fondamentaux), dans votre réseau ou les groupes de freelances.
3. **Faites un test payé** : 3 visuels et 5 réponses à des messages, sur un client fictif.
4. **Commencez petit** : 5 à 10 heures par semaine, sur un ou deux clients.
5. **Formalisez** : accord écrit, confidentialité, paiement à date fixe.

> [!madagascar]
> Former un jeune community manager malgache est aussi une façon de créer des emplois à distance. Payez-le correctement et à l''heure : un assistant fiable et motivé est l''atout le plus précieux d''une petite agence.

## Organiser une petite équipe

### Les procédures écrites

Tout ce qui se répète doit être écrit, étape par étape, dans un document partagé (Notion, Google Docs) :

1. **Accueillir un nouveau client** : accès, kit de marque, dossiers, réponses enregistrées.
2. **Créer et programmer** la semaine.
3. **Répondre aux messages** : ton, délais, ce qu''on transmet au client.
4. **Préparer le rapport** mensuel.
5. **Gérer une crise**.

### Les outils de l''équipe

| Besoin | Outil |
| --- | --- |
| Suivi des tâches | Trello, Notion ou Asana |
| Communication interne | WhatsApp, Slack ou Google Chat, avec un groupe par client |
| Fichiers | Google Drive, dossiers Canva d''équipe |
| Programmation et messages | Metricool ou Hootsuite avec plusieurs utilisateurs |
| Accès sécurisés | Gestionnaire de mots de passe partagé |

### Le contrôle qualité

Même avec un assistant, **vous** restez responsable devant le client. Relisez tout ce qui est programmé pendant les premières semaines, puis par échantillon. Une erreur de prix ou une faute dans une publication, c''est votre réputation.

## Piloter la rentabilité de chaque client

Tous les clients ne se valent pas : certains demandent beaucoup de temps pour un petit forfait.

> [!exemple] Tableau de rentabilité mensuel
>
> | Client | Forfait | Heures réelles | Revenu par heure |
> | --- | --- | --- | --- |
> | Hôtel A | 600 000 Ar | 28 h | 21 400 Ar |
> | Restaurant B | 330 000 Ar | 30 h | 11 000 Ar |
> | Boutique C | 450 000 Ar | 20 h | 22 500 Ar |
>
> *(Chiffres donnés en exemple.)* Le restaurant B rapporte deux fois moins par heure. Que faire ? Comprendre pourquoi (beaucoup de messages, validations lentes, demandes hors forfait), puis ajuster : nouvelle formule, prix, règles de validation, ou délégation des réponses.

### Les 5 chiffres à suivre chaque mois

1. **Revenus réguliers** (somme des forfaits).
2. **Revenu par heure** de chaque client.
3. **Part du plus gros client** dans le total.
4. **Nombre de clients perdus et gagnés**.
5. **Dépenses** : outils, assistant, connexion.

> [!retenir]
> - Vendez une stratégie et des résultats, pas seulement des publications.
> - Ajoutez des services à forte valeur : audit, formation, lancement, publicité, vidéo.
> - Déléguez les tâches répétitives, gardez la stratégie et la relation client.
> - Des procédures écrites et un contrôle qualité permanent.
> - Suivez la rentabilité de chaque client et ajustez.

## Exercice pratique : votre plan de croissance

> [!exercice] Exercice pratique · 2 heures
> 1. Réécrivez vos formules en version « résultats et stratégie », avec de nouveaux prix.
> 2. Créez une offre de service complémentaire (audit, formation ou lancement) avec contenu et prix.
> 3. Rédigez la description de mission d''un assistant et son test payé.
> 4. Écrivez 2 procédures : « accueillir un nouveau client » et « créer et programmer la semaine ».
> 5. Remplissez un tableau de rentabilité (avec vos clients ou des chiffres d''exemple) et proposez une action pour le client le moins rentable.
>
> **À livrer** : vos formules, votre offre complémentaire, la description de mission, les 2 procédures et le tableau de rentabilité.', null)
  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-a', 4, 0, 'Quelle tâche garder plutôt que déléguer ?', '["La création de visuels à partir de modèles","La programmation","La gestion des crises et la relation client","La recherche de tendances"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-a', 4, 1, 'Un forfait de 330 000 Ar demande 30 heures. Quel est le revenu par heure ?', '["33 000 Ar","3 300 Ar","11 000 Ar","110 000 Ar"]'::jsonb, 2);
insert into public.module_questions (course_id, module_index, position, question, options, correct) values ('mkt-0-a', 4, 2, 'Pourquoi écrire des procédures ?', '["Pour qu''un assistant fasse le travail sans erreur","Pour remplir le Drive","Pour le client uniquement","Ce n''est pas utile"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Quelles sont les deux façons de se spécialiser ?', '["Par prix ou par heure","Par secteur ou par réseau","Par couleur ou par police","Par âge ou par ville"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Combien de piliers de contenu prévoir ?', '["Aucun","1","3 à 5","20"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Quel indicateur est lié à l''objectif « plus de réservations » ?', '["Le nombre de « J''aime » sur la photo de profil","Le nombre de hashtags","La couleur du logo","Les demandes de réservation par message"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'À quoi servent les paramètres UTM ?', '["Changer la langue du site","Compresser une vidéo","Protéger un mot de passe","Savoir combien de visites et de ventes viennent de chaque publication"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Combien de temps par semaine pour la veille ?', '["Environ 30 minutes","10 heures","Une minute par mois","Aucun"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Que contient le diagnostic d''une stratégie ?', '["La liste des abonnés","L''audit de la page et des concurrents avec les chiffres de départ","La biographie du community manager","La facture"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Pourquoi adapter le format à chaque réseau ?', '["Ce n''est pas utile","Pour gagner moins de temps","Parce que la loi l''exige","Une vidéo horizontale avec un long texte ne marche pas sur TikTok"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Quelle fonction de Canva Pro transforme une publication carrée en story ?', '["La suppression d''arrière-plan","Le kit de marque","Le dossier client","Le redimensionnement magique"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Qu''est-ce que le batching ?', '["Supprimer les anciens contenus","Produire tous les contenus de la semaine en une fois","Répondre aux messages la nuit","Publier au hasard"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Quelle différence entre booster et créer une publicité ?', '["Créer une publicité offre plus d''objectifs et de ciblage","Booster est gratuit","Il n''y en a aucune","Créer une publicité est interdit"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Que regarder après 3 jours de campagne « messages » ?', '["La couleur du bouton","Le coût par message reçu","La météo","Le nombre d''employés"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Combien d''avance garder sur les publications programmées ?', '["Aucune","Un an","Au moins une semaine","Une heure"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Pourquoi des sous-titres sur les vidéos courtes ?', '["Pour allonger la vidéo","Beaucoup regardent sans le son","Pour cacher l''image","C''est obligatoire"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Que donner au client qui filme lui-même ?', '["Rien","Une caméra de cinéma","Un contrat de travail","Une liste de plans précise"]'::jsonb, 3);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Que ne pas faire pendant une crise ?', '["Supprimer les commentaires négatifs","Comprendre les faits","Publier une réponse validée","Prévenir le client"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Quand préparer le document de crise ?', '["Dès le début de la collaboration","Après la crise","Pendant la crise","Jamais"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Que faire pour comprendre les codes d''un public étranger ?', '["Publier sans regarder","Deviner","Observer pendant 2 semaines 10 marques de ce pays","Copier une marque malgache"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Combien de hashtags au maximum sur une publication LinkedIn ?', '["100","Environ 3","Aucun n''est jamais autorisé","30"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Qu''est-ce que le RGPD ?', '["Un logiciel de montage","Le règlement européen sur la protection des données personnelles","Une plateforme de paiement","Un réseau social"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Quand écrire pour le profil d''un dirigeant…', '["On copie un autre dirigeant","On ne lui montre rien","Le texte reflète ses idées et expériences, validées par lui","On invente sa vie"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Quel atout mettre en avant auprès d''un client européen ?', '["Ne pas répondre le matin","Ne jamais envoyer de rapport","Les messages du matin traités avant 9 h, heure de Paris","Travailler seulement le dimanche"]'::jsonb, 2);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Qu''est-ce qu''une formule avancée ?', '["Une offre qui vend une stratégie et des résultats","Une offre gratuite","Un prix plus bas","12 publications sans stratégie"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Comment recruter un assistant ?', '["Avec un test gratuit de 3 mois","Avec un test payé et un début sur 5 à 10 heures par semaine","En lui donnant tous vos mots de passe","Sans test, à plein temps immédiatement"]'::jsonb, 1);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Qui reste responsable devant le client du travail de l''assistant ?', '["Vous","Le client","L''assistant seul","Personne"]'::jsonb, 0);
insert into public.exam_questions (course_id, question, options, correct) values ('mkt-0-a', 'Que faire d''un client deux fois moins rentable par heure que les autres ?', '["Doubler son travail gratuitement","Ne rien faire","L''ignorer","Comprendre pourquoi et ajuster formule, prix ou règles"]'::jsonb, 3);

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
