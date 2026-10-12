// Imitation minimale de jsPDF qui dessine en SVG, pour prévisualiser l'attestation
// dans un navigateur sans accès à Internet. Ne sert qu'aux tests.
(function () {
  const PT = 25.4 / 72; // 1 point en mm
  const FAMILY = { helvetica: 'Liberation Sans, Arial, sans-serif', times: 'Liberation Serif, Times New Roman, serif', courier: 'Liberation Mono, Courier New, monospace' };
  const ctx = document.createElement('canvas').getContext('2d');
  function jsPDF() {
    const st = { fill: 'rgb(0,0,0)', stroke: 'rgb(0,0,0)', text: 'rgb(0,0,0)', lw: 0.2, font: 'helvetica', style: 'normal', size: 16, op: 1 };
    const out = [];
    const rgb = (a) => `rgb(${a[0]},${a[1]},${a[2]})`;
    const fontCss = () => `${/italic/.test(st.style) ? 'italic ' : ''}${/bold/.test(st.style) ? 'bold ' : ''}${st.size * PT}px ${FAMILY[st.font]}`;
    const paint = (style) => {
      const s = style || 'S';
      return `fill="${/F/.test(s) ? st.fill : 'none'}" stroke="${/D|S/.test(s) && s !== 'F' ? st.stroke : 'none'}" stroke-width="${st.lw}" opacity="${st.op}" stroke-linecap="round" stroke-linejoin="round"`;
    };
    const esc = (t) => String(t).replace(/&/g, '&amp;').replace(/</g, '&lt;');
    const d = {
      setFillColor: (...c) => { st.fill = rgb(c); },
      setDrawColor: (...c) => { st.stroke = rgb(c); },
      setTextColor: (...c) => { st.text = rgb(c); },
      setLineWidth: (w) => { st.lw = w; },
      setLineCap() {}, setLineJoin() {},
      setFont: (f, s) => { st.font = f.replace('vitako-sans', 'helvetica').replace('vitako-serif', 'times'); st.style = s || 'normal'; },
      addFileToVFS() {}, addFont() {},
      setFontSize: (s) => { st.size = s; },
      GState: function (o) { this.opacity = o.opacity; },
      setGState: (g) => { st.op = g.opacity; },
      getTextWidth: (t) => { ctx.font = fontCss(); return ctx.measureText(t).width; },
      splitTextToSize(t, w) {
        const words = String(t).split(' '); const lines = []; let cur = '';
        for (const wd of words) { const n = cur ? cur + ' ' + wd : wd; if (d.getTextWidth(n) > w && cur) { lines.push(cur); cur = wd; } else cur = n; }
        if (cur) lines.push(cur); return lines;
      },
      rect: (x, y, w, h, s) => out.push(`<rect x="${x}" y="${y}" width="${w}" height="${h}" ${paint(s)}/>`),
      roundedRect: (x, y, w, h, rx, ry, s) => out.push(`<rect x="${x}" y="${y}" width="${w}" height="${h}" rx="${rx}" ${paint(s)}/>`),
      line: (x1, y1, x2, y2) => out.push(`<line x1="${x1}" y1="${y1}" x2="${x2}" y2="${y2}" ${paint('S')}/>`),
      circle: (x, y, r, s) => out.push(`<circle cx="${x}" cy="${y}" r="${r}" ${paint(s)}/>`),
      lines(rel, x, y, scale, style, closed) {
        let p = `M${x} ${y}`; let cx = x; let cy = y;
        for (const [dx, dy] of rel) { cx += dx; cy += dy; p += ` L${cx} ${cy}`; }
        if (closed) p += ' Z';
        out.push(`<path d="${p}" ${paint(style || 'S')}/>`);
      },
      text(t, x, y, o = {}) {
        const lines = Array.isArray(t) ? t : [t];
        const lh = st.size * PT * (o.lineHeightFactor || 1.15);
        const anchor = o.align === 'center' ? 'middle' : o.align === 'right' ? 'end' : 'start';
        lines.forEach((ln, i) => {
          const rot = o.angle ? ` transform="rotate(${-o.angle} ${x} ${y})"` : '';
          const ls = o.charSpace ? ` letter-spacing="${o.charSpace}"` : '';
          out.push(`<text x="${x}" y="${y + i * lh}" text-anchor="${anchor}" style="font:${fontCss()}" fill="${st.text}" opacity="${st.op}"${ls}${rot}>${esc(ln)}</text>`);
        });
      },
      save(name) { window.__pdfSaved = name; },
      svg: () => `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 297 210" width="1188" height="840">${out.join('')}</svg>`,
    };
    return d;
  }
  window.jspdf = { jsPDF };
})();
