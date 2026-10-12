// Accès aux données (Supabase). Toutes les règles de sécurité sont dans la base :
// ce fichier ne fait qu'appeler les tables et les fonctions de supabase/schema.sql.
const CFG = window.VITAKO_CONFIG || {};

export const configured = Boolean(CFG.supabaseUrl && CFG.supabaseAnonKey && window.supabase);

export const sb = configured
  ? window.supabase.createClient(CFG.supabaseUrl, CFG.supabaseAnonKey, {
      auth: { flowType: 'pkce', persistSession: true, autoRefreshToken: true, detectSessionInUrl: true },
    })
  : null;

// Messages d'erreur compréhensibles pour les étudiants.
const MESSAGES = {
  not_authenticated: 'Connectez-vous pour continuer.',
  no_access: 'Votre abonnement n\'est pas actif. Abonnez-vous pour suivre les cours.',
  bad_operator: 'Choisissez MVola ou Orange Money.',
  bad_reference: 'Saisissez la référence exactement comme dans le SMS de confirmation (lettres, chiffres et points).',
  bad_sender: 'Le numéro doit avoir 10 chiffres, par exemple 034 12 345 67. Vous pouvez aussi laisser ce champ vide.',
  sender_operator_mismatch: 'Ce numéro ne correspond pas à l\'opérateur choisi. Vérifiez l\'opérateur ou laissez le champ vide.',
  already_pending: 'Vous avez déjà un paiement en attente de validation. Attendez sa validation avant d\'en envoyer un autre.',
  reference_used: 'Cette référence a déjà été envoyée. Chaque paiement a une référence unique : vérifiez votre SMS.',
  forbidden: 'Cette action est réservée à l\'administrateur.',
  already_decided: 'Ce paiement a déjà été traité.',
  not_found: 'Élément introuvable.',
  modules_incomplete: 'Terminez tous les modules avant de passer l\'examen.',
  too_many_attempts: 'Trop de tentatives en une heure. Faites une pause, puis réessayez.',
  no_questions: 'L\'examen de cette formation n\'est pas encore disponible.',
  already_submitted: 'Cet examen a déjà été corrigé. Recommencez un nouveau passage.',
  expired: 'Ce passage a expiré (plus de 3 heures). Recommencez l\'examen.',
  'Invalid login credentials': 'E-mail ou mot de passe incorrect.',
  'Email not confirmed': 'Confirmez d\'abord votre adresse : ouvrez le lien reçu par e-mail.',
  'User already registered': 'Un compte existe déjà avec cet e-mail. Connectez-vous plutôt.',
  'Password should be at least 6 characters': 'Le mot de passe doit contenir au moins 8 caractères.',
};

export class ApiError extends Error {
  constructor(raw) {
    const msg = raw?.message || String(raw);
    const key = Object.keys(MESSAGES).find((k) => msg === k || msg.includes(k));
    super(key ? MESSAGES[key] : 'Une erreur est survenue. Vérifiez votre connexion Internet puis réessayez.');
    this.code = key || 'unknown';
    this.raw = msg;
  }
}

function need() {
  if (!sb) throw new ApiError({ message: 'not_configured' });
}
async function run(promise) {
  const { data, error } = await promise;
  if (error) throw new ApiError(error);
  return data;
}

// --- Comptes ---------------------------------------------------------
export async function getSession() {
  if (!sb) return null;
  const { data } = await sb.auth.getSession();
  return data.session;
}
export function onAuthChange(cb) {
  if (!sb) return;
  // Important : ne jamais appeler Supabase directement dans ce rappel (blocage connu de supabase-js :
  // la connexion attend la fin du rappel, et le rappel attend la connexion). On remet donc
  // le travail à juste après, avec setTimeout.
  sb.auth.onAuthStateChange((event, session) => { setTimeout(() => cb(event, session), 0); });
}
const homeUrl = () => location.origin + location.pathname;

