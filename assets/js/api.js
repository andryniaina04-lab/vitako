// Accès aux données (Supabase). Toutes les règles de sécurité sont dans la base :
// ce fichier ne fait qu'appeler les tables et les fonctions de supabase/schema.sql.
const CFG = window.VITAKO_CONFIG || {};

export const configured = Boolean(CFG.supabaseUrl && CFG.supabaseAnonKey && window.supabase);

// Verrou propre à chaque onglet. Par défaut, supabase-js partage un verrou entre tous les
// onglets du site : un onglet resté bloqué (ancienne version, téléphone en veille…) pouvait
// alors empêcher toute connexion dans les autres onglets.
let lockChain = Promise.resolve();
function tabLock(name, timeout, fn) {
  const run = lockChain.then(() => fn());
  lockChain = run.catch(() => {});
  return run;
}

export const sb = configured
  ? window.supabase.createClient(CFG.supabaseUrl, CFG.supabaseAnonKey, {
      auth: { flowType: 'pkce', persistSession: true, autoRefreshToken: true, detectSessionInUrl: true, lock: tabLock },
    })
  : null;

// Limite de temps pour les appels de connexion : jamais de bouton bloqué indéfiniment.
export function withTimeout(promise, ms = 20000) {
  return Promise.race([
    promise,
    new Promise((_, reject) => setTimeout(() => reject(new ApiError({ message: 'timeout' })), ms)),
  ]);
}

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
  no_certificate: 'Vous pourrez donner votre avis après avoir obtenu l\'attestation de cette formation.',
  bad_rating: 'Choisissez une note de 1 à 5 étoiles.',
  campaign_locked: 'Cette campagne a déjà été envoyée : elle ne peut plus être modifiée ni supprimée.',
  not_started: 'Lancez d\'abord l\'envoi de la campagne.',
  resend_missing: 'La clé Resend est absente du coffre-fort Supabase (secret « resend_api_key »).',
  bad_category: 'Choisissez le type de remarque.',
  message_too_short: 'Votre message est trop court : écrivez au moins 10 caractères.',
  message_too_long: 'Votre message est trop long : 2 000 caractères au maximum.',
  bad_email: 'Cette adresse e-mail ne semble pas valide.',
  too_many_feedback: 'Vous avez envoyé plusieurs remarques récemment. Réessayez dans une heure.',
  timeout: 'La connexion prend trop de temps. Vérifiez votre connexion Internet, fermez les autres onglets Vitako, puis réessayez.',
  'Invalid login credentials': 'E-mail ou mot de passe incorrect.',
  'Email not confirmed': 'Confirmez d\'abord votre adresse : ouvrez le lien reçu par e-mail.',
  'User already registered': 'Un compte existe déjà avec cet e-mail. Connectez-vous plutôt.',
  'rate limit': 'Beaucoup d\'inscriptions en ce moment. Patientez quelques minutes puis réessayez.',
  'Too Many Requests': 'Beaucoup d\'inscriptions en ce moment. Patientez quelques minutes puis réessayez.',
  'Password should be at least 6 characters':'Le mot de passe doit contenir au moins 8 caractères.',
  trainer_profile_incomplete: 'Remplissez d\'abord votre profil formateur (photo, métier, bio, domaines et un moyen de contact), puis enregistrez-le.',
  not_trainer: 'Cette action est réservée aux formateurs.',
  bad_domain: 'Choisissez vos domaines dans la liste.',
  bad_phone: 'Numéro de téléphone invalide : 10 chiffres, par exemple 034 12 345 67.',
  bad_link: 'Un lien n\'est pas valide. Copiez l\'adresse complète, par exemple https://facebook.com/votre.page.',
  bad_image: 'Cette image n\'a pas pu être enregistrée. Réessayez.',
  headline_too_long: 'Le métier affiché est trop long : 80 caractères au maximum.',
  bio_too_long: 'La présentation est trop longue : 1 500 caractères au maximum.',
  rates_too_long: 'Les tarifs sont trop longs : 600 caractères au maximum.',
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

