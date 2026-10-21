// Attestation au format PDF A4 paysage (bibliothèque jsPDF chargée dans index.html).

// Les polices de base de jsPDF ne gèrent pas certains caractères : on les remplace.
const clean = (s) => String(s ?? '')
  .replace(/[’‘]/g, "'").replace(/[“”]/g, '"')
  .replace(/[–-]/g, '-').replace(/[  ]/g, ' ').replace(/…/g, '...');

export function slug(s) {
  return clean(s).toLowerCase().normalize('NFD').replace(/[̀-ͯ]/g, '').replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '');
}

// Polices intégrées au PDF (Liberation, licence OFL). Sans elles, chaque lecteur PDF
// remplace Helvetica/Times par ses propres polices : textes en italique, décalés…
// Elles ne sont téléchargées qu'au premier clic sur « Télécharger en PDF ».
const FONT_FILES = {
  sans: { normal: 'LiberationSans-Regular.ttf', bold: 'LiberationSans-Bold.ttf' },
  serif: { bold: 'LiberationSerif-Bold.ttf', italic: 'LiberationSerif-Italic.ttf', bolditalic: 'LiberationSerif-BoldItalic.ttf' },
};
let fontCache = null;
function toBase64(buf) {
  const bytes = new Uint8Array(buf);
  let bin = '';
  for (let i = 0; i < bytes.length; i += 0x8000) bin += String.fromCharCode.apply(null, bytes.subarray(i, i + 0x8000));
  return btoa(bin);
}
export async function loadPdfFonts() {
  if (fontCache) return fontCache;
  const base = new URL('../fonts/', import.meta.url);
  const entries = [];
  for (const [family, styles] of Object.entries(FONT_FILES)) {
    for (const [style, file] of Object.entries(styles)) entries.push([family, style, file]);
  }
  const loaded = await Promise.all(entries.map(async ([family, style, file]) => {
    const res = await fetch(new URL(file, base));
    if (!res.ok) throw new Error('police ' + file);
    return { family, style, file, data: toBase64(await res.arrayBuffer()) };
  }));
  fontCache = loaded;
  return loaded;
}
let logoCache = null;
// Logo officiel en PNG (le PDF ne sait pas dessiner le SVG). En cas d'échec, on dessine l'ancien logo.
export async function loadPdfLogo() {
  if (logoCache) return logoCache;
  const res = await fetch(new URL('../img/logo/vitako-logo-horizontal.png', import.meta.url));
  if (!res.ok) throw new Error('logo');
  logoCache = 'data:image/png;base64,' + toBase64(await res.arrayBuffer());
  return logoCache;
}
const FAMILY = { helvetica: 'sans', times: 'serif' };
let embedded = new Set();
// Choisit la police intégrée si elle existe, sinon la police standard de jsPDF.
function font(d, family, style) {
  const key = `${FAMILY[family]}:${style}`;
  if (embedded.has(key)) d.setFont(`vitako-${FAMILY[family]}`, style);
  else d.setFont(family, style);
}

const GREEN = [11, 122, 85];
const GREEN_DARK = [8, 74, 52];
const GOLD = [176, 128, 30];
const GOLD_LIGHT = [214, 176, 92];
const CREAM = [252, 249, 240];
const INK = [24, 36, 30];
const MUTED = [96, 108, 100];

// Texte centré avec espacement des lettres. jsPDF ne compte pas l'espacement
// quand il centre (align: 'center') : le texte partait vers la droite. On calcule nous-mêmes.
function spacedCenter(d, text, x, y, space) {
  const w = d.getTextWidth(text) + space * Math.max(0, [...text].length - 1);
  d.text(text, x - w / 2, y, { charSpace: space });
}

// Polygone fermé et rempli à partir d'une liste de points absolus.
function polygon(d, pts, style = 'F') {
  const [x0, y0] = pts[0];
  const rel = [];
  for (let i = 1; i < pts.length; i++) rel.push([pts[i][0] - pts[i - 1][0], pts[i][1] - pts[i - 1][1]]);
  d.lines(rel, x0, y0, [1, 1], style, true);
}

