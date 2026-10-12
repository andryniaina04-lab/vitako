// Petit convertisseur Markdown -> HTML pour les leçons.
// Gère : titres (#, ##, ###), paragraphes, listes (- et 1.), sous-listes (2 espaces),
// tableaux, blocs de code (```), **gras**, *italique*, `code`, liens, et des encadrés :
//   > [!exemple] Titre facultatif
//   > Texte de l'encadré (Markdown accepté)
// Types d'encadrés : objectifs, exemple, astuce, attention, madagascar, retenir, exercice, definition.
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
};

function inline(text) {
  let s = esc(text);
  s = s.replace(/`([^`]+)`/g, '<code>$1</code>');
  s = s.replace(/\*\*([^*]+)\*\*/g, '<strong>$1</strong>');
  s = s.replace(/(^|[\s(«])\*([^*\s][^*]*)\*/g, '$1<em>$2</em>');
  s = s.replace(/\[([^\]]+)\]\((https?:\/\/[^\s)]+)\)/g, '<a href="$2" target="_blank" rel="noopener">$1</a>');
  return s;
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

    // Bloc de code : ``` … ```
    if (/^\s*```/.test(line)) {
      const code = [];
      i++;
      while (i < lines.length && !/^\s*```/.test(lines[i])) { code.push(lines[i]); i++; }
      i++; // ligne de fermeture
      out.push(`<pre class="md-code"><code>${esc(code.join('\n'))}</code></pre>`);
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
      out.push('<div class="md-table"><table><thead><tr>' + head.map((c) => `<th>${inline(c)}</th>`).join('') +
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

// Titres des sections ## d'une leçon (pour le sommaire et le programme).
export function sections(src) {
  return String(src ?? '').split('\n').filter((l) => /^#{1,2}\s+/.test(l)).map((l) => l.replace(/^#{1,2}\s+/, '').replace(/\*\*/g, '').trim());
}

// Temps de lecture estimé, en minutes.
export function readingMinutes(src) {
  const words = String(src ?? '').split(/\s+/).filter(Boolean).length;
  return Math.max(3, Math.round(words / 160));
}
