// Vitako : pages du site (routeur, vues, actions).
import * as api from './api.js';
import { JOBS, DOMAINS_LIST, COURSES, courseById, otherLevel, jobByKey } from './catalog.js';
import { md, esc, nbsp, sections, readingMinutes } from './markdown.js';
import { certificatePdf, loadPdfFonts, loadPdfLogo, slug } from './pdf.js';
import { TEMOIGNAGES } from './temoignages.js';

const CFG = window.VITAKO_CONFIG;
const DAY = 864e5;

// ---------------------------------------------------------------------------
// État de la session
// ---------------------------------------------------------------------------
const S = {
  session: null,
  profile: null,
  progress: new Map(),   // course_id -> Set(module_index)
  certs: [],
  reviews: [],
  attempts: [],
  payments: [],
  admin: { pending: 0, active: 0, feedback: 0, trainers: 0 },
  trainer: null,         // profil formateur de la personne connectée (si formateur)
  trainers: null,        // formateurs visibles (liste publique, en cache)
  trainersAt: 0,
  trainerDraft: null,    // formulaire de l'Espace formateur pas encore enregistré
  parts: new Map(),      // version 2 : course_id -> modules et titres des leçons (cache)
  partDone: new Map(),   // version 2 : course_id -> Map("module-leçon" -> { good, total })
  previewOff: false,     // administrateur : voir la version actuelle au lieu de l'aperçu de la version 2
  price: CFG.price,
  promoPrice: CFG.promoPrice || 0,
  promoUntil: CFG.promoUntil || '',
  days: CFG.accessDays,
  lessons: new Map(),    // course_id -> leçons (cache)
  exam: null,            // passage en cours
  examResult: null,      // dernier résultat
  filter: { q: '', dom: 'all' },
  payOp: CFG.operators[0].id,
  booting: true,
  ui: { menu: false, search: false, searchFocus: false, notif: false },
};

const uid = () => S.session?.user?.id;
const isAdmin = () => !!S.profile?.is_admin;
const isTrainer = () => S.profile?.role === 'trainer';
const homeAfterLogin = () => (isAdmin() ? '/admin' : isTrainer() ? '/espace-formateur' : '/mon-espace');
const hasAccess = () => !!S.profile && (S.profile.is_admin || (S.profile.sub_end && new Date(S.profile.sub_end) > new Date()));
const daysLeft = () => Math.max(0, Math.ceil((new Date(S.profile.sub_end) - Date.now()) / DAY));
const doneSet = (cid) => S.progress.get(cid) || new Set();
const courseCert = (cid) => S.certs.find((c) => c.kind === 'course' && c.course_id === cid);
const jobCert = (key) => S.certs.find((c) => c.kind === 'job' && c.job_key === key);
const attemptsOf = (cid) => S.attempts.filter((a) => a.course_id === cid);
const bestOf = (cid) => attemptsOf(cid).reduce((m, a) => Math.max(m, a.score ?? 0), 0);
const pendingPayment = () => S.payments.find((p) => p.status === 'pending');

const fmtDate = (t) => new Date(t).toLocaleDateString('fr-FR', { day: 'numeric', month: 'long', year: 'numeric' });
const fmtDT = (t) => new Date(t).toLocaleString('fr-FR', { day: 'numeric', month: 'short', hour: '2-digit', minute: '2-digit' });
const ar = (n) => Number(n).toLocaleString('fr-FR').replace(/ | /g, ' ') + ' Ar';
// Promotion : active jusqu'au dernier jour inclus, date de Madagascar (UTC+3), comme dans la base.
const mgDate = () => new Date(Date.now() + 3 * 3600e3).toISOString().slice(0, 10);
const promoOn = () => S.promoPrice > 0 && S.promoPrice < S.price && /^\d{4}-\d{2}-\d{2}$/.test(S.promoUntil) && mgDate() <= S.promoUntil;
const priceNow = () => (promoOn() ? S.promoPrice : S.price);
const promoPct = () => Math.round((1 - S.promoPrice / S.price) * 100);
const promoEnd = () => new Date(`${S.promoUntil}T12:00:00`).toLocaleDateString('fr-FR', { day: 'numeric', month: 'long' });
// Prix affiché : ancien prix barré en rouge pendant la promotion
const priceHtml = () => (promoOn()
  ? `<s class="old-price">${ar(S.price)}</s> <span class="new-price">${ar(S.promoPrice)}</span>`
  : ar(S.price));
const promoBanner = () => (promoOn() ? `<a class="promo" href="#/abonnement">
    <span class="promo-pct">-${promoPct()} %</span>
    <span class="promo-txt"><b>Offre de lancement jusqu'au ${promoEnd()}</b>
      <span><b class="promo-new">${ar(S.promoPrice)}</b> au lieu de <s class="old-price">${ar(S.price)}</s> pour ${S.days} jours d'accès à toutes les formations.</span></span>
    <span class="promo-go">J'en profite <span aria-hidden="true">→</span></span></a>` : '');
const fmtTel = (t) => String(t || '').replace(/(\d{3})(\d{2})(\d{3})(\d{2})/, '$1 $2 $3 $4');
const opById = (id) => CFG.operators.find((o) => o.id === id) || CFG.operators[0];
const shuffle = (a) => { a = a.slice(); for (let i = a.length - 1; i > 0; i--) { const j = Math.floor(Math.random() * (i + 1)); [a[i], a[j]] = [a[j], a[i]]; } return a; };
const pad2 = (n) => String(n).padStart(2, '0');
const verifyUrl = (id) => `${location.origin}${location.pathname}#/attestation/${id}`;

async function loadUser() {
  const id = uid();
  if (!id) {
    Object.assign(S, { profile: null, progress: new Map(), certs: [], attempts: [], payments: [], reviews: [], trainer: null, trainerDraft: null, partDone: new Map() });
    return;
  }
  let profile = await api.getProfile(id);
  if (!profile) { await new Promise((r) => setTimeout(r, 800)); profile = await api.getProfile(id); }
  const [progress, certs, attempts, payments, reviews, parts] = await Promise.all([
    api.getProgress(id), api.getCertificates(id), api.getAttempts(id), api.getMyPayments(id),
    api.getMyReviews(id).catch(() => []), api.getPartProgress(id).catch(() => []),
  ]);
  S.partDone = new Map();
  for (const p of parts) {
    if (!S.partDone.has(p.course_id)) S.partDone.set(p.course_id, new Map());
    S.partDone.get(p.course_id).set(`${p.module_index}-${p.part_index}`, { good: p.good, total: p.total });
  }
  S.profile = profile;
  S.progress = new Map();
  for (const p of progress) {
    if (!S.progress.has(p.course_id)) S.progress.set(p.course_id, new Set());
    S.progress.get(p.course_id).add(p.module_index);
  }
  S.certs = certs; S.attempts = attempts; S.payments = payments; S.reviews = reviews;
  S.trainer = profile?.role === 'trainer' ? await api.getMyTrainer(id).catch(() => null) : null;
  if (profile?.is_admin) S.admin = await api.adminCounts().catch(() => S.admin);
}

// ---------------------------------------------------------------------------
// Icônes
// ---------------------------------------------------------------------------
const I = {
  soundOff: '<svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M11 5 6 9H2v6h4l5 4z"/><path d="m22 9-6 6"/><path d="m16 9 6 6"/></svg>',
  soundOn: '<svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M11 5 6 9H2v6h4l5 4z"/><path d="M15.5 8.5a5 5 0 0 1 0 7"/><path d="M19 5a10 10 0 0 1 0 14"/></svg>',
  lock: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" aria-hidden="true"><rect x="5" y="11" width="14" height="10" rx="2"/><path d="M8 11V8a4 4 0 0 1 8 0v3"/></svg>',
  check: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 12.5l4.5 4.5L19 7"/></svg>',
  seal: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="12" cy="9" r="6"/><path d="M8.5 14 7 22l5-3 5 3-1.5-8"/><path d="M9.5 9l2 2 3-3.5"/></svg>',
  eye: '<svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M2 12s3.6-7 10-7 10 7 10 7-3.6 7-10 7S2 12 2 12z"/><circle cx="12" cy="12" r="3"/></svg>',
  eyeOff: '<svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M3 3l18 18"/><path d="M10.6 5.1A10.7 10.7 0 0 1 12 5c6.4 0 10 7 10 7a17.6 17.6 0 0 1-3.2 4.2M6.6 6.6C3.9 8.3 2 12 2 12s3.6 7 10 7a9.8 9.8 0 0 0 5.4-1.6"/><path d="M9.9 9.9a3 3 0 0 0 4.2 4.2"/></svg>',
  sun: '<svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true"><circle cx="12" cy="12" r="4"/><path d="M12 2v2M12 20v2M4.9 4.9l1.4 1.4M17.7 17.7l1.4 1.4M2 12h2M20 12h2M4.9 19.1l1.4-1.4M17.7 6.3l1.4-1.4"/></svg>',
  moon: '<svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M21 12.8A9 9 0 1 1 11.2 3a7 7 0 0 0 9.8 9.8z"/></svg>',
};

// Logo officiel (fichiers sources dans assets/img/logo/). Le mot prend la couleur du texte (currentColor)
// pour rester lisible en thème clair et sombre ; le symbole garde son dégradé.
const LOGO_BOX = 'M54,0h92c29.823,0,54,24.177,54,54h0v92c0,29.823-24.177,54-54,54H54c-29.823,0-54-24.177-54-54V54C0,24.177,24.177,0,54,0Z';
const LOGO_CHECK = 'M56,102.75l27.5,27.5,60.5-60.5';
const LOGO_WORD = ['M342.016,143.148l-13.604-.194,38.481-91.928h42.368l-51.892,110.974h-45.283l-51.892-110.974h43.923l37.898,92.122Z', 'M436.275,40.143c-6.869,0-12.438-1.716-16.714-5.15-4.276-3.432-6.414-8.065-6.414-13.896,0-5.958,2.138-10.689,6.414-14.188s9.845-5.248,16.714-5.248c7.124,0,12.793,1.749,17.005,5.248,4.209,3.499,6.316,8.229,6.316,14.188,0,5.831-2.107,10.464-6.316,13.896-4.212,3.435-9.881,5.15-17.005,5.15ZM416.451,49.277l20.018,3.887,19.824-3.887v112.723h-39.842V49.277Z', 'M464.453,80.373v-17.297l22.545-9.135,17.103-32.845h22.544v29.93h46.645v29.347h-46.645v32.65c0,8.035,1.619,13.672,4.859,16.909,3.237,3.24,9.135,4.858,17.686,4.858,5.442,0,10.268-.486,14.479-1.458,4.209-.972,8.065-2.234,11.563-3.789v29.93c-3.887,1.427-9.007,2.721-15.354,3.887-6.35,1.166-12.894,1.749-19.629,1.749-12.311,0-22.384-1.88-30.222-5.636-7.841-3.757-13.638-9.165-17.395-16.229-3.759-7.061-5.636-15.32-5.636-24.779v-38.093h-22.545Z', 'M694.37,106.61c-1.815,11.661-5.411,21.897-10.786,30.707-5.379,8.812-12.181,15.646-20.407,20.504-8.229,4.859-17.589,7.288-28.083,7.288-10.885,0-20.44-2.429-28.667-7.288-8.229-4.858-14.673-11.725-19.338-20.601-4.665-8.874-6.997-19.077-6.997-30.61,0-11.789,2.332-22.089,6.997-30.901,4.665-8.81,11.108-15.676,19.338-20.602,8.227-4.922,17.782-7.385,28.667-7.385,10.494,0,19.854,2.429,28.083,7.288,8.227,4.859,15.062,11.661,20.504,20.407s9.004,19.144,10.689,31.193ZM620.322,106.61c0,5.441,1.133,10.301,3.401,14.576,2.266,4.275,5.409,7.613,9.427,10.009,4.014,2.399,8.615,3.596,13.799,3.596,5.441,0,10.559-1.196,15.354-3.596,4.791-2.396,9.004-5.733,12.633-10.009,3.625-4.275,6.346-9.135,8.162-14.576-1.816-5.569-4.537-10.495-8.162-14.771-3.629-4.276-7.842-7.644-12.633-10.106-4.795-2.46-9.912-3.692-15.354-3.692-5.184,0-9.785,1.232-13.799,3.692-4.018,2.463-7.161,5.83-9.427,10.106-2.269,4.275-3.401,9.201-3.401,14.771ZM685.041,162l-5.053-40.036,5.247-15.354-5.247-15.354,5.053-40.23h41.203l-6.997,55.39,6.997,55.584h-41.203Z', 'M781.242,130.321l-10.884-3.693,61.415-75.602h41.785l-96.593,110.974h-35.565V12.351h39.842v117.971ZM800.094,107.776l29.93-20.99,46.45,75.214h-44.7l-31.68-54.224Z', 'M940.998,165.109c-14.255,0-26.693-2.429-37.315-7.288-10.626-4.858-18.919-11.725-24.877-20.601-5.961-8.874-8.94-19.077-8.94-30.61,0-11.789,2.979-22.089,8.94-30.901,5.958-8.81,14.251-15.676,24.877-20.602,10.622-4.922,23.061-7.385,37.315-7.385,14.12,0,26.528,2.463,37.218,7.385,10.689,4.926,19.013,11.792,24.974,20.602,5.958,8.812,8.94,19.046,8.94,30.707s-2.982,21.931-8.94,30.805c-5.961,8.876-14.284,15.742-24.974,20.601-10.689,4.859-23.098,7.288-37.218,7.288ZM940.998,135.763c6.477,0,12.016-1.166,16.616-3.498,4.598-2.332,8.13-5.667,10.593-10.009,2.459-4.34,3.692-9.554,3.692-15.646,0-6.22-1.233-11.497-3.692-15.84-2.463-4.339-5.995-7.677-10.593-10.009-4.601-2.332-10.14-3.498-16.616-3.498s-12.05,1.166-16.715,3.498c-4.664,2.332-8.229,5.67-10.688,10.009-2.463,4.343-3.693,9.557-3.693,15.646s1.23,11.339,3.693,15.742c2.459,4.406,6.024,7.774,10.688,10.106,4.665,2.332,10.234,3.498,16.715,3.498Z'];
let logoN = 0;
function logoSvg({ word = true, label = 'Vitako' } = {}) {
  const id = 'vtk-g' + (++logoN);
  const grad = `<linearGradient id="${id}" x1="0" y1="200" x2="200" y2="0" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#04281c"/><stop offset=".45" stop-color="#075c40"/><stop offset=".75" stop-color="#0b7a55"/><stop offset="1" stop-color="#14a06f"/></linearGradient>`;
  const sym = `<path d="${LOGO_BOX}" fill="url(#${id})"/><path d="${LOGO_CHECK}" fill="none" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="24"/>`;
  const txt = word ? LOGO_WORD.map(d => `<path d="${d}" fill="currentColor"/>`).join('') : '';
  return `<svg class="vtk-logo" viewBox="0 0 ${word ? 1014 : 200} 200" role="img" aria-label="${label}"><defs>${grad}</defs>${sym}${txt}</svg>`;
}
I.search = '<svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" aria-hidden="true"><circle cx="11" cy="11" r="7"/><path d="M20 20l-3.6-3.6"/></svg>';
I.burger = '<svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" aria-hidden="true"><path d="M4 7h16M4 12h16M4 17h16"/></svg>';
I.close = '<svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" aria-hidden="true"><path d="M6 6l12 12M18 6L6 18"/></svg>';
I.sun = I.sun.replace('width="18" height="18"', 'width="20" height="20"');
I.moon = I.moon.replace('width="18" height="18"', 'width="20" height="20"');
const smallCheck = I.check.replace('<svg', '<svg width="14" height="14"');

// ---------------------------------------------------------------------------
// Thème clair / sombre
// ---------------------------------------------------------------------------
let THEME = null;
try { THEME = localStorage.getItem('vitako_theme'); } catch (e) { /* stockage indisponible */ }
const isDark = () => (THEME ? THEME === 'dark' : !!window.matchMedia?.('(prefers-color-scheme: dark)').matches);
function applyTheme() {
  if (THEME) document.documentElement.setAttribute('data-theme', THEME);
  else document.documentElement.removeAttribute('data-theme');
}

// ---------------------------------------------------------------------------
// Petits composants
// ---------------------------------------------------------------------------
const app = document.getElementById('app');
const topEl = document.getElementById('topbar');

function toast(text) {
  const el = document.getElementById('toast');
  el.textContent = text; el.hidden = false;
  clearTimeout(toast.t); toast.t = setTimeout(() => { el.hidden = true; }, 3200);
}
const go = (hash) => { if (location.hash === hash) render(); else location.hash = hash; };
const back = (href, label) => `<a class="back" href="${href}">← ${esc(label)}</a>`;
const notice = (kind, html) => `<div class="notice ${kind}">${html}</div>`;
const pageHead = (eyebrow, title, sub = '') =>
  `<div class="stack" style="gap:6px;margin-bottom:22px"><span class="eyebrow">${esc(eyebrow)}</span><h1>${esc(title)}</h1>${sub}</div>`;
const loadingView = () => '<div class="loading" role="status"><span class="spinner"></span>Chargement…</div>';

function needConfig() {
  return `<div class="narrow panel stack">
    <h2>Site en cours de configuration</h2>
    <p class="muted">La base de données n'est pas encore reliée. Renseignez l'adresse et la clé Supabase dans <span class="mono">assets/js/config.js</span> (voir le guide README).</p>
    <a class="btn ghost" href="#/formations">Voir les formations</a></div>`;
}
function needLogin(next) {
  return `<div class="narrow panel stack" style="gap:14px">
    <h2>Connectez-vous pour continuer</h2>
    <p class="muted">Créez un compte gratuit pour suivre votre progression, puis abonnez-vous pour accéder aux cours.</p>
    <div style="display:flex;gap:10px;flex-wrap:wrap">
      <a class="btn" href="#/inscription?suite=${encodeURIComponent(next)}">Créer un compte</a>
      <a class="btn ghost" href="#/connexion?suite=${encodeURIComponent(next)}">J'ai déjà un compte</a></div></div>`;
}
function needSub() {
  const expired = S.profile?.sub_end && new Date(S.profile.sub_end) <= new Date();
  return `<div class="narrow panel stack" style="gap:14px">
    <h2>${expired ? 'Votre abonnement est terminé' : 'Abonnement nécessaire'}</h2>
    <p class="muted">${expired ? `Votre accès aux cours s'est arrêté le ${fmtDate(S.profile.sub_end)}. Vos attestations restent disponibles.` : 'Les cours, les tests et les examens sont réservés aux abonnés.'}</p>
    <a class="btn" href="#/abonnement">${expired ? 'Renouveler' : "S'abonner"} · ${ar(priceNow())} / ${S.days} jours${promoOn() ? ` <span class="btn-pct">-${promoPct()} %</span>` : ''}</a>${promoOn() ? `<p class="muted" style="margin:0">Au lieu de <s class="old-price">${ar(S.price)}</s>, jusqu'au ${promoEnd()}.</p>` : ''}</div>`;
}
// Renvoie un écran de blocage si l'étudiant ne peut pas suivre les cours, sinon null.
function gate(next) {
  if (!api.configured) return needConfig();
  if (!S.session) return needLogin(next);
  if (!S.profile) return loadingView();
  if (!hasAccess()) return needSub();
  return null;
}

// ---------------------------------------------------------------------------
// Photo de profil : recadrée en carré et compressée dans le navigateur avant l'envoi
// ---------------------------------------------------------------------------
const AV_SIZE = 320;
async function loadImageFile(file) {
  if (!file || !/^image\//.test(file.type)) throw new Error('Choisissez une image (JPG, PNG, WebP ou HEIC).');
  if (file.size > 25 * 1024 * 1024) throw new Error('Image trop lourde (25 Mo maximum).');
  try { return await createImageBitmap(file, { imageOrientation: 'from-image' }); }
  catch (e) {
    return new Promise((res, rej) => { const i = new Image(); i.onload = () => res(i); i.onerror = () => rej(new Error('Image illisible. Essayez une photo JPG ou PNG.')); i.src = URL.createObjectURL(file); });
  }
}
// Découpe la zone choisie et la compresse : on baisse la qualité, puis la taille, jusqu'à passer sous le poids maximum.
const AV_MAX = 10 * 1024;    // 10 Ko au maximum par image (photo de profil, visuel carré)
const COVER_MAX = 30 * 1024; // 30 Ko au maximum pour la couverture d'un formateur
async function encodeCrop(img, box, { widths, aspect = 1, max, qualities = [0.8, 0.7, 0.6, 0.5, 0.4] }) {
  let last = null;
  for (const w of widths) {
    const h = Math.round(w / aspect);
    const c = document.createElement('canvas'); c.width = w; c.height = h;
    const g = c.getContext('2d'); g.imageSmoothingQuality = 'high';
    g.fillStyle = '#fff'; g.fillRect(0, 0, w, h);
    g.drawImage(img, box.sx, box.sy, box.sw, box.sh, 0, 0, w, h);
    const toBlob = (type, q) => new Promise((r) => c.toBlob(r, type, q));
    for (const q of qualities) {
      let blob = await toBlob('image/webp', q);
      if (!blob || blob.type !== 'image/webp') blob = await toBlob('image/jpeg', q);
      if (!blob) continue;
      last = blob;
      if (blob.size <= max) return blob;
    }
  }
  if (!last) throw new Error("Impossible de préparer l'image.");
  throw new Error('Cette image est trop détaillée. Essayez une autre photo.');
}
// Photo de profil : carré de 320 px au plus.
function cropToBlob(img, sx, sy, side) {
  return encodeCrop(img, { sx, sy, sw: side, sh: side }, { widths: [AV_SIZE, 256, 200, 160, 128, 96], max: AV_MAX, qualities: [0.8, 0.65, 0.5, 0.4] });
}
// Images du profil formateur : couverture en paysage (3 x 1) et visuel carré.
const IMG_KINDS = {
  cover: { aspect: 3, round: false, title: 'Recadrer la couverture', help: 'Format paysage. Faites glisser l\'image pour la placer, puis zoomez.', widths: [1200, 1050, 900, 750, 600, 480], max: COVER_MAX },
  visual: { aspect: 1, round: false, title: 'Recadrer le visuel', help: 'Format carré. Faites glisser l\'image pour la placer, puis zoomez.', widths: [480, 400, 320, 256, 200, 160], max: AV_MAX },
};
async function compressAvatar(file) {
  const img = await loadImageFile(file);
  const side = Math.min(img.width, img.height);
  return cropToBlob(img, (img.width - side) / 2, (img.height - side) / 2, side);
}
// Fenêtre de recadrage : glisser pour déplacer, curseur / molette / pincement pour zoomer.
// aspect : largeur / hauteur de la zone gardée (1 = carré, 3 = paysage). round : cercle pour la photo de profil.
function openCropper(img, { aspect = 1, round = true, title = 'Recadrer la photo', help = 'Faites glisser la photo pour la placer, puis zoomez.' } = {}) {
  return new Promise((resolve) => {
    const W = aspect === 1 ? 280 : 320, H = Math.round(W / aspect); // zone visible, en px
    const V = W;
    const base = Math.max(W / img.width, H / img.height);
    let z = 1, ox = (W - img.width * base) / 2, oy = (H - img.height * base) / 2;
    const ov = document.createElement('div');
    ov.className = 'crop-ov';
    ov.innerHTML = `<div class="crop-box" role="dialog" aria-modal="true" aria-labelledby="crop-t">
      <b id="crop-t" class="crop-title">${esc(title)}</b>
      <p class="crop-help">${esc(help)}</p>
      <div class="crop-stage" style="width:${W}px;aspect-ratio:${W}/${H}"><canvas width="${W * 2}" height="${H * 2}" aria-label="Aperçu du recadrage"></canvas><span class="crop-ring${round ? '' : ' sq'}" aria-hidden="true"></span></div>
      <label class="crop-zoom"><span aria-hidden="true">−</span><input type="range" min="1" max="4" step="0.01" value="1" aria-label="Zoom"><span aria-hidden="true">+</span></label>
      <div class="crop-actions"><button type="button" class="btn ghost" data-c="cancel">Annuler</button><button type="button" class="btn" data-c="ok">Enregistrer</button></div>
    </div>`;
    document.body.appendChild(ov);
    const cv = ov.querySelector('canvas'), g = cv.getContext('2d'), range = ov.querySelector('input');
    const sc = () => base * z;
    const clamp = () => { const s = sc(); ox = Math.min(0, Math.max(W - img.width * s, ox)); oy = Math.min(0, Math.max(H - img.height * s, oy)); };
    const draw = () => { clamp(); g.setTransform(2, 0, 0, 2, 0, 0); g.clearRect(0, 0, W, H); g.imageSmoothingQuality = 'high'; g.drawImage(img, ox, oy, img.width * sc(), img.height * sc()); };
    const zoomTo = (nz, cx = W / 2, cy = H / 2) => {
      nz = Math.min(4, Math.max(1, nz)); const s0 = sc();
      const ix = (cx - ox) / s0, iy = (cy - oy) / s0; z = nz; ox = cx - ix * sc(); oy = cy - iy * sc();
      range.value = z; draw();
    };
    draw();
    const pts = new Map(); let pinch = 0;
    cv.addEventListener('pointerdown', (e) => { cv.setPointerCapture(e.pointerId); pts.set(e.pointerId, [e.clientX, e.clientY]); });
    cv.addEventListener('pointermove', (e) => {
      if (!pts.has(e.pointerId)) return;
      const [px, py] = pts.get(e.pointerId); pts.set(e.pointerId, [e.clientX, e.clientY]);
      if (pts.size === 2) {
        const [a, b] = [...pts.values()]; const d = Math.hypot(a[0] - b[0], a[1] - b[1]);
        if (pinch) zoomTo(z * d / pinch); pinch = d; return;
      }
      const k = V / cv.getBoundingClientRect().width; ox += (e.clientX - px) * k; oy += (e.clientY - py) * k; draw();
    });
    const up = (e) => { pts.delete(e.pointerId); if (pts.size < 2) pinch = 0; };
    cv.addEventListener('pointerup', up); cv.addEventListener('pointercancel', up);
    cv.addEventListener('wheel', (e) => { e.preventDefault(); const r = cv.getBoundingClientRect(), k = V / r.width; zoomTo(z * (e.deltaY < 0 ? 1.08 : 1 / 1.08), (e.clientX - r.left) * k, (e.clientY - r.top) * k); }, { passive: false });
    range.addEventListener('input', () => zoomTo(Number(range.value)));
    const close = (val) => { document.removeEventListener('keydown', key); ov.remove(); resolve(val); };
    const key = (e) => { if (e.key === 'Escape') close(null); };
    document.addEventListener('keydown', key);
    ov.addEventListener('click', (e) => {
      if (e.target === ov || e.target.dataset.c === 'cancel') close(null);
      else if (e.target.dataset.c === 'ok') { const s = sc(); close({ sx: -ox / s, sy: -oy / s, sw: W / s, sh: H / s, side: W / s }); }
    });
    ov.querySelector('[data-c=ok]').focus();
  });
}
const initials = (name) => (name || '?').trim().split(/\s+/).slice(0, 2).map((x) => x[0]).join('').toUpperCase();
function avatarHtml(P, cls = '') {
  return P?.avatar_url
    ? `<img class="av ${cls}" src="${esc(P.avatar_url)}" alt="" width="${AV_SIZE}" height="${AV_SIZE}" loading="lazy" decoding="async">`
    : `<span class="av av-ini ${cls}" aria-hidden="true">${esc(initials(P?.full_name))}</span>`;
}

// ---------------------------------------------------------------------------
// Notifications (cloche en haut, point rouge sur le menu)
// ---------------------------------------------------------------------------
I.bell = '<svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M6 8a6 6 0 0 1 12 0c0 7 3 9 3 9H3s3-2 3-9"/><path d="M10.3 21a1.94 1.94 0 0 0 3.4 0"/></svg>';
const NSEEN = () => 'vitako_notif_seen_' + (uid() || '');
function notifSeen() { try { return new Set(JSON.parse(localStorage.getItem(NSEEN()) || '[]')); } catch (e) { return new Set(); } }
function notifMarkSeen(list) {
  try { const seen = notifSeen(); list.forEach((n) => seen.add(n.id)); localStorage.setItem(NSEEN(), JSON.stringify([...seen].slice(-60))); } catch (e) { /* stockage indisponible */ }
}
function notifications() {
  if (!S.session || !S.profile) return [];
  const out = [];
  const plural = (n, a, b) => (n > 1 ? b : a);
  if (isAdmin()) {
    const p = S.admin.pending || 0, f = S.admin.feedback || 0;
    // Toujours non lues tant qu'il reste quelque chose à traiter
    if (p) out.push({ id: 'adm-pay-' + p + '-' + Date.now(), tone: 'gold', sticky: true, title: `${p} ${plural(p, 'paiement', 'paiements')} à valider`, text: 'Vérifiez la référence dans votre application, puis validez ou refusez.', href: '#/admin' });
    if (f) out.push({ id: 'adm-fb-' + f + '-' + Date.now(), tone: 'blue', sticky: true, title: `${f} ${plural(f, 'nouvelle remarque', 'nouvelles remarques')}`, text: 'Des visiteurs ou des apprenants vous ont écrit.', href: '#/admin/remarques' });
    const tr = S.admin.trainers || 0;
    if (tr) out.push({ id: 'adm-tr-' + tr + '-' + Date.now(), tone: 'gold', sticky: true, title: `${tr} ${plural(tr, 'profil formateur', 'profils formateurs')} à valider`, text: 'Profils complétés ou corrigés par des formateurs déjà abonnés.', href: '#/admin/formateurs' });
    return out;
  }
  for (const pay of S.payments.slice(0, 5)) {
    if (pay.status === 'pending') out.push({ id: 'pay-p-' + pay.id, tone: 'gold', title: 'Paiement en cours de vérification', text: `Référence ${pay.reference}. Votre accès sera activé en ${CFG.validationDelay}.`, href: '#/abonnement', ts: pay.created_at });
    else if (pay.status === 'approved') out.push({ id: 'pay-a-' + pay.id, tone: 'ok', title: 'Votre accès est activé 🎉', text: `Paiement validé. Accès à toutes les formations jusqu'au ${fmtDate(pay.access_until || S.profile.sub_end)}.`, href: '#/formations', ts: pay.decided_at });
    else if (pay.status === 'rejected') out.push({ id: 'pay-r-' + pay.id, tone: 'err', title: 'Paiement non validé', text: `${pay.reason || 'Paiement introuvable'}. Vérifiez la référence dans votre SMS et renvoyez-la.`, href: '#/abonnement', ts: pay.decided_at });
  }
  const T = S.trainer;
  if (isTrainer() && T?.decided_at) {
    if (T.status === 'approved') out.push({ id: 'tr-ok-' + T.decided_at, tone: 'ok', title: 'Votre profil formateur est validé', text: hasAccess() ? 'Les étudiants peuvent maintenant le voir.' : 'Il sera visible dès que votre abonnement sera actif.', href: '#/espace-formateur', ts: T.decided_at });
    else if (T.status === 'rejected') out.push({ id: 'tr-ko-' + T.decided_at, tone: 'err', title: 'Votre profil formateur est à corriger', text: `${T.reason || 'Voir le motif'}. Corrigez-le puis enregistrez-le.`, href: '#/espace-formateur', ts: T.decided_at });
  }
  const end = S.profile.sub_end ? new Date(S.profile.sub_end) : null;
  if (end) {
    const left = Math.ceil((end - Date.now()) / DAY);
    if (left > 0 && left <= 3) out.push({ id: 'sub-soon-' + end.toISOString().slice(0, 10), tone: 'gold', title: `Votre abonnement se termine dans ${left} ${plural(left, 'jour', 'jours')}`, text: `Prolongez-le pour garder l'accès après le ${fmtDate(end)}.`, href: '#/abonnement' });
    else if (left <= 0 && left > -30) out.push({ id: 'sub-end-' + end.toISOString().slice(0, 10), tone: 'err', title: 'Votre abonnement est terminé', text: 'Vos attestations restent disponibles. Renouvelez pour continuer les formations.', href: '#/abonnement' });
  }
  return out.sort((a, b) => String(b.ts || '9').localeCompare(String(a.ts || '9')));
}
function notifUnread(list = notifications()) {
  const seen = notifSeen();
  return list.filter((n) => n.sticky || !seen.has(n.id)).length;
}
function notifPanel(list) {
  const seen = notifSeen();
  if (!list.length) return '<p class="nt-empty">Aucune notification pour le moment.</p>';
  return list.map((n) => `<a class="nt-item ${n.tone}${n.sticky || !seen.has(n.id) ? ' new' : ''}" href="${n.href}">
      <span class="nt-dot" aria-hidden="true"></span>
      <span class="nt-body"><b>${esc(n.title)}</b><small>${esc(n.text)}</small>${n.ts ? `<em>${fmtDT(n.ts)}</em>` : ''}</span></a>`).join('');
}
// Vérifie régulièrement s'il y a du nouveau (toutes les 60 s, et au retour sur l'onglet)
let notifBusy = false;
async function refreshNotifs() {
  if (notifBusy || !S.session || !S.profile || document.hidden) return;
  notifBusy = true;
  try {
    const snap = () => JSON.stringify([S.admin, S.payments.map((p) => p.id + p.status), S.profile.sub_end, S.trainer?.status, S.trainer?.decided_at]);
    const before = snap();
    if (isAdmin()) S.admin = await api.adminCounts();
    else {
      const [pays, prof, tr] = await Promise.all([api.getMyPayments(uid()), api.getProfile(uid()), isTrainer() ? api.getMyTrainer(uid()).catch(() => S.trainer) : null]);
      S.payments = pays; if (prof) S.profile = prof;
      if (isTrainer()) S.trainer = tr;
    }
    const after = snap();
    if (before !== after) { if (S.ui.notif || S.ui.menu) topbar(); else render(); }
  } catch (e) { /* réseau indisponible : on réessaiera */ }
  notifBusy = false;
}
setInterval(refreshNotifs, 60000);
document.addEventListener('visibilitychange', () => { if (!document.hidden) refreshNotifs(); });

