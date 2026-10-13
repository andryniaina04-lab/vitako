// Génère, à partir du dossier content/ :
//   - assets/js/data.js   (catalogue public utilisé par le site)
//   - supabase/seed.sql   (formations, leçons, tests et examens pour la base)
// Usage : node tools/build.mjs
import { readFileSync, writeFileSync, readdirSync, existsSync } from 'node:fs';
import { join, dirname } from 'node:path';
import { fileURLToPath, pathToFileURL } from 'node:url';

const root = join(dirname(fileURLToPath(import.meta.url)), '..');
const { sections, readingMinutes } = await import(pathToFileURL(join(root, 'assets/js/markdown.js')).href);
const read = (p) => readFileSync(join(root, p), 'utf8');

const domains = JSON.parse(read('content/catalog.json'));

// Formations rédigées : content/courses/<id>/course.json + module-N.md
const coursesDir = join(root, 'content/courses');
const full = {};
for (const id of readdirSync(coursesDir)) {
  const file = join(coursesDir, id, 'course.json');
  if (!existsSync(file)) continue;
  const c = JSON.parse(readFileSync(file, 'utf8'));
  if (c.id !== id) throw new Error(`${file} : id "${c.id}" différent du dossier "${id}"`);
  c.modules.forEach((m, i) => {
    m.body = readFileSync(join(coursesDir, id, m.file), 'utf8').trim();
    for (const q of m.questions) check(q, `${id} module ${i + 1}`);
  });
  if (c.exam.length < 10) throw new Error(`${id} : il faut au moins 10 questions d'examen (${c.exam.length}).`);
  c.exam.forEach((q) => check(q, `${id} examen`));
  full[id] = c;
}

function check(q, where) {
  if (!q.q || !Array.isArray(q.options) || q.options.length < 2 || q.options.length > 6
      || !Number.isInteger(q.correct) || q.correct < 0 || q.correct >= q.options.length) {
    throw new Error(`Question invalide (${where}) : ${JSON.stringify(q).slice(0, 120)}`);
  }
}

// 1) data.js : catalogue public (sans le texte des leçons ni les réponses).
const published = {};
for (const [id, c] of Object.entries(full)) {
  published[id] = {
    ...(c.title ? { title: c.title } : {}),
    hours: c.hours,
    description: c.description,
    objectives: c.objectives,
    modules: c.modules.map((m) => ({ title: m.title, summary: m.summary, sections: sections(m.body), minutes: readingMinutes(m.body) })),
  };
}
writeFileSync(join(root, 'assets/js/data.js'),
  '// Fichier généré par tools/build.mjs. Ne pas modifier à la main : modifier content/.\n' +
  `export const DOMAINS = ${JSON.stringify(domains, null, 1)};\n` +
  `export const PUBLISHED = ${JSON.stringify(published, null, 1)};\n`);

// 2) seed.sql
const { COURSES } = await import(pathToFileURL(join(root, 'assets/js/catalog.js')).href + `?v=${Date.now()}`);
const lit = (s) => (s === null || s === undefined || s === '' ? 'null' : `'${String(s).replace(/'/g, "''")}'`);
const json = (v) => `${lit(JSON.stringify(v))}::jsonb`;

// Mélange les réponses (toujours de la même façon) pour que la bonne ne soit pas toujours la première.
function shuffled(q, seed) {
  let h = 2166136261;
  for (const ch of seed + q.q) h = Math.imul(h ^ ch.charCodeAt(0), 16777619) >>> 0;
  const idx = q.options.map((_, i) => i);
  for (let i = idx.length - 1; i > 0; i--) {
    h = Math.imul(h ^ (h >>> 15), 2246822507) >>> 0;
    const j = h % (i + 1);
    [idx[i], idx[j]] = [idx[j], idx[i]];
  }
  return { options: idx.map((i) => q.options[i]), correct: idx.indexOf(q.correct) };
}

const out = [];
out.push('-- Fichier généré par tools/build.mjs. Ne pas modifier à la main : modifier content/ puis relancer.');
out.push('-- À exécuter dans Supabase > SQL Editor après schema.sql, et à chaque mise à jour du contenu.');
out.push('-- Il remplace le contenu des formations sans toucher aux comptes, paiements ni attestations.');
out.push('begin;');
out.push('insert into public.courses (id, job_key, job_name, level, title, hours, published) values');
out.push(COURSES.map((c) => `  (${lit(c.id)}, ${lit(c.job.key)}, ${lit(c.job.name)}, ${lit(c.level)}, ${lit(c.title)}, ${c.hours}, ${c.published})`).join(',\n'));
out.push('on conflict (id) do update set job_key = excluded.job_key, job_name = excluded.job_name, level = excluded.level,');
out.push('  title = excluded.title, hours = excluded.hours, published = excluded.published;');

for (const [id, c] of Object.entries(full)) {
  out.push(`\n-- ${id}`);
  out.push(`delete from public.exam_questions where course_id = ${lit(id)};`);
  out.push(`delete from public.module_questions where course_id = ${lit(id)};`);
  out.push(`delete from public.lessons where course_id = ${lit(id)} and module_index >= ${c.modules.length};`);
  c.modules.forEach((m, i) => {
    out.push(`insert into public.lessons (course_id, module_index, title, summary, body_md, video_url) values (${lit(id)}, ${i}, ${lit(m.title)}, ${lit(m.summary)}, ${lit(m.body)}, ${lit(m.video_url)})`);
    out.push('  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary, body_md = excluded.body_md, video_url = excluded.video_url;');
    m.questions.forEach((q, k) => {
      const s = shuffled(q, `${id}-m${i}-${k}`);
      out.push(`insert into public.module_questions (course_id, module_index, position, question, options, correct) values (${lit(id)}, ${i}, ${k}, ${lit(q.q)}, ${json(s.options)}, ${s.correct});`);
    });
  });
  c.exam.forEach((q, k) => {
    const s = shuffled(q, `${id}-x${k}`);
    out.push(`insert into public.exam_questions (course_id, question, options, correct) values (${lit(id)}, ${lit(q.q)}, ${json(s.options)}, ${s.correct});`);
  });
}
out.push('commit;');
writeFileSync(join(root, 'supabase/seed.sql'), out.join('\n') + '\n');

console.log(`Catalogue : ${COURSES.length} formations, dont ${Object.keys(full).length} publiée(s) : ${Object.keys(full).join(', ')}`);
