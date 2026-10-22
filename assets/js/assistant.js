// Assistant Vitako : bulle d'aide en bas à droite, avec des réponses préparées (pas d'IA).
// Pour ajouter ou modifier une question : éditer FAQ ci-dessous. Les mots de « k » servent à la recherche.
(() => {
  const CFG = window.VITAKO_CONFIG || {};
  const fmt = (n) => new Intl.NumberFormat('fr-FR').format(n).replace(/ | /g, ' ') + ' Ar';
  const promoOn = () => CFG.promoPrice && CFG.promoUntil && new Date().toISOString().slice(0, 10) <= CFG.promoUntil;
  const promoEnd = () => { const [y, m, d] = (CFG.promoUntil || '').split('-'); return `${+d} ${['janvier', 'février', 'mars', 'avril', 'mai', 'juin', 'juillet', 'août', 'septembre', 'octobre', 'novembre', 'décembre'][m - 1]} ${y}`; };
  const days = CFG.accessDays || 30;
  const price = () => promoOn()
    ? `<b>${fmt(CFG.promoPrice)}</b> pour ${days} jours (prix de lancement jusqu'au ${promoEnd()}, au lieu de ${fmt(CFG.price)})`
    : `<b>${fmt(CFG.price)}</b> pour ${days} jours`;
  const ops = () => (CFG.operators || []).map((o) => `<li><b>${o.name}</b> : <span class="va-mono">${o.number}</span>, au nom de ${o.holder}</li>`).join('');
  const link = (href, label) => `<a href="${href}" data-va-close>${label}</a>`;

  const CATS = [
    { id: 'site', icon: '👋', label: 'Découvrir Vitako' },
    { id: 'compte', icon: '👤', label: 'Inscription et compte' },
    { id: 'paiement', icon: '💳', label: 'Abonnement et paiement' },
    { id: 'formation', icon: '📚', label: 'Déroulement des formations' },
    { id: 'attestation', icon: '🎓', label: 'Examen et attestation' },
  ];

  const FAQ = [
    // Découvrir Vitako
    { c: 'site', q: "C'est quoi Vitako ?", k: 'vitako site presentation quoi',
      a: () => `Vitako est une plateforme de formation en ligne pour apprendre un métier du freelance et du télétravail depuis Madagascar : graphiste, monteur vidéo, rédacteur web, community manager, assistant virtuel, développeur et beaucoup d'autres.<br><br>Chaque formation contient des leçons courtes, des exemples de Madagascar, des exercices pratiques, un examen final et une <b>attestation vérifiable</b> à montrer à vos clients.` },
    { c: 'site', q: 'Quelles formations sont proposées ?', k: 'formations liste metiers domaines catalogue',
      a: () => `Plus de 100 formations dans 13 domaines : design, vidéo, rédaction et langues, marketing digital, développement web, data et IA, assistance, gestion, démarrer en freelance, compétences numériques, développement personnel…<br><br>La plupart des métiers ont deux niveaux : <b>Fondamentaux</b> puis <b>Avancé</b>.<br><br>${link('#/formations', 'Voir toutes les formations')}` },
    { c: 'site', q: 'Y a-t-il une formation gratuite ?', k: 'gratuit gratuite free essai offert',
      a: () => `Oui ! La formation <b>« Comment devenir freelance »</b> est gratuite pour toute personne qui crée un compte. Elle explique le travail en ligne, les métiers, ce qu'on peut gagner et comment démarrer.<br><br>Les leçons sont libres. L'examen final et l'attestation demandent un abonnement.<br><br>${link('#/formation/free-1-f', 'Voir la formation gratuite')}` },
    { c: 'site', q: 'Faut-il un ordinateur ?', k: 'ordinateur telephone smartphone materiel internet connexion',
      a: () => `Vous pouvez lire les leçons et faire les tests sur un téléphone. Le site est léger et fonctionne avec une connexion mobile.<br><br>Pour les exercices pratiques de certains métiers (design, montage vidéo, développement), un ordinateur est vivement conseillé.` },
    { c: 'site', q: 'Le diplôme est-il reconnu par l\'État ?', k: 'diplome reconnu etat officiel certificat',
      a: () => `Non, l'attestation Vitako n'est pas un diplôme d'État. C'est une <b>preuve vérifiable</b> que vous avez suivi la formation et réussi l'examen : chaque attestation a un numéro unique que vos clients peuvent vérifier en ligne.<br><br>Dans le freelance, ce qui compte surtout pour un client, c'est votre portfolio et la preuve de vos compétences.` },
    { c: 'site', q: "C'est quoi l'Accompagnement ?", k: 'accompagnement formateur coach aide mentor',
      a: () => `La page Accompagnement présente des formateurs et professionnels vérifiés par Vitako. Une fois connecté, vous voyez leurs contacts (WhatsApp, téléphone, e-mail) pour leur demander un suivi personnalisé.<br><br>${link('#/accompagnement', "Voir l'Accompagnement")}` },

    // Inscription et compte
    { c: 'compte', q: 'Comment créer un compte ?', k: 'inscription inscrire creer compte',
      a: () => `1. Cliquez sur <b>Créer un compte</b> en haut de la page.<br>2. Entrez votre nom complet (il apparaîtra sur vos attestations), votre e-mail et un mot de passe.<br>3. Ouvrez l'e-mail de confirmation reçu et cliquez sur le lien.<br><br>Créer un compte est gratuit.<br><br>${link('#/inscription', 'Créer un compte')}` },
    { c: 'compte', q: "Je n'ai pas reçu l'e-mail de confirmation", k: 'email mail confirmation recu pas spam',
      a: () => `Vérifiez d'abord le dossier <b>Spam</b> ou <b>Promotions</b> de votre boîte mail, puis attendez quelques minutes.<br><br>Vérifiez aussi que l'adresse e-mail a été écrite sans faute. Si rien n'arrive après 15 minutes, ${link('#/remarque', 'écrivez-nous')} en indiquant votre adresse e-mail.` },
    { c: 'compte', q: "J'ai oublié mon mot de passe", k: 'mot de passe oublie perdu reinitialiser connexion',
      a: () => `Allez sur la page de connexion et cliquez sur <b>Mot de passe oublié ?</b>. Entrez votre e-mail : vous recevrez un lien pour choisir un nouveau mot de passe.<br><br>${link('#/mot-de-passe-oublie', 'Réinitialiser mon mot de passe')}` },
    { c: 'compte', q: 'Comment changer mon nom ?', k: 'changer nom modifier profil',
      a: () => `Allez dans ${link('#/mon-espace', 'Mon espace')}, rubrique <b>Mon profil</b>, et modifiez votre nom complet.<br><br>Le nouveau nom s'applique aux prochaines attestations. Celles déjà délivrées gardent le nom d'origine.` },

    // Abonnement et paiement
    { c: 'paiement', q: "Combien coûte l'abonnement ?", k: 'prix tarif cout combien abonnement',
      a: () => `L'abonnement coûte ${price()}.<br><br>Il donne accès à <b>toutes les formations</b>, aux tests et examens illimités, et à une attestation pour chaque formation réussie.<br><br>${link('#/abonnement', "S'abonner")}` },
    { c: 'paiement', q: 'Comment payer ?', k: 'payer paiement mvola orange money mobile comment',
      a: () => `Le paiement se fait par <b>Mobile Money</b> :<ul>${ops()}</ul>1. Connectez-vous et allez sur la page ${link('#/abonnement', 'Abonnement')}.<br>2. Choisissez votre opérateur et envoyez le montant au numéro affiché.<br>3. Copiez la <b>référence de la transaction</b> depuis le SMS de confirmation et collez-la dans le formulaire.<br>4. Nous vérifions et activons votre accès, en général en ${CFG.validationDelay || 'quelques minutes'}. Vous recevez un e-mail de confirmation.` },
    { c: 'paiement', q: 'Où trouver la référence de transaction ?', k: 'reference transaction sms code',
      a: () => `La référence se trouve dans le <b>SMS de confirmation</b> envoyé par MVola ou Orange Money juste après votre paiement. Elle est faite de lettres, de chiffres et parfois de points.<br><br>Copiez-la exactement comme dans le SMS.` },
    { c: 'paiement', q: "J'ai payé mais mon accès n'est pas activé", k: 'paye active acces attente validation pas encore',
      a: () => `Après l'envoi de votre référence, nous vérifions la réception du paiement puis activons votre accès, en général en ${CFG.validationDelay || 'quelques minutes'}. Vous recevez un e-mail dès que c'est fait.<br><br>Si votre paiement est refusé, la raison s'affiche sur la page ${link('#/abonnement', 'Abonnement')} (référence introuvable, montant incorrect…). Vérifiez la référence dans votre SMS et renvoyez-la.` },
    { c: 'paiement', q: "L'abonnement se renouvelle-t-il tout seul ?", k: 'renouvellement automatique engagement prelevement resilier',
      a: () => `Non. Il n'y a <b>aucun prélèvement automatique</b> et aucun engagement : votre accès s'arrête seul au bout de ${days} jours.<br><br>Pour continuer, il suffit de payer à nouveau. Si vous payez avant la fin, les ${days} jours s'ajoutent à ceux qui restent.` },
    { c: 'paiement', q: "Que se passe-t-il à la fin de l'abonnement ?", k: 'fin expire termine abonnement attestations perdues',
      a: () => `L'accès aux cours, aux tests et aux examens s'arrête. Vos <b>attestations restent disponibles</b> et vérifiables en ligne, même sans abonnement.<br><br>Votre progression est gardée : si vous vous réabonnez, vous reprenez là où vous en étiez.` },

    // Déroulement des formations
    { c: 'formation', q: 'Comment se déroule une formation ?', k: 'deroulement fonctionnement modules lecons etapes',
      a: () => `Chaque formation est découpée en <b>modules</b>. Chaque module contient :<ul><li>des leçons courtes, avec des exemples de Madagascar</li><li>un petit test (QCM) pour vérifier ce que vous avez compris</li><li>un exercice pratique pour votre portfolio</li></ul>Quand tous les tests sont rendus, l'<b>examen final</b> s'ouvre. Si vous le réussissez, vous obtenez votre attestation.` },
    { c: 'formation', q: 'Combien de temps dure une formation ?', k: 'duree temps heures combien long',
      a: () => `Chaque formation affiche sa durée en heures (lecture, tests, exercices et examen). Selon le métier, comptez de 10 à 50 heures environ.<br><br>Vous avancez <b>à votre rythme</b> : il n'y a pas d'horaire, vous pouvez vous arrêter et reprendre quand vous voulez.` },
    { c: 'formation', q: 'Fondamentaux ou Avancé : par quoi commencer ?', k: 'niveau fondamentaux avance debutant commencer',
      a: () => `Commencez par <b>Fondamentaux</b> si vous débutez dans le métier. Le niveau <b>Avancé</b> approfondit le métier pour ceux qui ont déjà les bases.<br><br>Si vous réussissez les deux niveaux d'un même métier, vous obtenez en plus une <b>attestation de parcours complet</b>.` },
    { c: 'formation', q: 'Puis-je suivre plusieurs formations en même temps ?', k: 'plusieurs formations meme temps nombre limite',
      a: () => `Oui. Avec l'abonnement, vous avez accès à <b>toutes les formations sans limite</b>. Vous pouvez en suivre plusieurs en parallèle.<br><br>Pour progresser vite, nous conseillons quand même de vous concentrer sur un métier à la fois.` },
    { c: 'formation', q: 'Ma progression est-elle sauvegardée ?', k: 'progression sauvegarde reprendre perdu',
      a: () => `Oui. Votre progression est enregistrée dans votre compte : vous pouvez changer d'appareil (téléphone, ordinateur) et reprendre là où vous en étiez.` },

    // Examen et attestation
    { c: 'attestation', q: "Comment se passe l'examen final ?", k: 'examen final questions note reussir',
      a: () => `L'examen s'ouvre quand tous les tests de la formation sont rendus.<ul><li>Des questions à choix multiples tirées au hasard</li><li><b>50/100</b> pour réussir</li><li>Vous avez 3 heures pour rendre vos réponses</li></ul>` },
    { c: 'attestation', q: "Que se passe-t-il si je rate l'examen ?", k: 'rater echouer echec repasser essais',
      a: () => `Pas de souci : les <b>essais sont illimités</b>. Relisez les leçons concernées et repassez l'examen. Votre meilleur score est conservé.` },
    { c: 'attestation', q: 'Comment obtenir mon attestation ?', k: 'attestation obtenir telecharger pdf certificat',
      a: () => `Dès que vous réussissez l'examen final, votre attestation est créée. Vous la retrouvez dans ${link('#/mon-espace', 'Mon espace')} et pouvez la <b>télécharger en PDF</b>.<br><br>Elle porte votre nom, la formation, votre score et un numéro unique.` },
    { c: 'attestation', q: 'Comment un client vérifie mon attestation ?', k: 'verifier verification client numero authentique',
      a: () => `Chaque attestation a un numéro unique (par exemple VTK-2026-4F9A2C). Votre client le saisit sur la page de vérification et voit si l'attestation a bien été délivrée par Vitako.<br><br>${link('#/verifier', 'Vérifier une attestation')}` },
    { c: 'attestation', q: 'La formation gratuite donne-t-elle une attestation ?', k: 'gratuite attestation examen abonnement free',
      a: () => `Les leçons de « Comment devenir freelance » sont gratuites. Pour passer l'examen final et obtenir l'attestation, il faut un abonnement, qui donne aussi accès à toutes les autres formations.<br><br>${link('#/abonnement', "S'abonner")}` },
  ];

  const norm = (s) => s.toLowerCase().normalize('NFD').replace(/[̀-ͯ]/g, '').replace(/[^a-z0-9 ]/g, ' ');
  const STOP = new Set('je j ai le la les un une des de du d l a au aux et ou est ce c que qui quoi comment pour pas mon ma mes on il y en se sur dans faut peut puis vous votre'.split(' '));
  const words = (s) => norm(s).split(/\s+/).filter((w) => w.length > 1 && !STOP.has(w));
  function search(text) {
    const qw = words(text);
    if (!qw.length) return [];
    return FAQ.map((f, i) => {
      const hay = words(f.q + ' ' + f.k);
      const score = qw.reduce((s, w) => s + (hay.some((h) => h === w) ? 3 : hay.some((h) => h.startsWith(w.slice(0, 5)) || w.startsWith(h.slice(0, 5))) ? 1 : 0), 0);
      return { i, score };
    }).filter((r) => r.score > 0).sort((a, b) => b.score - a.score).slice(0, 4).map((r) => r.i);
  }

  const css = `
  .va-fab{position:fixed;right:18px;bottom:calc(18px + env(safe-area-inset-bottom,0px));z-index:60;width:58px;height:58px;border-radius:50%;border:0;cursor:pointer;background:var(--accent);color:var(--accent-ink);box-shadow:0 10px 26px rgba(0,0,0,.25);display:grid;place-items:center;transition:transform .2s}
  .va-fab:hover{transform:scale(1.06)}.va-fab svg{width:32px;height:32px}
  .va-fab .va-dot{position:absolute;top:4px;right:4px;width:12px;height:12px;border-radius:50%;background:#F0C04C;border:2px solid var(--surface)}
  .va-panel{position:fixed;right:18px;bottom:calc(88px + env(safe-area-inset-bottom,0px));z-index:61;width:380px;max-width:calc(100vw - 32px);height:min(600px,calc(100vh - 120px));background:var(--surface);color:var(--ink);border:1px solid var(--line);border-radius:18px;box-shadow:0 24px 60px rgba(0,0,0,.28);display:flex;flex-direction:column;overflow:hidden;font-family:var(--body)}
  .va-head{display:flex;align-items:center;gap:12px;padding:14px 16px;background:#0B3D2A;color:#fff}
  .va-av{width:40px;height:40px;border-radius:50%;background:#3CC48E;color:#04140C;display:grid;place-items:center;flex:none;position:relative}
  .va-av svg{width:22px;height:22px}.va-av::after{content:"";position:absolute;right:0;bottom:0;width:10px;height:10px;border-radius:50%;background:#7CF0B8;border:2px solid #0B3D2A}
  .va-head b{display:block;font-size:1rem}.va-head small{opacity:.8;font-size:.78rem}
  .va-x{margin-left:auto;background:none;border:0;color:#fff;cursor:pointer;padding:6px;border-radius:8px}.va-x:hover{background:rgba(255,255,255,.12)}
  .va-body{flex:1;overflow-y:auto;padding:16px;display:flex;flex-direction:column;gap:10px}
  .va-msg{max-width:88%;padding:10px 13px;border-radius:14px;font-size:.93rem;line-height:1.5;background:var(--bg);border:1px solid var(--line);align-self:flex-start}
  .va-msg ul{margin:6px 0;padding-left:18px}.va-msg a{font-weight:600}
  .va-msg.me{align-self:flex-end;background:var(--accent);color:var(--accent-ink);border-color:transparent}
  .va-mono{font-family:var(--mono);font-size:.88em}
  .va-chips{display:flex;flex-wrap:wrap;gap:7px}
  .va-chip{border:1px solid var(--line);background:var(--surface);color:var(--ink);border-radius:999px;padding:7px 12px;font:600 .85rem var(--body);cursor:pointer;text-align:left}
  .va-chip:hover{border-color:var(--accent);color:var(--accent)}
  .va-chip.alt{border-style:dashed;color:var(--muted)}
  .va-foot{border-top:1px solid var(--line);padding:10px 12px;display:flex;gap:8px;background:var(--surface)}
  .va-foot input{flex:1;min-width:0;border:1px solid var(--line);border-radius:999px;padding:10px 14px;font:inherit;font-size:.92rem;background:var(--bg);color:var(--ink)}
  .va-foot input:focus{outline:2px solid var(--accent);outline-offset:0;border-color:transparent}
  .va-send{width:42px;height:42px;border-radius:50%;border:0;background:var(--accent);color:var(--accent-ink);cursor:pointer;display:grid;place-items:center;flex:none}
  .va-note{font-size:.72rem;color:var(--muted);text-align:center;padding:0 12px 8px}
  @media (max-width:560px){.va-panel{right:8px;left:8px;width:auto;max-width:none;bottom:calc(84px + env(safe-area-inset-bottom,0px));height:calc(100vh - 110px)}.va-fab{right:14px;bottom:calc(14px + env(safe-area-inset-bottom,0px))}}
  @media print{.va-fab,.va-panel{display:none!important}}`;
  const st = document.createElement('style'); st.textContent = css; document.head.appendChild(st);

  const ICON_CHAT = '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linejoin="round"><path d="M7.34 18.87A9 9 0 1 0 4.71 16L3 21z"/><circle cx="8.3" cy="11.5" r="1.1"/><circle cx="12.5" cy="11.5" r="1.1"/><circle cx="16.7" cy="11.5" r="1.1"/></svg>';
  const ICON_X = '<svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round"><path d="M6 6l12 12M18 6L6 18"/></svg>';
  const ICON_SEND = '<svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 2L11 13M22 2l-7 20-4-9-9-4z"/></svg>';

  const fab = document.createElement('button');
  fab.className = 'va-fab'; fab.type = 'button'; fab.setAttribute('aria-label', "Ouvrir l'aide Vitako"); fab.setAttribute('aria-expanded', 'false');
  let seen = false; try { seen = localStorage.getItem('va-seen') === '1'; } catch (e) {}
  fab.innerHTML = ICON_CHAT + (seen ? '' : '<span class="va-dot"></span>');
  const panel = document.createElement('div');
  panel.className = 'va-panel'; panel.hidden = true; panel.setAttribute('role', 'dialog'); panel.setAttribute('aria-label', 'Aide Vitako');
  panel.innerHTML = `<div class="va-head"><span class="va-av">${ICON_CHAT}</span><div><b>Aide Vitako</b><small>Réponses aux questions fréquentes</small></div><button class="va-x" type="button" aria-label="Fermer">${ICON_X}</button></div>
    <div class="va-body" aria-live="polite"></div>
    <form class="va-foot"><input type="text" placeholder="Écrivez votre question…" aria-label="Votre question" maxlength="200"><button class="va-send" type="submit" aria-label="Envoyer">${ICON_SEND}</button></form>
    <div class="va-note">Réponses préparées par l'équipe Vitako</div>`;
  document.body.append(fab, panel);
  const body = panel.querySelector('.va-body');
  const input = panel.querySelector('input');

  const add = (html, me) => { const d = document.createElement('div'); d.className = 'va-msg' + (me ? ' me' : ''); d.innerHTML = html; body.appendChild(d); return d; };
  const chips = (items) => { const d = document.createElement('div'); d.className = 'va-chips'; d.innerHTML = items.map(([act, val, label, alt]) => `<button type="button" class="va-chip${alt ? ' alt' : ''}" data-va="${act}" data-v="${val}">${label}</button>`).join(''); body.appendChild(d); };
  const scroll = (el) => requestAnimationFrame(() => { body.scrollTop = el ? el.offsetTop - 12 : body.scrollHeight; });
  const esc = (s) => s.replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]));
  const home = () => chips(CATS.map((c) => ['cat', c.id, `${c.icon} ${c.label}`]));
  const more = (cat) => chips([...(cat ? [['cat', cat, 'Autres questions de ce thème', true]] : []), ['home', '', 'Voir tous les thèmes', true], ['contact', '', 'Écrire à l\'équipe', true]]);

  function start() {
    body.innerHTML = '';
    add('👋 Bonjour ! Je réponds aux questions fréquentes sur Vitako : inscription, abonnement, paiement, formations et attestations.');
    add('Choisissez un thème ou écrivez votre question :');
    home();
  }
  function showCat(id) {
    const c = CATS.find((x) => x.id === id); if (!c) return;
    const m = add(`${c.icon} ${c.label}`, true);
    chips(FAQ.map((f, i) => [f.c === id ? 'q' : '', i, esc(f.q)]).filter((x) => x[0]));
    scroll(m);
  }
  function showQ(i) {
    const f = FAQ[i]; if (!f) return;
    const m = add(esc(f.q), true);
    add(f.a());
    more(f.c);
    scroll(m);
  }
  function ask(text) {
    const m = add(esc(text), true);
    const hits = search(text);
    if (hits.length === 1) { add(FAQ[hits[0]].a()); more(FAQ[hits[0]].c); }
    else if (hits.length) { add('Voici les questions qui correspondent le mieux :'); chips(hits.map((i) => ['q', i, esc(FAQ[i].q)])); more(); }
    else { add("Je n'ai pas trouvé de réponse préparée à cette question. Choisissez un thème, ou envoyez votre question à l'équipe Vitako : nous vous répondrons."); home(); chips([['contact', '', "Écrire à l'équipe", true]]); }
    scroll(m);
  }

  const open = (on) => {
    panel.hidden = !on; fab.setAttribute('aria-expanded', String(on));
    fab.innerHTML = on ? ICON_X : ICON_CHAT;
    if (on) { try { localStorage.setItem('va-seen', '1'); } catch (e) {} if (!body.children.length) start(); if (matchMedia('(min-width:561px)').matches) input.focus(); }
  };
  fab.addEventListener('click', () => open(panel.hidden));
  panel.querySelector('.va-x').addEventListener('click', () => open(false));
  document.addEventListener('keydown', (e) => { if (e.key === 'Escape' && !panel.hidden) open(false); });
  panel.querySelector('form').addEventListener('submit', (e) => { e.preventDefault(); const t = input.value.trim(); if (!t) return; input.value = ''; ask(t); });
  body.addEventListener('click', (e) => {
    if (e.target.closest('[data-va-close]')) { open(false); return; }
    const b = e.target.closest('[data-va]'); if (!b) return;
    const a = b.dataset.va, v = b.dataset.v;
    if (a === 'cat') showCat(v);
    else if (a === 'q') showQ(+v);
    else if (a === 'home') { const m = add('Voir tous les thèmes', true); home(); scroll(m); }
    else if (a === 'contact') { open(false); location.hash = '#/remarque'; }
  });

  // Cachée pendant un examen et dans l'administration, pour ne pas gêner.
  const sync = () => { const h = location.hash; const hide = /\/examen$|^#\/admin/.test(h); fab.hidden = hide; if (hide) open(false); };
  addEventListener('hashchange', sync); sync();
})();