// ---------------------------------------------------------------------------
// Barre du haut
// ---------------------------------------------------------------------------
function topbar() {
  const r = route();
  const on = (p) => (r.path === p ? ' on' : '');
  const item = (href, label, extra = '') => `<a class="menu-item${on(href.slice(1))}" href="${href}">${label}${extra}</a>`;
  let items = item('#/', 'Accueil') + item('#/formations', 'Toutes les formations') + item('#/accompagnement', 'Accompagnement');
  if (S.session) {
    items += item('#/mon-espace', 'Mon espace');
    if (isTrainer()) {
      const st = trStatus(S.trainer);
      items += item('#/espace-formateur', 'Espace formateur', st === 'draft' ? ' <span class="pill grey">À compléter</span>' : st === 'rejected' ? ' <span class="pill red">À corriger</span>' : '');
    }
    if (isAdmin()) items += item('#/admin', 'Administration', S.admin.pending ? ` <span class="pill gold">${S.admin.pending}</span>` : '') + item('#/admin/formateurs', 'Formateurs', S.admin.trainers ? ` <span class="pill gold">${S.admin.trainers}</span>` : '') + item('#/admin/stats', 'Statistiques', '') + item('#/admin/avis', 'Avis', '') + item('#/admin/remarques', 'Remarques', S.admin.feedback ? ` <span class="pill gold">${S.admin.feedback}</span>` : '');
    else if (S.profile && !hasAccess()) items += item('#/abonnement', "S'abonner");
    else if (S.profile) items += item('#/abonnement', 'Prolonger mon abonnement');
  }
  items += item('#/verifier', 'Vérifier une attestation') + item('#/remarque', 'Envoyer une remarque');
  items += `<button class="menu-item menu-theme" data-act="theme">${isDark() ? 'Passer au thème clair' : 'Passer au thème sombre'}</button>`;
  const who = S.session
    ? `<div class="menu-who">${avatarHtml(S.profile, 'av-sm')}<b>${esc(S.profile?.full_name || '')}</b><small>${esc(S.session.user.email || '')}</small>
        ${S.profile && hasAccess() && !isAdmin() ? `<span class="pill">${isTrainer() ? 'Formateur' : 'Abonné'} · ${daysLeft()} j restants</span>` : isTrainer() ? '<span class="pill grey">Formateur</span>' : ''}</div>`
    : '';
  const foot = S.session
    ? '<button class="menu-item danger" data-act="logout">Déconnexion</button>'
    : '<div class="menu-cta"><a class="btn" href="#/inscription">Créer un compte</a><a class="btn ghost" href="#/connexion">Connexion</a></div>';
  const dark = isDark();
  const nlist = notifications();
  const unread = notifUnread(nlist);
  const badge = unread ? '<span class="red-dot" aria-hidden="true"></span>' : '';
  const bell = S.session && S.profile ? `<div class="nt-wrap">
        <button class="iconbtn${S.ui.notif ? ' on' : ''}" data-act="notif" aria-label="Notifications${unread ? ` (${unread} non lue${unread > 1 ? 's' : ''})` : ''}" aria-expanded="${!!S.ui.notif}" aria-controls="notif">${I.bell}${unread ? `<span class="nt-count">${unread}</span>` : ''}</button>
        <div class="nt-panel" id="notif" role="dialog" aria-label="Notifications" ${S.ui.notif ? '' : 'hidden'}><div class="nt-head">Notifications</div>${notifPanel(nlist)}</div>
      </div>` : '';
  const fl = document.getElementById('foot-logo'); if (fl && !fl.firstChild) fl.innerHTML = logoSvg({ label: 'Vitako, accueil' });
  topEl.innerHTML = `<a class="logo" href="#/" aria-label="Vitako, accueil">${logoSvg({ label: 'Vitako, accueil' })}</a>
    <div class="tb-actions${S.session && S.profile && !hasAccess() ? ' crowd' : ''}">
      ${S.session && S.profile && hasAccess() && !isAdmin() ? `<span class="pill tb-pill">Abonné · ${daysLeft()} j</span>` : ''}
      ${!S.session ? `<a class="tb-link" href="#/connexion">Connexion</a><a class="btn tb-cta" href="#/inscription"><span class="tb-l">Créer un compte</span><span class="tb-s">S'inscrire</span></a>` : ''}
      ${S.session && S.profile && !hasAccess() ? `<a class="btn tb-cta" href="#/abonnement">S'abonner</a>` : ''}
      ${bell}
      <button class="iconbtn${S.ui.search ? ' on' : ''}" data-act="search-toggle" aria-label="Rechercher une formation" aria-expanded="${S.ui.search}" aria-controls="tb-search">${I.search}</button>
      <button class="iconbtn" data-act="theme" aria-label="${dark ? 'Passer au thème clair' : 'Passer au thème sombre'}" title="${dark ? 'Thème clair' : 'Thème sombre'}">${dark ? I.sun : I.moon}</button>
      <button class="iconbtn${S.ui.menu ? ' on' : ''}" data-act="menu" aria-label="${S.ui.menu ? 'Fermer le menu' : 'Ouvrir le menu'}" aria-expanded="${S.ui.menu}" aria-controls="menu">${S.ui.menu ? I.close : I.burger}${badge}</button>
    </div>
    <div class="tb-search" id="tb-search" ${S.ui.search ? '' : 'hidden'}>
      <div class="tb-field">
        <span class="tb-search-ic">${I.search}</span>
        <input id="hsearch" type="search" autocomplete="off" placeholder="Rechercher un métier ou un logiciel (ex. graphiste, Photoshop, Excel)" aria-label="Rechercher un métier ou un logiciel" aria-controls="hs-panel" value="${esc(S.filter.q)}">
      </div>
      <div class="hs-panel" id="hs-panel" role="region" aria-live="polite" aria-label="Résultats de la recherche">${S.ui.search ? searchPanel() : ''}</div>
    </div>
    <nav class="menu" id="menu" aria-label="Menu principal" ${S.ui.menu ? '' : 'hidden'}>${who}<div class="menu-list">${items}</div>${foot}</nav>`;
  if (S.ui.searchFocus) {
    const h = document.getElementById('hsearch');
    if (h) { h.focus(); h.setSelectionRange(h.value.length, h.value.length); }
    S.ui.searchFocus = false;
  }
}

// ---------------------------------------------------------------------------
// Recherche (barre du haut, résultats affichés juste en dessous)
// ---------------------------------------------------------------------------
const norm = (s) => String(s || '').normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase();
const POPULAR_TERMS = ['Photoshop', 'Canva', 'Excel', 'WordPress', 'Figma', 'Anglais', 'Microsoft 365', 'Vidéo'];
const POPULAR_JOBS = ['gestion-0', 'design-0', 'mkt-0', 'dev-0', 'data-0', 'lang-1'];
const customTitle = (c) => !c.single && c.title !== `${c.job.name} – ${c.levelName}`;
function searchJobs(q) {
  const words = norm(q).split(/\s+/).filter(Boolean);
  if (!words.length) return [];
  return JOBS.map((j) => {
    const name = norm(j.name);
    const hay = norm(`${j.name} ${j.blurb} ${j.dom.name} ${j.tools} ${j.paid} ${j.courses.map((c) => c.title).join(' ')}`);
    if (!words.every((w) => hay.includes(w))) return null;
    const score = words.reduce((n, w) => n + (name.startsWith(w) ? 3 : name.includes(w) ? 2 : 0), 0);
    return { j, score };
  }).filter(Boolean).sort((a, b) => b.score - a.score || a.j.name.localeCompare(b.j.name, 'fr')).map((x) => x.j);
}
function hsRow(j) {
  const extra = j.courses.filter(customTitle).map((c) => `<small class="hs-extra">${esc(c.levelName)} : ${esc(c.title)}</small>`).join('');
  return `<li class="hs-row">
    <a class="hs-main" href="#/formation/${j.courses[0].id}"><b>${esc(j.name)}</b><small>${esc(j.dom.name)} · ${esc(j.tools)}</small>${extra}</a>
    <span class="hs-lvls">${j.courses.map((c) => `<a class="hs-lv${c.level === 'a' ? ' a' : ''}" href="#/formation/${c.id}" title="${esc(c.title)}">${esc(c.levelName)}</a>`).join('')}</span>
  </li>`;
}
function searchPanel() {
  const q = S.filter.q.trim();
  const terms = POPULAR_TERMS.filter((t) => searchJobs(t).length);
  const termChips = `<div class="hs-terms">${terms.map((t) => `<button type="button" class="chip" data-act="hs-pick" data-q="${esc(t)}">${esc(t)}</button>`).join('')}</div>`;
  if (!q) {
    const jobs = POPULAR_JOBS.map(jobByKey).filter(Boolean);
    return `<div class="hs-sec"><div class="eyebrow">Recherches fréquentes</div>${termChips}</div>
      <div class="hs-sec"><div class="eyebrow">Métiers très demandés</div><ul class="hs-list">${jobs.map(hsRow).join('')}</ul></div>`;
  }
  const list = searchJobs(q);
  if (!list.length) {
    return `<div class="hs-sec"><p class="hs-empty">Aucun métier ne correspond à « ${esc(q)} ».</p><div class="eyebrow">Essayez plutôt</div>${termChips}</div>`;
  }
  return `<div class="hs-sec"><div class="hs-count">${countLabel(list)}</div>
    <ul class="hs-list">${list.map(hsRow).join('')}</ul></div>`;
}
function refreshSearch() {
  const p = document.getElementById('hs-panel');
  if (p) p.innerHTML = searchPanel();
}

// ---------------------------------------------------------------------------
// Catalogue
// ---------------------------------------------------------------------------
function levelStatus(c) {
  if (!c.published) return '<span class="pill grey">Bientôt</span>';
  if (courseCert(c.id)) return '<span class="done-chk" role="img" aria-label="Réussi" data-tip="Réussi"><svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="m5 12.5 4.5 4.5L19 7.5"/></svg></span>';
  const n = doneSet(c.id).size;
  return n ? `<span class="pill">${n}/${c.modules.length}</span>` : '';
}
const countLabel = (jobs) => {
  const nc = jobs.reduce((n, j) => n + j.courses.length, 0);
  const nm = jobs.filter((j) => !j.single).length;
  return nm ? `${jobs.length} métier${jobs.length > 1 ? 's' : ''} · ${nc} formation${nc > 1 ? 's' : ''}` : `${nc} formation${nc > 1 ? 's' : ''}`;
};
function catalogGrid() {
  const list = JOBS.filter((j) => S.filter.dom === 'all' || j.dom.id === S.filter.dom);
  const locked = !hasAccess();
  const cards = list.map((j) => `<div class="card job">
      ${cover(j, { noTitle: true })}
      ${jobCert(j.key) ? '<div class="row"><span class="pill gold">Parcours complet</span></div>' : ''}
      <h3>${esc(j.name)}</h3>
      <p class="b">${esc(j.blurb.charAt(0).toUpperCase() + j.blurb.slice(1))}.</p>
      <div class="lvls">${j.courses.map((c) => `<a class="lv" href="#/formation/${c.id}"><span>${c.levelName} <small>· ${c.hours} h</small></span>
        <span class="r">${levelStatus(c)}${locked && c.published ? `<span class="lock" title="Abonnement requis">${I.lock}</span>` : ''}</span></a>`).join('')}</div>
    </div>`).join('');
  return { count: countLabel(list), html: cards || '<p class="muted">Aucun métier dans ce domaine.</p>' };
}
// Catalogue complet (#/formations) : filtres par domaine et toutes les formations
function catalog() {
  const g = catalogGrid();
  let banner = '';
  if (!S.session) banner = notice('info', 'Tout le monde peut consulter les formations, leurs descriptions et leurs objectifs. Pour suivre les cours, <a href="#/inscription">créez un compte</a> puis prenez un abonnement mensuel.');
  else if (S.profile && !hasAccess()) banner = notice(pendingPayment() ? 'info' : 'warn', pendingPayment()
    ? `Votre paiement est en attente de validation (en général en ${esc(CFG.validationDelay)}). Vous recevrez un e-mail dès que votre accès sera activé.`
    : `Vous n'avez pas d'abonnement actif. Pour suivre les cours, <a href="#/abonnement">abonnez-vous (${priceHtml()} / ${S.days} jours)</a>.`);
  return `${pageHead('Catalogue', 'Toutes les formations')}
  ${promoBanner()}
  ${banner ? `<div style="margin-bottom:18px">${banner}</div>` : ''}
  <div class="filters">
    <div class="chips" id="chips">${chips()}</div>
  </div>
  <div class="count" id="count">${g.count}</div>
  <div class="grid" id="grid">${g.html}</div>`;
}

// Accueil : page d'atterrissage aérée
// Les 10 formations mises en avant (identifiants des formations, dans l'ordre d'affichage).
const FEATURED = ['gestion-0-f', 'mkt-0-f', 'design-0-f', 'media-0-f', 'lang-0-f', 'dev-3-f', 'data-0-f', 'data-4-f', 'client-0-f', 'lang-1-f'];
const STEPS = [
  ['Créez votre compte', 'Gratuit. Parcourez toutes les formations, leurs objectifs et leurs programmes.'],
  ['Abonnez-vous', 'Par MVola ou Orange Money, pour 30 jours d\'accès à toutes les formations.'],
  ['Apprenez à votre rythme', 'Des leçons courtes, des exemples de Madagascar et un exercice pratique par module.'],
  ['Obtenez votre attestation', 'Réussissez l\'examen final et partagez une attestation vérifiable en ligne.'],
];
// Vidéo de présentation de l'accueil : CFG.heroVideo (fichier .mp4 ou .webm, lien YouTube ou Vimeo).
// Sans vidéo, une illustration animée occupe la place.
function heroMedia() {
  const v = String(CFG.heroVideo || '').trim();
  if (v) {
    const yt = v.match(/(?:youtu\.be\/|youtube\.com\/(?:watch\?v=|embed\/|shorts\/))([\w-]{11})/);
    const vm = v.match(/vimeo\.com\/(?:video\/)?(\d+)/);
    if (yt) return `<div class="lp-video"><iframe src="https://www.youtube-nocookie.com/embed/${yt[1]}?autoplay=1&mute=1&loop=1&playlist=${yt[1]}&controls=0&rel=0&playsinline=1" title="Présentation de Vitako" allow="autoplay; encrypted-media; picture-in-picture" allowfullscreen loading="lazy"></iframe></div>`;
    if (vm) return `<div class="lp-video"><iframe src="https://player.vimeo.com/video/${vm[1]}?autoplay=1&muted=1&loop=1&background=1" title="Présentation de Vitako" allow="autoplay; fullscreen; picture-in-picture" loading="lazy"></iframe></div>`;
    const hd = String(CFG.heroVideoHD || '').trim();
    const useHd = hd && heroQuality() === '1080';
    const qBtn = hd ? `<button class="lp-quality" type="button" data-act="hero-quality" aria-label="Qualité de la vidéo">${useHd ? '1080p' : '720p'}</button>` : '';
    return `<div class="lp-video"><video id="hero-video" src="${esc(useHd ? hd : v)}"${CFG.heroPoster ? ` poster="${esc(CFG.heroPoster)}"` : ''} muted loop playsinline preload="none" controls controlslist="nodownload noplaybackrate" disablepictureinpicture aria-label="Vidéo de présentation de Vitako"></video>
      <button class="lp-sound" type="button" data-act="hero-sound" aria-pressed="false">${I.soundOff}<span>Activer le son</span></button>${qBtn}</div>`;
  }
  return `<div class="lp-art" aria-hidden="true">
    <div class="lp-glass g1"><span class="g-ic">${DOM_ICONS.design}</span><div><b>Graphiste – Fondamentaux</b><small>Module 3 sur 5</small><i class="g-bar"><i style="width:60%"></i></i></div></div>
    <div class="lp-glass g2"><span class="g-ok">${I.check}</span><div><b>Attestation obtenue</b><small>Vérifiable en ligne</small></div></div>
    <div class="lp-glass g3"><span class="g-stars">★★★★★</span><small>« Formation claire et facile à comprendre »</small></div>
  </div>`;
}
function home() {
  heroQ = '720';
  const feat = FEATURED.map(courseById).filter((c) => c && c.published !== false);
  const card = (c) => {
    const j = c.job;
    return `<a class="card job feat" href="#/formation/${c.id}">
      ${cover(j, { noTitle: true })}
      <h3>${esc(j.name)}</h3>
      <p class="b">${esc(j.blurb.charAt(0).toUpperCase() + j.blurb.slice(1))}.</p>
      <span class="feat-meta"><span>${esc(c.levelName)} · ${c.hours} h</span><span class="feat-go" aria-hidden="true">→</span></span>
    </a>`;
  };
  const nJobs = JOBS.filter((j) => !j.single).length;
  const cta = S.session ? (isTrainer() ? `<a class="btn lg" href="#/espace-formateur">Espace formateur</a>` : `<a class="btn lg" href="#/mon-espace">Mon espace</a>`) : `<a class="btn lg" href="#/inscription">Créer mon compte gratuit</a>`;
  return `
  <section class="lp-hero">
    <div class="lp-hero-in">
      <div class="lp-hero-txt">
        <div class="eyebrow lp-eyebrow">Formations en ligne depuis Madagascar</div>
        <h1>Apprends un <em>métier</em> à <em>distance</em>.</h1>
        <p class="lp-lead">${nJobs} métiers du freelance et du télétravail, en leçons courtes et concrètes. Chaque formation réussie te donne une attestation vérifiable à montrer à tes clients.</p>
        <div class="lp-ctas"><a class="btn lg" href="#/formations">Voir les formations <span aria-hidden="true">→</span></a></div>
      </div>
      <div class="lp-media">${heroMedia()}</div>
    </div>
  </section>
  <dl class="lp-stats">
    <div><dt>Formations</dt><dd>${COURSES.length}</dd></div>
    <div><dt>Domaines</dt><dd>${DOMAINS_LIST.length}</dd></div>
    <div><dt>Pour réussir</dt><dd>50/100</dd></div>
    <div><dt>Attestation</dt><dd>Vérifiable</dd></div>
  </dl>
  ${promoBanner()}
  <section class="lp-cat" aria-labelledby="cat-title">
    <div class="eyebrow lp-eyebrow">Catalogue</div>
    <h2 id="cat-title">Toutes les formations</h2>
    <div class="chips">${`<button class="chip" data-act="dom-go" data-d="all">${DOM_ICONS.all}<span>Tous les domaines</span></button>` + DOMAINS_LIST.map((d) => `<button class="chip" data-act="dom-go" data-d="${d.id}">${DOM_ICONS[d.id] || ''}<span>${esc(d.name)}</span></button>`).join('')}</div>
  </section>
  <section class="lp-sec-block" aria-labelledby="feat-title">
    <div class="lp-head"><div class="eyebrow lp-eyebrow">Les plus demandées</div><h2 id="feat-title">10 formations pour décrocher<br class="br-d"> vos premiers clients</h2></div>
    <div class="grid feat-grid">${feat.map(card).join('')}</div>
    <div class="lp-more"><a class="btn ghost lg" href="#/formations">Voir les ${COURSES.length} formations <span aria-hidden="true">→</span></a></div>
  </section>
  ${temoignages()}
  <section class="lp-sec-block" aria-labelledby="steps-title">
    <div class="lp-head"><div class="eyebrow lp-eyebrow">Comment ça marche</div><h2 id="steps-title">De l'inscription à l'attestation</h2></div>
    <ol class="lp-steps">${STEPS.map(([t, d], i) => `<li><span class="lp-num">${i + 1}</span><h3>${t}</h3><p>${d}</p></li>`).join('')}</ol>
  </section>
  <section class="lp-band lp-final">
    <h2>Ton premier client commence ici</h2>
    <p>Inscription gratuite. Abonnement à ${priceHtml()} pour ${S.days} jours d'accès à toutes les formations.</p>
    <div class="lp-ctas">${cta}<a class="btn lg lp-outline" href="#/formations">Voir les formations</a></div>
  </section>`;
}
// Bande de témoignages qui défile (la liste est doublée pour une boucle sans saut)
const STAR = '<path d="M12 2.5l2.9 6 6.6.9-4.8 4.6 1.2 6.5L12 17.4l-5.9 3.1 1.2-6.5L2.5 9.4l6.6-.9z"/>';
function stars(n) {
  let out = '';
  for (let i = 1; i <= 5; i++) {
    const fill = n >= i ? 1 : n >= i - 0.5 ? 0.5 : 0;
    out += `<svg viewBox="0 0 24 24" width="16" height="16" aria-hidden="true"><defs><linearGradient id="st${i}-${fill}"><stop offset="${fill * 100}%" stop-color="currentColor"/><stop offset="${fill * 100}%" stop-color="currentColor" stop-opacity=".22"/></linearGradient></defs><g fill="url(#st${i}-${fill})">${STAR}</g></svg>`;
  }
  return `<span class="stars" role="img" aria-label="${String(n).replace('.', ',')} sur 5">${out}</span>`;
}
function temoignages() {
  if (!TEMOIGNAGES.length) return '';
  const card = (t, dup) => `<figure class="tm-card"${dup ? ' aria-hidden="true"' : ''}>
      ${stars(t.note)}
      <blockquote>${esc(t.texte)}</blockquote>
      <figcaption><span class="tm-av">${esc(t.nom.charAt(0))}</span>${esc(t.nom)}</figcaption>
    </figure>`;
  const list = TEMOIGNAGES.map((t) => card(t, false)).join('') + TEMOIGNAGES.map((t) => card(t, true)).join('');
  return `<section class="tm lp-band" aria-labelledby="tm-title">
    <h2 id="tm-title">Ils ont aimé Vitako</h2>
    <p class="tm-sub">Ce que disent les jeunes qui apprennent avec nous.</p>
    <div class="tm-view"><div class="tm-track" style="--tm-n:${TEMOIGNAGES.length}">${list}</div></div>
  </section>`;
}
// Icônes des domaines (traits simples, couleur du texte)
const svgI = (body) => `<svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">${body}</svg>`;
const DOM_ICONS = {
  all: svgI('<rect x="3" y="3" width="7" height="7" rx="1.5"/><rect x="14" y="3" width="7" height="7" rx="1.5"/><rect x="3" y="14" width="7" height="7" rx="1.5"/><rect x="14" y="14" width="7" height="7" rx="1.5"/>'),
  design: svgI('<path d="M12 3a9 9 0 1 0 0 18c1.1 0 1.7-.9 1.4-1.9-.3-.9.3-1.8 1.3-1.8H17a4 4 0 0 0 4-4c0-5.5-4-10.3-9-10.3z"/><circle cx="7.5" cy="11" r="1.2"/><circle cx="10.5" cy="7" r="1.2"/><circle cx="15.5" cy="8" r="1.2"/>'),
  media: svgI('<rect x="2" y="6" width="14" height="12" rx="2"/><path d="M16 10.5 22 7v10l-6-3.5"/>'),
  dev: svgI('<path d="m8 7-5 5 5 5"/><path d="m16 7 5 5-5 5"/><path d="m13.5 4-3 16"/>'),
  tech: svgI('<rect x="6" y="2" width="12" height="20" rx="2.5"/><path d="M11 18h2"/>'),
  mkt: svgI('<path d="M3 11v2a1 1 0 0 0 1 1h3l5 4V6L7 10H4a1 1 0 0 0-1 1z"/><path d="M16 9a4 4 0 0 1 0 6"/><path d="M19 6.5a8 8 0 0 1 0 11"/>'),
  lang: svgI('<path d="M12 20h9"/><path d="M16.5 3.5a2.1 2.1 0 0 1 3 3L7 19l-4 1 1-4z"/>'),
  data: svgI('<path d="M12 3l1.8 5.2L19 10l-5.2 1.8L12 17l-1.8-5.2L5 10l5.2-1.8z"/><path d="M19 15l.8 2.2L22 18l-2.2.8L19 21l-.8-2.2L16 18l2.2-.8z"/>'),
  client: svgI('<path d="M4 14v-2a8 8 0 0 1 16 0v2"/><rect x="2.5" y="13" width="4" height="6" rx="1.5"/><rect x="17.5" y="13" width="4" height="6" rx="1.5"/><path d="M19.5 19a3 3 0 0 1-3 3H13"/>'),
  gestion: svgI('<rect x="3" y="7" width="18" height="13" rx="2"/><path d="M9 7V5a2 2 0 0 1 2-2h2a2 2 0 0 1 2 2v2"/><path d="M3 13h18"/>'),
  num: svgI('<rect x="2" y="4" width="20" height="13" rx="2"/><path d="M8 21h8"/><path d="M12 17v4"/><path d="M12 7.5l1 2 2 1-2 1-1 2-1-2-2-1 2-1z"/>'),
  free: svgI('<circle cx="11" cy="11" r="7"/><path d="m20 20-3.5-3.5"/><path d="M11 8v6"/><path d="M8 11h6"/>'),
  perso: svgI('<circle cx="12" cy="12" r="9"/><circle cx="12" cy="12" r="5"/><circle cx="12" cy="12" r="1.5"/><path d="M19 5l-5.5 5.5"/>'),
  edu: svgI('<path d="M2 9l10-5 10 5-10 5z"/><path d="M6 11v5c0 1.7 2.7 3 6 3s6-1.3 6-3v-5"/><path d="M22 9v6"/>'),
};
// ---------------------------------------------------------------------------
// Couvertures dessinées (en attendant les images) : une couleur par domaine,
// complémentaire du vert Vitako, et un motif différent pour chaque métier.
// Une vraie image peut les remplacer : champ "cover" du métier dans content/catalog.json.
// ---------------------------------------------------------------------------
const COVER_COLORS = {
  design: ['#4C1D95', '#8B5CF6'],  // violet
  media: ['#991B1B', '#F97316'],   // rouge orangé
  dev: ['#1E3A8A', '#3B82F6'],     // bleu
  tech: ['#172554', '#6366F1'],    // bleu nuit
  mkt: ['#831843', '#EC4899'],     // framboise
  lang: ['#7C2D12', '#EA580C'],    // terre cuite
  data: ['#164E63', '#0EA5E9'],    // bleu pétrole
  client: ['#9F1239', '#FB7185'],  // rouge corail
  gestion: ['#78350F', '#F59E0B'], // ambre
  edu: ['#581C87', '#D946EF'],     // prune
  num: ['#1E1B4B', '#22D3EE'],     // nuit indigo et cyan numérique
  free: ['#14532D', '#84CC16'],     // vert forêt et vert tilleul
  perso: ['#1E293B', '#F59E0B'],   // nuit et soleil levant
};
function cover(j, opts = {}) {
  const [c1, c2] = COVER_COLORS[j.dom.id] || ['#13241B', '#0B7A55'];
  const n = Number(j.key.split('-').pop()) || 0;
  const title = opts.title || j.name;
  const badge = opts.level ? `<span class="cv-badge${opts.level === 'a' ? ' a' : ''}">${opts.level === 'a' ? 'Avancé' : 'Fondamentaux'}</span>` : '';
  const img = j.cover ? `<img class="cv-img" src="${esc(j.cover)}" alt="" loading="lazy" decoding="async">` : '';
  return `<div class="cover cv-p${n % 5}${opts.big ? ' big' : ''}" style="--c1:${c1};--c2:${c2};--ang:${120 + n * 18}deg" aria-hidden="true">
    ${img || `<span class="cv-ic">${DOM_ICONS[j.dom.id] || ''}</span>`}
    <span class="cv-txt"><span class="cv-dom">${DOM_ICONS[j.dom.id] || ''}${esc(j.dom.name)}</span>${opts.noTitle ? '' : `<b class="cv-title">${esc(title)}</b>`}</span>${badge}
  </div>`;
}
const chips = () => `<button class="chip${S.filter.dom === 'all' ? ' on' : ''}" data-dom="all" aria-pressed="${S.filter.dom === 'all'}">${DOM_ICONS.all}<span>Tous les domaines</span></button>` +
  DOMAINS_LIST.map((d) => `<button class="chip${S.filter.dom === d.id ? ' on' : ''}" data-dom="${d.id}" aria-pressed="${S.filter.dom === d.id}">${DOM_ICONS[d.id] || ''}<span>${esc(d.name)}</span></button>`).join('');
function refreshGrid() {
  const g = catalogGrid();
  document.getElementById('grid').innerHTML = g.html;
  document.getElementById('count').textContent = g.count;
  document.getElementById('chips').innerHTML = chips();
}

// ---------------------------------------------------------------------------
// Fiche formation
// ---------------------------------------------------------------------------
function coursePage(id) {
  const c = courseById(id);
  if (!c) return notFound();
  if (S.trainers === null && api.configured) return loadTrainers().then(() => coursePage(id));
  if (isV2(c)) return coursePage2(c);
  // Le détail du programme (résumés et sous-parties des modules) n'est pas dans le site public :
  // il est lu dans la base, qui ne le donne qu'aux abonnés.
  if (c.published && hasAccess() && api.configured && !S.lessons.has(id)) {
    return api.getLessons(id).then((ls) => { S.lessons.set(id, ls); return coursePage(id); });
  }
  const other = otherLevel(c);
  const done = doneSet(c.id);
  const n = c.modules.length;
  const allDone = done.size >= n;
  const cert = courseCert(c.id);
  const ok = hasAccess();

  let cta;
  if (!c.published) cta = `<p class="muted">Cette formation est en préparation. Elle sera bientôt disponible pour les abonnés.</p>${other?.published ? `<a class="btn ghost" href="#/formation/${other.id}">Voir le niveau ${other.levelName}</a>` : ''}`;
  else if (!api.configured) cta = '<p class="muted">Inscriptions bientôt ouvertes.</p>';
  else if (!S.session) cta = `<p class="muted">Créez un compte gratuit pour suivre votre progression, puis abonnez-vous pour suivre les cours.</p>
      <a class="btn" href="#/inscription?suite=${encodeURIComponent('/formation/' + c.id)}">Créer un compte</a>
      <a class="btn ghost" href="#/connexion?suite=${encodeURIComponent('/formation/' + c.id)}">J'ai déjà un compte</a>`;
  else if (!S.profile) cta = loadingView();
  else if (!ok) cta = `<p class="muted">${S.profile.sub_end ? `Votre abonnement s'est terminé le ${fmtDate(S.profile.sub_end)}. Vos attestations restent disponibles.` : 'Un abonnement est nécessaire pour suivre cette formation.'}</p>
      <a class="btn" href="#/abonnement">${S.profile.sub_end ? 'Renouveler' : "S'abonner"} · ${ar(priceNow())} / ${S.days} jours${promoOn() ? ` <span class="btn-pct">-${promoPct()} %</span>` : ''}</a>`;
  else {
    const next = [...Array(n).keys()].find((i) => !done.has(i));
    cta = next !== undefined
      ? `<a class="btn" href="#/formation/${c.id}/module/${next + 1}">${done.size ? 'Continuer' : 'Commencer'} : module ${next + 1}</a>`
      : cert ? `<a class="btn" href="#/attestation/${cert.id}">Voir mon attestation</a>`
        : `<a class="btn" href="#/formation/${c.id}/examen">Passer l'examen final</a>`;
  }
  const pct = Math.round((done.size / n) * 100);
  const tries = attemptsOf(c.id).length;
  const fondCert = c.level === 'a' && courseCert(other.id);

  return `${back('#/formations', 'Tous les métiers')}
  ${c.preview && isAdmin() ? `<div style="margin-bottom:16px">${notice('info', `Une <b>nouvelle version</b> de cette formation est prête en aperçu (visible seulement par vous). <button class="lnk" data-act="preview-toggle">Voir la nouvelle version</button>`)}</div>` : ''}
  <div class="cols">
    <div class="stack" style="gap:26px;min-width:0">
      <div class="stack" style="gap:10px">
        ${cover(c.job, { big: true, level: c.single ? null : c.level, title: c.title.startsWith(c.job.name) ? c.job.name : c.title })}
        <h1>${esc(c.title)}</h1>
        <div style="display:flex;gap:8px;flex-wrap:wrap"><span class="pill ${c.level === 'a' ? 'gold' : ''}">${c.levelName}</span><span class="pill grey">${c.hours} heures</span><span class="pill grey">${n} modules + examen</span>${c.published ? '' : '<span class="pill grey">Bientôt disponible</span>'}</div>
      </div>
      ${c.level === 'a' && !fondCert ? notice('info', `Niveau Fondamentaux recommandé avant celui-ci, mais pas obligatoire. <a href="#/formation/${other.id}">Voir les Fondamentaux</a>`) : ''}
      <p style="max-width:65ch">${esc(c.description)}</p>
      <div class="stack" style="gap:12px"><h2>Objectifs</h2><ol class="obj-num">${c.objectives.map((o) => `<li>${esc(o)}</li>`).join('')}</ol>
        <p class="muted" style="font-size:.9rem">À la fin de la formation, vous saurez faire ces ${c.objectives.length} choses.</p></div>
      ${c.job.paid ? '' : `<div class="stack" style="gap:12px"><h2>Outils utilisés</h2><div class="panel"><p>${esc(c.job.tools.charAt(0).toUpperCase() + c.job.tools.slice(1))}. Tout se fait avec des outils gratuits.</p></div></div>`}
      <div class="stack" style="gap:12px"${c.job.paid ? '' : ' hidden'}><h2>Outils du métier</h2>
        <div class="tools"><div class="panel"><span class="pill">Gratuits</span><p style="margin-top:8px">${esc(c.job.tools)}</p></div>
        <div class="panel"><span class="pill gold">Payants (professionnels)</span><p style="margin-top:8px">${esc(c.job.paid)}</p></div></div>
        <p class="muted" style="font-size:.88rem">${c.level === 'f' ? 'Ce niveau se fait avec les outils gratuits ; les outils payants sont présentés pour savoir quand ils deviennent rentables.' : 'Ce niveau utilise les outils payants demandés par les clients. Essais gratuits possibles.'} Les prix changent souvent : vérifiez-les sur le site officiel. Pas de logiciels piratés : virus et vol de fichiers clients.</p></div>
      <div class="stack" style="gap:12px"><h2>Programme</h2>
        ${c.published && !ok ? `<p class="muted prog-lock"><span class="lock">${I.lock}</span> Le détail de chaque module (résumé, sous-parties, leçon et tests) est réservé aux abonnés.</p>` : ''}
        <div class="mods">
          ${c.modules.map((m, i) => {
            const d = done.has(i);
            const action = c.published && ok
              ? `<a class="btn ghost sm" href="#/formation/${c.id}/module/${i + 1}">${d ? 'Revoir' : 'Ouvrir'}</a>`
              : c.published ? `<span class="lock">${I.lock}</span>` : '';
            const L = ok ? (S.lessons.get(c.id) || []).find((l) => l.module_index === i) : null;
            const subs = L ? sections(L.body_md || '') : [];
            const secs = subs.length ? `<ol class="mod-secs">${subs.map((s2, k) => `<li><span>${i + 1}.${k + 1}</span>${esc(s2)}</li>`).join('')}<li><span>${i + 1}.${subs.length + 1}</span>Test du module (3 questions)</li></ol>` : '';
            const info = L ? `${esc(L.summary || '')}${m.minutes ? ` · environ ${m.minutes} min de lecture` : ''}` : (c.published ? `Leçon${m.minutes ? ` d'environ ${m.minutes} min` : ''} + petit test` : '');
            return `<div class="mod${d ? ' done' : ''}"><span class="n">${d ? smallCheck : pad2(i + 1)}</span>
              <div class="t"><b>Module ${i + 1} · ${esc(m.title)}</b>${info ? `<small>${info}</small>` : ''}${secs}</div>${action}</div>`;
          }).join('')}
          <div class="mod${cert ? ' done' : ''}"><span class="n">${cert ? smallCheck : 'EX'}</span>
            <div class="t"><b>Examen final</b><small>10 questions · 50/100 pour réussir · essais illimités</small></div>
            ${c.published && ok && allDone ? `<a class="btn ghost sm" href="#/formation/${c.id}/examen">${tries ? 'Repasser' : 'Commencer'}</a>` : c.published ? `<span class="lock">${I.lock}</span>` : ''}
          </div>
        </div>
      </div>
      ${other ? `<div class="panel" style="display:flex;justify-content:space-between;align-items:center;gap:12px;flex-wrap:wrap">
        <div><span class="eyebrow">Même métier</span><div style="font-weight:700">${esc(other.title)}</div></div>
        <a class="btn ghost sm" href="#/formation/${other.id}">Voir le niveau ${other.levelName}</a>
      </div>` : ''}
      ${trainerSection(c)}
    </div>
    <aside class="panel side stack">
      ${S.session && c.published ? `<div class="stack" style="gap:8px"><div style="display:flex;justify-content:space-between"><b>Ma progression</b><span class="mono">${pct} %</span></div><div class="bar"><i style="width:${pct}%"></i></div>
        ${tries ? `<span class="muted" style="font-size:.9rem">Examen : ${tries} essai${tries > 1 ? 's' : ''}, meilleur score <b class="mono">${bestOf(c.id)}/100</b></span>` : ''}</div>` : ''}
      ${cert ? notice('warn', `Attestation obtenue le ${fmtDate(cert.issued_at)}.`) : ''}
      ${cta}
    </aside>
  </div>`;
}