// Coche (logo Vitako).
function check(d, x, y, size, color, width) {
  d.setDrawColor(...color); d.setLineWidth(width); d.setLineCap?.('round'); d.setLineJoin?.('round');
  d.lines([[size * 0.32, size * 0.32], [size * 0.62, -size * 0.7]], x, y);
}

// Texte en arc. En haut : lu de gauche à droite, lettres vers l'extérieur.
// En bas : lu de gauche à droite, lettres vers le centre. r = rayon de la ligne de base.
function arcText(d, text, cx, cy, r, where, tracking = 0.5) {
  const chars = [...text];
  const widths = chars.map((ch) => d.getTextWidth(ch) + tracking);
  const total = widths.reduce((a, b) => a + b, 0) - tracking;
  let pos = -total / 2;
  chars.forEach((ch, i) => {
    const mid = pos + (widths[i] - tracking) / 2;
    const a = mid / r; // angle (radians) depuis le haut ou le bas
    const w = widths[i] - tracking;
    if (where === 'top') {
      const bx = cx + r * Math.sin(a) - (w / 2) * Math.cos(a);
      const by = cy - r * Math.cos(a) - (w / 2) * Math.sin(a);
      d.text(ch, bx, by, { angle: (-a * 180) / Math.PI });
    } else {
      const bx = cx + r * Math.sin(a) - (w / 2) * Math.cos(a);
      const by = cy + r * Math.cos(a) + (w / 2) * Math.sin(a);
      d.text(ch, bx, by, { angle: (a * 180) / Math.PI });
    }
    pos += widths[i];
  });
}

// Petit losange décoratif.
function diamond(d, x, y, s, color) {
  d.setFillColor(...color);
  polygon(d, [[x, y - s], [x + s, y], [x, y + s], [x - s, y]]);
}

// Tampon officiel : rosette dorée, rubans verts, texte circulaire, coche au centre.
function seal(d, cx, cy, R, year) {
  // Rubans
  d.setFillColor(...GREEN_DARK);
  polygon(d, [[cx - 9, cy + 6], [cx - 2, cy + 9], [cx - 6.5, cy + 27], [cx - 9.6, cy + 23.4], [cx - 13.4, cy + 25.2]]);
  d.setFillColor(...GREEN);
  polygon(d, [[cx + 9, cy + 6], [cx + 2, cy + 9], [cx + 6.5, cy + 27], [cx + 9.6, cy + 23.4], [cx + 13.4, cy + 25.2]]);

  // Bord dentelé
  d.setFillColor(...GOLD);
  const n = 32;
  for (let i = 0; i < n; i++) {
    const a = (i / n) * Math.PI * 2;
    d.circle(cx + R * Math.cos(a), cy + R * Math.sin(a), 1.9, 'F');
  }
  d.circle(cx, cy, R, 'F');

  // Anneaux et texte circulaire
  d.setDrawColor(...CREAM); d.setLineWidth(0.35);
  d.circle(cx, cy, R - 1.6, 'S');
  d.circle(cx, cy, R - 6.6, 'S');
  font(d, 'helvetica', 'bold'); d.setFontSize(6); d.setTextColor(...CREAM);
  arcText(d, 'ATTESTATION OFFICIELLE', cx, cy, R - 5.5, 'top', 0.45);
  arcText(d, 'VITAKO', cx, cy, R - 3.4, 'bottom', 0.9);
  d.setFillColor(...CREAM);
  [-1, 1].forEach((side) => {
    const a = side * 1.25;
    d.circle(cx + (R - 4.1) * Math.sin(a), cy + (R - 4.1) * Math.cos(a), 0.55, 'F');
  });

  // Disque central
  d.setFillColor(...GREEN); d.circle(cx, cy, R - 7.4, 'F');
  d.setDrawColor(...GOLD_LIGHT); d.setLineWidth(0.3); d.circle(cx, cy, R - 8.3, 'S');
  check(d, cx - 3.6, cy - 0.6, 7.5, [255, 255, 255], 1.5);
  font(d, 'helvetica', 'bold'); d.setFontSize(5.2); d.setTextColor(...GOLD_LIGHT);
  d.text(String(year), cx, cy + 5.6, { align: 'center' });
}

