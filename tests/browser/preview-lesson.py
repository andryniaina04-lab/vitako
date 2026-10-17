"""Aperçu d'une leçon (Markdown -> HTML avec les styles du site), pour relecture visuelle.
Usage : python3 tests/browser/preview-lesson.py <fichier.md> <sortie.png> [largeur] [sombre]"""
import http.server, json, os, socketserver, sys, threading
from functools import partial
from playwright.sync_api import sync_playwright
ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
src, out = sys.argv[1], sys.argv[2]
width = int(sys.argv[3]) if len(sys.argv) > 3 else 390
dark = len(sys.argv) > 4 and sys.argv[4] == 'sombre'
Handler = partial(http.server.SimpleHTTPRequestHandler, directory=ROOT); Handler.log_message = lambda *a: None
socketserver.TCPServer.allow_reuse_address = True
httpd = socketserver.TCPServer(('127.0.0.1', 8799), Handler)
threading.Thread(target=httpd.serve_forever, daemon=True).start()
body = open(src, encoding='utf-8').read()
html = f"""<!doctype html><html lang="fr"{' data-theme="dark"' if dark else ''}><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="/assets/css/app.css"></head><body><main class="wrap"><div class="lesson-wrap"><article class="lesson md" id="a"></article></div></main>
<script type="module">import {{ md }} from '/assets/js/markdown.js'; document.getElementById('a').innerHTML = md({json.dumps(body)}, {{ number: '1.1' }}); window.done = 1;</script></body></html>"""
with sync_playwright() as p:
    b = p.chromium.launch(); pg = b.new_page(viewport={'width': width, 'height': 900}, device_scale_factor=1)
    pg.route('**/preview.html', lambda r: r.fulfill(body=html, content_type='text/html'))
    pg.goto('http://127.0.0.1:8799/preview.html'); pg.wait_for_function('window.done'); pg.wait_for_timeout(200)
    over = pg.evaluate('document.documentElement.scrollWidth > window.innerWidth + 1')
    pg.screenshot(path=out, full_page=True); b.close()
    print('débordement horizontal' if over else 'ok')
httpd.shutdown()