// ---------------------------------------------------------------------------
// Formations version 2 : 6 modules découpés en leçons, un QCM après chaque leçon
// ---------------------------------------------------------------------------
const isV2 = (c) => !!c && (c.format === 2 || (!!c.preview && isAdmin() && !S.previewOff));
const meta2 = (c) => (c.format === 2 ? c : { ...c, ...(c.preview || {}) });
const pkey = (m, p) => `${m}-${p}`;
const partsDone = (cid) => S.partDone.get(cid) || new Map();
async function course2(id) {
  if (!S.parts.has(id)) S.parts.set(id, await api.getCourse2(id));
  return S.parts.get(id);
}
const flatParts = (mods) => mods.flatMap((m) => m.lessons.map((l) => ({ m, l })));
const nextPart = (cid, mods) => flatParts(mods).find(({ m, l }) => !partsDone(cid).has(pkey(m.module_index, l.part_index))) || null;
const partHref = (cid, mi, pi) => `#/formation/${cid}/module/${mi + 1}/lecon/${pi + 1}`;
const fmtDur = (min) => { const h = Math.floor(min / 60), m = Math.round(min % 60); return h ? `${h} h${m ? ' ' + String(m).padStart(2, '0') : ''}` : `${m} min`; };

async function coursePage2(c) {
  const M = meta2(c);
  const ok = hasAccess();
  const mods = c.published && ok && api.configured ? await course2(c.id) : null;
  const done = partsDone(c.id);
  const nLessons = M.modules.reduce((n, m) => n + (m.lessons || 0), 0);
  const nDone = mods ? flatParts(mods).filter(({ m, l }) => done.has(pkey(m.module_index, l.part_index))).length : 0;
  const cert = courseCert(c.id);
  const other = otherLevel(c);
  let cta;
  if (!c.published) cta = '<p class="muted">Cette formation est en préparation.</p>';
  else if (!S.session) cta = `<p class="muted">Créez un compte gratuit pour suivre votre progression, puis abonnez-vous pour suivre les cours.</p>
      <a class="btn" href="#/inscription?suite=${encodeURIComponent('/formation/' + c.id)}">Créer un compte</a>
      <a class="btn ghost" href="#/connexion?suite=${encodeURIComponent('/formation/' + c.id)}">J'ai déjà un compte</a>`;
  else if (!S.profile) cta = loadingView();
  else if (!ok) cta = `<p class="muted">${S.profile.sub_end ? `Votre abonnement s'est terminé le ${fmtDate(S.profile.sub_end)}. Vos attestations restent disponibles.` : 'Un abonnement est nécessaire pour suivre cette formation.'}</p>
      <a class="btn" href="#/abonnement">${S.profile.sub_end ? 'Renouveler' : "S'abonner"} · ${ar(priceNow())} / ${S.days} jours${promoOn() ? ` <span class="btn-pct">-${promoPct()} %</span>` : ''}</a>`;
  else {
    const nx = mods && nextPart(c.id, mods);
    cta = nx ? `<a class="btn" href="${partHref(c.id, nx.m.module_index, nx.l.part_index)}">${nDone ? 'Continuer' : 'Commencer'} : leçon ${nx.m.module_index + 1}.${nx.l.part_index + 1}</a>`
      : cert ? `<a class="btn" href="#/attestation/${cert.id}">Voir mon attestation</a>` : `<a class="btn" href="#/formation/${c.id}/examen">Passer l'examen final</a>`;
  }
  const pct = nLessons ? Math.round((nDone / nLessons) * 100) : 0;
  const tries = attemptsOf(c.id).length;
  const B = M.breakdown;
  const parts = B ? [['Lecture', B.lecture, 's1'], ['Exercices', B.exercices, 's0'], ['Projets', B.projets, 's3'], ['QCM', B.qcm, 's2'], ['Examen', B.examen, 's4']] : [];
  const total = parts.reduce((n, p) => n + p[1], 0) || 1;
  const modsHtml = M.modules.map((pm, i) => {
    const m = mods?.find((x) => x.module_index === i);
    const mDone = m ? m.lessons.filter((l) => done.has(pkey(i, l.part_index))).length : 0;
    const full = m && mDone === m.lessons.length;
    const lessons = m ? `<ol class="les2">${m.lessons.map((l) => {
      const d = done.get(pkey(i, l.part_index));
      return `<li class="${d ? 'done' : ''}"><a href="${partHref(c.id, i, l.part_index)}"><span class="les2-n">${d ? smallCheck : `${i + 1}.${l.part_index + 1}`}</span><span class="les2-t">${esc(l.title)}</span>
        <small>${d && d.total ? `QCM ${d.good}/${d.total}` : `${l.minutes} min`}</small></a></li>`;
    }).join('')}</ol>` : '';
    return `<details class="mod2${full ? ' done' : ''}"${m && !full && (mDone || i === 0 || (mods && nextPart(c.id, mods)?.m.module_index === i)) ? ' open' : ''}>
      <summary><span class="mod2-n">${full ? smallCheck : pad2(i + 1)}</span><span class="mod2-t"><b>Module ${i + 1} · ${esc(pm.title)}</b>
        <small>${pm.lessons} leçons · ${fmtDur(pm.minutes)} de lecture${m ? ` · ${mDone}/${m.lessons.length} faites` : ''}</small>${m?.summary ? `<span class="mod2-s">${esc(m.summary)}</span>` : ''}</span>
        ${c.published && !ok ? `<span class="lock">${I.lock}</span>` : '<span class="mod2-chev" aria-hidden="true"></span>'}</summary>
      ${lessons}</details>`;
  }).join('');
  const previewNote = c.format !== 2 && isAdmin()
    ? `<div style="margin-bottom:16px">${notice('warn', `<b>Aperçu de la nouvelle version</b>, visible seulement par vous. Les étudiants voient encore la version actuelle. <button class="lnk" data-act="preview-toggle">Voir la version actuelle</button>`)}</div>` : '';
  return `${back('#/formations', 'Tous les métiers')}${previewNote}
  <div class="cols">
    <div class="stack" style="gap:26px;min-width:0">
      <div class="stack" style="gap:10px">
        ${cover(c.job, { big: true, level: c.single ? null : c.level, title: c.title.startsWith(c.job.name) ? c.job.name : c.title })}
        <h1>${esc(c.title)}</h1>
        <div style="display:flex;gap:8px;flex-wrap:wrap"><span class="pill ${c.level === 'a' ? 'gold' : ''}">${c.levelName}</span><span class="pill grey">${M.hours} heures</span><span class="pill grey">${M.modules.length} modules · ${nLessons} leçons</span><span class="pill grey">1 QCM après chaque leçon</span></div>
      </div>
      <p style="max-width:65ch">${esc(M.description)}</p>
      ${parts.length ? `<div class="stack" style="gap:10px"><h2>Votre temps de formation</h2>
        <div class="dur-bar" role="img" aria-label="Répartition des ${M.hours} heures">${parts.map(([k, v, col]) => `<i style="flex:${v};background:var(--${col})" title="${k} : ${fmtDur(v)}"></i>`).join('')}</div>
        <ul class="dur-leg">${parts.map(([k, v, col]) => `<li><i style="background:var(--${col})"></i>${k} <b>${fmtDur(v)}</b></li>`).join('')}</ul>
        <p class="muted" style="font-size:.88rem">Environ ${Math.round((total / 60) / 4.3)} h par semaine pour finir en un mois. Les exercices et les projets rejoignent votre portfolio.</p></div>` : ''}
      <div class="stack" style="gap:12px"><h2>Objectifs</h2><ol class="obj-num">${M.objectives.map((o) => `<li>${esc(o)}</li>`).join('')}</ol></div>
      ${c.job.paid ? `<div class="stack" style="gap:12px"><h2>Outils du métier</h2>
        <div class="tools"><div class="panel"><span class="pill">Gratuits</span><p style="margin-top:8px">${esc(c.job.tools)}</p></div>
        <div class="panel"><span class="pill gold">Payants (professionnels)</span><p style="margin-top:8px">${esc(c.job.paid)}</p></div></div>
        <p class="muted" style="font-size:.88rem">${c.level === 'f' ? 'Ce niveau se fait avec les outils gratuits ; les outils payants sont présentés pour savoir quand ils deviennent rentables.' : 'Ce niveau utilise les outils payants demandés par les clients. Essais gratuits possibles.'} Les prix changent souvent : vérifiez-les sur le site officiel. Pas de logiciels piratés.</p></div>`
        : `<div class="stack" style="gap:12px"><h2>Outils utilisés</h2><div class="panel"><p>${esc(c.job.tools.charAt(0).toUpperCase() + c.job.tools.slice(1))}. Tout se fait avec des outils gratuits.</p></div></div>`}
      <div class="stack" style="gap:12px"><h2>Programme</h2>
        ${c.published && !ok ? `<p class="muted prog-lock"><span class="lock">${I.lock}</span> Le titre des leçons, les cours et les QCM sont réservés aux abonnés.</p>` : ''}
        <div class="mods2">${modsHtml}
          <div class="mod2 exam2${cert ? ' done' : ''}"><div class="mod2-sum"><span class="mod2-n">${cert ? smallCheck : 'EX'}</span><span class="mod2-t"><b>Examen final</b><small>20 questions tirées au hasard · 50/100 pour réussir · essais illimités</small></span>
            ${c.published && ok && mods && nDone >= nLessons ? `<a class="btn ghost sm" href="#/formation/${c.id}/examen">${tries ? 'Repasser' : 'Commencer'}</a>` : c.published ? `<span class="lock">${I.lock}</span>` : ''}</div></div>
        </div>
      </div>
      ${other ? `<div class="panel" style="display:flex;justify-content:space-between;align-items:center;gap:12px;flex-wrap:wrap">
        <div><span class="eyebrow">Même métier</span><div style="font-weight:700">${esc(other.title)}</div></div>
        <a class="btn ghost sm" href="#/formation/${other.id}">Voir le niveau ${other.levelName}</a></div>` : ''}
      ${trainerSection(c)}
    </div>
    <aside class="panel side stack">
      ${S.session && c.published && ok ? `<div class="stack" style="gap:8px"><div style="display:flex;justify-content:space-between"><b>Ma progression</b><span class="mono">${pct} %</span></div><div class="bar"><i style="width:${pct}%"></i></div>
        <span class="muted" style="font-size:.9rem">${nDone} leçon${nDone > 1 ? 's' : ''} sur ${nLessons}</span>
        ${tries ? `<span class="muted" style="font-size:.9rem">Examen : ${tries} essai${tries > 1 ? 's' : ''}, meilleur score <b class="mono">${bestOf(c.id)}/100</b></span>` : ''}</div>` : ''}
      ${cert ? notice('warn', `Attestation obtenue le ${fmtDate(cert.issued_at)}.`) : ''}
      ${cta}
    </aside>
  </div>`;
}

