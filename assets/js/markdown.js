// Petit convertisseur Markdown -> HTML pour les leçons.
// Gère : titres (#, ##, ###), paragraphes, listes (- et 1.), sous-listes (2 espaces),
// tableaux, blocs de code (```), **gras**, *italique*, `code`, liens, et des encadrés :
//   > [!exemple] Titre facultatif
//   > Texte de l'encadré (Markdown accepté)
// Types d'encadrés : objectifs, exemple, astuce, attention, madagascar, retenir, exercice, definition,
// erreur (erreur fréquente et correction), projet (projet de fin de module), cle (chiffre ou idée clé).
// Schémas dessinés par le site : bloc ```schema <type> … ``` (voir SCHEMAS plus bas).
// Les sections ## sont numérotées automatiquement (1.1, 1.2…) quand on donne un numéro de module.
// Tout le texte est échappé : aucune balise HTML écrite dans une leçon n'est exécutée.

export const esc = (s) => String(s ?? '').replace(/[&<>"']/g, (m) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[m]));

export const CALLOUTS = {
  objectifs: { label: 'Objectifs du module', icon: '◎' },
  exemple: { label: 'Exemple', icon: '▸' },
  astuce: { label: 'Astuce', icon: '✦' },
  attention: { label: 'Attention', icon: '!' },
  madagascar: { label: 'Spécial Madagascar', icon: '◆' },
  retenir: { label: 'À retenir', icon: '✓' },
  exercice: { label: 'Exercice pratique', icon: '✎' },
  definition: { label: 'Définition', icon: '≡' },
  erreur: { label: 'Erreur fréquente', icon: '✕' },
  projet: { label: 'Projet du module', icon: '★' },
  cle: { label: 'À savoir', icon: 'i' },
};

// ---------------------------------------------------------------------------
// Schémas : ```schema <type>   (première ligne facultative « titre: … »)
//   etapes      Titre : texte                      (une ligne par étape)
//   cycle       Titre : texte                      (étapes qui recommencent)
//   comparaison colonnes: A | B [| C], ton: mauvais-bon (facultatif), puis « texte A | texte B »
//   entonnoir / pyramide   Titre : texte           (du haut vers le bas)
//   arbre       un élément par ligne, 2 espaces par niveau, « / » final = dossier
//   ecran       haut|gauche|centre|droite|bas: texte avec [1]… puis « [1] explication »
//   palette     #RRGGBB Nom | 60 %
//   barres      Libellé : valeur        (unite: Ar facultatif)
//   formats     Nom : 1080 x 1920
//   typo        Texte | taille en px | gras ou normal | rôle
//   contraste   #TEXTE sur #FOND
//   composition regle: tiers | z | marges   (sujet: haut-gauche… facultatif)
//   chiffres    50 % : texte
//   checklist   [x] fait   /   [ ] à faire
// ---------------------------------------------------------------------------
const HEX = /^#[0-9a-f]{6}$/i;
const kv = (l) => { const m = l.match(/^([^:]{1,40}?)\s*:\s+(.*)$/); return m ? [m[1].trim(), m[2].trim()] : [null, l.trim()]; };
const lum = (hex) => {
  const c = [1, 3, 5].map((k) => parseInt(hex.slice(k, k + 2), 16) / 255).map((v) => (v <= 0.03928 ? v / 12.92 : ((v + 0.055) / 1.055) ** 2.4));
  return 0.2126 * c[0] + 0.7152 * c[1] + 0.0722 * c[2];
};
export const contrastRatio = (a, b) => { const [x, y] = [lum(a), lum(b)].sort((m, n) => n - m); return (x + 0.05) / (y + 0.05); };
const fr = (n, d = 1) => String(Math.round(n * 10 ** d) / 10 ** d).replace('.', ',');
const badges = (t) => inline(t).replace(/\[(\d{1,2})\]/g, '<b class="sc-badge">$1</b>');

function schema(type, lines) {
  let title = '';
  const opts = {};
  const rows = [];
  for (const raw of lines) {
    if (!raw.trim()) continue;
    const m = raw.match(/^(titre|colonnes|ton|unite|regle|sujet):\s*(.*)$/i);
    if (m) { if (m[1].toLowerCase() === 'titre') title = m[2].trim(); else opts[m[1].toLowerCase()] = m[2].trim(); continue; }
    rows.push(raw);
  }
  let body = '';
  const T = type.toLowerCase();
  if (T === 'etapes' || T === 'cycle') {
    body = `<ol class="sc-steps${T === 'cycle' ? ' cycle' : ''}" style="--n:${rows.length}">${rows.map((r, i) => {
      const [k, v] = kv(r);
      return `<li style="--i:${i}"><span class="sc-num">${i + 1}</span><span class="sc-txt">${k ? `<b>${inline(k)}</b>` : ''}${v ? `<span>${inline(v)}</span>` : ''}</span></li>`;
    }).join('')}</ol>${T === 'cycle' ? '<p class="sc-loop">↻ Puis on recommence avec ce qu\'on a appris.</p>' : ''}`;
  } else if (T === 'comparaison') {
    const heads = (opts.colonnes || 'Avant | Après').split('|').map((x) => x.trim()).slice(0, 3);
    const tone = opts.ton === 'mauvais-bon' ? ['bad', 'good', 'good'] : opts.ton === 'bon-mauvais' ? ['good', 'bad', 'bad'] : ['c0', 'c1', 'c2'];
    const cols = heads.map(() => []);
    rows.forEach((r) => r.split('|').forEach((c, i) => { if (i < cols.length && c.trim()) cols[i].push(c.trim()); }));
    body = `<div class="sc-cmp" style="--n:${heads.length}">${heads.map((h, i) => `<div class="sc-col ${tone[i]}"><b class="sc-col-h">${tone[i] === 'bad' ? '✕ ' : tone[i] === 'good' ? '✓ ' : ''}${inline(h)}</b><ul>${cols[i].map((x) => `<li>${inline(x)}</li>`).join('')}</ul></div>`).join('')}</div>`;
  } else if (T === 'entonnoir' || T === 'pyramide') {
    const n = rows.length;
    body = `<ol class="sc-funnel ${T}">${rows.map((r, i) => {
      const [k, v] = kv(r);
      const w = T === 'entonnoir' ? 100 - i * (55 / Math.max(1, n - 1)) : 45 + i * (55 / Math.max(1, n - 1));
      return `<li style="--w:${Math.round(w)}%;--i:${i}"><b>${inline(k || v)}</b>${k && v ? `<span>${inline(v)}</span>` : ''}</li>`;
    }).join('')}</ol>`;
  } else if (T === 'arbre') {
    body = `<ul class="sc-tree">${rows.map((r) => {
      const depth = Math.min(6, Math.floor((r.match(/^\s*/)[0].length) / 2));
      const [raw, note] = r.trim().split(/\s+#\s+/);
      const dir = /\/$/.test(raw); const n = raw.replace(/\/$/, '');
      return `<li class="${dir ? 'dir' : 'file'}" style="--d:${depth}"><span class="sc-ic" aria-hidden="true"></span><span>${inline(n)}${dir ? '/' : ''}</span>${note ? `<small>${inline(note)}</small>` : ''}</li>`;
    }).join('')}</ul>`;
  } else if (T === 'ecran') {
    const zones = {}; const legend = [];
    rows.forEach((r) => {
      const z = r.match(/^(haut|gauche|centre|droite|bas)\s*:\s*(.*)$/i);
      if (z) zones[z[1].toLowerCase()] = z[2];
      else { const l = r.match(/^\[(\d{1,2})\]\s*(.*)$/); if (l) legend.push([l[1], l[2]]); }
    });
    const zone = (k) => (zones[k] ? `<div class="sc-z ${k}">${badges(zones[k])}</div>` : '');
    body = `<div class="sc-screen${zones.gauche ? ' has-l' : ''}${zones.droite ? ' has-r' : ''}"><div class="sc-bar" aria-hidden="true"><i></i><i></i><i></i><span>${inline(title)}</span></div>
      <div class="sc-zones">${zone('haut')}${zone('gauche')}${zone('centre')}${zone('droite')}${zone('bas')}</div></div>
      ${legend.length ? `<ol class="sc-legend">${legend.map(([n, t]) => `<li><b class="sc-badge">${n}</b><span>${inline(t)}</span></li>`).join('')}</ol>` : ''}`;
  } else if (T === 'palette') {
    const items = rows.map((r) => { const m = r.trim().match(/^(#[0-9a-fA-F]{6})\s+([^|]*?)(?:\|\s*(\d{1,3})\s*%)?\s*$/); return m && HEX.test(m[1]) ? { hex: m[1].toUpperCase(), name: m[2].trim(), pct: m[3] ? Number(m[3]) : null } : null; }).filter(Boolean);
    const bar = items.every((x) => x.pct) ? `<div class="sc-mix" aria-hidden="true">${items.map((x) => `<i style="flex:${x.pct};background:${x.hex}"></i>`).join('')}</div>` : '';
    body = `${bar}<ul class="sc-pal">${items.map((x) => `<li><i style="background:${x.hex}"></i><b>${inline(x.name)}</b><code>${x.hex}</code>${x.pct ? `<small>${x.pct} %</small>` : ''}</li>`).join('')}</ul>`;
  } else if (T === 'barres') {
    const items = rows.map((r) => { const [k, v] = kv(r); const n = Number(String(v).replace(/\s/g, '').replace(',', '.').match(/^-?[\d.]+/)?.[0]); return { k: k || '', v, n: Number.isFinite(n) ? n : 0 }; });
    const max = Math.max(1, ...items.map((x) => x.n));
    body = `<ul class="sc-bars">${items.map((x, i) => `<li style="--i:${i}"><span class="sc-bl">${inline(x.k)}</span><span class="sc-bt"><i style="width:${Math.max(2, Math.round((x.n / max) * 100))}%"></i></span><b>${inline(x.v)}${opts.unite ? ' ' + esc(opts.unite) : ''}</b></li>`).join('')}</ul>`;
  } else if (T === 'formats') {
    const items = rows.map((r) => { const [k, v] = kv(r); const m = String(v).match(/(\d+)\s*[x×]\s*(\d+)/); return m ? { k, w: +m[1], h: +m[2], v } : null; }).filter(Boolean);
    const H = 120;
    body = `<ul class="sc-formats">${items.map((x) => { const r = x.w / x.h; const h = r >= 1 ? Math.round(H / Math.min(r, 3.2)) : H; const w = Math.round(h * r);
      return `<li><span class="sc-fbox" style="width:${w}px;height:${h}px"></span><b>${inline(x.k)}</b><small>${esc(x.w)} × ${esc(x.h)} px</small></li>`; }).join('')}</ul>`;
  } else if (T === 'typo') {
    body = `<ul class="sc-typo">${rows.map((r) => { const [t, size, weight, role] = r.split('|').map((x) => (x || '').trim()); const px = Math.min(44, Math.max(10, Number(size) || 16));
      return `<li><span class="sc-ts" style="font-size:min(${px}px,${(px / 3.6).toFixed(1)}vw + 6px);font-weight:${/gras|bold/i.test(weight) ? 700 : 400}">${inline(t)}</span><small>${role ? `${inline(role)} · ` : ''}${esc(size)} px · ${/gras|bold/i.test(weight) ? 'gras' : 'normal'}</small></li>`; }).join('')}</ul>`;
  } else if (T === 'contraste') {
    body = `<ul class="sc-contrast">${rows.map((r) => { const m = r.trim().match(/^(#[0-9a-fA-F]{6})\s+sur\s+(#[0-9a-fA-F]{6})\s*(.*)$/i); if (!m) return '';
      const ratio = contrastRatio(m[1], m[2]); const ok = ratio >= 4.5 ? 'good' : ratio >= 3 ? 'mid' : 'bad';
      const verdict = ok === 'good' ? '✓ Lisible' : ok === 'mid' ? '≈ Gros titres seulement' : '✕ Illisible';
      return `<li><span class="sc-cs" style="color:${m[1]};background:${m[2]}">${m[3] ? inline(m[3]) : 'Aa Texte'}</span><span class="sc-cv ${ok}"><b>${verdict}</b><small>Contraste ${fr(ratio)} : 1 · ${m[1].toUpperCase()} sur ${m[2].toUpperCase()}</small></span></li>`; }).join('')}</ul>`;
  } else if (T === 'composition') {
    const regle = (opts.regle || 'tiers').toLowerCase();
    const pos = { 'haut-gauche': [33.3, 33.3], 'haut-droite': [66.7, 33.3], 'bas-gauche': [33.3, 66.7], 'bas-droite': [66.7, 66.7] }[(opts.sujet || '').toLowerCase()];
    let svg = '';
    if (regle === 'z') svg = '<path d="M12 14H88L12 86H88" class="sc-zpath"/><circle cx="12" cy="14" r="3.4"/><circle cx="88" cy="14" r="3.4"/><circle cx="12" cy="86" r="3.4"/><circle cx="88" cy="86" r="3.4"/><text x="12" y="8">1</text><text x="88" y="8">2</text><text x="12" y="97">3</text><text x="88" y="97">4</text>';
    else if (regle === 'marges') svg = '<rect x="10" y="10" width="80" height="80" class="sc-margin"/><rect x="18" y="20" width="64" height="14" class="sc-blk"/><rect x="18" y="40" width="40" height="5" class="sc-ln"/><rect x="18" y="49" width="52" height="5" class="sc-ln"/><rect x="18" y="58" width="46" height="5" class="sc-ln"/><rect x="18" y="72" width="26" height="9" class="sc-cta"/>';
    else svg = '<line x1="33.3" y1="0" x2="33.3" y2="100"/><line x1="66.7" y1="0" x2="66.7" y2="100"/><line x1="0" y1="33.3" x2="100" y2="33.3"/><line x1="0" y1="66.7" x2="100" y2="66.7"/>' +
      [[33.3, 33.3], [66.7, 33.3], [33.3, 66.7], [66.7, 66.7]].map(([x, y]) => `<circle cx="${x}" cy="${y}" r="${pos && pos[0] === x && pos[1] === y ? 7 : 2.6}" class="${pos && pos[0] === x && pos[1] === y ? 'sc-subj' : ''}"/>`).join('');
    body = `<div class="sc-comp ${regle}"><svg viewBox="0 0 100 100" preserveAspectRatio="none" aria-hidden="true">${svg}</svg></div>${rows.length ? `<ul class="sc-notes">${rows.map((r) => `<li>${inline(r.trim())}</li>`).join('')}</ul>` : ''}`;
  } else if (T === 'chiffres') {
    body = `<ul class="sc-kpis">${rows.map((r, i) => { const [k, v] = kv(r); return `<li style="--i:${i}"><b>${inline(k || '')}</b><span>${inline(v)}</span></li>`; }).join('')}</ul>`;
  } else if (T === 'checklist') {
    body = `<ul class="sc-check">${rows.map((r) => { const m = r.trim().match(/^\[( |x|X)\]\s*(.*)$/); const done = m && m[1].toLowerCase() === 'x';
      return `<li class="${done ? 'on' : ''}"><span class="sc-box" aria-hidden="true"></span><span>${inline(m ? m[2] : r.trim())}</span></li>`; }).join('')}</ul>`;
  } else {
    return `<pre class="md-code"><code>${esc(lines.join('\n'))}</code></pre>`;
  }
  return `<figure class="sc sc-${esc(T)}">${title && T !== 'ecran' ? `<figcaption>${inline(title)}</figcaption>` : ''}${body}</figure>`;
}

// Espaces insécables du français : jamais de « ? », « ! », « : », « ; » ou « » » seul en début de ligne.
export const nbsp = (html) => String(html).replace(/ ([?!;:»])/g, '\u00a0$1').replace(/« /g, '«\u00a0');
function inline(text) {
  let s = esc(text);
  s = s.replace(/`([^`]+)`/g, '<code>$1</code>');
  s = s.replace(/\*\*([^*]+)\*\*/g, '<strong>$1</strong>');
  s = s.replace(/(^|[\s(«])\*([^*\s][^*]*)\*/g, '$1<em>$2</em>');
  s = s.replace(/\[([^\]]+)\]\((https?:\/\/[^\s)]+)\)/g, '<a href="$2" target="_blank" rel="noopener">$1</a>');
  return nbsp(s);
}

const cells = (line) => line.trim().replace(/^\|/, '').replace(/\|$/, '').split('|').map((c) => c.trim());
const LIST = /^(\s*)([-*]|\d+[.)])\s+(.*)$/;

// Liste (avec sous-listes indentées d'au moins 2 espaces).
function list(lines, i) {
  const first = lines[i].match(LIST);
  const base = first[1].length;
  const ordered = /\d/.test(first[2]);
  const start = ordered ? parseInt(first[2], 10) : 1;
  const items = [];
  while (i < lines.length) {
    const m = lines[i].match(LIST);
    if (!m || m[1].length < base) break;
    if (m[1].length > base) {
      const sub = list(lines, i);
      if (items.length) items[items.length - 1] += sub.html;
      i = sub.i; continue;
    }
    if (/\d/.test(m[2]) !== ordered) break;
    items.push(inline(m[3]));
    i++;
  }
  const tag = ordered ? 'ol' : 'ul';
  const startAttr = ordered && start !== 1 ? ` start="${start}"` : '';
  return { html: `<${tag}${startAttr}>${items.map((t) => `<li>${t}</li>`).join('')}</${tag}>`, i };
}

/**
 * @param {string} src Markdown
 * @param {{number?: number}} [opts] numéro du module, pour numéroter les sections ## (1.1, 1.2…)
 */
export function md(src, opts = {}) {
  const lines = String(src ?? '').replace(/\r\n/g, '\n').split('\n');
  const out = [];
  let section = 0;
  let i = 0;
  while (i < lines.length) {
    const line = lines[i];
    if (!line.trim()) { i++; continue; }

    // Bloc de code : ``` … ```, ou schéma : ```schema <type>
    if (/^\s*```/.test(line)) {
      const sc = line.match(/^\s*```\s*schema\s+([a-z]+)\s*$/i);
      const code = [];
      i++;
      while (i < lines.length && !/^\s*```/.test(lines[i])) { code.push(lines[i]); i++; }
      i++; // ligne de fermeture
      out.push(sc ? schema(sc[1], code) : `<pre class="md-code"><code>${esc(code.join('\n'))}</code></pre>`);
      continue;
    }

    // Encadré : > [!type] Titre
    const co = line.match(/^>\s*\[!(\w+)\]\s*(.*)$/);
    if (co) {
      const type = CALLOUTS[co[1].toLowerCase()] ? co[1].toLowerCase() : 'astuce';
      const inner = [];
      i++;
      while (i < lines.length && /^>/.test(lines[i])) { inner.push(lines[i].replace(/^>\s?/, '')); i++; }
      const title = co[2].trim() || CALLOUTS[type].label;
      out.push(`<aside class="callout ${type}"><div class="callout-h"><span class="callout-i" aria-hidden="true">${CALLOUTS[type].icon}</span>${inline(title)}</div>${md(inner.join('\n'))}</aside>`);
      continue;
    }
    if (/^>\s?/.test(line)) {
      const inner = [];
      while (i < lines.length && /^>/.test(lines[i])) { inner.push(lines[i].replace(/^>\s?/, '')); i++; }
      out.push(`<blockquote>${md(inner.join('\n'))}</blockquote>`);
      continue;
    }

    const h = line.match(/^(#{1,3})\s+(.*)$/);
    if (h) {
      const level = Math.max(2, h[1].length); // # et ## -> h2 (le h1 est le titre de la page), ### -> h3
      if (level === 2 && opts.number) {
        section++;
        out.push(`<h2 id="s-${opts.number}-${section}"><span class="sec-num">${opts.number}.${section}</span>${inline(h[2])}</h2>`);
      } else {
        out.push(`<h${level}>${inline(h[2])}</h${level}>`);
      }
      i++; continue;
    }

    if (/^\s*\|/.test(line) && i + 1 < lines.length && /^\s*\|?\s*:?-{3,}/.test(lines[i + 1])) {
      const head = cells(line);
      i += 2;
      const rows = [];
      while (i < lines.length && /^\s*\|/.test(lines[i])) { rows.push(cells(lines[i])); i++; }
      out.push(`<div class="md-table cols-${Math.min(head.length, 5)}" tabindex="0"><table><thead><tr>` + head.map((c) => `<th>${inline(c)}</th>`).join('') +
        '</tr></thead><tbody>' + rows.map((r) => '<tr>' + r.map((c) => `<td>${inline(c)}</td>`).join('') + '</tr>').join('') +
        '</tbody></table></div>');
      continue;
    }

    if (LIST.test(line)) {
      const r = list(lines, i);
      out.push(r.html); i = r.i;
      continue;
    }

    const para = [];
    while (i < lines.length && lines[i].trim() && !/^(#{1,3}\s|>|\s*\||\s*```)/.test(lines[i]) && !LIST.test(lines[i])) { para.push(lines[i].trim()); i++; }
    if (para.length) out.push(`<p>${inline(para.join(' '))}</p>`);
    else { out.push(`<p>${inline(line)}</p>`); i++; }
  }
  return out.join('\n');
}

// Titres des sections ## d'une leçon (pour le sommaire et le programme). Les blocs de code sont ignorés.
export function sections(src) {
  let inCode = false;
  return String(src ?? '').split('\n').filter((l) => { if (/^\s*```/.test(l)) { inCode = !inCode; return false; } return !inCode && /^#{1,2}\s+/.test(l); })
    .map((l) => l.replace(/^#{1,2}\s+/, '').replace(/\*\*/g, '').trim());
}

// Temps de lecture estimé, en minutes (160 mots par minute ; 120 pour une leçon d'apprentissage).
export function readingMinutes(src, wpm = 160) {
  const words = String(src ?? '').split(/\s+/).filter(Boolean).length;
  return Math.max(3, Math.round(words / wpm));
}
