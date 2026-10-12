"""Parcours complet du site dans Chromium, avec un faux Supabase.
Usage : python3 tests/browser/run.py   (depuis la racine du projet)
Captures d'écran dans tests/browser/shots/.
"""
import http.server, os, re, socketserver, subprocess, sys, threading
from functools import partial
from playwright.sync_api import sync_playwright, expect

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
SHOTS = os.path.join(ROOT, 'tests', 'browser', 'shots')
os.makedirs(SHOTS, exist_ok=True)
subprocess.run(['node', 'tests/browser/fixture.mjs'], cwd=ROOT, check=True)

PORT = 8765
Handler = partial(http.server.SimpleHTTPRequestHandler, directory=ROOT)
Handler.log_message = lambda *a: None
socketserver.TCPServer.allow_reuse_address = True
httpd = socketserver.TCPServer(('127.0.0.1', PORT), Handler)
threading.Thread(target=httpd.serve_forever, daemon=True).start()
BASE = f'http://127.0.0.1:{PORT}/index.html'

read = lambda p: open(os.path.join(ROOT, p), encoding='utf-8').read()
MOCK = read('tests/browser/.fixture.js') + read('tests/browser/mock-supabase.js')
FAKE_PDF = read('tests/pdf-preview/jspdf-shim.js')
CONFIG = re.sub(r"supabaseAnonKey: '[^']*'", "supabaseAnonKey: 'test'", re.sub(r"supabaseUrl: '[^']*'", "supabaseUrl: 'https://test.supabase.co'", read('assets/js/config.js')))

results, errors = [], []
def check(name, cond):
    results.append((name, bool(cond)))
    print(('OK   ' if cond else 'ÉCHEC') + ' ' + name)

def setup(page):
    page.route('https://cdn.jsdelivr.net/**', lambda r: r.fulfill(body=MOCK, content_type='application/javascript'))
    page.route('https://cdnjs.cloudflare.com/**', lambda r: r.fulfill(body=FAKE_PDF, content_type='application/javascript'))
    page.route('https://fonts.googleapis.com/**', lambda r: r.abort())
    page.route('https://fonts.gstatic.com/**', lambda r: r.abort())
    page.route('**/assets/js/config.js', lambda r: r.fulfill(body=CONFIG, content_type='application/javascript'))
    page.on('pageerror', lambda e: errors.append(str(e)))
    page.on('console', lambda m: errors.append(m.text) if m.type == 'error' else None)

def goto(page, hash_):
    page.evaluate(f"location.hash = '{hash_}'")
    page.wait_for_timeout(250)

def signup(page, name, email, pw='motdepasse1'):
    goto(page, '#/inscription')
    page.fill('#a-name', name); page.fill('#a-email', email); page.fill('#a-pass', pw)
    page.click('#auth-form button[type=submit]')
    page.wait_for_timeout(700)

def login(page, email, pw='motdepasse1'):
    goto(page, '#/connexion')
    page.fill('#a-email', email); page.fill('#a-pass', pw)
    page.click('#auth-form button[type=submit]')
    page.wait_for_timeout(700)

def logout(page):
    page.click('[data-act=menu]'); page.wait_for_timeout(150)
    page.click('[data-act=logout]'); page.wait_for_timeout(400)