async function lessonPage2(id, num, k) {
  const c = courseById(id);
  if (!c || !c.published || !isV2(c)) return notFound();
  const blocked = gate(`/formation/${id}/module/${num}${k ? '/lecon/' + k : ''}`);
  if (blocked) return blocked;
  const mods = await course2(id);
  const mi = Number(num) - 1;
  const m = mods.find((x) => x.module_index === mi);
  if (!m) return notFound();
  let L;
  if (k == null) {
    L = m.lessons.find((l) => !partsDone(id).has(pkey(mi, l.part_index))) || m.lessons[0];
    history.replaceState(null, '', partHref(id, mi, L.part_index));
  } else L = m.lessons.find((l) => l.part_index === Number(k) - 1);
  if (!L) return notFound();
  const pi = L.part_index;
  const [body, qs] = await Promise.all([api.getPart(id, mi, pi), api.getPartQuestions(id, mi, pi)]);
  S.pquiz = { courseId: id, mi, pi, answered: false, qs: qs.map((q) => ({ ...q, order: shuffle(q.options.map((_, j) => j)) })) };
  const no = `${mi + 1}.${pi + 1}`;
  const secs = sections(body);
  const [c1, c2] = COVER_COLORS[c.dom.id] || ['#04281C', '#0B7A55'];
  return `${back(`#/formation/${id}`, c.title)}
  <div class="lesson-head l2-head" style="--c1:${c1};--c2:${c2}">
    <span class="eyebrow">Module ${mi + 1} · ${esc(m.title)}</span>
    <h1><span class="mod-num">${no}</span>${esc(L.title)}</h1>
    <p class="muted">Leçon ${pi + 1} sur ${m.lessons.length} · environ ${L.minutes} min de lecture · QCM de ${qs.length} questions</p>
    <div class="lesson-progress l2-prog" aria-label="Leçons du module ${mi + 1}">${m.lessons.map((l) => `<a data-p="${l.part_index}" href="${partHref(id, mi, l.part_index)}" class="${l.part_index === pi ? 'on' : ''}${partsDone(id).has(pkey(mi, l.part_index)) ? ' done' : ''}" title="Leçon ${mi + 1}.${l.part_index + 1} : ${esc(l.title)}">${mi + 1}.${l.part_index + 1}</a>`).join('')}</div>
  </div>
  <div class="lesson-grid">
    <nav class="toc" aria-label="Sommaire de la leçon">
      <b>Dans cette leçon</b>
      <ol>${secs.map((t, j) => `<li><button type="button" data-act="toc" data-target="s-${no}-${j + 1}"><span>${no}.${j + 1}</span>${esc(t)}</button></li>`).join('')}
        <li><button type="button" data-act="toc" data-target="mquiz-wrap"><span>${no}.${secs.length + 1}</span>QCM de la leçon</button></li></ol>
    </nav>
    <div class="lesson-wrap">
      <article class="lesson md">${md(body, { number: no })}</article>
      <section class="stack quiz-sec" id="mquiz-wrap">
        <h2 class="quiz-h"><span class="sec-num">${no}.${secs.length + 1}</span>QCM de la leçon</h2>
        <p class="muted">${qs.length} questions pour vérifier ce que vous avez retenu. Après vos réponses, chaque question est expliquée. La leçon est validée dès que vous rendez le QCM ; vous pouvez le refaire autant de fois que vous voulez.</p>
        <div id="mquiz">${partQuizHtml()}</div>
      </section>
    </div>
  </div>`;
}
function partQuizHtml() {
  const Q = S.pquiz;
  const mods = S.parts.get(Q.courseId) || [];
  const flat = flatParts(mods);
  const idx = flat.findIndex(({ m, l }) => m.module_index === Q.mi && l.part_index === Q.pi);
  const nx = flat[idx + 1];
  const qsHtml = Q.qs.map((q, qi) => {
    const right = Q.answered && Q.answers[qi] === q.correct;
    return `<div class="q${Q.answered ? (right ? ' q-ok' : ' q-ko') : ''}"><fieldset><legend><span>${pad2(qi + 1)}</span>${nbsp(esc(q.question))}</legend>
    ${q.order.map((oi) => {
      let cls = '';
      if (Q.answered) { if (oi === q.correct) cls = ' ok'; else if (Q.answers[qi] === oi) cls = ' ko'; }
      return `<label class="opt${cls}"><input type="radio" name="pq${qi}" value="${oi}" ${Q.answers?.[qi] === oi ? 'checked' : ''} ${Q.answered ? 'disabled' : ''}><span>${esc(q.options[oi])}</span></label>`;
    }).join('')}
    ${Q.answered ? `<p class="q-why"><b>${right ? '✓ Bonne réponse.' : `✕ La bonne réponse : ${nbsp(esc(q.options[q.correct]))}.`}</b> ${nbsp(esc(q.explanation || ''))}</p>` : ''}</fieldset></div>`;
  }).join('');
  if (!Q.answered) return `<form id="pquiz-form" class="stack">${qsHtml}<p id="mqerr" class="notice err" hidden>Répondez à toutes les questions avant de valider.</p><div><button class="btn" type="submit">Valider mes réponses</button></div></form>`;
  const n = Q.qs.length, s = Q.score;
  const msg = s === n ? 'Parfait, tout est juste !' : s >= Math.ceil(n * 0.6) ? 'Bien joué. Lisez les explications des questions manquées.' : 'Relisez les parties de la leçon liées aux questions en rouge, puis refaites le QCM.';
  const allDone = flat.length && flat.every(({ m, l }) => partsDone(Q.courseId).has(pkey(m.module_index, l.part_index)));
  const next = nx ? `<a class="btn" href="${partHref(Q.courseId, nx.m.module_index, nx.l.part_index)}">${nx.m.module_index !== Q.mi ? `Module suivant : ${nx.m.module_index + 1}.1` : `Leçon suivante : ${nx.m.module_index + 1}.${nx.l.part_index + 1}`}</a>`
    : allDone ? `<a class="btn" href="#/formation/${Q.courseId}/examen">Passer l'examen final</a>` : `<a class="btn" href="#/formation/${Q.courseId}">Voir les leçons restantes</a>`;
  return `<form id="pquiz-form" class="stack">${qsHtml}
    <div class="panel stack quiz-res ${s === n ? 'all' : s >= Math.ceil(n * 0.6) ? 'ok' : 'low'}" style="gap:10px"><b>Résultat : <span class="mono">${s}/${n}</span> bonne${s > 1 ? 's' : ''} réponse${s > 1 ? 's' : ''} · leçon ${Q.mi + 1}.${Q.pi + 1} validée</b><p class="muted">${msg}</p>
      <div style="display:flex;gap:10px;flex-wrap:wrap">${next}<button type="button" class="btn ghost" data-act="pquiz-retry">Refaire le QCM</button></div></div></form>`;
}
// ---------------------------------------------------------------------------
// Leçon + petit test
// ---------------------------------------------------------------------------

async function lessonPage(id, num) {
  const c = courseById(id);
  if (!c || !c.published) return notFound();
  if (isV2(c)) return lessonPage2(id, num, null);
  const blocked = gate(`/formation/${id}/module/${num}`);
  if (blocked) return blocked;
  const mi = Number(num) - 1;
  if (!S.lessons.has(id)) S.lessons.set(id, await api.getLessons(id));
  const lessons = S.lessons.get(id);
  const L = lessons.find((l) => l.module_index === mi);
  if (!L) return notFound();
  const questions = await api.getModuleQuestions(id, mi);
  S.mquiz = {
    courseId: id, mi, answered: false,
    qs: questions.map((q) => ({ ...q, order: shuffle(q.options.map((_, k) => k)) })),
  };
  const n = lessons.length;
  const secs = sections(L.body_md);
  const modNo = mi + 1;
  return `${back(`#/formation/${id}`, c.title)}
  <div class="lesson-head">
    <span class="eyebrow">Module ${modNo} sur ${n} · environ ${readingMinutes(L.body_md)} min de lecture</span>
    <h1><span class="mod-num">${modNo}</span>${esc(L.title)}</h1>
    ${L.summary ? `<p class="muted">${esc(L.summary)}</p>` : ''}
    <div class="lesson-progress" aria-label="Progression dans la formation">${lessons.map((l) => `<a href="#/formation/${id}/module/${l.module_index + 1}" class="${l.module_index === mi ? 'on' : ''}${doneSet(id).has(l.module_index) ? ' done' : ''}" title="Module ${l.module_index + 1} : ${esc(l.title)}">${l.module_index + 1}</a>`).join('')}</div>
  </div>
  <div class="lesson-grid">
    <nav class="toc" aria-label="Sommaire du module">
      <b>Dans ce module</b>
      <ol>${secs.map((t, k) => `<li><button type="button" data-act="toc" data-target="s-${modNo}-${k + 1}"><span>${modNo}.${k + 1}</span>${esc(t)}</button></li>`).join('')}
        <li><button type="button" data-act="toc" data-target="mquiz-wrap"><span>${modNo}.${secs.length + 1}</span>Test du module</button></li></ol>
    </nav>
    <div class="lesson-wrap">
      <article class="lesson md">${md(L.body_md, { number: modNo })}</article>
  <section class="stack quiz-sec" id="mquiz-wrap">
    <h2 class="quiz-h"><span class="sec-num">${modNo}.${secs.length + 1}</span>Test du module</h2>
    <p class="muted">${S.mquiz.qs.length} questions pour vérifier vos acquis. Le module est validé dès que vous rendez le test ; vous pouvez le refaire autant de fois que vous voulez.</p>
    <div id="mquiz">${moduleQuizHtml()}</div>
  </section>
    </div>
  </div>`;
}
function moduleQuizHtml() {
  const Q = S.mquiz;
  const c = courseById(Q.courseId);
  const n = c.modules.length;
  const qsHtml = Q.qs.map((q, qi) => `<div class="q"><fieldset><legend><span>${pad2(qi + 1)}</span>${esc(q.question)}</legend>
    ${q.order.map((oi) => {
      let cls = '';
      if (Q.answered) { if (oi === q.correct) cls = ' ok'; else if (Q.answers[qi] === oi) cls = ' ko'; }
      return `<label class="opt${cls}"><input type="radio" name="mq${qi}" value="${oi}" ${Q.answers?.[qi] === oi ? 'checked' : ''} ${Q.answered ? 'disabled' : ''}><span>${esc(q.options[oi])}</span></label>`;
    }).join('')}</fieldset></div>`).join('');
  const footer = Q.answered
    ? `<div class="panel stack" style="gap:10px"><b>Résultat : <span class="mono">${Q.score}/${Q.qs.length}</span> bonnes réponses</b><p class="muted">Module ${Q.mi + 1} terminé.</p>
       <div style="display:flex;gap:10px;flex-wrap:wrap">${Q.mi < n - 1
         ? `<a class="btn" href="#/formation/${c.id}/module/${Q.mi + 2}">Module suivant</a>`
         : doneSet(c.id).size >= n ? `<a class="btn" href="#/formation/${c.id}/examen">Passer l'examen final</a>` : `<a class="btn" href="#/formation/${c.id}">Voir les modules restants</a>`}
       <button type="button" class="btn ghost" data-act="mquiz-retry">Refaire le test</button></div></div>`
    : '<p id="mqerr" class="notice err" hidden>Répondez à toutes les questions avant de valider.</p><div><button class="btn" type="submit">Valider mes réponses</button></div>';
  return `<form id="mquiz-form" class="stack">${qsHtml}${footer}</form>`;
}

// ---------------------------------------------------------------------------
// Examen final
// ---------------------------------------------------------------------------
function examPage(id) {
  const c = courseById(id);
  if (!c || !c.published) return notFound();
  const blocked = gate(`/formation/${id}/examen`);
  if (blocked) return blocked;
  const v2 = isV2(c);
  const n = v2 ? meta2(c).modules.length : c.modules.length;
  if (doneSet(id).size < n) {
    return `${back(`#/formation/${id}`, c.title)}<div class="narrow panel stack"><h2>Terminez d'abord les modules</h2>
      <p class="muted">Vous avez terminé ${doneSet(id).size} module${doneSet(id).size > 1 ? 's' : ''} sur ${n}. L'examen s'ouvre quand ${v2 ? 'les QCM de toutes les leçons sont rendus' : 'tous les tests de module sont rendus'}.</p>
      <a class="btn" href="#/formation/${id}">Voir le programme</a></div>`;
  }
  if (S.examResult?.courseId === id) return examResult(c);
  if (S.exam?.courseId === id) return examForm(c);
  const tries = attemptsOf(id).length;
  return `${back(`#/formation/${id}`, c.title)}
  ${pageHead('Examen final', c.title)}
  <div class="narrow panel stack" style="max-width:620px;gap:14px">
    <ul class="obj"><li>${v2 ? '20 questions tirées au hasard, 5 points chacune' : '10 questions tirées au hasard, 10 points chacune'}</li><li>50/100 pour réussir et obtenir l'attestation</li><li>Essais illimités : votre meilleur score est conservé</li><li>Vous avez 3 heures pour rendre vos réponses</li></ul>
    ${tries ? `<p class="muted">Déjà ${tries} essai${tries > 1 ? 's' : ''} · meilleur score <b class="mono">${bestOf(id)}/100</b></p>` : ''}
    <p id="exerr" class="notice err" hidden></p>
    <div><button class="btn" data-act="exam-start" data-id="${id}">Commencer l'examen</button></div>
  </div>`;
}
function examForm(c) {
  const E = S.exam;
  return `${back(`#/formation/${c.id}`, c.title)}
  ${pageHead('Examen final', 'Examen : ' + c.title, `<p class="muted">${E.questions.length} questions · 50/100 pour réussir · essais illimités</p>`)}
  <form id="exam-form" class="stack" style="max-width:720px">
    ${E.questions.map((q, qi) => `<div class="q"><fieldset><legend><span>${pad2(qi + 1)}</span>${esc(q.question)}</legend>
      ${q.order.map((oi) => `<label class="opt"><input type="radio" name="ex${qi}" value="${oi}"><span>${esc(q.options[oi])}</span></label>`).join('')}
    </fieldset></div>`).join('')}
    <p id="exerr" class="notice err" hidden></p>
    <div><button class="btn" type="submit">Valider l'examen</button></div>
  </form>`;
}
function examResult(c) {
  const R = S.examResult;
  const pass = R.passed;
  const other = otherLevel(c);
  return `<div class="narrow stack" style="max-width:560px;text-align:center;align-items:center;gap:18px">
    <span class="pill ${pass ? '' : 'red'}">${pass ? 'Examen réussi' : 'Examen non réussi'}</span>
    <div class="score mono">${R.score}<small>/100</small></div>
    <div class="bar" style="width:100%"><i style="width:${R.score}%;background:${pass ? 'var(--accent)' : 'var(--danger)'}"></i></div>
    <p class="muted">${R.good} bonne${R.good > 1 ? 's' : ''} réponse${R.good > 1 ? 's' : ''} sur ${R.total} · Seuil : 50/100 · Essai n° ${R.attempts} · Meilleur score : <span class="mono">${R.best}/100</span></p>
    ${pass
      ? `<p>Bravo ${esc((S.profile.full_name || '').split(' ')[0])} ! Vous avez terminé « ${esc(c.title)} ». Votre attestation est prête.${R.job_certificate_id ? ' Vous avez réussi les deux niveaux : votre attestation de parcours complet est aussi disponible.' : ''}</p>
         <div style="display:flex;gap:10px;flex-wrap:wrap;justify-content:center">
           <a class="btn" href="#/attestation/${R.certificate_id}">Voir mon attestation</a>
           ${R.job_certificate_id ? `<a class="btn ghost" href="#/attestation/${R.job_certificate_id}">Attestation de parcours</a>` : (other ? `<a class="btn ghost" href="#/formation/${other.id}">Continuer : niveau ${other.levelName}</a>` : '<a class="btn ghost" href="#/formations">Voir les autres formations</a>')}</div>
         ${examTrainers(c)}`
      : `<p>Il manque ${50 - R.score} point${50 - R.score > 1 ? 's' : ''}. Relisez les modules si besoin, puis recommencez : le nombre d'essais n'est pas limité.</p>
         <p id="exerr" class="notice err" hidden></p>
         <div style="display:flex;gap:10px;flex-wrap:wrap;justify-content:center">
           <button class="btn" data-act="exam-start" data-id="${c.id}">Recommencer l'examen</button>
           <a class="btn ghost" href="#/formation/${c.id}">Revoir les modules</a></div>`}
  </div>`;
}

// Après un examen réussi : des formateurs du domaine pour la suite
function examTrainers(c) {
  const list = trainersFor(c.dom.id).slice(0, 2);
  if (!list.length) return '';
  return `<section class="tr-after stack" aria-labelledby="tr-after-t"><h2 id="tr-after-t">Besoin d'aide pour la suite ?</h2>
    <p class="muted">Ces formateurs en ${esc(c.dom.name)} peuvent vous accompagner pour trouver vos premiers clients.</p>
    <div class="tr-grid">${list.map(trainerCard).join('')}</div>
    <a href="#/accompagnement?domaine=${c.dom.id}">Voir tous les formateurs</a></section>`;
}

// ---------------------------------------------------------------------------
// Attestations
// ---------------------------------------------------------------------------
function certText(cert) {
  return cert.kind === 'job'
    ? {
        heading: 'Attestation de parcours complet',
        text: `a réussi les formations Fondamentaux et Avancé du métier ${cert.title}${cert.hours ? ` (${cert.hours} heures au total)` : ''} et peut proposer ses services en freelance ou en télétravail.`,
        rows: [['Métier', cert.title], ['Délivrée le', fmtDate(cert.issued_at)], ['N° de vérification', cert.id]],
      }
    : {
        heading: 'Attestation de réussite',
        text: `a suivi l'intégralité de la formation « ${cert.title} »${cert.hours ? ` (${cert.hours} heures)` : ''} et réussi l'examen final.`,
        rows: [['Score', `${cert.score}/100`], ['Délivrée le', fmtDate(cert.issued_at)], ['N° de vérification', cert.id]],
      };
}
async function certificatePage(id) {
  if (!api.configured) return needConfig();
  const cert = await api.verifyCertificate(id);
  if (!cert) {
    return `${back('#/verifier', 'Vérifier une autre attestation')}<div class="narrow panel stack"><h2>Attestation introuvable</h2>
      <p class="muted">Aucune attestation ne porte le numéro <span class="mono">${esc(id)}</span>. Vérifiez le numéro, par exemple VTK-2026-4F9A2C.</p></div>`;
  }
  S.certView = cert;
  const t = certText(cert);
  const mine = S.certs.some((c) => c.id === cert.id);
  return `${mine ? back('#/mon-espace', 'Mon espace') : ''}
  <div style="display:flex;justify-content:center;gap:10px;flex-wrap:wrap;margin-bottom:16px">
    <button class="btn" data-act="pdf">Télécharger en PDF (A4 paysage)</button>
    <button class="btn ghost" data-act="copy" data-v="${esc(verifyUrl(cert.id))}">Copier le lien de vérification</button>
  </div>
  ${diplomaHtml(cert, t)}
  <p class="muted" style="text-align:center;margin-top:14px;font-size:.88rem">Attestation authentique délivrée par Vitako. Elle reste valable après la fin de l'abonnement.</p>`;
}
// Tampon en SVG (même dessin que dans le PDF).
function sealSvg(year) {
  const scallops = Array.from({ length: 32 }, (_, i) => {
    const a = (i / 32) * Math.PI * 2;
    return `<circle cx="${(60 + 48 * Math.cos(a)).toFixed(2)}" cy="${(60 + 48 * Math.sin(a)).toFixed(2)}" r="5.1"/>`;
  }).join('');
  return `<svg class="dip-seal" viewBox="0 0 120 136" role="img" aria-label="Tampon officiel Vitako">
    <defs><path id="sealTop" d="M 26.7 60 A 33.3 33.3 0 0 1 93.3 60"/><path id="sealBot" d="M 21.1 60 A 38.9 38.9 0 0 0 98.9 60"/></defs>
    <polygon points="36,76 54.7,84 42.7,132 34.4,122.4 24.3,127.2" fill="#084A34"/>
    <polygon points="84,76 65.3,84 77.3,132 85.6,122.4 95.7,127.2" fill="#0B7A55"/>
    <g fill="#B0801E">${scallops}<circle cx="60" cy="60" r="48"/></g>
    <circle cx="60" cy="60" r="43.7" fill="none" stroke="#FCF9F0" stroke-width="0.9"/>
    <circle cx="60" cy="60" r="30.4" fill="none" stroke="#FCF9F0" stroke-width="0.9"/>
    <g fill="#FCF9F0" font-family="Helvetica, Arial, sans-serif" font-weight="700" font-size="6">
      <text><textPath href="#sealTop" startOffset="50%" text-anchor="middle">ATTESTATION OFFICIELLE</textPath></text>
      <text><textPath href="#sealBot" startOffset="50%" text-anchor="middle">VITAKO</textPath></text>
      <circle cx="${(60 - 37.9 * Math.sin(1.25)).toFixed(2)}" cy="${(60 + 37.9 * Math.cos(1.25)).toFixed(2)}" r="1.4"/>
      <circle cx="${(60 + 37.9 * Math.sin(1.25)).toFixed(2)}" cy="${(60 + 37.9 * Math.cos(1.25)).toFixed(2)}" r="1.4"/>
    </g>
    <circle cx="60" cy="60" r="28.3" fill="#0B7A55"/>
    <circle cx="60" cy="60" r="25.9" fill="none" stroke="#D6B05C" stroke-width="0.8"/>
    <path d="M 50.4 58.4 L 56.8 64.8 L 69.2 50.8" fill="none" stroke="#fff" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/>
    <text x="60" y="76" text-anchor="middle" fill="#D6B05C" font-family="Helvetica, Arial, sans-serif" font-weight="700" font-size="5.4">${year}</text>
  </svg>`;
}