export async function signUp(email, password, fullName, role = 'student') {
  need();
  const data = role === 'trainer' ? { full_name: fullName, role: 'trainer' } : { full_name: fullName };
  return run(withTimeout(sb.auth.signUp({ email, password, options: { data, emailRedirectTo: homeUrl() } })));
}
export async function signIn(email, password) {
  need();
  return run(withTimeout(sb.auth.signInWithPassword({ email, password })));
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
  return run(sb.from('profiles').select('*').eq('id', uid).maybeSingle());
}
// Photo de profil : fichier déjà compressé par le navigateur, rangé dans avatars/<uid>/.
export async function uploadAvatar(uid, blob) {
  need();
  const ext = blob.type === 'image/webp' ? 'webp' : 'jpg';
  const path = `${uid}/avatar.${ext}`;
  const up = await sb.storage.from('avatars').upload(path, blob, { upsert: true, contentType: blob.type, cacheControl: '3600' });
  if (up.error) throw new ApiError(up.error);
  const pub = sb.storage.from('avatars').getPublicUrl(path).data.publicUrl;
  const url = /^https?:/.test(pub) ? pub + '?v=' + Date.now() : pub; // ?v= : la nouvelle photo remplace l'ancienne en cache
  await run(sb.from('profiles').update({ avatar_url: url }).eq('id', uid));
  return url;
}
export async function removeAvatar(uid) {
  need();
  await sb.storage.from('avatars').remove([`${uid}/avatar.webp`, `${uid}/avatar.jpg`]).catch(() => null);
  await run(sb.from('profiles').update({ avatar_url: null }).eq('id', uid));
}
// --- Formateurs -----------------------------------------------------------
export async function becomeTrainer() {
  need();
  return run(sb.rpc('become_trainer'));
}
export async function leaveTrainer() {
  need();
  return run(sb.rpc('leave_trainer'));
}
export async function getMyTrainer(uid) {
  need();
  return run(sb.from('trainer_profiles').select('*').eq('user_id', uid).maybeSingle());
}
export async function saveTrainer(fields) {
  need();
  return run(sb.rpc('save_trainer_profile', { p: fields }));
}
// Couverture (compartiment covers, 30 Ko) ou visuel carré (compartiment avatars, 10 Ko), déjà compressés.
export async function uploadTrainerImage(uid, kind, blob) {
  need();
  const ext = blob.type === 'image/webp' ? 'webp' : 'jpg';
  const bucket = kind === 'cover' ? 'covers' : 'avatars';
  const path = `${uid}/${kind === 'cover' ? 'cover' : 'visuel'}.${ext}`;
  const up = await sb.storage.from(bucket).upload(path, blob, { upsert: true, contentType: blob.type, cacheControl: '3600' });
  if (up.error) throw new ApiError(up.error);
  const other = `${uid}/${kind === 'cover' ? 'cover' : 'visuel'}.${ext === 'webp' ? 'jpg' : 'webp'}`;
  sb.storage.from(bucket).remove([other]).catch(() => null);
  const pub = sb.storage.from(bucket).getPublicUrl(path).data.publicUrl;
  const url = /^https?:/.test(pub) ? pub + '?v=' + Date.now() : pub;
  return run(sb.rpc('set_trainer_image', { p_kind: kind, p_url: url }));
}
export async function removeTrainerImage(uid, kind) {
  need();
  const bucket = kind === 'cover' ? 'covers' : 'avatars';
  const name = kind === 'cover' ? 'cover' : 'visuel';
  await sb.storage.from(bucket).remove([`${uid}/${name}.webp`, `${uid}/${name}.jpg`]).catch(() => null);
  return run(sb.rpc('set_trainer_image', { p_kind: kind, p_url: null }));
}
export async function getTrainer(id) {
  if (!sb) return null;
  return run(sb.rpc('get_trainer', { p_id: id }));
}
export async function listTrainers() {
  if (!sb) return [];
  return (await run(sb.rpc('list_trainers'))) || [];
}
export async function adminTrainers() {
  need();
  return run(sb.rpc('admin_trainers'));
}
export async function adminDecideTrainer(userId, approve, reason) {
  need();
  return run(sb.rpc('admin_decide_trainer', { p_user: userId, p_approve: approve, p_reason: reason || null }));
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
// --- Formations version 2 (modules découpés en leçons) ----------------------
export async function getCourse2(courseId) {
  need();
  const [mods, parts] = await Promise.all([
    run(sb.from('modules2').select('module_index, title, summary').eq('course_id', courseId).order('module_index')),
    run(sb.from('lesson_parts').select('module_index, part_index, title, minutes').eq('course_id', courseId).order('module_index')),
  ]);
  return mods.map((m) => ({ ...m, lessons: parts.filter((p) => p.module_index === m.module_index).sort((a, b) => a.part_index - b.part_index) }));
}
export async function getPart(courseId, mi, pi) {
  need();
  const row = await run(sb.from('lesson_parts').select('body_md').eq('course_id', courseId).eq('module_index', mi).eq('part_index', pi).maybeSingle());
  return row?.body_md || '';
}
export async function getPartQuestions(courseId, mi, pi) {
  need();
  return run(sb.from('part_questions').select('id, question, options, correct, explanation')
    .eq('course_id', courseId).eq('module_index', mi).eq('part_index', pi).order('position'));
}
export async function getPartProgress(uid) {
  need();
  return run(sb.from('part_progress').select('course_id, module_index, part_index, good, total').eq('user_id', uid));
}
export async function completePart(courseId, mi, pi, good, total) {
  need();
  return run(sb.rpc('complete_part', { p_course: courseId, p_module: mi, p_part: pi, p_good: good, p_total: total }));
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
// Mises à jour des formations commencées (abonnés) : pour la cloche
export async function myCourseUpdates() {
  need();
  return run(sb.rpc('my_course_updates'));
}

export async function getMyPayments(uid) {
  need();
  return run(sb.from('payments').select('*').eq('user_id', uid).order('created_at', { ascending: false }).limit(20));
}

// --- Administration -----------------------------------------------------
export async function adminPayments(status) {
  need();
  let q = sb.from('payments').select('*, profile:profiles!payments_user_id_fkey(*)');
  q = status === 'pending'
    ? q.eq('status', 'pending').order('created_at', { ascending: true })
    : q.neq('status', 'pending').order('decided_at', { ascending: false }).limit(50);
  return run(q);
}
export async function adminDecide(id, approve, reason) {
  need();
  return run(sb.rpc('admin_decide_payment', { p_id: id, p_approve: approve, p_reason: reason || null }));
}
export async function getMyReviews(uid) {
  need();
  return run(sb.from('reviews').select('course_id, rating').eq('user_id', uid));
}
export async function submitReview(courseId, rating, comment, publish) {
  need();
  return run(sb.rpc('submit_review', { p_course: courseId, p_rating: rating, p_comment: comment, p_publish: publish }));
}
export async function adminReviewsMarkSeen() {
  need();
  return run(sb.rpc('admin_reviews_mark_seen'));
}
export async function adminReviews() {
  need();
  return run(sb.rpc('admin_reviews'));
}
export async function submitFeedback(category, message, email, page) {
  need();
  return run(sb.rpc('submit_feedback', { p_category: category, p_message: message, p_email: email || null, p_page: page || null }));
}
export async function adminFeedback() {
  need();
  return run(sb.rpc('admin_feedback'));
}
export async function adminFeedbackMark(id, read) {
  need();
  return run(sb.rpc('admin_feedback_mark', { p_id: id, p_read: read }));
}
// Tous les inscrits (l'administrateur peut lire tous les profils, voir schema.sql). Par paquets de 1 000.
export async function adminUsers() {
  need();
  const out = [];
  for (let from = 0; ; from += 1000) {
    const rows = await run(sb.from('profiles').select('id, full_name, email, role, is_admin, sub_end, created_at, avatar_url')
      .order('created_at', { ascending: false }).range(from, from + 999));
    out.push(...rows);
    if (rows.length < 1000) return out;
  }
}
// Toutes les attestations (lecture réservée à l'administrateur par la sécurité de la base).
export async function adminCertificates() {
  need();
  const out = [];
  for (let from = 0; ; from += 1000) {
    const rows = await run(sb.from('certificates').select('id, user_id, kind, course_id, title, score, issued_at')
      .order('issued_at', { ascending: false }).range(from, from + 999));
    out.push(...rows);
    if (rows.length < 1000) return out;
  }
}
export async function adminStats() {
  need();
  return run(sb.rpc('admin_stats'));
}
export async function adminCounts() {
  need();
  const [pending, active] = await Promise.all([
    sb.from('payments').select('id', { count: 'exact', head: true }).eq('status', 'pending'),
    sb.from('profiles').select('id', { count: 'exact', head: true }).gt('sub_end', new Date().toISOString()),
  ]);
  if (pending.error) throw new ApiError(pending.error);
  if (active.error) throw new ApiError(active.error);
  const [fb, tr, rv] = await Promise.all([sb.rpc('admin_feedback_new_count'), sb.rpc('admin_trainer_todo'), sb.rpc('admin_reviews_new_count')]);
  return { pending: pending.count || 0, active: active.count || 0, feedback: fb.error ? 0 : (fb.data || 0), trainers: tr.error ? 0 : (tr.data || 0), reviews: rv.error ? 0 : (rv.data || 0) };
}

// ---------------------------------------------------------------------------
// Emailing et offre réservée aux destinataires
// ---------------------------------------------------------------------------
export async function myOffer() {
  need();
  return run(sb.rpc('my_offer'));
}
export async function claimSiteOffer() {
  need();
  return run(sb.rpc('claim_site_offer'));
}
export async function offerOpen(token) {
  need();
  return run(sb.rpc('offer_open', { p_token: token || null }));
}
export async function emailUnsubscribe(token) {
  need();
  return run(sb.rpc('email_unsubscribe', { p_token: token }));
}
export async function setEmailOptout(optout) {
  need();
  return run(sb.rpc('set_email_optout', { p_optout: optout }));
}
export async function adminCampaigns() {
  need();
  return run(sb.rpc('admin_campaigns'));
}
export async function adminAudienceCounts() {
  need();
  return run(sb.rpc('admin_audience_counts'));
}
export async function adminCampaignSave(c) {
  need();
  return run(sb.rpc('admin_campaign_save', { p: c }));
}
export async function adminCampaignDelete(id) {
  need();
  return run(sb.rpc('admin_campaign_delete', { p_id: id }));
}
export async function adminCampaignPreview(id) {
  need();
  return run(sb.rpc('admin_campaign_preview', { p_id: id }));
}
export async function adminCampaignTest(id) {
  need();
  return run(sb.rpc('admin_campaign_test', { p_id: id }));
}
export async function adminCampaignStart(id) {
  need();
  return run(sb.rpc('admin_campaign_start', { p_id: id }));
}
export async function adminCampaignSendBatch(id) {
  need();
  return run(sb.rpc('admin_campaign_send_batch', { p_id: id }));
}
export async function adminCampaignRetry(id) {
  need();
  return run(sb.rpc('admin_campaign_retry', { p_id: id }));
}

// ---------------------------------------------------------------------------
// Visites du site (mesure anonyme, voir supabase/migrations/20261023_visites.sql)
// ---------------------------------------------------------------------------
export function trackVisit(v) {
  if (!configured) return;
  sb.rpc('track_visit', { p_visitor: v.visitor, p_session: v.session, p_path: v.path, p_source: v.source, p_device: v.device }).then(() => {}, () => {});
}
export async function adminVisitStats() {
  need();
  return run(sb.rpc('admin_visit_stats'));
}
export async function adminOfferStats() {
  need();
  return run(sb.rpc('admin_offer_stats'));
}

// Notifications push (voir supabase/migrations/20261024_push.sql et api/push.js)
export async function pushSubscribe(endpoint, p256dh, auth) {
  need();
  return run(sb.rpc('push_subscribe', { p_endpoint: endpoint, p_p256dh: p256dh, p_auth: auth }));
}
export async function pushUnsubscribe(endpoint) {
  need();
  return run(sb.rpc('push_unsubscribe', { p_endpoint: endpoint }));
}
export async function adminPushStats() {
  need();
  return run(sb.rpc('admin_push_stats'));
}
export async function adminPushTest() {
  need();
  return run(sb.rpc('admin_push_test'));
}