/**
 * @param {{heading:string, name:string, text:string, rows:[string,string][], verifyUrl:string, year?:number, fonts?:object[]}} c
 * @returns {import('jspdf').jsPDF}
 */
export function certificatePdf(c) {
  const { jsPDF } = window.jspdf;
  const d = new jsPDF({ orientation: 'landscape', unit: 'mm', format: 'a4' });
  embedded = new Set();
  for (const f of c.fonts || []) {
    try {
      d.addFileToVFS(f.file, f.data);
      d.addFont(f.file, `vitako-${f.family}`, f.style);
      embedded.add(`${f.family}:${f.style}`);
    } catch (e) { /* police standard en secours */ }
  }
  const W = 297, H = 210;
  const left = 30;                   // début de la zone encadrée (après la bande verte)
  const cx = (left + W - 10) / 2;    // centre de la zone encadrée

  // Fond crème
  d.setFillColor(...CREAM); d.rect(0, 0, W, H, 'F');

  // Bande verte à gauche, avec liseré doré et texte vertical
  d.setFillColor(...GREEN_DARK); d.rect(0, 0, 22, H, 'F');
  d.setFillColor(...GOLD); d.rect(22, 0, 1.2, H, 'F');
  d.setDrawColor(...GREEN); d.setLineWidth(0.25);
  for (let y = -22; y < H; y += 6) d.line(0, y + 22, 22, y);
  font(d, 'helvetica', 'bold'); d.setFontSize(8.5); d.setTextColor(...GOLD_LIGHT);
  const band = clean('VITAKO  ·  FORMATIONS FREELANCE ET TÉLÉTRAVAIL  ·  MADAGASCAR');
  const bandLen = d.getTextWidth(band) + 0.9 * band.length;
  d.text(band, 14, H / 2 + bandLen / 2, { angle: 90, charSpace: 0.9 });

  // Cadre doré double avec ornements d'angle
  d.setDrawColor(...GOLD); d.setLineWidth(0.9); d.rect(left, 10, W - 10 - left, H - 20);
  d.setLineWidth(0.3); d.rect(left + 2.6, 12.6, W - 15.2 - left, H - 25.2);
  [[left + 2.6, 12.6], [W - 12.6, 12.6], [left + 2.6, H - 12.6], [W - 12.6, H - 12.6]].forEach(([x, y]) => diamond(d, x, y, 2.4, GOLD));

  // Filigrane : grand cercle et grande coche très pâles derrière le texte.
  // Couleurs déjà mélangées avec le fond crème (pas de transparence : tous les lecteurs PDF ne la gèrent pas pareil).
  d.setFillColor(244, 245, 235); d.circle(cx, 104, 52, 'F');
  check(d, cx - 26, 104, 52, [231, 238, 226], 9);

  // En-tête : logo
  if (c.logo) {
    d.addImage(c.logo, 'PNG', cx - 19, 20, 38, 38 * 200 / 1014);
  } else {
    d.setFillColor(...GREEN); d.roundedRect(cx - 17.5, 20, 7.5, 7.5, 1.6, 1.6, 'F');
    check(d, cx - 15.8, 24, 4.2, [255, 255, 255], 0.9);
    font(d, 'helvetica', 'bold'); d.setFontSize(17); d.setTextColor(...INK);
    d.text('vitako', cx - 8, 26.4);
  }
  font(d, 'helvetica', 'normal'); d.setFontSize(7.6); d.setTextColor(...MUTED);
  spacedCenter(d, clean('FORMATIONS AUX MÉTIERS DU FREELANCE ET DU TÉLÉTRAVAIL'), cx, 34, 0.8);

  // Titre
  const words = clean(c.heading).split(' ');
  const main = words.shift().toUpperCase();
  const sub = words.join(' ').toUpperCase();
  font(d, 'times', 'bold'); d.setFontSize(34); d.setTextColor(...GREEN);
  spacedCenter(d, main, cx, 53, 2.2);
  font(d, 'helvetica', 'bold'); d.setFontSize(11); d.setTextColor(...GOLD);
  spacedCenter(d, sub, cx, 61.5, 2.6);
  d.setDrawColor(...GOLD); d.setLineWidth(0.4);
  d.line(cx - 48, 67, cx - 4, 67); d.line(cx + 4, 67, cx + 48, 67);
  diamond(d, cx, 67, 1.6, GOLD);

  // Nom
  font(d, 'times', 'italic'); d.setFontSize(13); d.setTextColor(...MUTED);
  d.text('Nous attestons que', cx, 78, { align: 'center' });
  const name = clean(c.name);
  let size = 34;
  font(d, 'times', 'bolditalic');
  do { d.setFontSize(size); size -= 1; } while (d.getTextWidth(name) > 200 && size > 18);
  d.setTextColor(...INK);
  d.text(name, cx, 93, { align: 'center' });
  const nw = Math.min(Math.max(d.getTextWidth(name) + 16, 90), 220);
  d.setDrawColor(...GOLD); d.setLineWidth(0.5); d.line(cx - nw / 2, 98, cx + nw / 2, 98);

  // Texte
  font(d, 'helvetica', 'normal'); d.setFontSize(12); d.setTextColor(...INK);
  d.text(d.splitTextToSize(clean(c.text), 195), cx, 108, { align: 'center', lineHeightFactor: 1.5 });

  // Informations : score (ou métier), date, numéro
  const xs = [cx - 76, cx, cx + 76];
  c.rows.forEach(([k, v], i) => {
    font(d, 'helvetica', 'bold'); d.setFontSize(7.6); d.setTextColor(...GOLD);
    spacedCenter(d, clean(k).toUpperCase(), xs[i], 129, 0.7);
    font(d, 'times', 'bold'); d.setFontSize(14); d.setTextColor(...INK);
    d.text(clean(v), xs[i], 136.5, { align: 'center' });
  });
  d.setDrawColor(...GOLD_LIGHT); d.setLineWidth(0.25);
  d.line(cx - 38, 126, cx - 38, 139); d.line(cx + 38, 126, cx + 38, 139);

  // Signature (à gauche)
  const sx = cx - 76;
  font(d, 'times', 'bolditalic'); d.setFontSize(20); d.setTextColor(...GREEN);
  d.text('Vitako', sx, 168, { align: 'center' });
  d.setDrawColor(...MUTED); d.setLineWidth(0.3); d.line(sx - 32, 172, sx + 32, 172);
  font(d, 'helvetica', 'normal'); d.setFontSize(9); d.setTextColor(...MUTED);
  d.text(clean('La direction pédagogique'), sx, 177.5, { align: 'center' });

  // Tampon (au centre)
  seal(d, cx, 161, 18, c.year || new Date().getFullYear());

  // Vérification (à droite)
  const vx = cx + 76;
  font(d, 'helvetica', 'bold'); d.setFontSize(7.6); d.setTextColor(...GOLD);
  spacedCenter(d, clean('VÉRIFICATION EN LIGNE'), vx, 163, 0.7);
  font(d, 'helvetica', 'normal'); d.setFontSize(8.4); d.setTextColor(...INK);
  const url = clean(c.verifyUrl).replace(/^https?:\/\//, '');
  const cut = url.indexOf('#/');
  const lines = cut > 0 ? [url.slice(0, cut), url.slice(cut)] : [url];
  d.text(lines, vx, 169.5, { align: 'center', lineHeightFactor: 1.35 });
  d.setFontSize(7.4); d.setTextColor(...MUTED);
  d.text(clean('Saisissez ce lien pour confirmer l’authenticité.'), vx, 181, { align: 'center' });

  return d;
}