// Attestation à l'écran, sur le même modèle que le PDF.
function diplomaHtml(cert, t) {
  const [main, ...rest] = t.heading.split(' ');
  const url = verifyUrl(cert.id).replace(/^https?:\/\//, '');
  const cut = url.indexOf('#/');
  return `<div class="dip-wrap"><div class="diploma">
    <div class="dip-band" aria-hidden="true"><span>VITAKO · FORMATIONS FREELANCE ET TÉLÉTRAVAIL · MADAGASCAR</span></div>
    <div class="dip-body"><div class="dip-frame">
      <i class="dip-corner tl"></i><i class="dip-corner tr"></i><i class="dip-corner bl"></i><i class="dip-corner br"></i>
      <div class="dip-mark" aria-hidden="true">${I.check}</div>
      <div class="dip-logo">${logoSvg()}</div>
      <div class="dip-tag">Formations aux métiers du freelance et du télétravail</div>
      <div class="dip-title">${esc(main)}</div>
      <div class="dip-sub">${esc(rest.join(' '))}</div>
      <div class="dip-rule"><span></span></div>
      <p class="dip-intro">Nous attestons que</p>
      <div class="dip-name">${esc(cert.full_name)}</div>
      <p class="dip-text">${esc(t.text)}</p>
      <div class="dip-rows">${t.rows.map(([k, v]) => `<div><span>${esc(k)}</span><b>${esc(v)}</b></div>`).join('')}</div>
      <div class="dip-foot">
        <div class="dip-sign"><b>Vitako</b><span>La direction pédagogique</span></div>
        ${sealSvg(new Date(cert.issued_at).getFullYear())}
        <div class="dip-verify"><span>Vérification en ligne</span><b>${esc(cut > 0 ? url.slice(0, cut) : url)}<br>${esc(cut > 0 ? url.slice(cut) : '')}</b></div>
      </div>
    </div></div>
  </div></div>`;
}

// Remarques : formulaire ouvert à tous (menu « Envoyer une remarque »)
const FB_CATS = [['site', 'Amélioration du site'], ['bug', 'Problème technique'], ['formation', 'Formation ou contenu'], ['autre', 'Autre']];
function feedbackPage() {
  if (!api.configured) return needConfig();
  return `${pageHead('Votre avis compte', 'Envoyer une remarque')}
  <form id="feedback-form" class="narrow panel stack" style="gap:14px">
    <p class="muted">Une idée pour améliorer le site, un problème rencontré, une formation à ajouter ? Écrivez-nous : chaque remarque est lue par l'équipe Vitako.</p>
    <div class="f"><label class="l" for="fb-cat">Type de remarque</label>
      <select class="in" id="fb-cat" required>${FB_CATS.map(([k, l]) => `<option value="${k}">${l}</option>`).join('')}</select></div>
    <div class="f"><label class="l" for="fb-msg">Votre message</label>
      <textarea class="in" id="fb-msg" rows="6" minlength="10" maxlength="2000" required placeholder="Décrivez votre idée ou le problème, avec la page concernée si possible."></textarea></div>
    ${S.session ? `<p class="muted" style="font-size:.88rem">Envoyé avec votre compte (${esc(S.session.user.email || '')}), pour que nous puissions vous répondre.</p>`
      : '<div class="f"><label class="l" for="fb-email">Votre e-mail <span class="muted">(facultatif, pour recevoir une réponse)</span></label><input class="in" id="fb-email" type="email" autocomplete="email" placeholder="vous@exemple.mg"></div>'}
    <p id="fberr" class="notice err" hidden></p>
    <button class="btn" type="submit">Envoyer ma remarque</button>
  </form>`;
}

async function adminFeedbackPage() {
  if (!S.session) return needLogin('/admin/remarques');
  if (!S.profile) return loadingView();
  if (!isAdmin()) return notFound();
  const [list, counts] = await Promise.all([api.adminFeedback(), api.adminCounts()]);
  S.admin = counts; topbar();
  const label = Object.fromEntries(FB_CATS);
  const fresh = list.filter((f) => f.status === 'new').length;
  const fmtD = (d) => new Date(d).toLocaleString('fr-FR', { day: 'numeric', month: 'short', hour: '2-digit', minute: '2-digit' });
  return `${adminTabs('remarques')}${pageHead('Administration', 'Remarques', `<p class="muted">${list.length} remarque${list.length > 1 ? 's' : ''} · ${fresh} non lue${fresh > 1 ? 's' : ''}. Envoyées depuis le menu « Envoyer une remarque ».</p>`)}
  ${list.length ? `<div class="fb-list">${list.map((f) => `<article class="fb-item${f.status === 'new' ? ' new' : ''}">
      <div class="fb-top"><span class="pill${f.category === 'bug' ? ' red' : f.category === 'formation' ? ' gold' : ''}">${esc(label[f.category] || f.category)}</span>
        ${f.status === 'new' ? '<span class="fb-dot" aria-label="Non lue"></span>' : ''}<small class="muted">${fmtD(f.created_at)}${f.page ? ` · page ${esc(f.page)}` : ''}</small></div>
      <p class="fb-msg">${esc(f.message)}</p>
      <div class="fb-foot"><small>${f.full_name ? `<b>${esc(f.full_name)}</b> · ` : '<b>Visiteur</b> · '}${f.email ? `<a href="mailto:${esc(f.email)}">${esc(f.email)}</a>` : '<span class="muted">pas d\'e-mail</span>'}</small>
        <button class="btn ghost sm" data-act="fb-mark" data-id="${f.id}" data-read="${f.status === 'new'}">${f.status === 'new' ? 'Marquer comme lue' : 'Marquer non lue'}</button></div>
    </article>`).join('')}</div>` : '<p class="muted">Aucune remarque pour l\'instant.</p>'}`;
}

function verifyPage() {
  return `${pageHead('Vérification', 'Vérifier une attestation')}
  <form id="verify-form" class="narrow panel stack" style="gap:14px">
    <p class="muted">Saisissez le numéro inscrit sur l'attestation pour vérifier qu'elle a bien été délivrée par Vitako.</p>
    <div class="f"><label class="l" for="v-id">Numéro de vérification</label><input class="in mono" id="v-id" placeholder="VTK-2026-4F9A2C" autocomplete="off" required></div>
    <button class="btn" type="submit">Vérifier</button>
  </form>`;
}

// ---------------------------------------------------------------------------
// Comptes
// ---------------------------------------------------------------------------
function passwordField(id, autocomplete, label = 'Mot de passe') {
  return `<div class="f"><label class="l" for="${id}">${label}</label>
    <div class="pw"><input class="in" id="${id}" type="password" required minlength="8" autocomplete="${autocomplete}" placeholder="8 caractères minimum">
    <button type="button" class="eye" data-act="eye" data-for="${id}" aria-pressed="false" aria-label="Afficher le mot de passe">${I.eye}<span>Afficher</span></button></div></div>`;
}
function authPage(mode, opts = {}) {
  if (!api.configured) return needConfig();
  const r = route();
  const next = r.query.get('suite') || '';
  const asTrainer = !!opts.trainer || r.query.get('profil') === 'formateur';
  if (mode === 'forgot') {
    return `<div class="narrow panel stack" style="gap:18px">
      <div class="stack" style="gap:6px"><h2>Mot de passe oublié</h2><p class="muted">Saisissez votre e-mail : vous recevrez un lien pour choisir un nouveau mot de passe.</p></div>
      <form id="forgot-form" class="stack" style="gap:14px" novalidate>
        <div class="f"><label class="l" for="f-email">E-mail</label><input class="in" id="f-email" type="email" autocomplete="email" required placeholder="vous@exemple.mg"></div>
        <p id="ferr" class="notice err" hidden></p><p id="fok" class="notice info" hidden></p>
        <button class="btn" type="submit">Envoyer le lien</button>
      </form>
      <p class="muted" style="font-size:.92rem"><a href="#/connexion">Retour à la connexion</a></p></div>`;
  }
  if (mode === 'reset') {
    if (!S.session) return `<div class="narrow panel stack"><h2>Lien expiré</h2><p class="muted">Ouvrez le lien reçu par e-mail, ou demandez-en un nouveau.</p><a class="btn" href="#/mot-de-passe-oublie">Demander un nouveau lien</a></div>`;
    return `<div class="narrow panel stack" style="gap:18px"><h2>Nouveau mot de passe</h2>
      <form id="reset-form" class="stack" style="gap:14px" novalidate>${passwordField('r-pass', 'new-password', 'Nouveau mot de passe')}
        <p id="rerr" class="notice err" hidden></p><button class="btn" type="submit">Enregistrer</button></form></div>`;
  }
  if (S.session && asTrainer && S.profile) return becomeTrainerPanel();
  if (S.session) return `<div class="narrow panel stack"><h2>Vous êtes connecté</h2><a class="btn" href="#/mon-espace">Aller à mon espace</a></div>`;
  const signup = mode === 'signup';
  const rolePick = `<fieldset class="role-pick"><legend class="l">Je m'inscris comme</legend>
      <label class="role-opt"><input type="radio" name="a-role" value="student"${asTrainer ? '' : ' checked'}><span><b>Étudiant(e)</b><small>Je veux apprendre un métier</small></span></label>
      <label class="role-opt"><input type="radio" name="a-role" value="trainer"${asTrainer ? ' checked' : ''}><span><b>Formateur(trice)</b><small>Je veux accompagner des étudiants</small></span></label></fieldset>
    <div class="notice info role-note stack" id="role-note"${asTrainer ? '' : ' hidden'} style="gap:8px"><p>Réservé aux profils <b>seniors ou confirmés</b> : au moins <b>5 ans d'expérience</b> en freelance ou en télétravail.</p><p>Même abonnement que les étudiants, avec accès à toutes les formations. Vous remplissez votre profil, puis Vitako le vérifie avant de l'afficher aux étudiants.</p><label class="rv-check tr-exp-chk"><input type="checkbox" id="a-exp"> Je confirme avoir au moins 5 ans d'expérience en freelance ou en télétravail.</label></div>`;
  return `<div class="narrow panel stack" style="gap:18px">
    <div class="stack" style="gap:6px"><h2>${signup ? 'Créer un compte' : 'Connexion'}</h2>
      <p class="muted">${signup ? 'Gratuit. Vous pourrez voir toutes les formations ; l\'abonnement débloque les cours.' : 'Heureux de vous revoir.'}</p></div>
    <form id="auth-form" class="stack" style="gap:14px" novalidate data-mode="${signup ? 'signup' : 'login'}" data-next="${esc(next)}">
      ${signup ? rolePick : ''}
      ${signup ? '<div class="f"><label class="l" for="a-name">Nom complet</label><input class="in" id="a-name" autocomplete="name" required placeholder="Ex. Hery Randria"><small class="muted">Il figurera sur vos attestations.</small></div>' : ''}
      <div class="f"><label class="l" for="a-email">E-mail</label><input class="in" id="a-email" type="email" autocomplete="email" required placeholder="vous@exemple.mg"></div>
      ${passwordField('a-pass', signup ? 'new-password' : 'current-password')}
      <p id="aerr" class="notice err" hidden></p><p id="aok" class="notice info" hidden></p>
      <button class="btn" type="submit">${signup ? 'Créer mon compte' : 'Se connecter'}</button>
    </form>
    <p class="muted" style="font-size:.92rem">${signup
      ? `Déjà inscrit ? <a href="#/connexion${next ? '?suite=' + encodeURIComponent(next) : ''}">Se connecter</a>`
      : `Pas encore de compte ? <a href="#/inscription${next ? '?suite=' + encodeURIComponent(next) : ''}">Créer un compte</a> · <a href="#/mot-de-passe-oublie">Mot de passe oublié ?</a>`}</p>
  </div>`;
}

// ---------------------------------------------------------------------------
// Abonnement (paiement Mobile Money)
// ---------------------------------------------------------------------------
function subscribePage() {
  if (!api.configured) return needConfig();
  if (!S.session) return needLogin('/abonnement');
  if (!S.profile) return loadingView();
  const act = hasAccess() && !isAdmin();
  const op = opById(S.payOp);
  const pending = pendingPayment();
  const last = S.payments[0];
  const showKo = last && last.status === 'rejected';
  const start = act ? new Date(S.profile.sub_end) : new Date();
  const tr = isTrainer() && !isAdmin();
  const trFirst = tr && trStatus(S.trainer) === 'draft';
  const perks = tr
    ? `<li><span><b>Votre profil formateur</b> visible par les étudiants, après validation par Vitako</span></li><li><span><b>Affiché</b> dans le menu Accompagnement et sous les formations de vos domaines</span></li><li><span><b>Toutes les formations</b>, tests et attestations, comme les étudiants</span></li><li><span><b>Sans engagement</b> : l'accès s'arrête seul au bout de ${S.days} jours, aucun prélèvement</span></li>`
    : `<li><span><b>Toutes les formations</b> disponibles, sans limite</span></li><li><span><b>Tests et examens</b> illimités</span></li><li><span><b>Une attestation</b> par formation réussie, plus l'attestation de parcours complet</span></li><li><span><b>Sans engagement</b> : l'accès s'arrête seul au bout de ${S.days} jours, aucun prélèvement</span></li>`;
  return `<div class="sub-wrap">
    <div class="panel stack sub-plan" style="gap:14px">
      <span class="eyebrow">${tr ? 'Abonnement formateur' : 'Abonnement mensuel'}</span>
      ${promoOn() ? `<div><span class="pill red">-${promoPct()} % jusqu'au ${promoEnd()}</span></div>` : ''}
      <div class="price">${priceHtml()} <small>/ ${S.days} jours</small></div>
      <ul class="obj sub-perks">${perks}</ul>
      ${act ? notice('info', `Abonnement actif jusqu'au ${fmtDate(S.profile.sub_end)}. Un nouveau paiement ajoute ${S.days} jours.`) : ''}
    </div>
    <div class="sub-pay stack" style="gap:18px">
    ${pending ? `<div class="panel stack" style="gap:10px">
      <div><span class="pill gold">En attente de validation</span></div>
      <p>Paiement ${esc(opById(pending.operator).name)} de <b class="mono">${ar(pending.amount)}</b>${pending.sender ? ` depuis le <span class="mono">${fmtTel(pending.sender)}</span>` : ''}, référence <span class="mono">${esc(pending.reference)}</span>, envoyé le ${fmtDT(pending.created_at)}.</p>
      <p class="muted">Nous vérifions la réception puis activons votre accès pour ${S.days} jours, en général en ${esc(CFG.validationDelay)}. Vous recevrez un e-mail dès que c'est fait.</p>
    </div>` : trFirst ? `<div class="panel stack tr-first" style="gap:12px">
      <div><span class="pill gold">Étape 1 d'abord</span></div>
      <h2>Remplissez d'abord votre profil formateur</h2>
      <p class="muted">Vitako vérifie votre profil au moment de valider votre paiement. Il manque : ${esc(trainerMissing(S.trainer).join(', '))}.</p>
      <div><a class="btn" href="#/espace-formateur">Remplir mon profil</a></div>
    </div>` : `
    ${showKo ? notice('err', `Votre paiement du ${fmtDT(last.created_at)} (référence ${esc(last.reference)}) n'a pas été validé : ${esc(last.reason || 'paiement introuvable')}. Vérifiez la référence dans votre SMS de confirmation et renvoyez-la.`) : ''}
    <form id="pay-form" class="panel stack pay-panel" style="gap:16px" novalidate>
      <div class="pay-head"><b>Payer par Mobile Money</b><span>Choisissez votre opérateur</span></div>
      <div class="ops two" role="radiogroup" aria-label="Opérateur">
        ${CFG.operators.map((o) => `<button type="button" class="op op-${o.id}${o.id === op.id ? ' on' : ''}" data-op="${o.id}" role="radio" aria-checked="${o.id === op.id}">${esc(o.name)}</button>`).join('')}
      </div>
      <ol class="steps">
        <li><span>Envoyez <b class="mono">${ar(priceNow())}</b> à ce numéro ${esc(op.name)} :</span>
          <div class="paynum"><span class="mono">${esc(op.number)}</span><button type="button" class="btn ghost sm" data-act="copy" data-v="${op.number.replace(/ /g, '')}">Copier</button></div>
          <div class="holder">Au nom de <b>${esc(op.holder)}</b></div></li>
        <li>Entrez les informations du paiement :</li>
      </ol>
      <div class="f"><label class="l" for="p-ref">Référence de la transaction</label><input class="in mono" id="p-ref" autocomplete="off" required placeholder="Copiez-la depuis le SMS de confirmation"></div>
      <div class="f"><label class="l" for="p-tel">Votre numéro (facultatif)</label><input class="in mono" id="p-tel" inputmode="tel" autocomplete="tel" placeholder="${op.prefixes[0]} 12 345 67"></div>
      <p id="perr" class="notice err" hidden></p>
      <button class="btn" type="submit">Envoyer ma référence</button>
      <p class="muted" style="font-size:.85rem">Nous vérifions le paiement puis activons votre accès pour ${S.days} jours, en général en ${esc(CFG.validationDelay)}, et vous prévenons par e-mail. Accès prévu du ${fmtDate(start)} au ${fmtDate(start.getTime() + S.days * DAY)}.</p>
    </form>`}
    </div>
  </div>`;
}

// ---------------------------------------------------------------------------
// Mon espace
// ---------------------------------------------------------------------------
function accountPage() {
  if (!api.configured) return needConfig();
  if (!S.session) return needLogin('/mon-espace');
  if (!S.profile) return loadingView();
  const P = S.profile;
  const act = hasAccess();
  const ongoing = COURSES.filter((c) => c.published && doneSet(c.id).size && !courseCert(c.id));
  const jobCerts = S.certs.filter((c) => c.kind === 'job');
  const courseCerts = S.certs.filter((c) => c.kind === 'course');
  const pending = pendingPayment();
  let subHtml;
  if (P.is_admin) subHtml = '<p class="muted">Compte administrateur : accès à tous les cours.</p><a class="btn" href="#/admin">Valider les paiements</a>';
  else if (act) {
    const left = daysLeft();
    subHtml = `<div class="dsh-days"><b>${left}</b> jour${left > 1 ? 's' : ''} restant${left > 1 ? 's' : ''}</div>
      <div class="bar"><i style="width:${Math.min(100, (left / S.days) * 100)}%"></i></div>
      <p class="muted">Se désactive automatiquement le ${fmtDate(P.sub_end)}.</p>
      ${pending ? notice('warn', `Paiement en attente de validation (envoyé le ${fmtDT(pending.created_at)}).`) : ''}
      <a class="btn" href="#/abonnement">Prolonger de ${S.days} jours</a>`;
  } else {
    subHtml = `<p class="muted">${P.sub_end ? `Votre accès aux cours s'est arrêté le ${fmtDate(P.sub_end)}. Vos attestations restent consultables.` : 'Abonnez-vous pour suivre les cours.'}</p>
      ${pending ? notice('warn', `Paiement en attente de validation (envoyé le ${fmtDT(pending.created_at)}).`) : ''}
      <a class="btn" href="#/abonnement">${P.sub_end ? 'Renouveler' : "S'abonner"}</a>`;
  }
  const ic = (b) => `<svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">${b}</svg>`;
  const IC = {
    sub: ic('<rect x="2" y="5" width="20" height="14" rx="3"/><path d="M2 10h20"/><path d="M6 15h4"/>'),
    learn: ic('<path d="M2 7.5 12 3l10 4.5-10 4.5z"/><path d="M6 9.8v5.2c0 1.7 2.7 3 6 3s6-1.3 6-3V9.8"/>'),
    cert: ic('<circle cx="12" cy="9" r="6"/><path d="M8.5 13.5 7 22l5-3 5 3-1.5-8.5"/>'),
    user: ic('<circle cx="12" cy="8" r="4"/><path d="M4 21c1.5-4 4.5-6 8-6s6.5 2 8 6"/>'),
  };
  const modsDone = [...S.progress.values()].reduce((n, set) => n + set.size, 0);
  const subTone = P.is_admin || act ? 'ok' : pending ? 'wait' : 'off';
  const domColor = (c) => (COVER_COLORS[c.dom.id] || ['#0B7A55', '#14A06F']);
  const ongoingHtml = ongoing.map((c) => {
    const [c1, c2] = domColor(c); const n = doneSet(c.id).size; const pc = Math.round((n / c.modules.length) * 100);
    return `<div class="dsh-course"><span class="dsh-dot" style="background:linear-gradient(135deg,${c1},${c2})">${DOM_ICONS[c.dom.id] || ''}</span>
      <div class="t"><div class="dsh-ct">${esc(c.title)}</div>
        <div class="dsh-prog"><span class="bar"><i style="width:${pc}%;background:linear-gradient(90deg,${c1},${c2})"></i></span><small>${n}/${c.modules.length} modules${attemptsOf(c.id).length ? ` · examen ${bestOf(c.id)}/100` : ''}</small></div></div>
      <a class="btn sm" href="#/formation/${c.id}">Continuer</a></div>`;
  }).join('');
  return `<section class="dsh-hero">
    <div class="dsh-hero-in">
      <div class="dsh-who">${avatarHtml(P, 'av-lg')}<div><div class="dsh-eyebrow">Mon espace</div><h1>Salama, ${esc((P.full_name || '').split(' ')[0])}</h1>
        <p>${act && !P.is_admin ? `Abonnement actif : encore ${daysLeft()} jour${daysLeft() > 1 ? 's' : ''} pour apprendre.` : P.is_admin ? 'Compte administrateur.' : 'Abonnez-vous pour suivre les cours et obtenir vos attestations.'}</p></div></div>
      <div class="dsh-kpis">
        <div><b>${ongoing.length}</b><span>en cours</span></div>
        <div><b>${modsDone}</b><span>modules terminés</span></div>
        <div><b>${courseCerts.length + jobCerts.length}</b><span>attestation${courseCerts.length + jobCerts.length > 1 ? 's' : ''}</span></div>
      </div>
    </div>
  </section>
  <div class="dash dsh">
    ${isTrainer() ? `<section class="panel stack dsh-card tone-trainer" style="gap:12px">
      <div class="dsh-h"><span class="dsh-ic">${CT_ICONS.trainer}</span><b>Espace formateur</b>${trPill(S.trainer)}</div>
      <p class="muted">${esc(trainerStateText())}</p>
      <div><a class="btn" href="#/espace-formateur">Ouvrir mon Espace formateur</a></div>
    </section>` : ''}
    <section class="panel stack dsh-card tone-${subTone}" style="gap:12px">
      <div class="dsh-h"><span class="dsh-ic">${IC.sub}</span><b>Abonnement</b>${P.is_admin ? '<span class="pill">Admin</span>' : act ? '<span class="pill">Actif</span>' : pending ? '<span class="pill gold">En attente</span>' : `<span class="pill red">${P.sub_end ? 'Expiré' : 'Aucun'}</span>`}</div>
      ${subHtml}
    </section>
    <section class="panel stack dsh-card tone-learn" style="gap:4px">
      <div class="dsh-h"><span class="dsh-ic">${IC.learn}</span><b>Formations en cours</b>${ongoing.length ? `<span class="pill blue">${ongoing.length}</span>` : ''}</div>
      <div class="list">${ongoing.length ? ongoingHtml
        : '<p class="muted" style="padding-top:8px">Aucune formation en cours. <a href="#/formations">Parcourir les métiers</a></p>'}</div>
    </section>
    <section class="panel stack dsh-card tone-cert" style="gap:4px">
      <div class="dsh-h"><span class="dsh-ic">${IC.cert}</span><b>Mes attestations</b>${courseCerts.length + jobCerts.length ? `<span class="pill gold">${courseCerts.length + jobCerts.length}</span>` : ''}</div>
      <div class="list">
        ${jobCerts.map((c) => `<div class="item dsh-cert job"><span class="dsh-medal">${I.seal || IC.cert}</span><div class="t"><div>Parcours complet : ${esc(c.title)}</div><small class="muted mono">${esc(c.id)}</small></div><a class="btn sm" href="#/attestation/${c.id}">Voir</a></div>`).join('')}
        ${courseCerts.length ? courseCerts.map((c) => `<div class="item dsh-cert"><span class="dsh-medal">${IC.cert}</span><div class="t"><div>${esc(c.title)}</div><small class="muted mono">${esc(c.id)} · <span class="dsh-score">${c.score}/100</span></small></div><a class="btn ghost sm" href="#/attestation/${c.id}">Voir</a></div>`).join('')
          : '<p class="muted" style="padding-top:8px">Terminez une formation et réussissez l\'examen pour obtenir votre première attestation.</p>'}
      </div>
    </section>
  </div>
  <form id="name-form" class="panel stack dsh-card tone-user" style="gap:12px;margin-top:22px;max-width:520px">
    <div class="dsh-h"><span class="dsh-ic">${IC.user}</span><b>Mon profil</b></div>
    <div class="av-edit">${avatarHtml(P, 'av-xl')}
      <div class="stack" style="gap:8px">
        <div class="av-btns"><label class="btn ghost sm av-pick" for="av-file">${P.avatar_url ? 'Changer la photo' : 'Ajouter une photo'}</label>${P.avatar_url ? '<button type="button" class="btn ghost sm" data-act="av-remove">Retirer</button>' : ''}</div>
        <input type="file" id="av-file" accept="image/*" hidden>
        <small class="muted">JPG, PNG ou photo du téléphone. Vous choisissez le cadrage, la photo est ensuite compressée automatiquement.</small>
      </div>
    </div>
    <div class="f"><label class="l" for="n-name">Nom complet (sur les attestations)</label><input class="in" id="n-name" value="${esc(P.full_name)}" autocomplete="name" required></div>
    <p class="muted" style="font-size:.88rem">Le nouveau nom s'applique aux prochaines attestations. Celles déjà délivrées gardent le nom d'origine.</p>
    <div><button class="btn ghost" type="submit">Enregistrer le nom</button></div>
  </form>
  ${!isTrainer() && !P.is_admin ? `<p class="tr-invite muted">Vous voulez accompagner des étudiants dans votre métier ? <a href="#/devenir-formateur">Devenir formateur</a></p>` : ''}`;
}

// ---------------------------------------------------------------------------
// Formateurs : accompagnement personnalisé
// ---------------------------------------------------------------------------
const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;
const TR_STATUS = {
  draft: ['Profil à compléter', 'grey'],
  pending: ['En attente de validation', 'gold'],
  approved: ['Profil validé', ''],
  rejected: ['À corriger', 'red'],
};
const TR_REASONS = ['Moins de 5 ans d\'expérience en freelance ou télétravail', 'Photo de profil absente ou inadaptée', 'Présentation trop courte ou peu claire', 'Informations fausses ou douteuses',
  'Profil sans rapport avec les formations Vitako', 'Coordonnées invalides'];
const trStatus = (t) => t?.status || 'draft';
const trPill = (t) => { const [label, cls] = TR_STATUS[trStatus(t)]; return `<span class="pill ${cls}">${label}</span>`; };
const domName = (id) => DOMAINS_LIST.find((d) => d.id === id)?.name || id;
const domColors = (id) => COVER_COLORS[id] || ['#04281C', '#0B7A55'];
const waLink = (v) => { let d = String(v || '').replace(/\D/g, ''); if (/^0\d{9}$/.test(d)) d = '261' + d.slice(1); return 'https://wa.me/' + d; };
const fmtPhone = (v) => (/^0\d{9}$/.test(v || '') ? fmtTel(v) : v || '');
const firstName = (n) => String(n || '').trim().split(/\s+/)[0] || '';
const svgS = (body, fill = false) => `<svg viewBox="0 0 24 24" width="18" height="18" ${fill ? 'fill="currentColor"' : 'fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"'} aria-hidden="true">${body}</svg>`;
const CT_ICONS = {
  whatsapp: svgS('<path d="M7.9 20A9 9 0 1 0 4 16.1L2 22z"/><path d="M9 10.2c.4 1.6 1.9 3.3 3.9 4.1l1.3-1.1 2 1-.4 1.6c-3.6.4-7.7-3.3-7.8-7.2l1.6-.5 1 2z"/>'),
  phone: svgS('<path d="M22 16.9v3a2 2 0 0 1-2.2 2 19.8 19.8 0 0 1-8.6-3.1 19.5 19.5 0 0 1-6-6A19.8 19.8 0 0 1 2.1 4.2 2 2 0 0 1 4.1 2h3a2 2 0 0 1 2 1.7c.1 1 .4 1.9.7 2.8a2 2 0 0 1-.5 2.1L8.1 9.9a16 16 0 0 0 6 6l1.3-1.3a2 2 0 0 1 2.1-.4c.9.3 1.8.6 2.8.7a2 2 0 0 1 1.7 2z"/>'),
  email: svgS('<rect x="3" y="5" width="18" height="14" rx="2"/><path d="m3 7 9 6 9-6"/>'),
  facebook: svgS('<path d="M13.5 21v-7.5h2.6l.4-3h-3V8.6c0-.9.3-1.5 1.5-1.5h1.6V4.4c-.3 0-1.2-.1-2.3-.1-2.3 0-3.9 1.4-3.9 4v2.2H7.8v3h2.6V21h3.1z"/>', true),
  linkedin: svgS('<path d="M4.98 3.5a2.5 2.5 0 1 1 0 5 2.5 2.5 0 0 1 0-5zM3 9.75h4V21H3zM9.5 9.75h3.83v1.54h.05c.53-1 1.84-2.06 3.79-2.06 4.05 0 4.8 2.67 4.8 6.13V21h-4v-5.04c0-1.2-.02-2.75-1.68-2.75-1.68 0-1.94 1.31-1.94 2.66V21h-4z"/>', true),
  instagram: svgS('<rect x="3" y="3" width="18" height="18" rx="5"/><circle cx="12" cy="12" r="4"/><circle cx="17.5" cy="6.5" r="1" fill="currentColor" stroke="none"/>'),
  tiktok: svgS('<path d="M16.6 3c.4 2.3 1.9 3.9 4.4 4.1v3.1c-1.6.1-3-.4-4.4-1.3v6.2c0 3.6-2.6 6.4-6.2 6.4S4 18.9 4 15.4c0-3.6 3-6.3 6.8-5.9v3.2c-1.9-.4-3.6.9-3.6 2.7 0 1.6 1.3 2.8 2.9 2.8 1.7 0 3-1.2 3-3.2V3h3.5z"/>', true),
  website: svgS('<circle cx="12" cy="12" r="10"/><path d="M2 12h20"/><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/>'),
  trainer: svgS('<circle cx="9" cy="7" r="4"/><path d="M2 21c.8-3.6 3.6-6 7-6s6.2 2.4 7 6"/><path d="m16 11 2 2 4-4"/>'),
  camera: svgS('<path d="M14.5 4h-5L7 7H4a2 2 0 0 0-2 2v9a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2h-3z"/><circle cx="12" cy="13" r="3.5"/>'),
  text: svgS('<path d="M4 6h16M4 12h16M4 18h10"/>'),
  contact: svgS('<path d="M7.9 20A9 9 0 1 0 4 16.1L2 22z"/>'),
};
const SOCIALS = [['facebook', 'Facebook'], ['linkedin', 'LinkedIn'], ['instagram', 'Instagram'], ['tiktok', 'TikTok'], ['website', 'Site web']];

// Ce qui manque pour que le profil soit complet (mêmes règles que la base).
function trainerMissing(t, P = S.profile) {
  const m = [];
  if (!P?.avatar_url) m.push('votre photo de profil');
  if (!t || String(t.headline || '').trim().length < 3) m.push('votre métier');
  if (!t || String(t.bio || '').trim().length < 30) m.push('une présentation (30 caractères au moins)');
  if (!t || !(t.domains || []).length) m.push('au moins un domaine');
  if (!t || !(t.whatsapp || t.phone || t.email)) m.push('un moyen de contact (WhatsApp, téléphone ou e-mail)');
  return m;
}
// Phrase d'état pour le formateur connecté.
function trainerStateText() {
  const st = trStatus(S.trainer);
  if (st === 'draft') return `Complétez votre profil. Il manque : ${trainerMissing(S.trainer).join(', ')}.`;
  if (st === 'rejected') return `Profil à corriger : ${S.trainer.reason || 'voir le motif'}. Modifiez-le puis enregistrez-le : il repart en validation.`;
  if (st === 'approved') return hasAccess() ? 'Votre profil est visible par les étudiants.' : 'Votre profil est validé. Il sera de nouveau visible dès que votre abonnement sera actif.';
  if (pendingPayment()) return 'Vitako vérifie votre profil en même temps que votre paiement.';
  return hasAccess() ? 'Vitako vérifie votre profil.' : 'Profil complet. Prenez votre abonnement : Vitako vérifie votre profil en même temps que le paiement.';
}

// Liste publique des formateurs visibles, gardée 5 minutes.
async function loadTrainers(force = false) {
  if (!api.configured) { S.trainers = []; return S.trainers; }
  if (!force && S.trainers && Date.now() - S.trainersAt < 5 * 60e3) return S.trainers;
  S.trainers = await api.listTrainers().catch(() => S.trainers || []);
  S.trainersAt = Date.now();
  return S.trainers;
}
// Ordre tiré au hasard, mais le même toute la journée : chaque formateur a sa chance d'être en tête.
const dayHash = (s) => { let h = 2166136261; for (let i = 0; i < s.length; i++) { h ^= s.charCodeAt(i); h = Math.imul(h, 16777619); } return h >>> 0; };
const dailyOrder = (list) => { const d = mgDate(); return list.slice().sort((a, b) => dayHash(a.user_id + d) - dayHash(b.user_id + d)); };
const trainersFor = (dom) => dailyOrder((S.trainers || []).filter((t) => !dom || (t.domains || []).includes(dom)));

function trainerCard(t) {
  const doms = t.domains || [];
  const pills = doms.slice(0, 3).map((d) => `<span class="pill grey">${esc(domName(d))}</span>`).join('') + (doms.length > 3 ? `<span class="pill grey">+${doms.length - 3}</span>` : '');
  const [c1, c2] = domColors(doms[0]);
  const rate = String(t.rates || '').split('\n')[0].trim();
  return `<a class="tr-card" href="#/formateur/${esc(t.user_id)}">
    <span class="tr-cv" style="--c1:${c1};--c2:${c2}">${t.cover_url ? `<img src="${esc(t.cover_url)}" alt="" loading="lazy" decoding="async">` : ''}</span>
    <span class="tr-body">
      ${avatarHtml(t, 'av-tr')}
      <b class="tr-name">${esc(t.full_name)}</b>
      <span class="tr-hl">${esc(t.headline)}</span>
      <span class="tr-doms">${pills}</span>
      ${rate ? `<span class="tr-rates">${esc(rate.length > 90 ? rate.slice(0, 88) + '…' : rate)}</span>` : ''}
      <span class="tr-go">Voir le profil <span aria-hidden="true">→</span></span>
    </span></a>`;
}
// Sous une formation : quelques formateurs du même domaine.
function trainerSection(c) {
  const list = trainersFor(c.dom.id);
  if (!list.length) return '';
  return `<section class="stack tr-sec" style="gap:12px" aria-labelledby="tr-sec-t">
    <div class="tr-sec-h"><h2 id="tr-sec-t">Se faire accompagner</h2>${list.length > 3 ? `<a href="#/accompagnement?domaine=${c.dom.id}">Voir les ${list.length} formateurs</a>` : ''}</div>
    <p class="muted">Ces formateurs en ${esc(c.dom.name)} peuvent vous aider pendant la formation et pour trouver vos premiers clients.</p>
    <div class="tr-grid">${list.slice(0, 3).map(trainerCard).join('')}</div></section>`;
}

// Devenir formateur (personne déjà inscrite)
function becomeTrainerPanel() {
  if (isTrainer()) {
    return `<div class="narrow panel stack"><h2>Vous êtes formateur</h2><p class="muted">Votre compte formateur est déjà actif.</p><a class="btn" href="#/espace-formateur">Aller à mon Espace formateur</a></div>`;
  }
  return `<div class="narrow panel stack tr-become" style="gap:14px">
    <span class="eyebrow">Accompagnement</span>
    <h1 class="tr-become-t">Devenir formateur</h1>
    <p>Accompagnez les étudiants de Vitako dans votre domaine et faites connaître vos services.</p>
    <p class="notice warn">Réservé aux profils <b>seniors ou confirmés</b> : au moins <b>5 ans d'expérience</b> en freelance ou en télétravail. Vitako vérifie votre parcours avant d'afficher votre profil.</p>
    <ul class="obj sub-perks">
      <li><span><b>Un profil public</b> avec photo, couverture, présentation, tarifs et contacts</span></li>
      <li><span><b>Visible par les étudiants</b> dans le menu Accompagnement et sous les formations de vos domaines</span></li>
      <li><span><b>Même abonnement</b> que les étudiants, avec accès à toutes les formations</span></li>
    </ul>
    <p class="muted" style="font-size:.9rem">Vous gardez votre compte, vos cours et vos attestations. Vitako vérifie votre profil avant de l'afficher.</p>
    <label class="rv-check tr-exp-chk"><input type="checkbox" id="b-exp"> Je confirme avoir au moins 5 ans d'expérience en freelance ou en télétravail.</label>
    <p id="berr" class="notice err" hidden></p>
    <button class="btn" data-act="become-trainer">Devenir formateur</button></div>`;
}
function becomeTrainerPage() {
  if (!api.configured) return needConfig();
  if (!S.session) return authPage('signup', { trainer: true });
  if (!S.profile) return loadingView();
  return becomeTrainerPanel();
}

// Espace formateur : étapes, puis le formulaire du profil
function readTrainerForm(f) {
  const v = (id) => f.querySelector('#' + id)?.value ?? '';
  return {
    headline: v('t-headline'), bio: v('t-bio'), rates: v('t-rates'),
    domains: [...f.querySelectorAll('input[name=t-dom]:checked')].map((i) => i.value),
    whatsapp: v('t-wa'), phone: v('t-phone'), email: v('t-email'),
    facebook: v('t-fb'), linkedin: v('t-li'), instagram: v('t-ig'), tiktok: v('t-tt'), website: v('t-web'),
  };
}
function trainerSpacePage() {
  if (!api.configured) return needConfig();
  if (!S.session) return needLogin('/espace-formateur');
  if (!S.profile) return loadingView();
  if (!isTrainer()) return becomeTrainerPanel();
  const P = S.profile, T = S.trainer || {};
  const D = S.trainerDraft || T;
  const st = trStatus(S.trainer);
  const act = hasAccess(), pend = pendingPayment();
  const missing = trainerMissing(S.trainer);
  const step = (n, state, title, text, action = '') => `<li class="tr-step ${state}"><span class="tr-step-n">${state === 'done' ? smallCheck : n}</span>
    <div><b>${title}</b><p>${text}</p>${action}</div></li>`;
  const s2 = st === 'draft' ? 'todo' : 'done';
  const s3 = act ? 'done' : pend ? 'wait' : s2 === 'done' ? 'todo' : 'off';
  const s4 = st === 'approved' ? (act ? 'done' : 'wait') : st === 'rejected' ? 'err' : st === 'pending' && (pend || act) ? 'wait' : 'off';
  const steps = `<ol class="tr-steps" aria-label="Étapes pour être visible">
    ${step(1, 'done', 'Créer votre compte', `C'est fait. Bienvenue, ${esc(firstName(P.full_name))} !`)}
    ${step(2, s2, 'Remplir votre profil', s2 === 'done' ? 'Profil complet. Vous pouvez le modifier à tout moment.' : `Il manque : ${esc(missing.join(', '))}.`,
      s2 === 'done' ? '' : '<button type="button" class="btn sm" data-act="toc" data-target="trainer-form">Remplir mon profil</button>')}
    ${step(3, s3, 'Payer l\'abonnement', act ? `Actif jusqu'au ${fmtDate(P.sub_end)}.` : pend ? `Paiement envoyé le ${fmtDT(pend.created_at)}, en cours de vérification.`
      : s3 === 'todo' ? `${ar(priceNow())} pour ${S.days} jours, par MVola ou Orange Money.` : 'Possible dès que votre profil est complet.',
      s3 === 'todo' ? '<a class="btn sm" href="#/abonnement">Payer l\'abonnement</a>' : '')}
    ${step(4, s4, 'Validation par Vitako', st === 'approved' ? (act ? 'Votre profil est visible par les étudiants.' : 'Profil validé. Il sera visible dès que votre abonnement sera actif.')
      : st === 'rejected' ? `À corriger : ${esc(T.reason || '')}. Modifiez votre profil puis enregistrez-le : il repart en validation.`
      : s4 === 'wait' ? 'Vitako vérifie votre profil en même temps que votre paiement.' : 'Après votre paiement, Vitako vérifie votre profil puis le rend visible.')}
  </ol>`;
  const [c1, c2] = domColors((D.domains || [])[0]);
  const domSet = new Set(D.domains || []);
  const field = (id, label, value, attrs = '', hint = '') => `<div class="f"><label class="l" for="${id}">${label}</label><input class="in" id="${id}" value="${esc(value || '')}" ${attrs}>${hint ? `<small class="muted">${hint}</small>` : ''}</div>`;
  const visible = st === 'approved' && act;
  return `<section class="dsh-hero tr-hero">
    <div class="dsh-hero-in">
      <div class="dsh-who">${avatarHtml(P, 'av-lg')}<div><div class="dsh-eyebrow">Espace formateur</div><h1>Salama, ${esc(firstName(P.full_name))}</h1>
        <p>${esc(trainerStateText())}</p></div></div>
      <div class="tr-hero-act"><span class="tr-hero-st${visible ? ' on' : ''}">${visible ? 'Visible par les étudiants' : TR_STATUS[st][0]}</span>
        <a class="btn on-dark" href="#/formateur/${uid()}">Voir mon profil public</a></div>
    </div>
  </section>
  ${steps}
  <div class="tr-layout">
  <form id="trainer-form" class="tr-form stack" novalidate>
    <p class="notice warn">Réservé aux profils <b>seniors ou confirmés</b> : au moins <b>5 ans d'expérience</b> en freelance ou en télétravail. Indiquez vos années d'expérience et vos principales réalisations dans votre présentation : Vitako les vérifie avant d'afficher votre profil.</p>
    <section class="panel stack dsh-card tone-trainer">
      <div class="dsh-h"><span class="dsh-ic">${CT_ICONS.camera}</span><b>Photos</b></div>
      <div class="tr-cover-prev" style="--c1:${c1};--c2:${c2}">${T.cover_url ? `<img src="${esc(T.cover_url)}" alt="Votre photo de couverture">` : '<span>Photo de couverture (format paysage)</span>'}</div>
      <div class="av-btns"><label class="btn ghost sm tr-pick" for="tr-cover-file">${T.cover_url ? 'Changer la couverture' : 'Ajouter une couverture'}</label>${T.cover_url ? '<button type="button" class="btn ghost sm" data-act="tr-img-remove" data-kind="cover">Retirer</button>' : ''}</div>
      <input type="file" id="tr-cover-file" data-kind="cover" accept="image/*" hidden>
      <small class="muted">Facultative. Une image en longueur pour présenter vos services. Elle est compressée automatiquement (30 Ko au maximum).</small>
      <div class="tr-imgs">
        <div class="tr-img-col">${avatarHtml(P, 'av-xl')}<div class="stack" style="gap:6px"><b>Photo de profil <span class="pill gold">Obligatoire</span></b>
          <div class="av-btns"><label class="btn ghost sm av-pick" for="av-file">${P.avatar_url ? 'Changer la photo' : 'Ajouter une photo'}</label></div>
          <input type="file" id="av-file" accept="image/*" hidden><small class="muted">Une vraie photo de vous, le visage bien visible.</small></div></div>
        <div class="tr-img-col"><span class="tr-visual-prev">${T.visual_url ? `<img src="${esc(T.visual_url)}" alt="Votre visuel">` : 'Visuel carré'}</span><div class="stack" style="gap:6px"><b>Visuel carré</b>
          <div class="av-btns"><label class="btn ghost sm tr-pick" for="tr-visual-file">${T.visual_url ? 'Changer' : 'Ajouter'}</label>${T.visual_url ? '<button type="button" class="btn ghost sm" data-act="tr-img-remove" data-kind="visual">Retirer</button>' : ''}</div>
          <input type="file" id="tr-visual-file" data-kind="visual" accept="image/*" hidden><small class="muted">Facultatif. Une affiche ou une réalisation (10 Ko au maximum).</small></div></div>
      </div>
    </section>
    <section class="panel stack dsh-card tone-trainer">
      <div class="dsh-h"><span class="dsh-ic">${CT_ICONS.text}</span><b>Présentation</b></div>
      ${field('t-headline', 'Votre métier', D.headline, 'maxlength="80" placeholder="Ex. Graphiste freelance depuis 5 ans" autocomplete="organization-title"')}
      <fieldset class="tr-doms-pick"><legend class="l">Domaines où vous pouvez accompagner <span class="muted">(autant que vous voulez)</span></legend>
        <div class="chips chips-wrap">${DOMAINS_LIST.map((d) => `<label class="chip chk${domSet.has(d.id) ? ' on' : ''}"><input type="checkbox" name="t-dom" value="${d.id}"${domSet.has(d.id) ? ' checked' : ''}>${DOM_ICONS[d.id] || ''}<span>${esc(d.name)}</span></label>`).join('')}</div>
        <small class="muted">Votre profil s'affiche sous les formations de ces domaines.</small></fieldset>
      <div class="f"><label class="l" for="t-bio">Présentation</label>
        <textarea class="in" id="t-bio" rows="6" maxlength="1500" placeholder="Vos années d'expérience en freelance ou télétravail, ce que vous avez réalisé, et comment vous accompagnez les étudiants (séances en visio, relecture de portfolio, aide pour trouver des clients…).">${esc(D.bio || '')}</textarea>
        <small class="muted">30 caractères au moins, 1 500 au maximum.</small></div>
      <div class="f"><label class="l" for="t-rates">Tarifs d'accompagnement <span class="muted">(facultatif)</span></label>
        <textarea class="in" id="t-rates" rows="3" maxlength="600" placeholder="Ex. Séance d'une heure en visio : 20 000 Ar. Suivi d'un mois : 80 000 Ar.">${esc(D.rates || '')}</textarea></div>
    </section>
    <section class="panel stack dsh-card tone-trainer">
      <div class="dsh-h"><span class="dsh-ic">${CT_ICONS.contact}</span><b>Contacts</b></div>
      <p class="muted" style="font-size:.9rem">Visibles seulement par les personnes inscrites et connectées. Indiquez au moins un numéro WhatsApp, un téléphone ou un e-mail.</p>
      <div class="tr-fields">
        ${field('t-wa', 'WhatsApp', fmtPhone(D.whatsapp), 'inputmode="tel" autocomplete="tel" placeholder="034 12 345 67"')}
        ${field('t-phone', 'Téléphone', fmtPhone(D.phone), 'inputmode="tel" placeholder="032 12 345 67"')}
        ${field('t-email', 'E-mail de contact', S.trainerDraft ? D.email : (T.email ?? (st === 'draft' ? P.email : '')), 'type="email" autocomplete="email" placeholder="vous@exemple.mg"')}
        ${field('t-fb', 'Facebook', D.facebook, 'inputmode="url" placeholder="https://facebook.com/votre.page"')}
        ${field('t-li', 'LinkedIn', D.linkedin, 'inputmode="url" placeholder="https://linkedin.com/in/votre-nom"')}
        ${field('t-ig', 'Instagram', D.instagram, 'inputmode="url" placeholder="@votre.compte ou lien"')}
        ${field('t-tt', 'TikTok', D.tiktok, 'inputmode="url" placeholder="@votre.compte ou lien"')}
        ${field('t-web', 'Site web ou portfolio', D.website, 'inputmode="url" placeholder="https://monportfolio.com"')}
      </div>
    </section>
    <p id="terr" class="notice err" hidden></p>
    <div class="tr-save"><button class="btn" type="submit">Enregistrer mon profil</button><a class="btn ghost" href="#/formateur/${uid()}">Voir mon profil public</a></div>
    <p class="muted" style="font-size:.88rem">${st === 'approved' ? 'Votre profil est validé : vos modifications sont visibles tout de suite.' : 'Une fois votre profil complet et votre abonnement payé, Vitako le vérifie puis le rend visible.'}</p>
    <div class="tr-leave"><b>Ne plus être formateur ?</b><p class="muted">Votre compte redevient un compte étudiant : vous gardez votre abonnement, vos cours et vos attestations. Votre profil formateur n'est plus affiché nulle part. Vous pourrez redevenir formateur plus tard (votre profil sera de nouveau vérifié).</p>
      <button type="button" class="btn ghost sm" data-act="leave-trainer">Revenir en compte étudiant</button></div>
  </form>
  <aside class="tr-preview" aria-label="Aperçu de votre carte">
    <span class="eyebrow">Aperçu de votre carte</span>
    ${trainerCard({ user_id: uid(), full_name: P.full_name, avatar_url: P.avatar_url, headline: T.headline || 'Votre métier', domains: T.domains || [], rates: T.rates, cover_url: T.cover_url })}
    <p class="muted">C'est ainsi que les étudiants vous voient dans le menu Accompagnement et sous les formations de vos domaines.</p>
  </aside>
  </div>`;
}

// Profil public d'un formateur (comme une page LinkedIn)
function contactsHtml(t, id) {
  if (!S.session) {
    return `<div class="tp-lock">${I.lock}<p>Connectez-vous pour voir ses contacts : WhatsApp, téléphone, e-mail et réseaux sociaux.</p>
      <div class="av-btns"><a class="btn sm" href="#/connexion?suite=${encodeURIComponent('/formateur/' + id)}">Se connecter</a><a class="btn ghost sm" href="#/inscription?suite=${encodeURIComponent('/formateur/' + id)}">Créer un compte gratuit</a></div></div>`;
  }
  const C = t.contacts || {};
  const rows = [];
  if (C.whatsapp) rows.push(`<a class="ct-btn ct-wa" href="${waLink(C.whatsapp)}" target="_blank" rel="noopener">${CT_ICONS.whatsapp}<span>WhatsApp<small>${esc(fmtPhone(C.whatsapp))}</small></span></a>`);
  if (C.phone) rows.push(`<a class="ct-btn" href="tel:${esc(C.phone)}">${CT_ICONS.phone}<span>Appeler<small>${esc(fmtPhone(C.phone))}</small></span></a>`);
  if (C.email) rows.push(`<a class="ct-btn" href="mailto:${esc(C.email)}">${CT_ICONS.email}<span>E-mail<small>${esc(C.email)}</small></span></a>`);
  const soc = SOCIALS.filter(([k]) => C[k]).map(([k, label]) => `<a href="${esc(C[k])}" target="_blank" rel="noopener nofollow" aria-label="${label} de ${esc(t.full_name)}" title="${label}">${CT_ICONS[k]}</a>`).join('');
  if (!rows.length && !soc) return '<p class="muted">Aucun contact indiqué.</p>';
  return `<div class="tp-contacts">${rows.join('')}</div>${soc ? `<div class="ct-social">${soc}</div>` : ''}`;
}
async function trainerPage(id) {
  if (!api.configured) return needConfig();
  if (!UUID_RE.test(id)) return notFound();
  const t = await api.getTrainer(id);
  if (!t) {
    return `${back('#/accompagnement', 'Tous les formateurs')}<div class="narrow panel stack"><h2>Profil indisponible</h2>
      <p class="muted">Ce formateur n'est pas visible pour le moment.</p><a class="btn" href="#/accompagnement">Voir les formateurs</a></div>`;
  }
  const own = uid() === id;
  const doms = t.domains || [];
  const [c1, c2] = domColors(doms[0]);
  const fn = firstName(t.full_name);
  let preview = '';
  if (!t.visible) {
    const why = t.status === 'approved' ? 'son abonnement n\'est pas actif' : t.status === 'rejected' ? `à corriger : ${t.reason || ''}` : t.status === 'pending' ? 'il attend la validation de Vitako' : 'il n\'est pas encore complet';
    preview = notice('warn', own ? `<b>Aperçu de votre profil.</b> Il n'est pas encore visible par les étudiants : ${esc(why)}. <a href="#/espace-formateur">Retour à mon Espace formateur</a>`
      : `<b>Profil non visible</b> (${esc(why)}). Vous le voyez parce que vous êtes administrateur.`);
  } else if (own) preview = notice('info', 'Voici votre profil tel que les étudiants le voient. <a href="#/espace-formateur">Le modifier</a>');
  const C = t.contacts || {};
  const mainCta = !S.session ? `<a class="btn" href="#/connexion?suite=${encodeURIComponent('/formateur/' + id)}">Se connecter pour le contacter</a>`
    : C.whatsapp ? `<a class="btn ct-wa-btn" href="${waLink(C.whatsapp)}" target="_blank" rel="noopener">${CT_ICONS.whatsapp}Écrire sur WhatsApp</a>`
      : C.email ? `<a class="btn" href="mailto:${esc(C.email)}">${CT_ICONS.email}Envoyer un e-mail</a>`
        : C.phone ? `<a class="btn" href="tel:${esc(C.phone)}">${CT_ICONS.phone}Appeler</a>` : '';
  return `${back('#/accompagnement', 'Tous les formateurs')}
  ${preview ? `<div style="margin-bottom:16px">${preview}</div>` : ''}
  <article class="tp">
    <div class="tp-card">
      <div class="tp-cover" style="--c1:${c1};--c2:${c2}">${t.cover_url ? `<img src="${esc(t.cover_url)}" alt="Couverture du profil de ${esc(t.full_name)}" width="1200" height="400">` : ''}</div>
      <div class="tp-body">
        ${avatarHtml(t, 'av-tp')}
        <div class="tp-row">
          <div class="tp-id"><h1>${esc(t.full_name)}</h1><p class="tp-hl">${esc(t.headline)}</p>
            <div class="tp-doms">${doms.map((d) => `<a class="chip" href="#/accompagnement?domaine=${esc(d)}">${DOM_ICONS[d] || ''}<span>${esc(domName(d))}</span></a>`).join('')}</div></div>
          ${mainCta ? `<div class="tp-cta">${mainCta}</div>` : ''}
        </div>
      </div>
    </div>
    <div class="tp-cols">
      <div class="stack" style="gap:16px;min-width:0">
        <section class="panel tp-sec"><h2>À propos</h2><p class="tp-text">${esc(t.bio)}</p></section>
        ${t.rates ? `<section class="panel tp-sec"><h2>Tarifs d'accompagnement</h2><p class="tp-text">${esc(t.rates)}</p></section>` : ''}
      </div>
      <aside class="stack" style="gap:16px;min-width:0">
        ${t.visual_url ? `<figure class="panel tp-visual"><img src="${esc(t.visual_url)}" alt="Visuel de ${esc(t.full_name)}" width="480" height="480" loading="lazy"></figure>` : ''}
        <section class="panel tp-sec"><h2>Contacter ${esc(fn)}</h2>${contactsHtml(t, id)}</section>
        <p class="tp-safe">Vitako vérifie les profils des formateurs. L'accompagnement et son prix se décident directement entre vous et le formateur : mettez-vous d'accord sur le programme avant de payer.</p>
      </aside>
    </div>
  </article>`;
}

// Menu Accompagnement : tous les formateurs visibles, filtre par domaine
async function accompagnementPage() {
  const dom = route().query.get('domaine') || 'all';
  const list = await loadTrainers(true);
  const count = {};
  list.forEach((t) => (t.domains || []).forEach((d) => { count[d] = (count[d] || 0) + 1; }));
  const shown = trainersFor(dom === 'all' ? null : dom);
  const chip = (id, label, n) => `<a class="chip${dom === id ? ' on' : ''}" href="#/accompagnement${id === 'all' ? '' : '?domaine=' + id}"${dom === id ? ' aria-current="true"' : ''}>${DOM_ICONS[id] || ''}<span>${esc(label)}</span>${n ? ` <small>${n}</small>` : ''}</a>`;
  const chips = list.length ? `<div class="filters"><div class="chips">${chip('all', 'Tous les domaines', list.length)}${DOMAINS_LIST.filter((d) => count[d.id] || d.id === dom).map((d) => chip(d.id, d.name, count[d.id] || 0)).join('')}</div></div>` : '';
  const empty = !list.length ? 'Les premiers formateurs arrivent bientôt. Revenez dans quelques jours !'
    : `Aucun formateur en ${esc(domName(dom))} pour le moment. <a href="#/accompagnement">Voir tous les formateurs</a>`;
  return `${pageHead('Accompagnement', 'Un formateur pour vous accompagner', '<p class="muted" style="max-width:64ch">Des professionnels vérifiés par Vitako vous aident à progresser dans votre métier et à trouver vos premiers clients. Regardez leur profil, puis contactez celui qui vous correspond.</p>')}
  ${chips}
  ${shown.length ? `<div class="count">${shown.length} formateur${shown.length > 1 ? 's' : ''}</div><div class="tr-grid">${shown.map(trainerCard).join('')}</div>` : `<div class="panel"><p class="muted">${empty}</p></div>`}
  ${isTrainer() ? '' : `<section class="panel tr-join"><div><b>Vous êtes formateur ou professionnel ?</b><p class="muted">Créez votre profil, accompagnez les étudiants de Vitako et faites connaître vos services.</p></div><a class="btn ghost" href="#/devenir-formateur">Devenir formateur</a></section>`}`;
}

// Administration : profil du formateur à côté de son paiement
function adminTrainerBox(tr) {
  const [c1, c2] = domColors((tr.domains || [])[0]);
  const bio = String(tr.bio || '');
  const contacts = [tr.whatsapp && `WhatsApp ${fmtPhone(tr.whatsapp)}`, tr.phone && `Tél. ${fmtPhone(tr.phone)}`, tr.contact_email].filter(Boolean);
  const socials = SOCIALS.filter(([k]) => tr[k]).map(([k, l]) => `<a href="${esc(tr[k])}" target="_blank" rel="noopener nofollow">${l}</a>`).join(' · ');
  return `<div class="pay-tr">
    <div class="pay-tr-cv" style="--c1:${c1};--c2:${c2}">${tr.cover_url ? `<img src="${esc(tr.cover_url)}" alt="">` : ''}</div>
    <div class="pay-tr-in">
      <div class="pay-tr-h">${avatarHtml(tr, 'av-md')}<div><b>${esc(tr.headline || 'Métier non indiqué')}</b><small class="muted">${(tr.domains || []).map(domName).map(esc).join(' · ') || 'Aucun domaine'}</small></div>${trPill(tr)}</div>
      ${!tr.avatar_url ? '<p class="notice warn">Pas de photo de profil.</p>' : ''}
      <p class="pay-tr-bio">${bio ? esc(bio.length > 320 ? bio.slice(0, 318) + '…' : bio) : '<span class="muted">Pas de présentation.</span>'}</p>
      <p class="pay-tr-ct"><b>Contacts :</b> ${contacts.length ? esc(contacts.join(' · ')) : '<span class="muted">aucun</span>'}${socials ? ` · ${socials}` : ''}</p>
      ${tr.rates ? `<p class="pay-tr-ct"><b>Tarifs :</b> ${esc(tr.rates)}</p>` : ''}
      <div class="pay-tr-foot">${tr.visual_url ? `<img class="pay-tr-vis" src="${esc(tr.visual_url)}" alt="Visuel carré">` : ''}<a class="btn ghost sm" href="#/formateur/${esc(tr.user_id)}" target="_blank" rel="noopener">Voir le profil complet</a></div>
    </div></div>`;
}
const reasonSelect = (id, list, label) => `<select class="in sm" id="${id}" aria-label="${label}">${list.map((r) => `<option>${esc(r)}</option>`).join('')}</select>`;

async function adminTrainersPage() {
  if (!S.session) return needLogin('/admin/formateurs');
  if (!S.profile) return loadingView();
  if (!isAdmin()) return notFound();
  const [list, counts] = await Promise.all([api.adminTrainers(), api.adminCounts()]);
  S.admin = counts; topbar();
  const active = (t) => t.sub_end && new Date(t.sub_end) > new Date();
  const n = (s) => list.filter((t) => t.status === s).length;
  const visible = list.filter((t) => t.status === 'approved' && active(t)).length;
  const fmtD = (d) => new Date(d).toLocaleDateString('fr-FR', { day: 'numeric', month: 'short', year: 'numeric' });
  const item = (t) => {
    const sub = active(t) ? `Abonné jusqu'au ${fmtDate(t.sub_end)}` : t.has_pending_payment ? 'Paiement en attente (onglet Paiements)' : t.sub_end ? `Abonnement terminé le ${fmtDate(t.sub_end)}` : 'Pas encore abonné';
    let actions = `<a class="btn ghost sm" href="#/formateur/${esc(t.user_id)}">Voir le profil</a>`;
    if (t.status === 'pending' || t.status === 'rejected') actions += `<button class="btn sm" data-act="tr-ok" data-user="${esc(t.user_id)}">Valider le profil</button>`;
    if (t.status === 'pending' || t.status === 'approved') {
      actions += `${reasonSelect('trk-' + t.user_id, TR_REASONS, 'Motif')}<button class="btn ghost sm" data-act="tr-ko" data-user="${esc(t.user_id)}">${t.status === 'approved' ? 'Masquer le profil' : 'Refuser'}</button>`;
    }
    return `<article class="fb-item adm-tr st-${t.status}">
      <div class="adm-tr-h">${avatarHtml(t, 'av-md')}<div class="t"><b>${esc(t.full_name)}</b><small class="muted">${esc(t.email || '')}</small></div>${trPill(t)}</div>
      <p><b>${esc(t.headline || 'Métier non indiqué')}</b>${(t.domains || []).length ? ` · <span class="muted">${(t.domains || []).map(domName).map(esc).join(', ')}</span>` : ''}</p>
      <small class="muted">${esc(sub)}${t.updated_at ? ` · modifié le ${fmtD(t.updated_at)}` : ''}${t.status === 'rejected' && t.reason ? ` · motif : ${esc(t.reason)}` : ''}</small>
      <div class="payact">${actions}</div>
    </article>`;
  };
  return `${adminTabs('formateurs')}${pageHead('Administration', 'Formateurs', '<p class="muted">Un profil n\'est visible que s\'il est validé ET que l\'abonnement du formateur est actif. Le premier profil se valide en général avec le paiement, dans l\'onglet Paiements.</p>')}
  <div class="kpis">
    ${kpi('Formateurs inscrits', nf(list.length))}
    ${kpi('Profils visibles', nf(visible), 'Validés et abonnés', 'good')}
    ${kpi('En attente', nf(n('pending')), 'Profils complets à vérifier', n('pending') ? 'warn' : '')}
    ${kpi('À compléter', nf(n('draft')), 'Profils pas encore remplis')}
  </div>
  ${list.length ? `<div class="fb-list" style="margin-top:18px">${list.map(item).join('')}</div>` : '<p class="muted" style="margin-top:18px">Aucun formateur inscrit pour l\'instant.</p>'}`;
}

// ---------------------------------------------------------------------------
// Administration
// ---------------------------------------------------------------------------
async function adminPage() {
  if (!api.configured) return needConfig();
  if (!S.session) return needLogin('/admin');
  if (!S.profile) return loadingView();
  if (!isAdmin()) return notFound();
  const [pending, done, counts, trainers] = await Promise.all([api.adminPayments('pending'), api.adminPayments('done'), api.adminCounts(), api.adminTrainers().catch(() => [])]);
  S.admin = counts;
  const trOf = Object.fromEntries(trainers.map((t) => [t.user_id, t]));
  const payReasons = ['Référence introuvable', 'Montant incorrect', 'Numéro d\'expéditeur différent', 'Référence déjà utilisée'];
  const actions = (p) => {
    const tr = p.profile?.role === 'trainer' ? trOf[p.user_id] : null;
    if (!tr || tr.status === 'approved') {
      return `<div class="payact">
        <button class="btn sm" data-act="pay-ok" data-id="${p.id}">Valider : ${S.days} jours d'accès</button>
        ${reasonSelect('r-' + p.id, payReasons, 'Motif du refus')}
        <button class="btn ghost sm" data-act="pay-ko" data-id="${p.id}">Refuser</button></div>`;
    }
    return `${adminTrainerBox(tr)}
      <div class="payrows">
        <div class="payact"><button class="btn sm" data-act="pay-ok-tr" data-id="${p.id}" data-user="${esc(p.user_id)}"${tr.status === 'draft' ? ' disabled title="Profil incomplet"' : ''}>Valider le paiement et le profil</button>
          <small class="muted">${tr.status === 'draft' ? 'Profil incomplet : validez seulement le paiement.' : `Accès de ${S.days} jours et profil visible par les étudiants.`}</small></div>
        <div class="payact"><span class="payact-l">Accès aux cours, profil refusé :</span>${reasonSelect('tr-r-' + p.id, TR_REASONS, 'Motif du refus du profil')}
          <button class="btn ghost sm" data-act="pay-ok-only" data-id="${p.id}" data-user="${esc(p.user_id)}">Valider le paiement seulement</button></div>
        <div class="payact"><span class="payact-l">Paiement non reçu :</span>${reasonSelect('r-' + p.id, payReasons, 'Motif du refus du paiement')}
          <button class="btn ghost sm" data-act="pay-ko" data-id="${p.id}">Refuser le paiement</button></div>
      </div>`;
  };
  topbar();
  const ops = CFG.operators.map((o) => `${esc(o.name)} ${esc(o.number)}`).join(' · ');
  return `${adminTabs('pay')}${pageHead('Administration', 'Paiements à valider', `<p class="muted">${counts.pending} en attente · ${counts.active} abonné${counts.active > 1 ? 's' : ''} actif${counts.active > 1 ? 's' : ''} · ${ops}</p>`)}
  <div style="margin-bottom:18px">${notice('warn', `Avant de valider, ouvrez votre application MVola ou Orange Money et vérifiez : la référence existe, le montant correspond au « Montant attendu » de la demande et, s'il est indiqué, le numéro de l'expéditeur correspond. Ne validez jamais à partir d'une capture d'écran.`)}</div>
  ${pending.length ? `<div class="paylist">${pending.map((p) => `<div class="panel">
      <div class="payhead"><div><b>${esc(p.profile?.full_name || 'Étudiant')}</b>${p.profile?.role === 'trainer' ? ' <span class="pill tr-tag">Formateur</span>' : ''}<small class="muted">${esc(p.profile?.email || '')}</small></div><span class="pill grey">Reçu le ${fmtDT(p.created_at)}</span></div>
      <dl class="paydl">
        <div><dt>Opérateur</dt><dd>${esc(opById(p.operator).name)} → ${esc(opById(p.operator).number)}</dd></div>
        <div><dt>Expéditeur</dt><dd class="${p.sender ? 'mono' : 'muted'}">${p.sender ? fmtTel(p.sender) : 'Non indiqué'}</dd></div>
        <div><dt>Référence</dt><dd class="mono">${esc(p.reference)}</dd></div>
        <div><dt>Montant attendu</dt><dd class="mono">${ar(p.amount)}</dd></div>
      </dl>
      ${actions(p)}</div>`).join('')}</div>`
    : '<div class="panel"><p class="muted">Aucun paiement en attente. Les nouvelles références apparaîtront ici.</p></div>'}
  <h2 style="margin:30px 0 12px">Derniers paiements traités</h2>
  ${done.length ? `<div class="tbl"><table><thead><tr><th>Traité le</th><th>Étudiant</th><th>Opérateur</th><th>Référence</th><th>Résultat</th></tr></thead><tbody>
    ${done.map((p) => `<tr><td>${fmtDT(p.decided_at || p.created_at)}</td><td>${esc(p.profile?.full_name || '')}<br><small class="muted">${esc(p.profile?.email || '')}</small></td><td>${esc(opById(p.operator).name)}</td><td class="mono">${esc(p.reference)}</td>
      <td>${p.status === 'approved' ? `<span class="pill">Validé</span>${p.access_until ? ` <small class="muted">jusqu'au ${fmtDate(p.access_until)}</small>` : ''}` : `<span class="pill red">Refusé</span> <small class="muted">${esc(p.reason || '')}</small>`}</td></tr>`).join('')}
  </tbody></table></div>` : '<p class="muted">Aucun paiement traité pour l\'instant.</p>'}`;
}

const adminTabs = (on) => `<nav class="tabs" aria-label="Administration">
  <a class="tab${on === 'pay' ? ' on' : ''}" href="#/admin"${on === 'pay' ? ' aria-current="page"' : ''}>Paiements${S.admin.pending ? ` <span class="pill gold">${S.admin.pending}</span>` : ''}</a>
  <a class="tab${on === 'inscrits' ? ' on' : ''}" href="#/admin/inscrits"${on === 'inscrits' ? ' aria-current="page"' : ''}>Inscrits</a>
  <a class="tab${on === 'formateurs' ? ' on' : ''}" href="#/admin/formateurs"${on === 'formateurs' ? ' aria-current="page"' : ''}>Formateurs${S.admin.trainers ? ` <span class="pill gold">${S.admin.trainers}</span>` : ''}</a>
  <a class="tab${on === 'stats' ? ' on' : ''}" href="#/admin/stats"${on === 'stats' ? ' aria-current="page"' : ''}>Statistiques</a>
  <a class="tab${on === 'avis' ? ' on' : ''}" href="#/admin/avis"${on === 'avis' ? ' aria-current="page"' : ''}>Avis</a>
  <a class="tab${on === 'remarques' ? ' on' : ''}" href="#/admin/remarques"${on === 'remarques' ? ' aria-current="page"' : ''}>Remarques${S.admin.feedback ? ` <span class="pill gold">${S.admin.feedback}</span>` : ''}</a></nav>`;
const nf = (n) => Number(n || 0).toLocaleString('fr-FR').replace(/\u202f|\u00a0/g, ' ');
const pct = (a, b) => (b ? Math.round((a / b) * 100) : 0);
const kpi = (label, value, sub = '', tone = '') => `<div class="kpi${tone ? ' ' + tone : ''}"><span class="kpi-l">${label}</span><b class="kpi-v">${value}</b>${sub ? `<span class="kpi-s">${sub}</span>` : ''}</div>`;

// Liste des inscrits : abonnés ou non, recherche, filtres et export pour Excel
const USER_FILTERS = [['all', 'Tous'], ['active', 'Abonnés'], ['never', 'Jamais abonnés'], ['expired', 'Abonnement terminé'], ['trainer', 'Formateurs'], ['certs', 'Avec attestation']];
const userMatch = (u, f) => f === 'all' || (f === 'trainer' ? u.role === 'trainer' : f === 'certs' ? (u.certs || []).length > 0 : userState(u) === f);
const userState = (u) => (u.sub_end && new Date(u.sub_end) > new Date() ? 'active' : u.sub_end ? 'expired' : 'never');
function usersFiltered() {
  const A = S.adminUsers || { list: [], f: 'all', q: '' };
  const q = norm(A.q).trim();
  return A.list.filter((u) => !u.is_admin
    && userMatch(u, A.f)
    && (!q || norm(`${u.full_name} ${u.email}`).includes(q)));
}
function usersTable() {
  const list = usersFiltered();
  const fmtD = (d) => new Date(d).toLocaleDateString('fr-FR', { day: 'numeric', month: 'short', year: 'numeric' });
  const st = (u) => { const s = userState(u);
    return s === 'active' ? `<span class="pill">Abonné</span> <small class="muted">jusqu'au ${fmtDate(u.sub_end)}</small>`
      : s === 'expired' ? `<span class="pill red">Terminé</span> <small class="muted">le ${fmtDate(u.sub_end)}</small>` : '<span class="pill grey">Jamais abonné</span>'; };
  const certs = (u) => { const c = u.certs || []; if (!c.length) return '<span class="muted">—</span>';
    return `<details class="us-certs"><summary>${c.length} attestation${c.length > 1 ? 's' : ''}</summary><ul>${c.map((x) => `<li><a href="#/attestation/${esc(x.id)}">${esc(x.title)}</a>${x.kind === 'job' ? ' <span class="pill">Parcours complet</span>' : x.score != null ? ` <small class="muted">${x.score}/100</small>` : ''} <small class="muted">· ${fmtD(x.issued_at)}</small></li>`).join('')}</ul></details>`; };
  return `<div class="count">${list.length} personne${list.length > 1 ? 's' : ''}</div>
  ${list.length ? `<div class="tbl"><table class="us-tbl"><thead><tr><th>Inscrit le</th><th>Nom</th><th>E-mail</th><th>Type</th><th>Abonnement</th><th>Attestations</th></tr></thead><tbody>
    ${list.map((u) => `<tr><td>${fmtD(u.created_at)}</td><td><span class="us-n">${avatarHtml(u, 'av-xs')}${esc(u.full_name)}</span></td><td><a href="mailto:${esc(u.email || '')}">${esc(u.email || '')}</a></td>
      <td>${u.role === 'trainer' ? '<span class="pill tr-tag">Formateur</span>' : 'Étudiant'}</td><td>${st(u)}</td><td>${certs(u)}</td></tr>`).join('')}
  </tbody></table></div>` : '<p class="muted">Aucune personne ne correspond.</p>'}`;
}
async function adminUsersPage() {
  if (!S.session) return needLogin('/admin/inscrits');
  if (!S.profile) return loadingView();
  if (!isAdmin()) return notFound();
  const [list, certs] = await Promise.all([api.adminUsers(), api.adminCertificates().catch(() => [])]);
  const byUser = {}; certs.forEach((c) => { (byUser[c.user_id] ||= []).push(c); });
  list.forEach((u) => { u.certs = byUser[u.id] || []; });
  S.adminUsers = { list, f: S.adminUsers?.f || 'all', q: S.adminUsers?.q || '' };
  const users = list.filter((u) => !u.is_admin);
  const n = (f) => users.filter((u) => userMatch(u, f)).length;
  return `${adminTabs('inscrits')}${pageHead('Administration', 'Inscrits', '<p class="muted">Toutes les personnes inscrites, abonnées ou non. Cliquez sur un e-mail pour écrire à la personne.</p>')}
  <div class="kpis">${kpi('Inscrits', nf(n('all')))}${kpi('Abonnés actifs', nf(n('active')), '', 'good')}${kpi('Jamais abonnés', nf(n('never')))}${kpi('Abonnement terminé', nf(n('expired')), 'À relancer', 'warn')}${kpi('Attestations délivrées', nf(users.reduce((k, u) => k + u.certs.length, 0)), `${nf(n('certs'))} personne${n('certs') > 1 ? 's' : ''}`)}</div>
  <div class="us-bar">
    <div class="chips" id="us-chips">${USER_FILTERS.map(([k, l]) => `<button class="chip${S.adminUsers.f === k ? ' on' : ''}" data-act="us-filter" data-f="${k}">${l} <small>${n(k)}</small></button>`).join('')}</div>
    <div class="us-tools"><input class="in" id="us-q" type="search" placeholder="Rechercher un nom ou un e-mail" value="${esc(S.adminUsers.q)}" aria-label="Rechercher un inscrit">
      <button class="btn ghost" data-act="us-csv">Télécharger (Excel)</button></div>
  </div>
  <div id="us-list">${usersTable()}</div>`;
}
function usersCsv() {
  const cell = (v) => `"${String(v ?? '').replace(/"/g, '""')}"`;
  const d = (t) => (t ? new Date(t).toLocaleDateString('fr-FR') : '');
  const label = { active: 'Abonné', expired: 'Terminé', never: 'Jamais abonné' };
  const rows = [['Inscrit le', 'Nom', 'E-mail', 'Type', 'Abonnement', "Fin d'abonnement", 'Nombre d\'attestations', 'Attestations']].concat(
    usersFiltered().map((u) => [d(u.created_at), u.full_name, u.email, u.role === 'trainer' ? 'Formateur' : 'Étudiant', label[userState(u)], d(u.sub_end), (u.certs || []).length, (u.certs || []).map((c) => `${c.title}${c.score != null ? ` (${c.score}/100)` : ''} - ${c.id}`).join(' | ')]));
  const blob = new Blob(['\ufeff' + rows.map((r) => r.map(cell).join(';')).join('\r\n')], { type: 'text/csv;charset=utf-8' });
  const a = document.createElement('a'); a.href = URL.createObjectURL(blob); a.download = `vitako-inscrits-${mgDate()}.csv`;
  document.body.appendChild(a); a.click(); a.remove(); setTimeout(() => URL.revokeObjectURL(a.href), 2000);
}

async function adminStatsPage() {
  if (!S.session) return needLogin('/admin/stats');
  if (!S.profile) return loadingView();
  if (!isAdmin()) return notFound();
  const [st, counts] = await Promise.all([api.adminStats(), api.adminCounts()]);
  S.admin = counts; topbar();
  const U = st.users, Sb = st.subs, P = st.payments, L = st.learning;
  const days = st.signups || [];
  const max = Math.max(1, ...days.map((d) => d.n));
  const total30 = days.reduce((n, d) => n + d.n, 0);
  const fmtDay = (d) => new Date(`${d}T12:00:00`).toLocaleDateString('fr-FR', { day: 'numeric', month: 'short' });
  const bars = days.map((d) => `<div class="cbar" tabindex="0" data-tip="${fmtDay(d.d)} : ${d.n} inscription${d.n > 1 ? 's' : ''}" aria-label="${fmtDay(d.d)} : ${d.n} inscription${d.n > 1 ? 's' : ''}">
      <i style="height:${d.n ? Math.max(4, Math.round((d.n / max) * 100)) : 0}%"></i></div>`).join('');
  const time = new Date().toLocaleTimeString('fr-FR', { hour: '2-digit', minute: '2-digit' });
  return `${adminTabs('stats')}${pageHead('Administration', 'Statistiques', `<p class="muted">Chiffres en temps réel, mis à jour à ${time}. <button class="lnk" data-act="reload" style="padding:0 4px">Actualiser</button></p>`)}
  <h2 class="st-h">Utilisateurs</h2>
  <div class="kpis">
    ${kpi('Inscrits', nf(U.total), `+${nf(U.today)} aujourd'hui · +${nf(U.week)} en 7 jours · +${nf(U.month)} en 30 jours`)}
    ${kpi('Abonnés actifs', nf(Sb.active), `${pct(Sb.active, U.total)} % des inscrits${Sb.ending7 ? ` · ${nf(Sb.ending7)} finissent dans 7 jours` : ''}`, 'good')}
    ${kpi('Abonnements terminés', nf(Sb.expired), 'À relancer pour un renouvellement')}
    ${kpi('Jamais abonnés', nf(Sb.never), 'Inscrits sans paiement validé')}
  </div>
  <div class="panel chart">
    <div class="chart-h"><b>Inscriptions sur 30 jours</b><span class="muted">${nf(total30)} au total · maximum ${nf(max === 1 && !days.some((d) => d.n) ? 0 : max)} en un jour</span></div>
    <div class="bars" role="img" aria-label="Inscriptions par jour sur les 30 derniers jours, ${total30} au total">${bars}</div>
    <div class="bars-x"><span>${days[0] ? fmtDay(days[0].d) : ''}</span><span>${days.length ? fmtDay(days[days.length - 1].d) : ''}</span></div>
  </div>
  <h2 class="st-h">Paiements</h2>
  <div class="kpis">
    ${kpi('Recettes ce mois', ar(P.revenue_month), 'Paiements validés depuis le 1er du mois', 'good')}
    ${kpi('Recettes totales', ar(P.revenue_total), `${nf(P.approved)} paiement${P.approved > 1 ? 's' : ''} validé${P.approved > 1 ? 's' : ''}`)}
    ${kpi('En attente', `<a href="#/admin">${nf(P.pending)}</a>`, 'À vérifier dans MVola ou Orange Money', P.pending ? 'warn' : '')}
    ${kpi('Refusés', nf(P.rejected), `${pct(P.rejected, P.approved + P.rejected)} % des paiements traités`)}
  </div>
  <h2 class="st-h">Apprentissage</h2>
  <div class="kpis">
    ${kpi('Étudiants en formation', nf(L.learners), `${nf(L.active7)} actifs ces 7 derniers jours`)}
    ${kpi('Modules terminés', nf(L.modules_done))}
    ${kpi('Examens passés', nf(L.exams), `${nf(L.exams_passed)} réussis (${pct(L.exams_passed, L.exams)} %)`)}
    ${kpi('Attestations', nf(L.course_certs), `${nf(L.job_certs)} parcours complet${L.job_certs > 1 ? 's' : ''}`, 'gold')}
  </div>
  <h2 class="st-h">Formations les plus suivies</h2>
  ${st.top_courses?.length ? `<div class="tbl"><table><thead><tr><th>#</th><th>Formation</th><th>Étudiants</th><th>Attestations</th></tr></thead><tbody>
    ${st.top_courses.map((c, i) => `<tr><td class="mono">${i + 1}</td><td><a href="#/formation/${esc(c.id)}">${esc(c.title)}</a></td><td class="mono">${nf(c.learners)}</td><td class="mono">${nf(c.certs)}</td></tr>`).join('')}
  </tbody></table></div>` : '<p class="muted">Aucun module terminé pour l\'instant.</p>'}`;
}

async function adminReviewsPage() {
  if (!S.session) return needLogin('/admin/avis');
  if (!S.profile) return loadingView();
  if (!isAdmin()) return notFound();
  const list = await api.adminReviews();
  const n = list.length;
  const avg = n ? list.reduce((a, r) => a + r.rating, 0) / n : 0;
  const dist = [5, 4, 3, 2, 1].map((k) => [k, list.filter((r) => r.rating === k).length]);
  const pub = list.filter((r) => r.can_publish).length;
  const fmtD = (d) => new Date(d).toLocaleDateString('fr-FR', { day: 'numeric', month: 'short', year: 'numeric' });
  return `${adminTabs('avis')}${pageHead('Administration', 'Avis des apprenants', '<p class="muted">Avis laissés après l\'obtention d\'une attestation. Seuls les avis marqués « Accord pour publier » peuvent être repris dans les témoignages de l\'accueil.</p>')}
  <div class="kpis">
    ${kpi('Avis reçus', nf(n))}
    ${kpi('Note moyenne', n ? `${avg.toFixed(1).replace('.', ',')} / 5` : '–', n ? stars(Math.round(avg * 2) / 2) : '', 'gold')}
    ${kpi('Accord pour publier', nf(pub), `${pct(pub, n)} % des avis`, 'good')}
    ${kpi('Satisfaits (4 et 5 ★)', n ? `${pct(dist[0][1] + dist[1][1], n)} %` : '–', dist.map(([k, c]) => `${k} ★ : ${c}`).join(' · '))}
  </div>
  ${n ? `<div class="tbl" style="margin-top:18px"><table class="rv-tbl"><thead><tr><th>Date</th><th>Apprenant</th><th>Formation</th><th>Note</th><th>Commentaire</th><th>Publication</th></tr></thead><tbody>
    ${list.map((r) => `<tr><td>${fmtD(r.created_at)}</td><td>${esc(r.full_name || '')}<br><small class="muted">${esc(r.email || '')}</small></td>
      <td><a href="#/formation/${esc(r.course_id)}">${esc(r.course_title || r.course_id)}</a></td><td>${stars(r.rating)}</td>
      <td class="rv-com">${r.comment ? esc(r.comment) : '<span class="muted">Pas de commentaire</span>'}</td>
      <td>${r.can_publish ? '<span class="pill">Accord pour publier</span>' : '<span class="muted">Privé</span>'}</td></tr>`).join('')}
  </tbody></table></div>` : '<p class="muted">Aucun avis pour l\'instant. Le formulaire s\'affiche aux apprenants dès qu\'ils obtiennent une attestation.</p>'}`;
}

// Bloc « Donnez votre avis » au-dessus du pied de page, après une attestation
const SKIP_KEY = 'vitako_review_skip';
const skipped = () => { try { return JSON.parse(localStorage.getItem(SKIP_KEY)) || []; } catch (e) { return []; } };
function pendingReview() {
  if (!S.profile || isAdmin()) return null;
  const done = new Set(S.reviews.map((r) => r.course_id));
  const skip = new Set(skipped());
  return S.certs.filter((c) => c.kind === 'course' && c.course_id && !done.has(c.course_id) && !skip.has(c.course_id))
    .sort((a, b) => String(b.issued_at).localeCompare(String(a.issued_at)))[0] || null;
}
const RV_LABELS = ['', 'Décevante', 'Moyenne', 'Bien', 'Très bien', 'Excellente'];
function reviewBlock() {
  const c = pendingReview();
  if (!c || /^\/admin/.test(route().path) || /\/examen$/.test(route().path) && !S.examResult) return '';
  const title = courseById(c.course_id)?.title || c.title;
  const starsIn = [5, 4, 3, 2, 1].map((k) => `<input type="radio" name="rv-rating" id="rv-${k}" value="${k}"><label for="rv-${k}" title="${RV_LABELS[k]}"><span class="sr">${k} étoile${k > 1 ? 's' : ''} : ${RV_LABELS[k]}</span><svg viewBox="0 0 24 24" width="38" height="38" aria-hidden="true">${STAR}</svg></label>`).join('');
  return `<section class="rv" aria-labelledby="rv-title">
    <div class="rv-head">
      <span class="rv-ico" aria-hidden="true"><svg viewBox="0 0 24 24" width="26" height="26" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="9" r="6"/><path d="M8.5 13.5 7 22l5-3 5 3-1.5-8.5"/></svg></span>
      <div><h2 id="rv-title">Bravo pour votre attestation !</h2>
      <p>Que pensez-vous de la formation <b>${esc(title)}</b> ? Votre avis nous aide à améliorer Vitako. Il ne prend qu'une minute.</p></div>
    </div>
    <form id="review-form" class="rv-form" data-course="${esc(c.course_id)}">
      <fieldset class="rv-stars"><legend>Votre note <span class="muted">(cliquez sur une étoile)</span></legend><div class="rv-starline"><div class="rv-starrow">${starsIn}</div><span class="rv-word" aria-hidden="true"></span></div></fieldset>
      <label class="l" for="rv-comment">Votre commentaire <span class="muted">(facultatif)</span></label>
      <textarea id="rv-comment" class="in" rows="3" maxlength="1000" placeholder="Ce qui vous a plu, ce qui pourrait être amélioré…"></textarea>
      <label class="rv-check"><input type="checkbox" id="rv-publish"> J'accepte que mon avis soit publié sur le site avec mon prénom et l'initiale de mon nom.</label>
      <p id="rverr" class="notice err" hidden></p>
      <div class="rv-actions"><button class="btn" type="submit">Envoyer mon avis</button><button class="lnk" type="button" data-act="review-later">Plus tard</button></div>
    </form>
  </section>`;
}
// Vidéo de l'accueil : lecture automatique sans son sur grand écran, et jamais en mode « économie de données »
// (sur téléphone, la vidéo ne se charge que si la personne appuie sur lecture).
const SEEN_KEY = 'vitako_video_seen';
function heroSeen() { try { return localStorage.getItem(SEEN_KEY) === '1'; } catch (e) { return false; } }
// Toujours 720p au chargement de la page ; le 1080p n'est utilisé que si la personne le choisit.
let heroQ = '720';
function heroQuality() { return heroQ; }
function startHeroVideo() {
  const v = document.getElementById('hero-video');
  if (!v) return;
  const saveData = navigator.connection && navigator.connection.saveData;
  const wide = window.matchMedia && window.matchMedia('(min-width: 861px)').matches;
  const calm = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  // Vidéo vue en entier (au moins 90 %) : on s'en souvient sur cet appareil.
  v.addEventListener('timeupdate', () => {
    if (v.duration && v.currentTime >= v.duration * 0.9 && !heroSeen()) { try { localStorage.setItem(SEEN_KEY, '1'); } catch (e) {} }
  });
  // Lecture automatique seulement pour ceux qui ne l'ont pas encore vue.
  if (wide && !saveData && !calm && !heroSeen()) { v.muted = true; v.play().catch(() => {}); }
}
function renderReviewSlot() {
  const slot = document.getElementById('review-slot');
  if (slot) slot.innerHTML = reviewBlock();
}

function notFound() {
  return '<div class="narrow panel stack"><h2>Page introuvable</h2><p class="muted">Cette page n\'existe pas ou n\'est plus disponible.</p><a class="btn" href="#/formations">Voir les formations</a></div>';
}

// ---------------------------------------------------------------------------
// Routeur
// ---------------------------------------------------------------------------
function route() {
  const raw = decodeURIComponent(location.hash.replace(/^#/, '')) || '/';
  const [path, qs] = raw.split('?');
  return { path: path || '/', query: new URLSearchParams(qs || '') };
}
const ROUTES = [
  [/^\/$/, home],
  [/^\/formations$/, catalog],
  [/^\/formation\/([\w-]+)$/, coursePage],
  [/^\/formation\/([\w-]+)\/module\/(\d+)$/, lessonPage],
  [/^\/formation\/([\w-]+)\/module\/(\d+)\/lecon\/(\d+)$/, lessonPage2],
  [/^\/formation\/([\w-]+)\/examen$/, examPage],
  [/^\/connexion$/, () => authPage('login')],
  [/^\/inscription$/, () => authPage('signup')],
  [/^\/mot-de-passe-oublie$/, () => authPage('forgot')],
  [/^\/nouveau-mot-de-passe$/, () => authPage('reset')],
  [/^\/abonnement$/, subscribePage],
  [/^\/mon-espace$/, accountPage],
  [/^\/attestation\/([\w-]+)$/, certificatePage],
  [/^\/verifier$/, verifyPage],
  [/^\/admin$/, adminPage],
  [/^\/admin\/stats$/, adminStatsPage],
  [/^\/admin\/avis$/, adminReviewsPage],
  [/^\/admin\/remarques$/, adminFeedbackPage],
  [/^\/admin\/formateurs$/, adminTrainersPage],
  [/^\/admin\/inscrits$/, adminUsersPage],
  [/^\/accompagnement$/, accompagnementPage],
  [/^\/formateur\/([\w-]+)$/, trainerPage],
  [/^\/espace-formateur$/, trainerSpacePage],
  [/^\/devenir-formateur$/, becomeTrainerPage],
  [/^\/remarque$/, feedbackPage],
];
let renderToken = 0;
async function render() {
  const token = ++renderToken;
  topbar();
  const { path } = route();
  // Espace formateur : ce qui est tapé mais pas encore enregistré reste en place (envoi d'une image, notification…)
  if (path === '/espace-formateur') { const tf = document.getElementById('trainer-form'); if (tf) S.trainerDraft = readTrainerForm(tf); } else S.trainerDraft = null;
  const hit = ROUTES.map(([re, fn]) => [path.match(re), fn]).find(([m]) => m);
  if (!hit) { app.innerHTML = notFound(); return; }
  const [m, fn] = hit;
  let html;
  try {
    const out = fn(...m.slice(1));
    if (out instanceof Promise) { app.innerHTML = loadingView(); html = await out; } else html = out;
  } catch (e) {
    console.error(e);
    html = `<div class="narrow panel stack"><h2>Impossible d'afficher la page</h2><p class="muted">${esc(e instanceof api.ApiError ? e.message : 'Vérifiez votre connexion Internet puis réessayez.')}</p><button class="btn" data-act="reload">Réessayer</button></div>`;
  }
  if (token !== renderToken) return;
  app.innerHTML = html;
  renderReviewSlot();
  startHeroVideo();
  document.title = path === '/' ? 'Vitako · Formations aux métiers du freelance' : `${document.querySelector('#app h1, #app h2')?.textContent || 'Vitako'} · Vitako`;
}

