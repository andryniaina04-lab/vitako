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
# Une fois les 100 formations publiées, on retire tech-4-a de PUBLISHED dans data.js
# (seulement pour ce test) afin de vérifier encore l'affichage d'une formation non publiée.
DATA_JS = read('assets/js/data.js').replace('"tech-4-a": {', '"__test-non-publiee": {', 1)
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
    page.route(re.compile(r'.*/assets/js/data\.js(\?.*)?$'), lambda r: r.fulfill(body=DATA_JS, content_type='application/javascript'))
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

    # --- Accueil (page d'atterrissage)
    check('accueil : 10 formations mises en avant', page.locator('.feat-grid .card.feat').count() == 10)
    check('accueil : 4 chiffres clés', page.locator('.lp-stats > div').count() == 4 and '110' in page.locator('.lp-stats').inner_text())
    check('accueil : bandes vertes (témoignages et appel final)', page.locator('.lp-band').count() == 2)
    check('accueil : plus de barre de recherche dans la page', page.locator('#search').count() == 0)
    check('barre du haut : Connexion et Créer un compte pour les visiteurs', page.locator('.tb-actions a[href="#/connexion"]').count() == 1 and page.locator('.tb-actions a[href="#/inscription"]').count() == 1)
    check('accueil : pas de défilement horizontal', not page.evaluate('document.documentElement.scrollWidth > window.innerWidth + 1'))
    page.screenshot(path=f'{SHOTS}/00-accueil.png', full_page=True)
    check('accueil : bloc catalogue avec 13 domaines', page.locator('.lp-cat .chip').count() == 13)
    page.click('.lp-cat [data-d=media]'); page.wait_for_timeout(400)
    check('accueil : un domaine ouvre le catalogue filtré', page.evaluate('location.hash') == '#/formations' and page.locator('.card.job').count() == 5)
    page.click('[data-dom=all]'); goto(page, '#/'); page.wait_for_timeout(300)
    page.click('.lp-more a'); page.wait_for_timeout(400)
    # --- Catalogue complet
    check('catalogue : 60 cartes (50 métiers + 8 perso + 2 numériques)', page.locator('.card.job').count() == 60 and page.evaluate('location.hash') == '#/formations')
    page.click('[data-dom=data]'); page.wait_for_timeout(150)
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
    check('loupe : suggestions sous la barre', page.locator('#hs-panel').is_visible() and 'recherches fréquentes' in page.locator('#hs-panel').inner_text().lower())
    page.keyboard.type('photoshop'); page.wait_for_timeout(200)
    n2 = page.locator('#hs-panel .hs-row').count()
    check(f'recherche : résultats affichés sous la barre ({n2} métiers)', 0 < n2 < 50)
    check('recherche : on reste sur la même page', '#/verifier' in page.url)
    check('recherche : le champ garde le focus', page.evaluate("document.activeElement.id") == 'hsearch')
    page.screenshot(path=f'{SHOTS}/01c-recherche.png')
    page.fill('#hsearch', 'retouche'); page.wait_for_timeout(150)
    check('recherche sans accents : « retouche » trouve Retoucheur photo', 'Retoucheur photo' in page.locator('#hs-panel').inner_text())
    page.fill('#hsearch', 'zzzzqq'); page.wait_for_timeout(150)
    check('recherche : message si aucun résultat', 'Aucun métier ne correspond' in page.locator('#hs-panel').inner_text())
    page.fill('#hsearch', 'graphiste'); page.wait_for_timeout(150)
    page.locator('#hs-panel .hs-main').first.click(); page.wait_for_timeout(300)
    check('recherche : un clic ouvre la formation et ferme la recherche', '#/formation/' in page.url and not page.locator('#tb-search').is_visible())

    # --- Fiche formation (visiteur)
    goto(page, '#/formation/design-0-f')
    check('fiche : titre', 'Graphiste – Fondamentaux' in page.locator('h1').inner_text())
    check('fiche : outils payants affichés', 'Adobe Illustrator' in page.content())
    check('fiche : objectifs numérotés', page.locator('.obj-num li').count() >= 5)
    check('fiche visiteur : détail du programme caché (pas de sous-parties 1.1…)', page.locator('.mod-secs').count() == 0 and page.locator('.prog-lock').count() == 1)
    check('site public : aucun résumé ni sous-partie de module dans data.js', '"sections"' not in read('assets/js/data.js') and '"summary"' not in read('assets/js/data.js'))
    page.screenshot(path=f'{SHOTS}/02z-fiche.png', full_page=True)
    check('fiche : invite à créer un compte', page.locator('aside a:has-text("Créer un compte")').count() == 1)
    goto(page, '#/formation/tech-4-a')
    try:
        page.wait_for_selector('.pill:has-text("Bientôt disponible")', timeout=3000); ok = True
    except Exception:
        ok = False
    check('fiche non publiée : « Bientôt disponible »', ok)
    goto(page, '#/formation/design-0-f/module/1')
    check('leçon bloquée pour un visiteur', 'Connectez-vous pour continuer' in page.content())

    # --- Inscription + paiement
    signup(page, 'Fanja Rakoto', 'fanja@exemple.mg')
    check('après inscription : page abonnement', '#/abonnement' in page.url)
    check('numéro MVola affiché', '038 28 753 61' in page.content())
    promo = page.evaluate("new Date(Date.now() + 3 * 3600e3).toISOString().slice(0, 10)") <= '2026-11-30'
    if promo:
        check('promotion : ancien prix 60 000 Ar barré en rouge', page.locator('.price .old-price').count() == 1 and '60 000' in page.locator('.price .old-price').inner_text())
        check('promotion : 30 000 Ar à envoyer', '30 000 Ar' in page.locator('.steps').inner_text())
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
    goto(page, '#/admin/stats'); page.wait_for_timeout(500)
    check('admin : page Statistiques', 'Statistiques' in page.locator('h1').inner_text())
    check('statistiques : 12 indicateurs', page.locator('.kpi').count() == 12)
    check('statistiques : courbe des inscriptions sur 30 jours', page.locator('.bars .cbar').count() == 30)
    check('statistiques : recettes du paiement validé', '30 000 Ar' in page.locator('.kpis').nth(1).inner_text() or '60 000 Ar' in page.locator('.kpis').nth(1).inner_text())
    page.screenshot(path=f'{SHOTS}/03b-statistiques.png', full_page=True)
    logout(page)

    # --- Étudiante abonnée : modules
    login(page, 'fanja@exemple.mg')
    check('connexion : redirection vers mon espace', '#/mon-espace' in page.url)
    check('mon espace : abonnement actif 30 jours', '30 jours restants' in page.locator('.dsh-days').inner_text())
    goto(page, '#/formation/design-0-f'); page.wait_for_timeout(500)
    check('fiche abonnée : détail du programme visible (1.1…)', page.locator('.mod-secs').count() == 5 and '1.1' in page.locator('.mod-secs').first.inner_text() and page.locator('.prog-lock').count() == 0)
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
    # --- Avis après l'attestation (bloc au-dessus du pied de page)
    check('avis : bloc affiché après l\'attestation', page.locator('#review-slot .rv #review-form').count() == 1 and 'Graphiste' in page.locator('#review-slot').inner_text())
    page.click('#review-form button[type=submit]'); page.wait_for_timeout(200)
    check('avis : note obligatoire', 'note de 1 à 5' in page.locator('#rverr').inner_text())
    page.click('label[for=rv-4]'); page.fill('#rv-comment', 'Très claire, merci !'); page.check('#rv-publish')
    page.locator('#review-slot').scroll_into_view_if_needed(); page.screenshot(path=f'{SHOTS}/05b-avis.png')
    page.click('#review-form button[type=submit]'); page.wait_for_timeout(500)
    check('avis : envoyé et remerciement', 'Merci pour votre avis' in page.locator('#review-slot').inner_text())
    goto(page, '#/'); page.wait_for_timeout(300)
    check('avis : bloc masqué une fois l\'avis donné', page.locator('#review-form').count() == 0)

    # --- Attestation
    goto(page, '#/attestation/' + page.evaluate("window.__mockdb().certificates.find((c) => c.kind === 'course').id")); page.wait_for_timeout(500)
    check('attestation : nom et formation', 'Fanja Rakoto' in page.content() and 'Graphiste – Fondamentaux' in page.content())
    cert_id = page.locator('.dip-rows b').nth(2).inner_text()
    check('attestation : tampon affiché', page.locator('.dip-seal').count() == 1)
    page.click('[data-act=pdf]'); page.wait_for_timeout(200)
    saved = page.evaluate('window.__pdfSaved')
    check(f'PDF : téléchargement lancé ({saved})', bool(saved) and saved.endswith('.pdf'))
    page.screenshot(path=f'{SHOTS}/06-attestation.png', full_page=True)
    goto(page, '#/mon-espace')
    check('mon espace : attestation listée', cert_id in page.content())
    goto(page, '#/formations'); page.wait_for_selector('.done-chk')
    check('catalogue : coche sur la formation réussie', page.locator('.lv .done-chk').count() == 1 and page.locator('.lv .pill.gold').count() == 0)
    page.hover('.done-chk'); page.wait_for_timeout(300)
    check('catalogue : « Réussi » au survol de la coche', page.evaluate("getComputedStyle(document.querySelector('.done-chk'), '::after').opacity") == '1')
    page.locator('.card.job').first.screenshot(path=f'{SHOTS}/06b-coche-reussi.png')
    goto(page, '#/mon-espace')
    check('mon espace : en-tête coloré et cartes', page.locator('.dsh-hero').count() == 1 and page.locator('.dsh-card').count() == 4)
    page.screenshot(path=f'{SHOTS}/06c-mon-espace.png', full_page=True)

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
    login(page, 'admin@vitako.mg')
    goto(page, '#/admin/avis'); page.wait_for_selector('.rv-tbl')
    check('admin : onglet Avis avec l\'avis reçu', 'Très claire, merci !' in page.content() and 'Accord pour publier' in page.locator('.rv-tbl').inner_text() and page.locator('.tabs .tab').count() == 3)
    check('admin : note moyenne 4,0', '4,0 / 5' in page.locator('.kpis').inner_text())
    check('admin : pas de bloc d\'avis pour l\'administrateur', page.locator('#review-form').count() == 0)
    page.screenshot(path=f'{SHOTS}/03c-avis-admin.png', full_page=True)
    logout(page)
    goto(page, '#/admin'); page.wait_for_timeout(300)
    check('admin inaccessible sans compte', 'Connectez-vous' in page.content())

    # --- Téléphone (390 px)
    m = browser.new_context(viewport={'width': 390, 'height': 844}, locale='fr-FR', device_scale_factor=2)
    mp = m.new_page(); setup(mp)
    for name, h in [('07-mobile-accueil', '#/'), ('07b-mobile-catalogue', '#/formations'), ('08-mobile-formation', '#/formation/design-0-f'), ('09-mobile-inscription', '#/inscription')]:
        mp.goto(BASE + h); mp.wait_for_timeout(500)
        overflow = mp.evaluate('document.documentElement.scrollWidth > window.innerWidth + 1')
        check(f'{name} : pas de défilement horizontal', not overflow)
        mp.screenshot(path=f'{SHOTS}/{name}.png', full_page=name.endswith('attestation'))
    # Pages des modules (tableaux, blocs de code, sommaire) : rien ne doit dépasser de l'écran
    signup(mp, 'Admin Mobile', 'admin@mobile.mg')
    for mod in ['media-0-f/module/2', 'design-0-f/module/1', 'tech-3-f/module/3', 'tech-0-a/module/3', 'data-3-a/module/2']:
        goto(mp, '#/formation/' + mod); mp.wait_for_timeout(500)
        check(f'module {mod} sur téléphone : pas de défilement horizontal', not mp.evaluate('document.documentElement.scrollWidth > window.innerWidth + 1'))
    mp.screenshot(path=f'{SHOTS}/11-mobile-module.png')
    # Témoignages : bande qui défile sur l'accueil, sans dépasser de l'écran
    goto(mp, '#/'); mp.wait_for_selector('.tm-card')
    check('témoignages : 8 avis affichés (doublés pour la boucle)', mp.locator('.tm-card').count() == 16 and mp.locator('.tm-card:not([aria-hidden])').count() == 8)
    check('témoignages : notes en étoiles', mp.locator('.tm .stars[aria-label="4,5 sur 5"]').count() >= 1)
    check('témoignages : animation active', mp.evaluate("getComputedStyle(document.querySelector('.tm-track')).animationName") == 'tm-scroll')
    check('témoignages sur téléphone : pas de défilement horizontal', not mp.evaluate('document.documentElement.scrollWidth > window.innerWidth + 1'))
    mp.locator('.tm').scroll_into_view_if_needed(); mp.screenshot(path=f'{SHOTS}/12-mobile-temoignages.png')
    browser.close()
httpd.shutdown()

errs = [e for e in errors if 'Failed to load resource' not in e]
check('aucune erreur JavaScript', not errs)
for e in errs[:10]: print('   ', e)
ok = sum(1 for _, c in results if c)
print(f'\nRéussis : {ok} · Échoués : {len(results) - ok}')
sys.exit(0 if ok == len(results) else 1)
