"""Aperçu de l'attestation (dessin approximatif en SVG, polices proches de celles du PDF).
Usage : python3 tests/pdf-preview/preview.py  -> tests/pdf-preview/*.png
"""
import os, http.server, socketserver, threading
from functools import partial
from playwright.sync_api import sync_playwright

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
OUT = os.path.join(ROOT, 'tests', 'pdf-preview')
Handler = partial(http.server.SimpleHTTPRequestHandler, directory=ROOT)
Handler.log_message = lambda *a: None
socketserver.TCPServer.allow_reuse_address = True
httpd = socketserver.TCPServer(('127.0.0.1', 8766), Handler)
threading.Thread(target=httpd.serve_forever, daemon=True).start()

CASES = {
  'cours': dict(heading='Attestation de réussite', name='RANDRIAMIHANTA Andrianiaina Philibert',
                text="a suivi l'intégralité de la formation « Graphiste – Fondamentaux » (12 heures) et réussi l'examen final.",
                rows=[['Score', '90/100'], ['Délivrée le', '12 octobre 2026'], ['N° de vérification', 'VTK-2026-92F943']],
                verifyUrl='https://vitako.vercel.app/#/attestation/VTK-2026-92F943', year=2026),
  'metier': dict(heading='Attestation de parcours complet', name='Fanja Rakoto',
                 text='a réussi les formations Fondamentaux et Avancé du métier Graphiste (26 heures au total) et peut proposer ses services en freelance ou en télétravail.',
                 rows=[['Métier', 'Graphiste'], ['Délivrée le', '12 octobre 2026'], ['N° de vérification', 'VTK-2026-4F9A2C']],
                 verifyUrl='https://vitako.vercel.app/#/attestation/VTK-2026-4F9A2C', year=2026),
}
with sync_playwright() as p:
    b = p.chromium.launch(); pg = b.new_page(viewport={'width': 1188, 'height': 840})
    pg.goto('http://127.0.0.1:8766/tests/pdf-preview/blank.html')
    pg.add_script_tag(path=os.path.join(OUT, 'jspdf-shim.js'))
    for name, data in CASES.items():
        svg = pg.evaluate("""async (c) => { const m = await import('/assets/js/pdf.js'); return m.certificatePdf(c).svg(); }""", data)
        pg.set_content(f'<body style="margin:0">{svg}</body>')
        pg.add_script_tag(path=os.path.join(OUT, 'jspdf-shim.js'))
        pg.screenshot(path=os.path.join(OUT, f'apercu-{name}.png'))
        pg.goto('http://127.0.0.1:8766/tests/pdf-preview/blank.html'); pg.add_script_tag(path=os.path.join(OUT, 'jspdf-shim.js'))
    b.close()
httpd.shutdown()
print('ok')