// ---------------------------------------------------------------------------
// Actions
// ---------------------------------------------------------------------------
const showErr = (id, msg) => { const el = document.getElementById(id); if (el) { el.textContent = msg; el.hidden = false; } };
const busy = (btn, on, label) => { if (!btn) return; btn.disabled = on; if (label) btn.textContent = label; };

document.addEventListener('click', async (e) => {
  // Fermer le menu quand on clique ailleurs
  if (S.ui.menu && !e.target.closest('#menu') && !e.target.closest('[data-act=menu]')) { S.ui.menu = false; topbar(); }
  if (S.ui.notif && !e.target.closest('.nt-wrap')) { S.ui.notif = false; topbar(); }
  // Fermer la recherche quand on clique ailleurs (un clic sur un résultat la ferme au changement de page)
  const hsLink = e.target.closest('#hs-panel a');
  if (S.ui.search && ((!e.target.closest('#tb-search') && !e.target.closest('[data-act=search-toggle]')) || (hsLink && hsLink.getAttribute('href') === location.hash))) {
    S.ui.search = false; S.filter.q = ''; topbar();
  }
  const t = e.target.closest('[data-act],[data-dom],[data-op]');
  if (!t) return;
  if (t.dataset.act === 'hero-quality') {
    const v = document.getElementById('hero-video');
    if (v && CFG.heroVideoHD) {
      const q = heroQuality() === '1080' ? '720' : '1080';
      heroQ = q;
      const time = v.currentTime, playing = !v.paused;
      v.src = q === '1080' ? CFG.heroVideoHD : CFG.heroVideo;
      v.addEventListener('loadedmetadata', () => { v.currentTime = time; if (playing) v.play().catch(() => {}); }, { once: true });
      v.load();
      t.textContent = `${q}p`;
      toast(q === '1080' ? 'Vidéo en 1080p (meilleure qualité, 12,7 Mo).' : 'Vidéo en 720p (plus légère, 6,5 Mo).');
    }
    return;
  }
  if (t.dataset.act === 'hero-sound') {
    const v = document.getElementById('hero-video');
    if (v) {
      v.muted = !v.muted;
      if (!v.muted) { if (v.paused) v.play().catch(() => {}); }
      t.setAttribute('aria-pressed', String(!v.muted));
      t.innerHTML = v.muted ? `${I.soundOff}<span>Activer le son</span>` : `${I.soundOn}<span>Couper le son</span>`;
    }
    return;
  }
  if (t.dataset.act === 'fb-mark') {
    t.disabled = true;
    try { await api.adminFeedbackMark(t.dataset.id, t.dataset.read === 'true'); render(); }
    catch (err) { toast(err.message); t.disabled = false; }
    return;
  }
  if (t.dataset.act === 'dom-go') { S.filter.dom = t.dataset.d; go('#/formations'); return; }
  if (t.dataset.act === 'review-later') {
    const id = document.getElementById('review-form')?.dataset.course;
    if (id) { try { localStorage.setItem(SKIP_KEY, JSON.stringify([...skipped(), id])); } catch (err) {} }
    renderReviewSlot(); toast('D\'accord. Vous pourrez donner votre avis une autre fois.'); return;
  }
  if (t.dataset.act === 'notif') {
    S.ui.notif = !S.ui.notif; S.ui.menu = false; S.ui.search = false;
    const list = notifications(); topbar(); if (S.ui.notif) { notifMarkSeen(list); refreshNotifs(); }
    return;
  }
  if (t.dataset.act === 'menu') { S.ui.menu = !S.ui.menu; topbar(); if (S.ui.menu) document.querySelector('#menu .menu-item')?.focus(); return; }
  if (t.dataset.act === 'search-toggle') {
    S.ui.search = !S.ui.search; S.ui.menu = false; S.ui.searchFocus = S.ui.search; if (!S.ui.search) S.filter.q = ''; topbar(); return;
  }
  if (t.dataset.act === 'hs-pick') {
    S.filter.q = t.dataset.q; const h = document.getElementById('hsearch');
    if (h) { h.value = S.filter.q; h.focus(); }
    refreshSearch(); return;
  }
  if (t.dataset.dom) {
    S.filter.dom = t.dataset.dom; refreshGrid();
    const box = document.getElementById('chips'), on = box?.querySelector('.chip.on');
    if (box && on && box.scrollWidth > box.clientWidth) box.scrollTo({ left: on.offsetLeft - (box.clientWidth - on.offsetWidth) / 2, behavior: 'smooth' });
    return;
  }
  if (t.dataset.op) { S.payOp = t.dataset.op; render(); return; }
  const a = t.dataset.act;

  if (a === 'theme') {
    THEME = isDark() ? 'light' : 'dark';
    try { localStorage.setItem('vitako_theme', THEME); } catch (err) { /* ignoré */ }
    applyTheme(); topbar(); return;
  }
  if (a === 'eye') {
    const inp = document.getElementById(t.dataset.for); if (!inp) return;
    const show = inp.type === 'password'; inp.type = show ? 'text' : 'password';
    t.setAttribute('aria-pressed', String(show));
    t.setAttribute('aria-label', show ? 'Masquer le mot de passe' : 'Afficher le mot de passe');
    t.innerHTML = (show ? I.eyeOff : I.eye) + `<span>${show ? 'Masquer' : 'Afficher'}</span>`;
    inp.focus(); return;
  }
  if (a === 'copy') {
    const v = t.dataset.v;
    try { await navigator.clipboard.writeText(v); toast('Copié.'); } catch (err) { toast(v); }
    return;
  }
  if (a === 'reload') { render(); return; }
  if (a === 'toc') { document.getElementById(t.dataset.target)?.scrollIntoView({ behavior: 'smooth', block: 'start' }); return; }
  if (a === 'av-remove') {
    try { await api.removeAvatar(uid()); S.profile.avatar_url = null; toast('Photo retirée.'); } catch (err) { toast(err.message); }
    if (isTrainer()) S.trainer = await api.getMyTrainer(uid()).catch(() => S.trainer);
    render(); return;
  }
  if (a === 'tr-img-remove') {
    try { S.trainer = await api.removeTrainerImage(uid(), t.dataset.kind); toast('Image retirée.'); } catch (err) { toast(err.message); }
    render(); return;
  }
  if (a === 'become-trainer') {
    if (!document.getElementById('b-exp')?.checked) { showErr('berr', 'Cochez la case pour confirmer vos 5 ans d\'expérience au moins.'); return; }
    busy(t, true);
    try {
      await api.becomeTrainer();
      S.profile.role = 'trainer';
      S.trainer = await api.getMyTrainer(uid()).catch(() => null);
      toast('Bienvenue dans votre Espace formateur !');
      go('#/espace-formateur');
    } catch (err) { showErr('berr', err.message); busy(t, false); }
    return;
  }
  if (a === 'us-filter') {
    S.adminUsers.f = t.dataset.f;
    document.querySelectorAll('#us-chips .chip').forEach((c) => c.classList.toggle('on', c === t));
    document.getElementById('us-list').innerHTML = usersTable(); return;
  }
  if (a === 'us-csv') { usersCsv(); return; }
  if (a === 'leave-trainer') {
    if (!confirm('Revenir en compte étudiant ? Votre profil formateur ne sera plus affiché.')) return;
    busy(t, true);
    try {
      await api.leaveTrainer();
      S.profile.role = 'student'; S.trainer = null; S.trainers = null;
      toast('Votre compte est redevenu un compte étudiant.');
      go('#/mon-espace');
    } catch (err) { toast(err.message); busy(t, false); }
    return;
  }
  if (a === 'tr-ok' || a === 'tr-ko') {
    busy(t, true);
    try {
      await api.adminDecideTrainer(t.dataset.user, a === 'tr-ok', a === 'tr-ko' ? document.getElementById('trk-' + t.dataset.user)?.value : null);
      toast(a === 'tr-ok' ? 'Profil validé. Il est visible si l\'abonnement est actif.' : 'Profil masqué. Le formateur verra le motif.');
      render();
    } catch (err) { toast(err.message); busy(t, false); }
    return;
  }
  if (a === 'pay-ok-tr' || a === 'pay-ok-only') {
    busy(t, true);
    try {
      const p = await api.adminDecide(t.dataset.id, true);
      if (a === 'pay-ok-tr') await api.adminDecideTrainer(t.dataset.user, true);
      else await api.adminDecideTrainer(t.dataset.user, false, document.getElementById('tr-r-' + t.dataset.id)?.value);
      toast(a === 'pay-ok-tr' ? `Paiement et profil validés. Accès jusqu'au ${fmtDate(p.access_until)}.` : `Accès activé jusqu'au ${fmtDate(p.access_until)}. Profil refusé : le formateur verra le motif.`);
    } catch (err) { toast(err.message); }
    render(); return;
  }
  if (a === 'logout') { S.ui.menu = false; await api.signOut(); S.session = null; await loadUser(); go('#/'); toast('Vous êtes déconnecté.'); return; }

  if (a === 'preview-toggle') { S.previewOff = !S.previewOff; render(); window.scrollTo(0, 0); return; }
  if (a === 'pquiz-retry') {
    S.pquiz.answered = false; S.pquiz.answers = null;
    S.pquiz.qs = S.pquiz.qs.map((q) => ({ ...q, order: shuffle(q.order) }));
    document.getElementById('mquiz').innerHTML = partQuizHtml();
    document.getElementById('mquiz-wrap').scrollIntoView({ behavior: 'smooth', block: 'start' }); return;
  }
  if (a === 'mquiz-retry') {
    S.mquiz.answered = false; S.mquiz.answers = null;
    S.mquiz.qs = S.mquiz.qs.map((q) => ({ ...q, order: shuffle(q.order) }));
    document.getElementById('mquiz').innerHTML = moduleQuizHtml(); return;
  }
  if (a === 'exam-start') {
    busy(t, true, 'Préparation…');
    try {
      const r = await api.startExam(t.dataset.id);
      S.examResult = null;
      S.exam = { courseId: t.dataset.id, attemptId: r.attempt_id, questions: r.questions.map((q) => ({ ...q, order: shuffle(q.options.map((_, k) => k)) })) };
      render(); window.scrollTo(0, 0);
    } catch (err) { showErr('exerr', err.message); busy(t, false, 'Commencer l\'examen'); }
    return;
  }
  if (a === 'pdf') {
    const cert = S.certView; if (!cert || !window.jspdf) { toast('Le PDF n\'est pas disponible. Vérifiez votre connexion puis réessayez.'); return; }
    const label = t.textContent;
    busy(t, true, 'Préparation du PDF…');
    const fonts = await loadPdfFonts().catch(() => null);
    const logo = await loadPdfLogo().catch(() => null);
    const tx = certText(cert);
    certificatePdf({ heading: tx.heading, name: cert.full_name, text: tx.text, rows: tx.rows, verifyUrl: verifyUrl(cert.id), year: new Date(cert.issued_at).getFullYear(), fonts, logo })
      .save(`attestation-vitako-${slug(cert.full_name)}-${cert.id.toLowerCase()}.pdf`);
    busy(t, false, label);
    return;
  }
  if (a === 'pay-ok' || a === 'pay-ko') {
    const approve = a === 'pay-ok';
    const reason = approve ? null : document.getElementById('r-' + t.dataset.id)?.value;
    busy(t, true);
    try {
      const p = await api.adminDecide(t.dataset.id, approve, reason);
      toast(approve ? `Accès activé jusqu'au ${fmtDate(p.access_until)}.` : 'Paiement refusé. L\'étudiant verra le motif.');
      render();
    } catch (err) { toast(err.message); busy(t, false); }
  }
});

