// Faux Supabase, utilisé UNIQUEMENT pour les tests dans un navigateur sans connexion.
// Il imite l'API de supabase-js utilisée par assets/js/api.js et reprend, en simplifié,
// la logique des fonctions de supabase/schema.sql. Les données sont gardées dans localStorage.
(function () {
  const FIX = window.__VITAKO_FIXTURE__; // { lessons, module_questions, exam_questions, courses }
  const KEY = 'vitako_mock_db';
  const load = () => { try { return JSON.parse(localStorage.getItem(KEY)); } catch (e) { return null; } };
  let db = load() || {
    users: [], profiles: [], progress: [], exam_attempts: [], certificates: [], payments: [], reviews: [],
    settings: [{ key: 'price_ar', value: '60000' }, { key: 'promo_price_ar', value: '30000' }, { key: 'promo_until', value: '2026-11-30' }, { key: 'access_days', value: '30' }],
    session: null,
  };
  const save = () => localStorage.setItem(KEY, JSON.stringify(db));
  const uuid = () => 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, (c) => { const r = Math.random() * 16 | 0; return (c === 'x' ? r : (r & 3 | 8)).toString(16); });
  const now = () => new Date().toISOString();
  const err = (message) => ({ data: null, error: { message } });
  const me = () => db.session?.user?.id;
  const profile = () => db.profiles.find((p) => p.id === me());
  const isAdmin = () => !!profile()?.is_admin;
  const hasAccess = () => { const p = profile(); return !!p && (p.is_admin || (p.sub_end && new Date(p.sub_end) > new Date())); };
  const listeners = [];
  // Comme supabase-js : la connexion attend la fin des rappels, et les appels à la base
  // attendent la fin de la connexion. Un rappel qui appelle la base bloquerait tout.
  let authLock = null;
  const emit = async (ev) => {
    let release; authLock = new Promise((r) => { release = r; });
    try { await Promise.all(listeners.map((cb) => cb(ev, db.session))); } finally { authLock = null; release(); }
  };
  const waitAuth = () => authLock || Promise.resolve();

  function table(name) {
    switch (name) {
      case 'settings': return db.settings;
      case 'courses': return FIX.courses;
      case 'profiles': return db.profiles.filter((p) => p.id === me() || isAdmin());
      case 'lessons': return hasAccess() ? FIX.lessons : [];
      case 'module_questions': return hasAccess() ? FIX.module_questions : [];
      case 'progress': return db.progress.filter((p) => p.user_id === me() || isAdmin());
      case 'exam_attempts': return db.exam_attempts.filter((p) => p.user_id === me() || isAdmin());
      case 'reviews': return (db.reviews ||= []).filter((p) => p.user_id === me() || isAdmin());
      case 'certificates': return db.certificates.filter((p) => p.user_id === me() || isAdmin());
      case 'payments': return db.payments.filter((p) => p.user_id === me() || isAdmin())
        .map((p) => ({ ...p, profile: (({ full_name, email }) => ({ full_name, email }))(db.profiles.find((x) => x.id === p.user_id) || {}) }));
      default: throw new Error('table inconnue ' + name);
    }
  }

  class Query {
    constructor(name) { this.name = name; this.filters = []; this.op = 'select'; }
    select(cols, opts) { this.opts = opts || {}; return this; }
    eq(c, v) { this.filters.push((r) => r[c] === v); return this; }
    neq(c, v) { this.filters.push((r) => r[c] !== v); return this; }
    gt(c, v) { this.filters.push((r) => r[c] != null && r[c] > v); return this; }
    not(c, op, v) { this.filters.push((r) => r[c] !== null && r[c] !== undefined); return this; }
    order(c, o) { this.sort = [c, o?.ascending !== false]; return this; }
    limit(n) { this.lim = n; return this; }
    maybeSingle() { this.single = true; return this; }
    update(vals) { this.op = 'update'; this.vals = vals; return this; }
    upsert(row) { this.op = 'upsert'; this.row = row; return this; }
    then(res, rej) { return waitAuth().then(() => this.exec()).then(res, rej); }
    exec() {
      if (this.op === 'upsert') {
        if (this.name !== 'progress') return err('permission denied');
        const r = this.row;
        if (r.user_id !== me() || !hasAccess()) return err('new row violates row-level security policy');
        if (!db.progress.some((p) => p.user_id === r.user_id && p.course_id === r.course_id && p.module_index === r.module_index)) {
          db.progress.push({ ...r, completed_at: now() }); save();
        }
        return { data: null, error: null };
      }
      let rows = table(this.name).filter((r) => this.filters.every((f) => f(r)));
      if (this.op === 'update') {
        if (this.name !== 'profiles' || Object.keys(this.vals).some((k) => k !== 'full_name' && k !== 'avatar_url')) return err('permission denied');
        rows.filter((r) => r.id === me()).forEach((r) => Object.assign(db.profiles.find((p) => p.id === r.id), this.vals));
        save(); return { data: null, error: null };
      }
      if (this.sort) { const [c, asc] = this.sort; rows = rows.slice().sort((a, b) => (a[c] > b[c] ? 1 : a[c] < b[c] ? -1 : 0) * (asc ? 1 : -1)); }
      if (this.lim) rows = rows.slice(0, this.lim);
      if (this.opts?.head) return { data: null, count: rows.length, error: null };
      if (this.single) return { data: rows[0] ? JSON.parse(JSON.stringify(rows[0])) : null, error: null };
      return { data: JSON.parse(JSON.stringify(rows)), error: null };
    }
  }

  const newCertId = () => 'VTK-' + new Date().getFullYear() + '-' + Math.random().toString(16).slice(2, 8).toUpperCase();
  const RPC = {
    submit_payment({ p_operator, p_reference, p_sender }) {
      if (!me()) return err('not_authenticated');
      const ref = String(p_reference || '').replace(/\s/g, '').toUpperCase();
      const sender = String(p_sender || '').replace(/\D/g, '') || null;
      if (!['mvola', 'orange'].includes(p_operator)) return err('bad_operator');
      if (!/^[A-Z0-9][A-Z0-9.-]{4,39}$/.test(ref)) return err('bad_reference');
      if (sender && !/^03\d{8}$/.test(sender)) return err('bad_sender');
      if (sender && ((p_operator === 'mvola' && !['034', '038'].includes(sender.slice(0, 3))) || (p_operator === 'orange' && !['032', '037'].includes(sender.slice(0, 3))))) return err('sender_operator_mismatch');
      if (db.payments.some((p) => p.user_id === me() && p.status === 'pending')) return err('already_pending');
      if (db.payments.some((p) => p.operator === p_operator && p.reference === ref && p.status !== 'rejected')) return err('reference_used');
      const row = { id: uuid(), user_id: me(), operator: p_operator, reference: ref, sender, amount: (new Date(Date.now() + 3 * 3600e3).toISOString().slice(0, 10) <= '2026-11-30' ? 30000 : 60000), status: 'pending', reason: null, created_at: now(), decided_at: null, access_until: null };
      db.payments.push(row); save(); return { data: row, error: null };
    },
    admin_decide_payment({ p_id, p_approve, p_reason }) {
      if (!isAdmin()) return err('forbidden');
      const p = db.payments.find((x) => x.id === p_id);
      if (!p) return err('not_found');
      if (p.status !== 'pending') return err('already_decided');
      if (p_approve) {
        const prof = db.profiles.find((x) => x.id === p.user_id);
        const base = Math.max(Date.now(), prof.sub_end ? Date.parse(prof.sub_end) : 0);
        prof.sub_end = new Date(base + 30 * 864e5).toISOString();
        Object.assign(p, { status: 'approved', decided_at: now(), access_until: prof.sub_end });
      } else Object.assign(p, { status: 'rejected', decided_at: now(), reason: p_reason || 'Paiement introuvable' });
      save(); return { data: p, error: null };
    },
    submit_review({ p_course, p_rating, p_comment, p_publish }) {
      if (!me()) return err('not_authenticated');
      if (!(p_rating >= 1 && p_rating <= 5)) return err('bad_rating');
      if (!db.certificates.some((c) => c.user_id === me() && c.kind === 'course' && c.course_id === p_course)) return err('no_certificate');
      db.reviews ||= [];
      db.reviews = db.reviews.filter((r) => !(r.user_id === me() && r.course_id === p_course));
      const row = { id: uuid(), user_id: me(), course_id: p_course, rating: p_rating, comment: String(p_comment || '').trim().slice(0, 1000), can_publish: !!p_publish, created_at: now() };
      db.reviews.push(row); save(); return { data: row, error: null };
    },
    admin_reviews() {
      if (!isAdmin()) return err('forbidden');
      const list = (db.reviews || []).slice().reverse().map((r) => {
        const p = db.profiles.find((x) => x.id === r.user_id) || {};
        return { ...r, full_name: p.full_name, email: p.email, course_title: (FIX.courses.find((c) => c.id === r.course_id) || {}).title };
      });
      return { data: list, error: null };
    },
    submit_feedback({ p_category, p_message, p_email, p_page }) {
      if (!['site', 'bug', 'formation', 'autre'].includes(p_category)) return err('bad_category');
      const msg = String(p_message || '').trim();
      if (msg.length < 10) return err('message_too_short');
      db.feedback ||= [];
      const row = { id: uuid(), user_id: me() || null, email: p_email || (profile() || {}).email || null, category: p_category, message: msg, page: p_page || null, status: 'new', created_at: now() };
      db.feedback.push(row); save(); return { data: row.id, error: null };
    },
    admin_feedback() {
      if (!isAdmin()) return err('forbidden');
      return { data: (db.feedback || []).slice().reverse().map((f) => ({ ...f, full_name: (db.profiles.find((p) => p.id === f.user_id) || {}).full_name || null, has_account: !!f.user_id })), error: null };
    },
    admin_feedback_mark({ p_id, p_read }) {
      if (!isAdmin()) return err('forbidden');
      const f = (db.feedback || []).find((x) => x.id === p_id); if (!f) return err('not_found');
      f.status = p_read ? 'read' : 'new'; save(); return { data: null, error: null };
    },
    admin_feedback_new_count() {
      if (!isAdmin()) return err('forbidden');
      return { data: (db.feedback || []).filter((f) => f.status === 'new').length, error: null };
    },
    admin_stats() {
      if (!isAdmin()) return err('forbidden');
      const st = db.profiles.filter((p) => !p.is_admin);
      const day = (iso) => new Date(Date.parse(iso) + 3 * 3600e3).toISOString().slice(0, 10);
      const today = day(now());
      const signups = Array.from({ length: 30 }, (_, i) => {
        const d = new Date(Date.parse(today) - (29 - i) * 864e5).toISOString().slice(0, 10);
        return { d, n: st.filter((p) => day(p.created_at || now()) === d).length };
      });
      const ok = db.payments.filter((p) => p.status === 'approved');
      const learners = new Set(db.progress.map((x) => x.user_id));
      const byCourse = {};
      db.progress.forEach((x) => { (byCourse[x.course_id] ||= new Set()).add(x.user_id); });
      const top = Object.entries(byCourse).map(([id, set]) => ({ id, title: (FIX.courses.find((c) => c.id === id) || {}).title || id, learners: set.size,
        certs: db.certificates.filter((c) => c.kind === 'course' && c.course_id === id).length })).sort((a, b) => b.learners - a.learners).slice(0, 10);
      const exams = db.exam_attempts.filter((a) => a.submitted_at);
      return { data: {
        users: { total: st.length, today: st.filter((p) => day(p.created_at || now()) === today).length, week: st.length, month: st.length },
        subs: { active: st.filter((p) => p.sub_end && new Date(p.sub_end) > new Date()).length, expired: st.filter((p) => p.sub_end && new Date(p.sub_end) <= new Date()).length,
          never: st.filter((p) => !p.sub_end).length, ending7: 0 },
        payments: { pending: db.payments.filter((p) => p.status === 'pending').length, approved: ok.length, rejected: db.payments.filter((p) => p.status === 'rejected').length,
          revenue_total: ok.reduce((n, p) => n + p.amount, 0), revenue_month: ok.reduce((n, p) => n + p.amount, 0) },
        learning: { learners: learners.size, active7: learners.size, modules_done: db.progress.length, exams: exams.length, exams_passed: exams.filter((a) => a.score >= 50).length,
          course_certs: db.certificates.filter((c) => c.kind === 'course').length, job_certs: db.certificates.filter((c) => c.kind === 'job').length },
        signups, top_courses: top,
      }, error: null };
    },
    start_exam({ p_course }) {
      if (!me()) return err('not_authenticated');
      if (!hasAccess()) return err('no_access');
      const c = FIX.courses.find((x) => x.id === p_course && x.published);
      if (!c) return err('not_found');
      const needed = FIX.lessons.filter((l) => l.course_id === p_course).length;
      const done = db.progress.filter((p) => p.user_id === me() && p.course_id === p_course).length;
      if (done < needed) return err('modules_incomplete');
      const qs = FIX.exam_questions.filter((q) => q.course_id === p_course).sort(() => Math.random() - 0.5).slice(0, 10);
      const att = { id: uuid(), user_id: me(), course_id: p_course, question_ids: qs.map((q) => q.id), started_at: now(), submitted_at: null, score: null };
      db.exam_attempts.push(att); save();
      return { data: { attempt_id: att.id, questions: qs.map(({ id, question, options }) => ({ id, question, options })) }, error: null };
    },
    submit_exam({ p_attempt, p_answers }) {
      const att = db.exam_attempts.find((a) => a.id === p_attempt && a.user_id === me());
      if (!att) return err('not_found');
      if (att.submitted_at) return err('already_submitted');
      const qs = FIX.exam_questions.filter((q) => att.question_ids.includes(q.id));
      const good = qs.filter((q) => Number(p_answers[q.id]) === q.correct).length;
      const score = Math.round((good * 100) / qs.length);
      Object.assign(att, { submitted_at: now(), score });
      const course = FIX.courses.find((c) => c.id === att.course_id);
      const name = profile().full_name;
      let cert = null; let jobCert = null;
      if (score >= 50) {
        cert = db.certificates.find((c) => c.user_id === me() && c.kind === 'course' && c.course_id === course.id);
        if (!cert) { cert = { id: newCertId(), user_id: me(), kind: 'course', course_id: course.id, job_key: course.job_key, full_name: name, title: course.title, score, hours: course.hours, issued_at: now() }; db.certificates.push(cert); } else cert.score = Math.max(cert.score, score);
        const levels = FIX.courses.filter((c) => c.job_key === course.job_key).length;
        const have = db.certificates.filter((c) => c.user_id === me() && c.kind === 'course' && c.job_key === course.job_key).length;
        if (have >= levels) {
          jobCert = db.certificates.find((c) => c.user_id === me() && c.kind === 'job' && c.job_key === course.job_key);
          if (!jobCert) { jobCert = { id: newCertId(), user_id: me(), kind: 'job', course_id: null, job_key: course.job_key, full_name: name, title: course.job_name, score: null, hours: 0, issued_at: now() }; db.certificates.push(jobCert); }
        }
      }
      save();
      const mine = db.exam_attempts.filter((a) => a.user_id === me() && a.course_id === att.course_id && a.submitted_at);
      return { data: { score, good, total: qs.length, passed: score >= 50, best: Math.max(...mine.map((a) => a.score)), attempts: mine.length, certificate_id: cert?.id || null, job_certificate_id: jobCert?.id || null }, error: null };
    },
    verify_certificate({ p_id }) {
      const c = db.certificates.find((x) => x.id === String(p_id).trim().toUpperCase());
      return { data: c ? { id: c.id, kind: c.kind, title: c.title, full_name: c.full_name, score: c.score, hours: c.hours, issued_at: c.issued_at } : null, error: null };
    },
  };

  const auth = {
    async getSession() { return { data: { session: db.session } }; },
    onAuthStateChange(cb) { listeners.push(cb); return { data: { subscription: { unsubscribe() {} } } }; },
    async signUp({ email, password, options }) {
      if (db.users.some((u) => u.email === email)) return err('User already registered');
      const user = { id: uuid(), email, password };
      db.users.push(user);
      db.profiles.push({ id: user.id, full_name: options?.data?.full_name || email.split('@')[0], email, is_admin: email.startsWith('admin@'), sub_end: null, created_at: now() });
      db.session = { user: { id: user.id, email } }; save(); await emit('SIGNED_IN');
      return { data: { user: db.session.user, session: db.session }, error: null };
    },
    async signInWithPassword({ email, password }) {
      const u = db.users.find((x) => x.email === email && x.password === password);
      if (!u) return err('Invalid login credentials');
      db.session = { user: { id: u.id, email } }; save(); await emit('SIGNED_IN');
      return { data: { session: db.session }, error: null };
    },
    async signOut() { db.session = null; save(); await emit('SIGNED_OUT'); return { error: null }; },
    async resetPasswordForEmail() { return { data: {}, error: null }; },
    async updateUser({ password }) { const u = db.users.find((x) => x.id === me()); if (u) u.password = password; save(); return { data: {}, error: null }; },
  };

  window.supabase = {
    createClient() {
      const storage = {
        from: (bucket) => ({
          async upload(path, blob, opts) {
            if (bucket !== 'avatars' || !me() || path.split('/')[0] !== me()) return err('new row violates row-level security policy');
            if (blob.size > 10240) return err('The object exceeded the maximum allowed size');
            const url = await new Promise((r) => { const fr = new FileReader(); fr.onload = () => r(fr.result); fr.readAsDataURL(blob); });
            (db.files ||= {})[bucket + '/' + path] = { url, size: blob.size, type: blob.type }; save();
            return { data: { path }, error: null };
          },
          getPublicUrl(path) { const f = db.files?.[bucket + '/' + path]; return { data: { publicUrl: f ? f.url : 'https://mock.supabase.co/storage/v1/object/public/' + bucket + '/' + path } }; },
          async remove(paths) { paths.forEach((p) => { if (db.files) delete db.files[bucket + '/' + p]; }); save(); return { data: [], error: null }; },
        }),
      };
      return { auth, storage, from: (name) => new Query(name), rpc: async (name, params) => RPC[name](params) };
    },
  };
  window.__mockdb = () => db;
})();