with sync_playwright() as p:
    browser = p.chromium.launch()
    ctx = browser.new_context(viewport={'width': 1280, 'height': 900}, locale='fr-FR')
    page = ctx.new_page(); setup(page)
    page.goto(BASE + '#/'); page.wait_for_timeout(600)

    # --- Catalogue
    check('catalogue : 50 métiers', page.locator('.card.job').count() == 50)
    nb_pub = sum(1 for c in page.evaluate("window.__VITAKO_FIXTURE__").get('courses', []) if c.get('published'))
    check(f'catalogue : {nb_pub} formations disponibles', page.locator('.fact b').nth(1).inner_text().strip() == str(nb_pub))
    page.fill('#search', 'photoshop'); page.wait_for_timeout(150)
    n = page.locator('.card.job').count()
    check(f'recherche "photoshop" filtre ({n} métiers)', 0 < n < 50)
    check('le champ de recherche garde le focus', page.evaluate("document.activeElement.id") == 'search')
    page.fill('#search', ''); page.click('[data-dom=data]'); page.wait_for_timeout(150)
    check('filtre domaine : 5 métiers', page.locator('.card.job').count() == 5)
    page.click('[data-dom=all]')
    page.screenshot(path=f'{SHOTS}/01-catalogue.png', full_page=False)
    page.click('[data-act=menu]'); page.wait_for_timeout(150)
    check('menu : s\'ouvre avec le bouton à trois traits', page.locator('#menu').is_visible())
    page.screenshot(path=f'{SHOTS}/01b-menu.png')
    page.click('h1'); page.wait_for_timeout(150)
    check('menu : se ferme en cliquant ailleurs', not page.locator('#menu').is_visible())
    goto(page, '#/verifier')
    page.click('[data-act=search-toggle]'); page.wait_for_timeout(150)
    check('loupe : champ de recherche affiché et actif', page.evaluate("document.activeElement.id") == 'hsearch')
    page.keyboard.type('excel'); page.wait_for_timeout(400)
    n2 = page.locator('.card.job').count()
    check(f'recherche depuis le haut : retour au catalogue filtré ({n2} métiers)', '#/' in page.url and 0 < n2 < 50)
    check('recherche depuis le haut : le champ garde le focus', page.evaluate("document.activeElement.id") == 'hsearch')
    page.keyboard.press('Escape'); page.fill('#search', ''); page.wait_for_timeout(150)

    # --- Fiche formation (visiteur)
    goto(page, '#/formation/design-0-f')
    check('fiche : titre', 'Graphiste – Fondamentaux' in page.locator('h1').inner_text())
    check('fiche : outils payants affichés', 'Adobe Illustrator' in page.content())
    check('fiche : objectifs numérotés et sections 1.1…', page.locator('.obj-num li').count() >= 5 and '1.1' in page.locator('.mod-secs').first.inner_text())
    page.screenshot(path=f'{SHOTS}/02z-fiche.png', full_page=True)
    check('fiche : invite à créer un compte', page.locator('aside a:has-text("Créer un compte")').count() == 1)
    goto(page, '#/formation/tech-4-a')
    check('fiche non publiée : « Bientôt disponible »', 'Bientôt disponible' in page.content())
    goto(page, '#/formation/design-0-f/module/1')
    check('leçon bloquée pour un visiteur', 'Connectez-vous pour continuer' in page.content())

    # --- Inscription + paiement
    signup(page, 'Fanja Rakoto', 'fanja@exemple.mg')
    check('après inscription : page abonnement', '#/abonnement' in page.url)
    check('numéro MVola affiché', '038 28 753 61' in page.content())
    check('nom du titulaire MVola affiché', 'Andrianiaina Philibert' in page.content())
    page.screenshot(path=f'{SHOTS}/02a-abonnement.png')
    page.click('[data-op=orange]'); page.wait_for_timeout(200)
    check('numéro Orange Money affiché', '032 62 291 65' in page.content())
    check('nom du titulaire Orange Money affiché', 'ANDRIANIAINA PHILIBERT RANDRIAMIHANTA' in page.content())
    page.fill('#p-ref', 'ab'); page.click('#pay-form button[type=submit]'); page.wait_for_timeout(200)
    check('référence trop courte refusée', page.locator('#perr').is_visible())
    page.fill('#p-ref', 'CI241012.1200.A1'); page.fill('#p-tel', '0381234567'); page.click('#pay-form button[type=submit]'); page.wait_for_timeout(200)
    check('numéro d\'un autre opérateur refusé', 'ne correspond pas' in page.locator('#perr').inner_text())
    page.fill('#p-tel', ''); page.click('#pay-form button[type=submit]'); page.wait_for_timeout(500)
    check('paiement sans numéro accepté : en attente', 'En attente de validation' in page.content())
    page.screenshot(path=f'{SHOTS}/02-abonnement-attente.png')
    logout(page)

    # --- Second étudiant : référence déjà utilisée
    signup(page, 'Hery Randria', 'hery@exemple.mg')
    page.click('[data-op=orange]'); page.wait_for_timeout(200)
    page.fill('#p-ref', 'ci241012.1200.a1'); page.click('#pay-form button[type=submit]'); page.wait_for_timeout(400)
    check('référence déjà utilisée refusée', 'déjà été envoyée' in page.locator('#perr').inner_text())
    logout(page)

    # --- Administrateur
    signup(page, 'Administrateur', 'admin@vitako.mg')
    goto(page, '#/admin'); page.wait_for_timeout(400)
    check('admin : 1 paiement en attente', page.locator('[data-act=pay-ok]').count() == 1)
    check('admin : numéro non indiqué', 'Non indiqué' in page.content())
    page.screenshot(path=f'{SHOTS}/03-admin.png')
    page.click('[data-act=pay-ok]'); page.wait_for_timeout(500)
    check('admin : paiement validé', page.locator('[data-act=pay-ok]').count() == 0 and 'Validé' in page.content())
    logout(page)

    # --- Étudiante abonnée : modules
    login(page, 'fanja@exemple.mg')
    check('connexion : redirection vers mon espace', '#/mon-espace' in page.url)
    check('mon espace : abonnement actif 30 jours', '30 jours restants' in page.content())
    fx = page.evaluate('window.__VITAKO_FIXTURE__')
    for i in range(1, 6):
        goto(page, f'#/formation/design-0-f/module/{i}'); page.wait_for_timeout(300)
        if i == 3:
            check('leçon 3 : tableau des outils payants', page.locator('.md-table').count() >= 2)
            check('leçon 3 : sections numérotées 3.1, 3.2…', page.locator('.md h2 .sec-num').first.inner_text() == '3.1')
            check('leçon 3 : sommaire du module', page.locator('.toc li').count() >= 5)
            check('leçon 3 : encadrés (objectifs, à retenir, exercice)', all(page.locator(f'.callout.{k}').count() >= 1 for k in ['objectifs', 'retenir', 'exercice']))
            page.screenshot(path=f'{SHOTS}/04-lecon.png', full_page=False)
            page.screenshot(path=f'{SHOTS}/04b-lecon-complete.png', full_page=True)
        page.click('#mquiz-form button[type=submit]'); page.wait_for_timeout(150)
        if i == 1: check('test de module : réponses obligatoires', page.locator('#mqerr').is_visible())
        for q in range(3):
            page.locator(f'input[name=mq{q}]').first.check()
        page.click('#mquiz-form button[type=submit]'); page.wait_for_timeout(300)
        check(f'module {i} validé', 'terminé' in page.locator('#mquiz').inner_text())
    goto(page, '#/formation/design-0-f')
    check('progression 100 %', '100 %' in page.content())
    # Autre formation : blocs de code (arborescence, HTML, CSS)
    goto(page, '#/formation/dev-3-f/module/2'); page.wait_for_timeout(300)
    check('leçon avec blocs de code (dev-3-f module 2)', page.locator('.md pre.md-code').count() >= 3)
    check('bloc de code : HTML affiché comme texte', '<h1>Bienvenue' in page.locator('.md pre.md-code').nth(1).inner_text())
    page.locator('.md pre.md-code').first.scroll_into_view_if_needed()
    page.screenshot(path=f'{SHOTS}/04c-lecon-code.png', full_page=False)

    # --- Examen : échec puis réussite
    goto(page, '#/formation/design-0-f/examen')
    page.click('[data-act=exam-start]'); page.wait_for_timeout(500)
    check('examen : 10 questions', page.locator('#exam-form .q').count() == 10)
    correct = {q['question']: q['options'][q['correct']] for q in fx['exam_questions']}
    def answer(right):
        for k in range(10):
            qtext = page.locator('#exam-form legend').nth(k).inner_text().split('\n')[-1].strip()
            good = correct.get(re.sub(r'^\d+\s*', '', qtext), correct.get(qtext))
            labels = page.locator(f'#exam-form .q').nth(k).locator('label')
            for j in range(labels.count()):
                txt = labels.nth(j).inner_text().strip()
                if (txt == good) == right:
                    labels.nth(j).locator('input').check(); break
    answer(False)
    page.click('#exam-form button[type=submit]'); page.wait_for_timeout(600)
    check('examen raté : 0/100 et bouton recommencer', 'non réussi' in page.content() and page.locator('[data-act=exam-start]').count() == 1)
    page.click('[data-act=exam-start]'); page.wait_for_timeout(500)
    answer(True)
    page.click('#exam-form button[type=submit]'); page.wait_for_timeout(600)
    check('examen réussi : 100/100', 'Examen réussi' in page.content() and '100' in page.locator('.score').inner_text())
    page.screenshot(path=f'{SHOTS}/05-resultat.png')

    # --- Attestation
    page.click('a:has-text("Voir mon attestation")'); page.wait_for_timeout(500)
    check('attestation : nom et formation', 'Fanja Rakoto' in page.content() and 'Graphiste – Fondamentaux' in page.content())
    cert_id = page.locator('.dip-rows b').nth(2).inner_text()
    check('attestation : tampon affiché', page.locator('.dip-seal').count() == 1)
    page.click('[data-act=pdf]'); page.wait_for_timeout(200)
    saved = page.evaluate('window.__pdfSaved')
    check(f'PDF : téléchargement lancé ({saved})', bool(saved) and saved.endswith('.pdf'))
    page.screenshot(path=f'{SHOTS}/06-attestation.png', full_page=True)
    goto(page, '#/mon-espace')
    check('mon espace : attestation listée', cert_id in page.content())

    # --- Nom, thème, mot de passe
    page.fill('#n-name', 'Fanja Rakotomalala'); page.click('#name-form button[type=submit]'); page.wait_for_timeout(300)
    check('changement de nom', 'Salama, Fanja' in page.content() and page.evaluate("document.getElementById('n-name').value") == 'Fanja Rakotomalala')
    before = page.evaluate("getComputedStyle(document.body).backgroundColor")
    page.click('[data-act=theme]'); page.wait_for_timeout(150)
    after = page.evaluate("getComputedStyle(document.body).backgroundColor")
    check('bouton thème change les couleurs', before != after)
    logout(page)
    goto(page, '#/connexion')
    page.fill('#a-pass', 'secret123'); page.click('[data-act=eye]')
    check('afficher le mot de passe', page.get_attribute('#a-pass', 'type') == 'text')
    page.click('[data-act=eye]')
    check('masquer le mot de passe', page.get_attribute('#a-pass', 'type') == 'password')

    # --- Vérification publique
    goto(page, '#/verifier'); page.fill('#v-id', cert_id.lower()); page.click('#verify-form button[type=submit]'); page.wait_for_timeout(500)
    check('vérification publique d\'une attestation', 'Fanja Rakoto' in page.content())
    goto(page, '#/attestation/VTK-0000-XXXX'); page.wait_for_timeout(300)
    check('numéro inconnu : introuvable', 'Attestation introuvable' in page.content())
    page.set_viewport_size({'width': 390, 'height': 844})
    goto(page, '#/attestation/' + cert_id); page.wait_for_timeout(500)
    check('attestation sur téléphone : pas de défilement horizontal', not page.evaluate('document.documentElement.scrollWidth > window.innerWidth + 1'))
    page.screenshot(path=f'{SHOTS}/10-mobile-attestation.png', full_page=True)
    page.set_viewport_size({'width': 1280, 'height': 900})
    goto(page, '#/admin'); page.wait_for_timeout(300)
    check('admin inaccessible sans compte', 'Connectez-vous' in page.content())

    # --- Téléphone (390 px)
    m = browser.new_context(viewport={'width': 390, 'height': 844}, locale='fr-FR', device_scale_factor=2)
    mp = m.new_page(); setup(mp)
    for name, h in [('07-mobile-catalogue', '#/'), ('08-mobile-formation', '#/formation/design-0-f'), ('09-mobile-inscription', '#/inscription')]:
        mp.goto(BASE + h); mp.wait_for_timeout(500)
        overflow = mp.evaluate('document.documentElement.scrollWidth > window.innerWidth + 1')
        check(f'{name} : pas de défilement horizontal', not overflow)
        mp.screenshot(path=f'{SHOTS}/{name}.png', full_page=name.endswith('attestation'))
    browser.close()
httpd.shutdown()

errs = [e for e in errors if 'Failed to load resource' not in e]
check('aucune erreur JavaScript', not errs)
for e in errs[:10]: print('   ', e)
ok = sum(1 for _, c in results if c)
print(f'\nRéussis : {ok} · Échoués : {len(results) - ok}')
sys.exit(0 if ok == len(results) else 1)