document.addEventListener('input', (e) => {
  if (e.target.id === 'hsearch') { S.filter.q = e.target.value; refreshSearch(); }
  if (e.target.id === 'us-q' && S.adminUsers) { S.adminUsers.q = e.target.value; document.getElementById('us-list').innerHTML = usersTable(); }
});
document.addEventListener('keydown', (e) => {
  if (e.key === 'Escape' && (S.ui.menu || S.ui.search)) {
    const wasMenu = S.ui.menu; S.ui.menu = false; if (!wasMenu) { S.ui.search = false; S.filter.q = ''; } topbar();
    document.querySelector(wasMenu ? '[data-act=menu]' : '[data-act=search-toggle]')?.focus();
  }
  if (e.target.id === 'hsearch' && (e.key === 'Enter' || e.key === 'ArrowDown')) {
    const first = document.querySelector(S.filter.q.trim() ? '#hs-panel .hs-main' : '#hs-panel .chip, #hs-panel .hs-main');
    if (!first) return;
    e.preventDefault();
    if (e.key === 'Enter' && S.filter.q.trim()) { S.ui.search = false; S.filter.q = ''; location.hash = first.getAttribute('href'); topbar(); }
    else first.focus();
  }
});

document.addEventListener('submit', async (e) => {
  e.preventDefault();
  const f = e.target;
  const btn = f.querySelector('button[type=submit]');

  if (f.id === 'auth-form') {
    const signup = f.dataset.mode === 'signup';
    const email = f.querySelector('#a-email').value.trim().toLowerCase();
    const pass = f.querySelector('#a-pass').value;
    const name = signup ? f.querySelector('#a-name').value.trim().replace(/\s+/g, ' ') : '';
    document.getElementById('aerr').hidden = true;
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) return showErr('aerr', 'Saisissez une adresse e-mail valide, par exemple vous@exemple.mg.');
    if (signup && name.length < 2) return showErr('aerr', 'Indiquez votre nom complet : il figurera sur vos attestations.');
    if (pass.length < 8) return showErr('aerr', 'Le mot de passe doit contenir au moins 8 caractères.');
    const role = signup && f.querySelector('input[name=a-role]:checked')?.value === 'trainer' ? 'trainer' : 'student';
    if (role === 'trainer' && !f.querySelector('#a-exp')?.checked) return showErr('aerr', 'Le compte formateur est réservé aux personnes ayant au moins 5 ans d\'expérience en freelance ou en télétravail. Cochez la case pour le confirmer, ou choisissez « Étudiant(e) ».');
    busy(btn, true);
    // Où aller une fois connecté (lu par onAuthChange, qui peut se déclencher pendant l'appel).
    // Étudiant : page d'accueil. Formateur : son Espace formateur, pour remplir son profil.
    S.afterLogin = f.dataset.next || (signup ? (role === 'trainer' ? '/espace-formateur' : '/') : '');
    try {
      let r;
      if (signup) {
        r = await api.signUp(email, pass, name, role);
        if (!r.session) {
          f.querySelectorAll('input,button').forEach((el) => { el.disabled = true; });
          const ok = document.getElementById('aok');
          ok.textContent = `Compte créé. Ouvrez l'e-mail envoyé à ${email} et cliquez sur le lien pour confirmer votre adresse, puis connectez-vous.`;
          ok.hidden = false;
          return;
        }
      } else {
        r = await api.signIn(email, pass);
      }
      // On termine la connexion ici, sans dépendre uniquement de onAuthChange.
      if (r?.session && S.afterLogin !== null && S.afterLogin !== undefined) {
        const next = S.afterLogin; S.afterLogin = null;
        S.session = r.session;
        await loadUser().catch((e2) => console.error(e2));
        toast('Connexion réussie.');
        go('#' + (next || homeAfterLogin()));
      }
    } catch (err) { S.afterLogin = null; showErr('aerr', err.message); busy(btn, false); }
    return;
  }
  if (f.id === 'forgot-form') {
    const email = f.querySelector('#f-email').value.trim();
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) return showErr('ferr', 'Saisissez une adresse e-mail valide.');
    busy(btn, true);
    try {
      await api.sendPasswordReset(email);
      document.getElementById('ferr').hidden = true;
      const ok = document.getElementById('fok'); ok.textContent = `Si un compte existe pour ${email}, un lien vient d'être envoyé. Pensez à regarder dans les spams.`; ok.hidden = false;
    } catch (err) { showErr('ferr', err.message); busy(btn, false); }
    return;
  }
  if (f.id === 'reset-form') {
    const pass = f.querySelector('#r-pass').value;
    if (pass.length < 8) return showErr('rerr', 'Le mot de passe doit contenir au moins 8 caractères.');
    busy(btn, true);
    try { await api.updatePassword(pass); toast('Mot de passe enregistré.'); go('#/mon-espace'); } catch (err) { showErr('rerr', err.message); busy(btn, false); }
    return;
  }
  if (f.id === 'pay-form') {
    const op = opById(S.payOp);
    const ref = f.querySelector('#p-ref').value.trim().replace(/\s+/g, '').toUpperCase();
    const tel = f.querySelector('#p-tel').value.replace(/\D/g, '');
    document.getElementById('perr').hidden = true;
    if (!/^[A-Z0-9][A-Z0-9.-]{4,39}$/.test(ref)) return showErr('perr', 'Saisissez la référence exactement comme dans le SMS de confirmation (lettres, chiffres et points).');
    if (tel && !/^03\d{8}$/.test(tel)) return showErr('perr', `Le numéro doit avoir 10 chiffres, par exemple ${op.prefixes[0]} 12 345 67. Vous pouvez aussi laisser ce champ vide.`);
    if (tel && !op.prefixes.includes(tel.slice(0, 3))) return showErr('perr', `Ce numéro ne correspond pas à ${op.name} (préfixes ${op.prefixes.join(', ')}). Choisissez le bon opérateur ou laissez le champ vide.`);
    busy(btn, true);
    try {
      await api.submitPayment(op.id, ref, tel);
      S.payments = await api.getMyPayments(uid());
      toast('Référence envoyée. Votre accès sera activé après vérification.');
      render(); window.scrollTo(0, 0);
    } catch (err) { showErr('perr', err.message); busy(btn, false); }
    return;
  }
  if (f.id === 'name-form') {
    const name = f.querySelector('#n-name').value.trim().replace(/\s+/g, ' ');
    if (name.length < 2) { toast('Indiquez votre nom complet.'); return; }
    busy(btn, true);
    try { await api.updateName(uid(), name); S.profile.full_name = name; toast('Nom enregistré.'); render(); } catch (err) { toast(err.message); busy(btn, false); }
    return;
  }
  if (f.id === 'trainer-form') {
    const d = readTrainerForm(f);
    const phoneOk = (v) => { const x = v.replace(/[^0-9+]/g, ''); return !x || /^\+?\d{8,15}$/.test(x); };
    // @compte → lien complet pour Instagram et TikTok
    if (/^@[\w.]{2,30}$/.test(d.instagram.trim())) d.instagram = 'https://instagram.com/' + d.instagram.trim().slice(1);
    if (/^@[\w.]{2,30}$/.test(d.tiktok.trim())) d.tiktok = 'https://www.tiktok.com/' + d.tiktok.trim();
    document.getElementById('terr').hidden = true;
    if (!phoneOk(d.whatsapp)) return showErr('terr', 'Numéro WhatsApp invalide : 10 chiffres, par exemple 034 12 345 67.');
    if (!phoneOk(d.phone)) return showErr('terr', 'Numéro de téléphone invalide : 10 chiffres, par exemple 034 12 345 67.');
    if (d.email.trim() && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(d.email.trim())) return showErr('terr', 'L\'e-mail de contact ne semble pas valide.');
    busy(btn, true, 'Enregistrement…');
    try {
      const before = trStatus(S.trainer);
      S.trainer = await api.saveTrainer(d);
      S.trainerDraft = null; f.id = '';
      const st = trStatus(S.trainer);
      toast(st === 'draft' ? `Profil enregistré. Il manque encore : ${trainerMissing(S.trainer).join(', ')}.`
        : before !== st && st === 'pending' ? (hasAccess() || pendingPayment() ? 'Profil complet ! Vitako va le vérifier.' : 'Profil complet ! Vous pouvez maintenant payer l\'abonnement.')
          : 'Profil enregistré.');
      render(); window.scrollTo(0, 0);
    } catch (err) { showErr('terr', err.message); busy(btn, false, 'Enregistrer mon profil'); }
    return;
  }
  if (f.id === 'verify-form') {
    const id = f.querySelector('#v-id').value.trim().toUpperCase();
    if (id) go(`#/attestation/${encodeURIComponent(id)}`);
    return;
  }
  if (f.id === 'pquiz-form') {
    const Q = S.pquiz;
    const answers = {};
    for (let i = 0; i < Q.qs.length; i++) {
      const sel = f.querySelector(`input[name="pq${i}"]:checked`);
      if (!sel) { document.getElementById('mqerr').hidden = false; document.getElementById('mqerr').scrollIntoView({ block: 'center' }); return; }
      answers[i] = Number(sel.value);
    }
    const good = Q.qs.filter((q, i) => answers[i] === q.correct).length;
    busy(btn, true, 'Correction…');
    try {
      const r = await api.completePart(Q.courseId, Q.mi, Q.pi, good, Q.qs.length);
      if (!S.partDone.has(Q.courseId)) S.partDone.set(Q.courseId, new Map());
      const prev = S.partDone.get(Q.courseId).get(`${Q.mi}-${Q.pi}`);
      S.partDone.get(Q.courseId).set(`${Q.mi}-${Q.pi}`, { good: Math.max(good, prev?.good || 0), total: Q.qs.length });
      if (r?.module_done) { if (!S.progress.has(Q.courseId)) S.progress.set(Q.courseId, new Set()); S.progress.get(Q.courseId).add(Q.mi); }
      Q.answers = answers; Q.answered = true; Q.score = good;
      document.getElementById('mquiz').innerHTML = partQuizHtml();
      document.querySelector(`.lesson-progress a[data-p="${Q.pi}"]`)?.classList.add('done');
      document.getElementById('mquiz-wrap').scrollIntoView({ behavior: 'smooth', block: 'start' });
    } catch (err) { toast(err.message); busy(btn, false, 'Valider mes réponses'); }
    return;
  }
  if (f.id === 'mquiz-form') {
    const Q = S.mquiz;
    const answers = {};
    for (let i = 0; i < Q.qs.length; i++) {
      const sel = f.querySelector(`input[name="mq${i}"]:checked`);
      if (!sel) { document.getElementById('mqerr').hidden = false; return; }
      answers[i] = Number(sel.value);
    }
    busy(btn, true);
    try {
      await api.markModuleDone(uid(), Q.courseId, Q.mi);
      if (!S.progress.has(Q.courseId)) S.progress.set(Q.courseId, new Set());
      S.progress.get(Q.courseId).add(Q.mi);
      Q.answers = answers; Q.answered = true;
      Q.score = Q.qs.filter((q, i) => answers[i] === q.correct).length;
      document.getElementById('mquiz').innerHTML = moduleQuizHtml();
      document.getElementById('mquiz-wrap').scrollIntoView({ behavior: 'smooth', block: 'start' });
    } catch (err) { toast(err.message); busy(btn, false); }
    return;
  }
  if (f.id === 'feedback-form') {
    const msg = f.querySelector('#fb-msg').value.trim();
    if (msg.length < 10) return showErr('fberr', 'Votre message est trop court : écrivez au moins 10 caractères.');
    busy(btn, true, 'Envoi…');
    try {
      await api.submitFeedback(f.querySelector('#fb-cat').value, msg, f.querySelector('#fb-email')?.value.trim(), S.ui.fromPage || '');
      f.outerHTML = '<div class="narrow panel stack fb-thanks" role="status"><h2>Merci pour votre remarque !</h2><p class="muted">Elle a bien été transmise à l\'équipe Vitako. Vos idées nous aident à améliorer le site.</p><a class="btn" href="#/">Retour à l\'accueil</a></div>';
    } catch (err) { showErr('fberr', err.message); busy(btn, false, 'Envoyer ma remarque'); }
    return;
  }
  if (f.id === 'review-form') {
    const sel = f.querySelector('input[name="rv-rating"]:checked');
    if (!sel) return showErr('rverr', 'Choisissez une note de 1 à 5 étoiles.');
    busy(btn, true, 'Envoi…');
    try {
      await api.submitReview(f.dataset.course, Number(sel.value), f.querySelector('#rv-comment').value, f.querySelector('#rv-publish').checked);
      S.reviews = [...S.reviews, { course_id: f.dataset.course, rating: Number(sel.value) }];
      const slot = document.getElementById('review-slot');
      if (slot) slot.innerHTML = '<section class="rv rv-done" role="status"><h2>Merci pour votre avis !</h2><p>Il a bien été envoyé à l\'équipe Vitako.</p></section>';
      setTimeout(renderReviewSlot, 6000);
    } catch (err) { showErr('rverr', err.message); busy(btn, false, 'Envoyer mon avis'); }
    return;
  }
  if (f.id === 'exam-form') {
    const E = S.exam;
    const answers = {};
    for (let i = 0; i < E.questions.length; i++) {
      const sel = f.querySelector(`input[name="ex${i}"]:checked`);
      if (!sel) return showErr('exerr', 'Répondez à toutes les questions avant de valider.');
      answers[E.questions[i].id] = Number(sel.value);
    }
    busy(btn, true, 'Correction…');
    try {
      const r = await api.submitExam(E.attemptId, answers);
      S.exam = null;
      S.examResult = { ...r, courseId: E.courseId };
      const id = uid();
      [S.certs, S.attempts] = await Promise.all([api.getCertificates(id), api.getAttempts(id), r.passed ? loadTrainers().catch(() => null) : null]);
      render(); window.scrollTo(0, 0);
    } catch (err) { showErr('exerr', err.message); busy(btn, false, 'Valider l\'examen'); }
  }
});