export async function signUp(email, password, fullName) {
  need();
  return run(sb.auth.signUp({ email, password, options: { data: { full_name: fullName }, emailRedirectTo: homeUrl() } }));
}
export async function signIn(email, password) {
  need();
  return run(sb.auth.signInWithPassword({ email, password }));
}
export async function signOut() {
  if (sb) await sb.auth.signOut();
}
export async function sendPasswordReset(email) {
  need();
  return run(sb.auth.resetPasswordForEmail(email, { redirectTo: homeUrl() }));
}
export async function updatePassword(password) {
  need();
  return run(sb.auth.updateUser({ password }));
}

// --- Profil, progression, attestations --------------------------------
export async function getProfile(uid) {
  need();
  return run(sb.from('profiles').select('id, full_name, email, is_admin, sub_end').eq('id', uid).maybeSingle());
}
export async function updateName(uid, fullName) {
  need();
  return run(sb.from('profiles').update({ full_name: fullName }).eq('id', uid));
}
export async function getProgress(uid) {
  need();
  return run(sb.from('progress').select('course_id, module_index').eq('user_id', uid));
}
export async function markModuleDone(uid, courseId, moduleIndex) {
  need();
  return run(sb.from('progress').upsert(
    { user_id: uid, course_id: courseId, module_index: moduleIndex },
    { onConflict: 'user_id,course_id,module_index', ignoreDuplicates: true },
  ));
}
export async function getCertificates(uid) {
  need();
  return run(sb.from('certificates').select('*').eq('user_id', uid).order('issued_at', { ascending: false }));
}
export async function getAttempts(uid) {
  need();
  return run(sb.from('exam_attempts').select('course_id, score, submitted_at')
    .eq('user_id', uid).not('submitted_at', 'is', null));
}
export async function getSettings() {
  if (!sb) return {};
  const rows = await run(sb.from('settings').select('key, value'));
  return Object.fromEntries(rows.map((r) => [r.key, r.value]));
}

// --- Cours --------------------------------------------------------------
export async function getLessons(courseId) {
  need();
  return run(sb.from('lessons').select('module_index, title, summary, body_md, video_url')
    .eq('course_id', courseId).order('module_index'));
}
export async function getModuleQuestions(courseId, moduleIndex) {
  need();
  return run(sb.from('module_questions').select('id, question, options, correct')
    .eq('course_id', courseId).eq('module_index', moduleIndex).order('position'));
}
export async function startExam(courseId) {
  need();
  return run(sb.rpc('start_exam', { p_course: courseId }));
}
export async function submitExam(attemptId, answers) {
  need();
  return run(sb.rpc('submit_exam', { p_attempt: attemptId, p_answers: answers }));
}
export async function verifyCertificate(id) {
  need();
  return run(sb.rpc('verify_certificate', { p_id: id }));
}

// --- Paiements ----------------------------------------------------------
export async function submitPayment(operator, reference, sender) {
  need();
  return run(sb.rpc('submit_payment', { p_operator: operator, p_reference: reference, p_sender: sender || null }));
}
export async function getMyPayments(uid) {
  need();
  return run(sb.from('payments').select('*').eq('user_id', uid).order('created_at', { ascending: false }).limit(20));
}

// --- Administration -----------------------------------------------------
export async function adminPayments(status) {
  need();
  let q = sb.from('payments').select('*, profile:profiles!payments_user_id_fkey(full_name, email)');
  q = status === 'pending'
    ? q.eq('status', 'pending').order('created_at', { ascending: true })
    : q.neq('status', 'pending').order('decided_at', { ascending: false }).limit(50);
  return run(q);
}
export async function adminDecide(id, approve, reason) {
  need();
  return run(sb.rpc('admin_decide_payment', { p_id: id, p_approve: approve, p_reason: reason || null }));
}
export async function adminCounts() {
  need();
  const [pending, active] = await Promise.all([
    sb.from('payments').select('id', { count: 'exact', head: true }).eq('status', 'pending'),
    sb.from('profiles').select('id', { count: 'exact', head: true }).gt('sub_end', new Date().toISOString()),
  ]);
  if (pending.error) throw new ApiError(pending.error);
  if (active.error) throw new ApiError(active.error);
  return { pending: pending.count || 0, active: active.count || 0 };
}
