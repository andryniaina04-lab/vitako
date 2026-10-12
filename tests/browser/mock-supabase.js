// Faux Supabase, utilisé UNIQUEMENT pour les tests dans un navigateur sans connexion.
// Il imite l'API de supabase-js utilisée par assets/js/api.js et reprend, en simplifié,
// la logique des fonctions de supabase/schema.sql. Les données sont gardées dans localStorage.
(function () {
  const FIX = window.__VITAKO_FIXTURE__; // { lessons, module_questions, exam_questions, courses }
  const KEY = 'vitako_mock_db';
  const load = () => { try { return JSON.parse(localStorage.getItem(KEY)); } catch (e) { return null; } };
  let db = load() || {
    users: [], profiles: [], progress: [], exam_attempts: [], certificates: [], payments: [],
    settings: [{ key: 'price_ar', value: '25000' }, { key: 'access_days', value: '30' }],
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
  const emit = (ev) => listeners.forEach((cb) => setTimeout(() => cb(ev, db.session), 0));

  function table(name) {
    switch (name) {
      case 'settings': return db.settings;
      case 'courses': return FIX.courses;
      case 'profiles': return db.profiles.filter((p) => p.id === me() || isAdmin());
      case 'lessons': return hasAccess() ? FIX.lessons : [];
      case 'module_questions': return hasAccess() ? FIX.module_questions : [];
      case 'progress': return db.progress.filter((p) => p.user_id === me() || isAdmin());
      case 'exam_attempts': return db.exam_attempts.filter((p) => p.user_id === me() || isAdmin());
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
    then(res, rej) { return Promise.resolve(this.exec()).then(res, rej); }
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
        if (this.name !== 'profiles' || Object.keys(this.vals).some((k) => k !== 'full_name')) return err('permission denied');
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
      const row = { id: uuid(), user_id: me(), operator: p_operator, reference: ref, sender, amount: 25000, status: 'pending', reason: null, created_at: now(), decided_at: null, access_until: null };
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
      db.session = { user: { id: user.id, email } }; save(); emit('SIGNED_IN');
      return { data: { user: db.session.user, session: db.session }, error: null };
    },
    async signInWithPassword({ email, password }) {
      const u = db.users.find((x) => x.email === email && x.password === password);
      if (!u) return err('Invalid login credentials');
      db.session = { user: { id: u.id, email } }; save(); emit('SIGNED_IN');
      return { data: { session: db.session }, error: null };
    },
    async signOut() { db.session = null; save(); emit('SIGNED_OUT'); return { error: null }; },
    async resetPasswordForEmail() { return { data: {}, error: null }; },
    async updateUser({ password }) { const u = db.users.find((x) => x.id === me()); if (u) u.password = password; save(); return { data: {}, error: null }; },
  };

  window.supabase = {
    createClient() {
      return { auth, from: (name) => new Query(name), rpc: async (name, params) => RPC[name](params) };
    },
  };
  window.__mockdb = () => db;
})();
