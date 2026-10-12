// Prépare les données du faux Supabase à partir de content/ (pour les tests navigateur).
import { readFileSync, readdirSync, existsSync, writeFileSync } from 'node:fs';
import { join, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';
import { COURSES } from '../../assets/js/catalog.js';

const root = join(dirname(fileURLToPath(import.meta.url)), '../..');
const fx = { courses: [], lessons: [], module_questions: [], exam_questions: [] };
fx.courses = COURSES.map((c) => ({ id: c.id, job_key: c.job.key, job_name: c.job.name, level: c.level, title: c.title, hours: c.hours, published: c.published }));
let qid = 1;
for (const id of readdirSync(join(root, 'content/courses'))) {
  const f = join(root, 'content/courses', id, 'course.json');
  if (!existsSync(f)) continue;
  const c = JSON.parse(readFileSync(f, 'utf8'));
  c.modules.forEach((m, i) => {
    fx.lessons.push({ course_id: id, module_index: i, title: m.title, summary: m.summary, video_url: m.video_url || null,
      body_md: readFileSync(join(root, 'content/courses', id, m.file), 'utf8') });
    m.questions.forEach((q, k) => fx.module_questions.push({ id: qid++, course_id: id, module_index: i, position: k, question: q.q, options: q.options, correct: q.correct }));
  });
  c.exam.forEach((q) => fx.exam_questions.push({ id: qid++, course_id: id, question: q.q, options: q.options, correct: q.correct }));
}
writeFileSync(join(root, 'tests/browser/.fixture.js'), `window.__VITAKO_FIXTURE__ = ${JSON.stringify(fx)};\n`);
console.log(`fixture : ${fx.lessons.length} leçons, ${fx.exam_questions.length} questions d'examen`);
