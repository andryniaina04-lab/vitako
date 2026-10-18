// Génère, à partir du dossier content/ :
//   - assets/js/data.js   (catalogue public utilisé par le site)
//   - supabase/seed.sql   (formations, leçons, tests et examens pour la base)
// Usage : node tools/build.mjs
import { readFileSync, writeFileSync, readdirSync, existsSync } from 'node:fs';
import { join, dirname } from 'node:path';
import { createHash } from 'node:crypto';
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

// Formations « version 2 » : content/courses/<id>/v2/course.json + un fichier par leçon.
// 6 modules, 4 à 6 leçons par module, un QCM (avec explications) par leçon, 60 questions d'examen.
// « live »: false = aperçu réservé à l'administrateur ; true = en ligne pour tous.
const v2 = {};
const durMin = (body, kind) => {
  let total = 0;
  for (const line of body.split('\n')) {
    const m = line.match(new RegExp(`^>\\s*\\[!${kind}\\](.*)$`, 'i'));
    if (!m) continue;
    const h = m[1].match(/(\d+)\s*h(?:eures?)?(?:\s*(\d+))?/i);
    const mn = m[1].match(/(\d+)\s*min/i);
    total += h ? Number(h[1]) * 60 + Number(h[2] || 0) : mn ? Number(mn[1]) : 0;
  }
  return total;
};
for (const id of Object.keys(full)) {
  const file = join(coursesDir, id, 'v2', 'course.json');
  if (!existsSync(file)) continue;
  const c = JSON.parse(readFileSync(file, 'utf8'));
  // Un module ou l'examen peut être rangé dans son propre fichier JSON (ex. "m1.json").
  const sub = (x) => (typeof x === 'string' ? JSON.parse(readFileSync(join(coursesDir, id, 'v2', x), 'utf8')) : x);
  c.modules = c.modules.map(sub);
  c.exam = sub(c.exam);
  const br = { lecture: 0, qcm: 0, exercices: 0, projets: 0, examen: 60 };
  c.modules.forEach((m, i) => {
    if (!m.title || !Array.isArray(m.lessons) || m.lessons.length < 1) throw new Error(`${id} v2 module ${i + 1} : titre ou leçons manquants`);
    m.lessons.forEach((l, k) => {
      const where = `${id} v2 leçon ${i + 1}.${k + 1}`;
      l.body = readFileSync(join(coursesDir, id, 'v2', l.file), 'utf8').trim();
      l.minutes = readingMinutes(l.body, 120);
      if (!Array.isArray(l.questions) || l.questions.length < 3) throw new Error(`${where} : il faut au moins 3 questions`);
      for (const q of l.questions) { check(q, where); if (!q.why) throw new Error(`${where} : explication (why) manquante pour « ${q.q} »`); }
      br.lecture += l.minutes; br.qcm += 5;
      br.exercices += durMin(l.body, 'exercice'); br.projets += durMin(l.body, 'projet');
    });
  });
  if (c.exam.length < 20) throw new Error(`${id} v2 : il faut au moins 20 questions d'examen (${c.exam.length}).`);
  c.exam.forEach((q) => check(q, `${id} v2 examen`));
  c.breakdown = br;
  c.hoursCalc = Math.round(Object.values(br).reduce((a, b) => a + b, 0) / 60);
  if (!c.progress_map || c.progress_map.length !== full[id].modules.length) throw new Error(`${id} v2 : progress_map doit avoir ${full[id].modules.length} valeurs`);
  v2[id] = c;
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
    // Seuls les titres des modules sont publics : résumés et sous-parties restent dans la base (abonnés).
    modules: c.modules.map((m) => ({ title: m.title, minutes: readingMinutes(m.body) })),
  };
}
// Version 2 : en ligne, elle remplace la version 1 ; en aperçu, ses titres sont joints sous « preview ».
for (const [id, c] of Object.entries(v2)) {
  const meta = {
    hours: c.hoursCalc,
    description: c.description,
    objectives: c.objectives,
    breakdown: c.breakdown,
    modules: c.modules.map((m) => ({ title: m.title, minutes: m.lessons.reduce((n, l) => n + l.minutes, 0), lessons: m.lessons.length })),
  };
  published[id] = c.live ? { ...(published[id].title ? { title: published[id].title } : {}), ...meta, format: 2 } : { ...published[id], preview: meta };
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
for (const [id, c] of Object.entries(v2)) {
  out.push(`\n-- ${id} (version 2${c.live ? ', en ligne' : ', aperçu administrateur'})`);
  out.push(`delete from public.lesson_parts where course_id = ${lit(id)};`);
  out.push(`delete from public.modules2 where course_id = ${lit(id)} and module_index >= ${c.modules.length};`);
  c.modules.forEach((m, i) => {
    out.push(`insert into public.modules2 (course_id, module_index, title, summary) values (${lit(id)}, ${i}, ${lit(m.title)}, ${lit(m.summary || '')})`);
    out.push('  on conflict (course_id, module_index) do update set title = excluded.title, summary = excluded.summary;');
    m.lessons.forEach((l, k) => {
      out.push(`insert into public.lesson_parts (course_id, module_index, part_index, title, minutes, body_md) values (${lit(id)}, ${i}, ${k}, ${lit(l.title)}, ${l.minutes}, ${lit(l.body)});`);
      l.questions.forEach((q, n) => {
        const s = shuffled(q, `${id}-v2-${i}-${k}-${n}`);
        out.push(`insert into public.part_questions (course_id, module_index, part_index, position, question, options, correct, explanation) values (${lit(id)}, ${i}, ${k}, ${n}, ${lit(q.q)}, ${json(s.options)}, ${s.correct}, ${lit(q.why)});`);
      });
    });
  });
  c.exam.forEach((q, k) => {
    const s = shuffled(q, `${id}-v2x${k}`);
    out.push(`insert into public.exam_questions (course_id, question, options, correct, version) values (${lit(id)}, ${lit(q.q)}, ${json(s.options)}, ${s.correct}, 2);`);
  });
  out.push(c.live ? `select public.course_go_live(${lit(id)}, array[${c.progress_map.map((x) => (x === null ? 'null' : Number(x))).join(', ')}]::int[]);`
    : `update public.courses set v2_live = false where id = ${lit(id)};`);
}
// Empreinte du contenu visible par les abonnés : si elle change, les personnes qui ont commencé
// la formation sont prévenues (notification et e-mail). Message facultatif : "update_note" dans
// course.json (v2/course.json pour une version 2 en ligne), à changer à chaque mise à jour.
const hashes = {};
for (const [id, c] of Object.entries(full)) {
  const n = v2[id]?.live ? v2[id] : c;
  const visible = v2[id]?.live
    ? { v: 2, modules: n.modules.map((m) => ({ t: m.title, s: m.summary, l: m.lessons.map((l) => ({ t: l.title, b: l.body, q: l.questions })) })), exam: n.exam }
    : { v: 1, modules: n.modules.map((m) => ({ t: m.title, s: m.summary, b: m.body, v: m.video_url, q: m.questions })), exam: n.exam };
  hashes[id] = { h: createHash('sha256').update(JSON.stringify(visible)).digest('hex').slice(0, 32), ...(n.update_note ? { note: n.update_note } : {}) };
}
out.push('\n-- Mises à jour : prévient les abonnés concernés quand le contenu visible change');
out.push(`select public.sync_course_hashes(${json(hashes)});`);
out.push('commit;');
writeFileSync(join(root, 'supabase/seed.sql'), out.join('\n') + '\n');

console.log(`Catalogue : ${COURSES.length} formations, dont ${Object.keys(full).length} publiée(s) : ${Object.keys(full).join(', ')}`);
for (const [id, c] of Object.entries(v2)) {
  const n = c.modules.reduce((a, m) => a + m.lessons.length, 0);
  const words = c.modules.reduce((a, m) => a + m.lessons.reduce((b, l) => b + l.body.split(/\s+/).length, 0), 0);
  const h = (x) => `${Math.floor(x / 60)} h ${String(x % 60).padStart(2, '0')}`;
  console.log(`Version 2 ${id} (${c.live ? 'en ligne' : 'aperçu'}) : ${c.modules.length} modules, ${n} leçons, ${words} mots, ${c.modules.reduce((a, m) => a + m.lessons.reduce((b, l) => b + l.questions.length, 0), 0)} questions de QCM, ${c.exam.length} d'examen`);
  console.log(`  Durée : ${c.hoursCalc} h = lecture ${h(c.breakdown.lecture)} + QCM ${h(c.breakdown.qcm)} + exercices ${h(c.breakdown.exercices)} + projets ${h(c.breakdown.projets)} + examen ${h(c.breakdown.examen)}`);
}
