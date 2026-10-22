// Met un numéro de version sur les fichiers du site dans index.html, pour que les
// navigateurs chargent toujours la dernière version après une mise en ligne.
// À lancer avant chaque envoi sur GitHub : node tools/stamp.mjs
import { readFileSync, writeFileSync } from 'node:fs';
import { join, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';

const root = join(dirname(fileURLToPath(import.meta.url)), '..');
const file = join(root, 'index.html');
const now = new Date();
const p = (n) => String(n).padStart(2, '0');
const v = `${now.getUTCFullYear()}${p(now.getUTCMonth() + 1)}${p(now.getUTCDate())}-${p(now.getUTCHours())}${p(now.getUTCMinutes())}`;

const modules = ['app.js', 'api.js', 'catalog.js', 'data.js', 'markdown.js', 'pdf.js', 'temoignages.js'];
const importMap = `<script type="importmap" id="vitako-importmap">${JSON.stringify({
  imports: Object.fromEntries(modules.map((m) => [`./assets/js/${m}`, `./assets/js/${m}?v=${v}`])),
})}</script>`;

let html = readFileSync(file, 'utf8');
html = html.replace(/assets\/css\/app\.css(\?v=[\w-]+)?/, `assets/css/app.css?v=${v}`);
html = html.replace(/assets\/js\/config\.js(\?v=[\w-]+)?/, `assets/js/config.js?v=${v}`);
html = html.replace(/assets\/js\/assistant\.js(\?v=[\w-]+)?/, `assets/js/assistant.js?v=${v}`);
html = html.replace(/<script type="module" src="assets\/js\/app\.js(\?v=[\w-]+)?"><\/script>/, `<script type="module" src="assets/js/app.js?v=${v}"></script>`);
html = html.replace(/<script type="importmap" id="vitako-importmap">.*?<\/script>\n?\s*/s, '');
html = html.replace('<script type="module" src="assets/js/app.js', `${importMap}\n  <script type="module" src="assets/js/app.js`);
html = html.replace(/<span class="version">[^<]*<\/span>/, `<span class="version">Version ${v}</span>`);
if (!html.includes('class="version"')) {
  html = html.replace('<a href="#/verifier">Vérifier une attestation</a>', `<a href="#/verifier">Vérifier une attestation</a>\n    <span class="version">Version ${v}</span>`);
}
writeFileSync(file, html);
console.log('Version', v);
