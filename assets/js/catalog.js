// Catalogue : 50 métiers en deux niveaux (100 formations) et des formations à niveau unique
// (domaine Développement personnel, champ "single" dans content/catalog.json).
// Les données viennent de data.js, généré par `node tools/build.mjs`
// à partir de content/catalog.json et content/courses/*.
import { DOMAINS, PUBLISHED } from './data.js';

const lower = (s) => s.charAt(0).toLowerCase() + s.slice(1);
const upperFirst = (s) => s.charAt(0).toUpperCase() + s.slice(1);

function defaultModules(job, level) {
  if (job.single) {
    return [
      { title: 'Comprendre', summary: 'Les notions clés, expliquées simplement.' },
      { title: 'Les bases', summary: 'Les règles et techniques à connaître.' },
      { title: 'Les outils et méthodes', summary: `Mettre en pratique avec ${job.tools}.` },
      { title: 'Mise en situation', summary: 'Un cas concret de freelance ou de télétravail à Madagascar.' },
      { title: 'Mon plan d\'action', summary: 'Ancrer les nouvelles habitudes dans la durée.' },
    ];
  }
  if (level === 'f') {
    return [
      { title: 'Le métier et ses clients', summary: `Ce que fait un ${lower(job.name)} et qui le paie, à Madagascar et à l'étranger.` },
      { title: 'Les bases du métier', summary: 'Les notions indispensables, expliquées avec des exemples concrets.' },
      { title: 'Les outils gratuits et payants', summary: `Prendre en main ${job.tools}, puis découvrir les outils payants : ${job.paid}.` },
      { title: 'Premier projet complet', summary: 'Réaliser une mission de A à Z, comme pour un vrai client.' },
      { title: 'Trouver des clients et se faire payer', summary: 'Portfolio, prix, devis, Mobile Money et paiements internationaux.' },
    ];
  }
  return [
    { title: 'Se spécialiser', summary: 'Choisir une niche rentable et se démarquer.' },
    { title: 'Outils professionnels et techniques avancées', summary: `Travailler avec les outils payants demandés par les clients : ${job.paid}.` },
    { title: 'Qualité et rapidité', summary: 'Méthodes, modèles et contrôles pour livrer plus vite sans erreur.' },
    { title: 'Clients internationaux', summary: 'Travailler en français et en anglais avec des clients étrangers.' },
    { title: 'Développer son activité', summary: 'Augmenter ses tarifs, fidéliser, déléguer.' },
  ];
}

function defaultObjectives(job, level) {
  if (job.single) return [`Progresser en ${lower(job.name)}`, 'Appliquer des méthodes simples au quotidien', 'Construire son plan d\'action'];
  if (level === 'f') {
    return [
      `Comprendre le métier de ${lower(job.name)} et ses clients`,
      `Utiliser ${job.tools}`,
      'Connaître les outils payants du métier et savoir quand ils deviennent rentables',
      'Réaliser une première mission complète',
      'Trouver des clients et se faire payer depuis Madagascar',
    ];
  }
  return [
    'Choisir une spécialité rentable',
    `Travailler avec les outils professionnels : ${job.paid}`,
    'Livrer plus vite avec des méthodes professionnelles',
    'Décrocher des clients internationaux mieux payés',
  ];
}

export const DOMAINS_LIST = DOMAINS;
export const LEVELS = { f: 'Fondamentaux', a: 'Avancé' };
export const SINGLE_LEVEL_NAME = 'Formation';
export const JOBS = [];
export const COURSES = [];

DOMAINS.forEach((dom, di) => {
  dom.jobs.forEach((j, ji) => {
    const job = { key: `${dom.id}-${ji}`, name: j.name, blurb: j.blurb, tools: j.tools, paid: j.paid, cover: j.cover || null, single: !!j.single, dom, courses: [] };
    (job.single ? ['f'] : ['f', 'a']).forEach((level) => {
      const id = `${job.key}-${level}`;
      const pub = PUBLISHED[id];
      const fond = level === 'f';
      const course = {
        id, job, dom, level,
        single: job.single,
        levelName: job.single ? SINGLE_LEVEL_NAME : LEVELS[level],
        title: pub?.title ?? (job.single ? job.name : `${job.name} – ${LEVELS[level]}`),
        hours: pub?.hours ?? (fond ? 10 + ((di + ji) % 5) : 14 + ((di * 2 + ji) % 5)),
        description: pub?.description ?? (`${upperFirst(lower(job.name))} : ${job.blurb}. ` + (job.single
          ? 'Une formation courte et pratique pour progresser dans votre travail en freelance ou en télétravail.'
          : fond
          ? 'Ce niveau Fondamentaux donne les bases pour réaliser vos premières missions en freelance ou en télétravail depuis Madagascar.'
          : 'Ce niveau Avancé aide à se spécialiser et à viser des clients mieux payés, à Madagascar et à l\'étranger. Le niveau Fondamentaux est recommandé avant.')),
        objectives: pub?.objectives ?? defaultObjectives(job, level),
        modules: pub?.modules ?? defaultModules(job, level),
        published: !!pub,
        // Version 2 (modules découpés en leçons) : en ligne (format 2) ou en aperçu pour l'administrateur.
        format: pub?.format || 1,
        breakdown: pub?.breakdown || null,
        preview: pub?.preview || null,
      };
      job.courses.push(course);
      COURSES.push(course);
    });
    JOBS.push(job);
  });
});

export const courseById = (id) => COURSES.find((c) => c.id === id);
export const jobByKey = (key) => JOBS.find((j) => j.key === key);
export const otherLevel = (course) => course.job.courses.find((c) => c !== course);
