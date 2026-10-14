// Vitako : pages du site (routeur, vues, actions).
import * as api from './api.js';
import { JOBS, DOMAINS_LIST, COURSES, courseById, otherLevel, jobByKey } from './catalog.js';
import { md, esc, sections, readingMinutes } from './markdown.js';
import { certificatePdf, loadPdfFonts, slug } from './pdf.js';
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
  admin: { pending: 0, active: 0, feedback: 0 },
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
  ui: { menu: false, search: false, searchFocus: false },
};

const uid = () => S.session?.user?.id;
const isAdmin = () => !!S.profile?.is_admin;
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
    Object.assign(S, { profile: null, progress: new Map(), certs: [], attempts: [], payments: [], reviews: [] });
    return;
  }
  let profile = await api.getProfile(id);
  if (!profile) { await new Promise((r) => setTimeout(r, 800)); profile = await api.getProfile(id); }
  const [progress, certs, attempts, payments, reviews] = await Promise.all([
    api.getProgress(id), api.getCertificates(id), api.getAttempts(id), api.getMyPayments(id),
    api.getMyReviews(id).catch(() => []),
  ]);
  S.profile = profile;
  S.progress = new Map();
  for (const p of progress) {
    if (!S.progress.has(p.course_id)) S.progress.set(p.course_id, new Set());
    S.progress.get(p.course_id).add(p.module_index);
  }
  S.certs = certs; S.attempts = attempts; S.payments = payments; S.reviews = reviews;
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
// Barre du haut
// ---------------------------------------------------------------------------
function topbar() {
  const r = route();
  const on = (p) => (r.path === p ? ' on' : '');
  const item = (href, label, extra = '') => `<a class="menu-item${on(href.slice(1))}" href="${href}">${label}${extra}</a>`;
  let items = item('#/', 'Accueil') + item('#/formations', 'Toutes les formations');
  if (S.session) {
    items += item('#/mon-espace', 'Mon espace');
    if (isAdmin()) items += item('#/admin', 'Administration', S.admin.pending ? ` <span class="pill gold">${S.admin.pending}</span>` : '') + item('#/admin/stats', 'Statistiques', '') + item('#/admin/avis', 'Avis', '') + item('#/admin/remarques', 'Remarques', S.admin.feedback ? ` <span class="pill gold">${S.admin.feedback}</span>` : '');
    else if (S.profile && !hasAccess()) items += item('#/abonnement', "S'abonner");
    else if (S.profile) items += item('#/abonnement', 'Prolonger mon abonnement');
  }
  items += item('#/verifier', 'Vérifier une attestation') + item('#/remarque', 'Envoyer une remarque');
  const who = S.session
    ? `<div class="menu-who"><b>${esc(S.profile?.full_name || '')}</b><small>${esc(S.session.user.email || '')}</small>
        ${S.profile && hasAccess() && !isAdmin() ? `<span class="pill">Abonné · ${daysLeft()} j restants</span>` : ''}</div>`
    : '';
  const foot = S.session
    ? '<button class="menu-item danger" data-act="logout">Déconnexion</button>'
    : '<div class="menu-cta"><a class="btn" href="#/inscription">Créer un compte</a><a class="btn ghost" href="#/connexion">Connexion</a></div>';
  const dark = isDark();
  const badge = S.session && isAdmin() && S.admin.pending ? `<span class="dot-badge">${S.admin.pending}</span>` : '';
  topEl.innerHTML = `<a class="logo" href="#/" aria-label="Vitako, accueil"><i>${I.check.replace('currentColor', 'var(--accent-ink)')}</i>vitako</a>
    <div class="tb-actions">
      ${S.session && S.profile && hasAccess() && !isAdmin() ? `<span class="pill tb-pill">Abonné · ${daysLeft()} j</span>` : ''}
      ${!S.session ? `<a class="tb-link" href="#/connexion">Connexion</a><a class="btn tb-cta" href="#/inscription"><span class="tb-l">Créer un compte</span><span class="tb-s">S'inscrire</span></a>` : ''}
      ${S.session && S.profile && !hasAccess() ? `<a class="btn tb-cta" href="#/abonnement">S'abonner</a>` : ''}
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
  const cta = S.session ? `<a class="btn lg" href="#/mon-espace">Mon espace</a>` : `<a class="btn lg" href="#/inscription">Créer mon compte gratuit</a>`;
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
    <div class="lp-head"><div class="eyebrow lp-eyebrow">Les plus demandées</div><h2 id="feat-title">10 formations pour décrocher vos premiers clients</h2></div>
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
// Leçon + petit test
// ---------------------------------------------------------------------------

async function lessonPage(id, num) {
  const c = courseById(id);
  if (!c || !c.published) return notFound();
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
  const n = c.modules.length;
  if (doneSet(id).size < n) {
    return `${back(`#/formation/${id}`, c.title)}<div class="narrow panel stack"><h2>Terminez d'abord les modules</h2>
      <p class="muted">Vous avez terminé ${doneSet(id).size} module${doneSet(id).size > 1 ? 's' : ''} sur ${n}. L'examen s'ouvre quand tous les tests de module sont rendus.</p>
      <a class="btn" href="#/formation/${id}">Voir le programme</a></div>`;
  }
  if (S.examResult?.courseId === id) return examResult(c);
  if (S.exam?.courseId === id) return examForm(c);
  const tries = attemptsOf(id).length;
  return `${back(`#/formation/${id}`, c.title)}
  ${pageHead('Examen final', c.title)}
  <div class="narrow panel stack" style="max-width:620px;gap:14px">
    <ul class="obj"><li>10 questions tirées au hasard, 10 points chacune</li><li>50/100 pour réussir et obtenir l'attestation</li><li>Essais illimités : votre meilleur score est conservé</li><li>Vous avez 3 heures pour rendre vos réponses</li></ul>
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
           ${R.job_certificate_id ? `<a class="btn ghost" href="#/attestation/${R.job_certificate_id}">Attestation de parcours</a>` : (other ? `<a class="btn ghost" href="#/formation/${other.id}">Continuer : niveau ${other.levelName}</a>` : '<a class="btn ghost" href="#/formations">Voir les autres formations</a>')}</div>`
      : `<p>Il manque ${50 - R.score} point${50 - R.score > 1 ? 's' : ''}. Relisez les modules si besoin, puis recommencez : le nombre d'essais n'est pas limité.</p>
         <p id="exerr" class="notice err" hidden></p>
         <div style="display:flex;gap:10px;flex-wrap:wrap;justify-content:center">
           <button class="btn" data-act="exam-start" data-id="${c.id}">Recommencer l'examen</button>
           <a class="btn ghost" href="#/formation/${c.id}">Revoir les modules</a></div>`}
  </div>`;
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
      <div class="dip-logo"><i>${I.check.replace('currentColor', '#fff')}</i>vitako</div>
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
function authPage(mode) {
  if (!api.configured) return needConfig();
  const r = route();
  const next = r.query.get('suite') || '';
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
  if (S.session) return `<div class="narrow panel stack"><h2>Vous êtes connecté</h2><a class="btn" href="#/mon-espace">Aller à mon espace</a></div>`;
  const signup = mode === 'signup';
  return `<div class="narrow panel stack" style="gap:18px">
    <div class="stack" style="gap:6px"><h2>${signup ? 'Créer un compte' : 'Connexion'}</h2>
      <p class="muted">${signup ? 'Gratuit. Vous pourrez voir toutes les formations ; l\'abonnement débloque les cours.' : 'Heureux de vous revoir.'}</p></div>
    <form id="auth-form" class="stack" style="gap:14px" novalidate data-mode="${signup ? 'signup' : 'login'}" data-next="${esc(next)}">
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
  return `<div class="narrow stack" style="gap:18px">
    <div class="panel stack" style="gap:12px">
      <span class="eyebrow">Abonnement mensuel</span>
      ${promoOn() ? `<div><span class="pill red">-${promoPct()} % jusqu'au ${promoEnd()}</span></div>` : ''}
      <div class="price">${priceHtml()} <small>/ ${S.days} jours</small></div>
      <ul class="obj"><li>Accès à toutes les formations disponibles</li><li>Tests et examens illimités</li><li>Une attestation par formation réussie, plus l'attestation de parcours complet</li><li>Désactivation automatique au bout de ${S.days} jours, sans prélèvement</li></ul>
      ${act ? notice('info', `Abonnement actif jusqu'au ${fmtDate(S.profile.sub_end)}. Un nouveau paiement ajoute ${S.days} jours.`) : ''}
    </div>
    ${pending ? `<div class="panel stack" style="gap:10px">
      <div><span class="pill gold">En attente de validation</span></div>
      <p>Paiement ${esc(opById(pending.operator).name)} de <b class="mono">${ar(pending.amount)}</b>${pending.sender ? ` depuis le <span class="mono">${fmtTel(pending.sender)}</span>` : ''}, référence <span class="mono">${esc(pending.reference)}</span>, envoyé le ${fmtDT(pending.created_at)}.</p>
      <p class="muted">Nous vérifions la réception puis activons votre accès pour ${S.days} jours, en général en ${esc(CFG.validationDelay)}. Vous recevrez un e-mail dès que c'est fait.</p>
    </div>` : `
    ${showKo ? notice('err', `Votre paiement du ${fmtDT(last.created_at)} (référence ${esc(last.reference)}) n'a pas été validé : ${esc(last.reason || 'paiement introuvable')}. Vérifiez la référence dans votre SMS de confirmation et renvoyez-la.`) : ''}
    <form id="pay-form" class="panel stack" style="gap:16px" novalidate>
      <b>Payer par Mobile Money</b>
      <div class="ops two" role="radiogroup" aria-label="Opérateur">
        ${CFG.operators.map((o) => `<button type="button" class="op${o.id === op.id ? ' on' : ''}" data-op="${o.id}" role="radio" aria-checked="${o.id === op.id}">${esc(o.name)}<small>${o.prefixes.join(' / ')}</small></button>`).join('')}
      </div>
      <ol class="steps">
        <li><span>Envoyez <b class="mono">${ar(priceNow())}</b> à ce numéro ${esc(op.name)} :</span>
          <div class="paynum"><span class="mono">${esc(op.number)}</span><button type="button" class="btn ghost sm" data-act="copy" data-v="${op.number.replace(/ /g, '')}">Copier</button></div>
          <div class="holder">Au nom de <b>${esc(op.holder)}</b></div>
          <small class="muted">Vérifiez ce nom avant de confirmer le transfert, puis gardez le SMS de confirmation : il contient la référence de la transaction.</small></li>
        <li>Entrez les informations du paiement :</li>
      </ol>
      <div class="f"><label class="l" for="p-ref">Référence de la transaction</label><input class="in mono" id="p-ref" autocomplete="off" required placeholder="Copiez-la depuis le SMS de confirmation"></div>
      <div class="f"><label class="l" for="p-tel">Votre numéro ${esc(op.name)} (facultatif)</label><input class="in mono" id="p-tel" inputmode="tel" autocomplete="tel" placeholder="${op.prefixes[0]} 12 345 67"><small class="muted">Le numéro qui a envoyé l'argent. Il nous aide à retrouver votre paiement plus vite.</small></div>
      <p id="perr" class="notice err" hidden></p>
      <button class="btn" type="submit">Envoyer ma référence</button>
      <p class="muted" style="font-size:.85rem">Nous vérifions le paiement puis activons votre accès pour ${S.days} jours, en général en ${esc(CFG.validationDelay)}, et vous prévenons par e-mail. Accès prévu du ${fmtDate(start)} au ${fmtDate(start.getTime() + S.days * DAY)}.</p>
    </form>`}
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
      <div><div class="dsh-eyebrow">Mon espace</div><h1>Salama, ${esc((P.full_name || '').split(' ')[0])}</h1>
        <p>${act && !P.is_admin ? `Abonnement actif : encore ${daysLeft()} jour${daysLeft() > 1 ? 's' : ''} pour apprendre.` : P.is_admin ? 'Compte administrateur.' : 'Abonnez-vous pour suivre les cours et obtenir vos attestations.'}</p></div>
      <div class="dsh-kpis">
        <div><b>${ongoing.length}</b><span>en cours</span></div>
        <div><b>${modsDone}</b><span>modules terminés</span></div>
        <div><b>${courseCerts.length + jobCerts.length}</b><span>attestation${courseCerts.length + jobCerts.length > 1 ? 's' : ''}</span></div>
      </div>
    </div>
  </section>
  <div class="dash dsh">
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
    <div class="dsh-h"><span class="dsh-ic">${IC.user}</span><b>Nom sur les attestations</b></div>
    <div class="f"><label class="l" for="n-name">Nom complet</label><input class="in" id="n-name" value="${esc(P.full_name)}" autocomplete="name" required></div>
    <p class="muted" style="font-size:.88rem">Le nouveau nom s'applique aux prochaines attestations. Celles déjà délivrées gardent le nom d'origine.</p>
    <div><button class="btn ghost" type="submit">Enregistrer le nom</button></div>
  </form>`;
}

// ---------------------------------------------------------------------------
// Administration
// ---------------------------------------------------------------------------
async function adminPage() {
  if (!api.configured) return needConfig();
  if (!S.session) return needLogin('/admin');
  if (!S.profile) return loadingView();
  if (!isAdmin()) return notFound();
  const [pending, done, counts] = await Promise.all([api.adminPayments('pending'), api.adminPayments('done'), api.adminCounts()]);
  S.admin = counts;
  topbar();
  const ops = CFG.operators.map((o) => `${esc(o.name)} ${esc(o.number)}`).join(' · ');
  return `${adminTabs('pay')}${pageHead('Administration', 'Paiements à valider', `<p class="muted">${counts.pending} en attente · ${counts.active} abonné${counts.active > 1 ? 's' : ''} actif${counts.active > 1 ? 's' : ''} · ${ops}</p>`)}
  <div style="margin-bottom:18px">${notice('warn', `Avant de valider, ouvrez votre application MVola ou Orange Money et vérifiez : la référence existe, le montant correspond au « Montant attendu » de la demande et, s'il est indiqué, le numéro de l'expéditeur correspond. Ne validez jamais à partir d'une capture d'écran.`)}</div>
  ${pending.length ? `<div class="paylist">${pending.map((p) => `<div class="panel">
      <div class="payhead"><div><b>${esc(p.profile?.full_name || 'Étudiant')}</b><small class="muted">${esc(p.profile?.email || '')}</small></div><span class="pill grey">Reçu le ${fmtDT(p.created_at)}</span></div>
      <dl class="paydl">
        <div><dt>Opérateur</dt><dd>${esc(opById(p.operator).name)} → ${esc(opById(p.operator).number)}</dd></div>
        <div><dt>Expéditeur</dt><dd class="${p.sender ? 'mono' : 'muted'}">${p.sender ? fmtTel(p.sender) : 'Non indiqué'}</dd></div>
        <div><dt>Référence</dt><dd class="mono">${esc(p.reference)}</dd></div>
        <div><dt>Montant attendu</dt><dd class="mono">${ar(p.amount)}</dd></div>
      </dl>
      <div class="payact">
        <button class="btn sm" data-act="pay-ok" data-id="${p.id}">Valider : ${S.days} jours d'accès</button>
        <select class="in sm" id="r-${p.id}" aria-label="Motif du refus"><option>Référence introuvable</option><option>Montant incorrect</option><option>Numéro d'expéditeur différent</option><option>Référence déjà utilisée</option></select>
        <button class="btn ghost sm" data-act="pay-ko" data-id="${p.id}">Refuser</button>
      </div></div>`).join('')}</div>`
    : '<div class="panel"><p class="muted">Aucun paiement en attente. Les nouvelles références apparaîtront ici.</p></div>'}
  <h2 style="margin:30px 0 12px">Derniers paiements traités</h2>
  ${done.length ? `<div class="tbl"><table><thead><tr><th>Traité le</th><th>Étudiant</th><th>Opérateur</th><th>Référence</th><th>Résultat</th></tr></thead><tbody>
    ${done.map((p) => `<tr><td>${fmtDT(p.decided_at || p.created_at)}</td><td>${esc(p.profile?.full_name || '')}<br><small class="muted">${esc(p.profile?.email || '')}</small></td><td>${esc(opById(p.operator).name)}</td><td class="mono">${esc(p.reference)}</td>
      <td>${p.status === 'approved' ? `<span class="pill">Validé</span>${p.access_until ? ` <small class="muted">jusqu'au ${fmtDate(p.access_until)}</small>` : ''}` : `<span class="pill red">Refusé</span> <small class="muted">${esc(p.reason || '')}</small>`}</td></tr>`).join('')}
  </tbody></table></div>` : '<p class="muted">Aucun paiement traité pour l\'instant.</p>'}`;
}

const adminTabs = (on) => `<nav class="tabs" aria-label="Administration">
  <a class="tab${on === 'pay' ? ' on' : ''}" href="#/admin"${on === 'pay' ? ' aria-current="page"' : ''}>Paiements${S.admin.pending ? ` <span class="pill gold">${S.admin.pending}</span>` : ''}</a>
  <a class="tab${on === 'stats' ? ' on' : ''}" href="#/admin/stats"${on === 'stats' ? ' aria-current="page"' : ''}>Statistiques</a>
  <a class="tab${on === 'avis' ? ' on' : ''}" href="#/admin/avis"${on === 'avis' ? ' aria-current="page"' : ''}>Avis</a>
  <a class="tab${on === 'remarques' ? ' on' : ''}" href="#/admin/remarques"${on === 'remarques' ? ' aria-current="page"' : ''}>Remarques${S.admin.feedback ? ` <span class="pill gold">${S.admin.feedback}</span>` : ''}</a></nav>`;
const nf = (n) => Number(n || 0).toLocaleString('fr-FR').replace(/\u202f|\u00a0/g, ' ');
const pct = (a, b) => (b ? Math.round((a / b) * 100) : 0);
const kpi = (label, value, sub = '', tone = '') => `<div class="kpi${tone ? ' ' + tone : ''}"><span class="kpi-l">${label}</span><b class="kpi-v">${value}</b>${sub ? `<span class="kpi-s">${sub}</span>` : ''}</div>`;

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
const HQ_KEY = 'vitako_video_quality';
function heroQuality() { try { return localStorage.getItem(HQ_KEY) || '720'; } catch (e) { return '720'; } }
function startHeroVideo() {
  const v = document.getElementById('hero-video');
  if (!v) return;
  const saveData = navigator.connection && navigator.connection.saveData;
  const wide = window.matchMedia && window.matchMedia('(min-width: 861px)').matches;
  const calm = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  if (wide && !saveData && !calm) { v.muted = true; v.play().catch(() => {}); }
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
  [/^\/remarque$/, feedbackPage],
];
let renderToken = 0;
async function render() {
  const token = ++renderToken;
  topbar();
  const { path } = route();
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
      try { localStorage.setItem(HQ_KEY, q); } catch (err) {}
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
  if (a === 'logout') { S.ui.menu = false; await api.signOut(); S.session = null; await loadUser(); go('#/'); toast('Vous êtes déconnecté.'); return; }

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
    const tx = certText(cert);
    certificatePdf({ heading: tx.heading, name: cert.full_name, text: tx.text, rows: tx.rows, verifyUrl: verifyUrl(cert.id), year: new Date(cert.issued_at).getFullYear(), fonts })
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
    busy(btn, true);
    // Où aller une fois connecté (lu par onAuthChange, qui peut se déclencher pendant l'appel).
    S.afterLogin = f.dataset.next || (signup ? '/abonnement' : '');
    try {
      let r;
      if (signup) {
        r = await api.signUp(email, pass, name);
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
        go('#' + (next || (isAdmin() ? '/admin' : '/mon-espace')));
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
  if (f.id === 'verify-form') {
    const id = f.querySelector('#v-id').value.trim().toUpperCase();
    if (id) go(`#/attestation/${encodeURIComponent(id)}`);
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
      [S.certs, S.attempts] = await Promise.all([api.getCertificates(id), api.getAttempts(id)]);
      render(); window.scrollTo(0, 0);
    } catch (err) { showErr('exerr', err.message); busy(btn, false, 'Valider l\'examen'); }
  }
});

window.addEventListener('hashchange', (ev) => {
  try { const prev = new URL(ev.oldURL).hash.replace(/^#/, ''); if (prev !== '/remarque') S.ui.fromPage = prev || '/'; } catch (e) {}
  S.ui.menu = false; S.ui.search = false; S.filter.q = '';
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
      if (next !== undefined && next !== null) { toast('Connexion réussie.'); go('#' + (next || (isAdmin() ? '/admin' : '/mon-espace'))); return; }
    }
    render();
  });
})();
// Avis : le message « choisissez une note » disparaît dès qu'une étoile est choisie
document.addEventListener('change', (e) => {
  if (e.target.name === 'rv-rating') { const el = document.getElementById('rverr'); if (el) el.hidden = true; }
});
