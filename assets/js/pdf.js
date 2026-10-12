// Attestation au format PDF A4 paysage (bibliothèque jsPDF chargée dans index.html).

// Les polices de base de jsPDF ne gèrent pas certains caractères : on les remplace.
const clean = (s) => String(s ?? '')
  .replace(/[’‘]/g, "'").replace(/[“”«»]/g, '"')
  .replace(/[–—]/g, '-').replace(/[  ]/g, ' ').replace(/…/g, '...');

export function slug(s) {
  return clean(s).toLowerCase().normalize('NFD').replace(/[̀-ͯ]/g, '').replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '');
}

/**
 * @param {{heading:string, name:string, text:string, rows:[string,string][], verifyUrl:string}} c
 * @returns {Blob}
 */
export function certificatePdf(c) {
  const { jsPDF } = window.jspdf;
  const d = new jsPDF({ orientation: 'landscape', unit: 'mm', format: 'a4' });
  const W = 297, H = 210, cx = W / 2;
  const green = [11, 122, 85], gold = [168, 111, 0], ink = [19, 36, 27], muted = [86, 102, 92];

  // Cadre double
  d.setDrawColor(...gold); d.setLineWidth(1.4); d.rect(8, 8, W - 16, H - 16);
  d.setLineWidth(0.4); d.rect(12, 12, W - 24, H - 24);

  // Logo
  d.setFillColor(...green); d.roundedRect(cx - 26, 22, 7, 7, 1.2, 1.2, 'F');
  d.setDrawColor(255, 255, 255); d.setLineWidth(0.9); d.lines([[1.4, 1.5], [2.6, -3.2]], cx - 24.4, 25.6);
  d.setTextColor(...ink); d.setFont('helvetica', 'bold'); d.setFontSize(15); d.text('vitako', cx - 17, 27.8);
  d.setFont('helvetica', 'normal'); d.setFontSize(9); d.setTextColor(...muted);
  d.text(clean('FORMATIONS AUX MÉTIERS DU FREELANCE ET DU TÉLÉTRAVAIL'), cx, 37, { align: 'center', charSpace: 0.6 });

  // Titre, nom, texte
  d.setTextColor(...green); d.setFont('helvetica', 'bold'); d.setFontSize(28);
  d.text(clean(c.heading.toUpperCase()), cx, 58, { align: 'center' });
  d.setTextColor(...muted); d.setFont('helvetica', 'normal'); d.setFontSize(12);
  d.text('Nous attestons que', cx, 73, { align: 'center' });
  d.setTextColor(...ink); d.setFont('helvetica', 'bold'); d.setFontSize(30);
  d.text(clean(c.name), cx, 90, { align: 'center' });
  d.setDrawColor(...gold); d.setLineWidth(0.5); d.line(cx - 70, 95, cx + 70, 95);
  d.setFont('helvetica', 'normal'); d.setFontSize(12.5); d.setTextColor(...ink);
  d.text(d.splitTextToSize(clean(c.text), 190), cx, 106, { align: 'center', lineHeightFactor: 1.45 });

  // Informations (score, date, numéro)
  const xs = c.rows.length === 2 ? [cx - 50, cx + 50] : [cx - 85, cx, cx + 85];
  c.rows.forEach(([k, v], i) => {
    d.setFont('helvetica', 'normal'); d.setFontSize(9.5); d.setTextColor(...muted);
    d.text(clean(k).toUpperCase(), xs[i], 140, { align: 'center', charSpace: 0.4 });
    d.setFont('courier', 'bold'); d.setFontSize(13); d.setTextColor(...ink);
    d.text(clean(v), xs[i], 148, { align: 'center' });
  });

  // Sceau
  d.setDrawColor(...gold); d.setFillColor(251, 239, 208); d.setLineWidth(0.8); d.circle(42, 172, 13, 'FD');
  d.setLineWidth(0.4); d.circle(42, 172, 10.5);
  d.setLineWidth(1.4); d.lines([[3, 3], [6, -7]], 37, 172.5);
  d.setFont('helvetica', 'bold'); d.setFontSize(6.5); d.setTextColor(...gold); d.text('VITAKO', 42, 182.2, { align: 'center' });

  // Signature
  d.setDrawColor(...muted); d.setLineWidth(0.3); d.line(W - 100, 175, W - 40, 175);
  d.setFont('helvetica', 'normal'); d.setFontSize(10); d.setTextColor(...muted);
  d.text(clean('La direction pédagogique Vitako'), W - 70, 181, { align: 'center' });

  d.setFontSize(8.5);
  d.text(clean(`Vérifier cette attestation : ${c.verifyUrl}`), cx, 192, { align: 'center' });
  return d;
}