window.addEventListener('hashchange', (ev) => {
  try { const prev = new URL(ev.oldURL).hash.replace(/^#/, ''); if (prev !== '/remarque') S.ui.fromPage = prev || '/'; } catch (e) {}
  S.ui.menu = false; S.ui.search = false; S.ui.notif = false; S.filter.q = '';
  const { path } = route();
  if (!/\/examen$/.test(path)) { S.examResult = null; }
  render();
  window.scrollTo(0, 0);
});

// ---------------------------------------------------------------------------
// Démarrage
// ---------------------------------------------------------------------------
applyTheme();
render();
(async () => {
  if (!api.configured) return;
  try {
    const settings = await api.getSettings();
    if (settings.price_ar) S.price = Number(settings.price_ar);
    if ('promo_price_ar' in settings) S.promoPrice = Number(settings.promo_price_ar) || 0;
    if ('promo_until' in settings) S.promoUntil = settings.promo_until || '';
    if (settings.access_days) S.days = Number(settings.access_days);
    S.session = await api.getSession();
    await loadUser();
  } catch (e) { console.error(e); }
  S.booting = false;
  render();
  api.onAuthChange(async (event, session) => {
    if (event === 'INITIAL_SESSION' || event === 'TOKEN_REFRESHED') return;
    const changed = session?.user?.id !== S.session?.user?.id;
    S.session = session;
    if (event === 'PASSWORD_RECOVERY') { await loadUser(); go('#/nouveau-mot-de-passe'); return; }
    if (!changed) return;
    await loadUser().catch((e) => console.error(e));
    if (event === 'SIGNED_IN') {
      const next = S.afterLogin; S.afterLogin = null;
      if (next !== undefined && next !== null) { toast('Connexion réussie.'); go('#' + (next || homeAfterLogin())); return; }
    }
    render();
  });
})();
// Avis : le message « choisissez une note » disparaît dès qu'une étoile est choisie
document.addEventListener('change', async (e) => {
  if (e.target.id === 'av-file') {
    const file = e.target.files?.[0]; e.target.value = '';
    if (!file) return;
    let img;
    try { img = await loadImageFile(file); } catch (err) { toast(err.message); return; }
    const box = await openCropper(img);
    if (!box) return;
    const pick = document.querySelector('.av-pick'); if (pick) pick.textContent = 'Envoi…';
    try {
      const blob = await cropToBlob(img, box.sx, box.sy, box.side);
      S.profile.avatar_url = await api.uploadAvatar(uid(), blob);
      toast(`Photo enregistrée (${Math.max(1, Math.round(blob.size / 1024))} Ko).`);
      if (isTrainer()) S.trainer = await api.getMyTrainer(uid()).catch(() => S.trainer);
    } catch (err) { toast(err.message || "La photo n'a pas pu être envoyée."); }
    render();
    return;
  }
  if (e.target.id === 'tr-cover-file' || e.target.id === 'tr-visual-file') {
    const kind = e.target.dataset.kind, K = IMG_KINDS[kind];
    const file = e.target.files?.[0]; e.target.value = '';
    if (!file) return;
    let img;
    try { img = await loadImageFile(file); } catch (err) { toast(err.message); return; }
    const box = await openCropper(img, K);
    if (!box) return;
    const pick = document.querySelector(`label[for="${e.target.id}"]`); if (pick) pick.textContent = 'Envoi…';
    try {
      const blob = await encodeCrop(img, box, K);
      S.trainer = await api.uploadTrainerImage(uid(), kind, blob);
      toast(`${kind === 'cover' ? 'Couverture enregistrée' : 'Visuel enregistré'} (${Math.max(1, Math.round(blob.size / 1024))} Ko).`);
    } catch (err) { toast(err.message || "L'image n'a pas pu être envoyée."); }
    render();
    return;
  }
  if (e.target.name === 't-dom') { e.target.closest('.chip')?.classList.toggle('on', e.target.checked); return; }
  if (e.target.name === 'a-role') { const n = document.getElementById('role-note'); if (n) n.hidden = e.target.value !== 'trainer'; return; }
  if (e.target.name === 'rv-rating') { const el = document.getElementById('rverr'); if (el) el.hidden = true; }
});
