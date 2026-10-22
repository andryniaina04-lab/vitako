// Application installable (PWA) : enregistrement du service worker et bouton « Installer Vitako ».
(() => {
  const standalone = () => matchMedia('(display-mode: standalone)').matches || navigator.standalone === true;
  const ua = navigator.userAgent;
  const isIOS = /iphone|ipad|ipod/i.test(ua) || (/macintosh/i.test(ua) && navigator.maxTouchPoints > 1);
  const isMobile = /android|iphone|ipad|ipod|mobile/i.test(ua) || isIOS;
  let deferred = null;

  if ('serviceWorker' in navigator && (location.protocol === 'https:' || location.hostname === 'localhost')) {
    addEventListener('load', () => navigator.serviceWorker.register('/sw.js').catch(() => {}));
  }

  const KEY = 'vitako_install_later';
  const later = () => { try { return Date.now() < Number(localStorage.getItem(KEY) || 0); } catch (e) { return false; } };
  const snooze = (days) => { try { localStorage.setItem(KEY, String(Date.now() + days * 864e5)); } catch (e) { /* stockage indisponible */ } };

  // Bandeau discret en bas de l'écran, sur téléphone seulement.
  let bar = null;
  function showBar() {
    if (bar || standalone() || later() || !isMobile) return;
    if (!deferred && !isIOS) return;
    if (/^#\/(admin|formation\/[\w-]+\/examen)/.test(location.hash)) return;
    bar = document.createElement('div');
    bar.className = 'pwa-bar';
    bar.setAttribute('role', 'dialog');
    bar.setAttribute('aria-label', "Installer l'application Vitako");
    bar.innerHTML = `<img src="/assets/img/app/icon-192.png" alt="" width="40" height="40">
      <div><b>Application Vitako</b><small>Sur ton écran d'accueil</small></div>
      <button type="button" class="pwa-go" data-pwa-install>Installer</button>
      <button type="button" class="pwa-x" aria-label="Plus tard">×</button>`;
    bar.querySelector('.pwa-x').addEventListener('click', () => { snooze(14); hideBar(); });
    document.body.appendChild(bar);
  }
  function hideBar() { bar?.remove(); bar = null; }

  addEventListener('beforeinstallprompt', (e) => {
    e.preventDefault();
    deferred = e;
    document.documentElement.classList.add('pwa-can-install');
    setTimeout(showBar, 4000);
  });
  addEventListener('appinstalled', () => {
    deferred = null; hideBar(); document.documentElement.classList.remove('pwa-can-install');
  });
  if (isIOS && !standalone()) setTimeout(showBar, 6000);

  // Tout bouton [data-pwa-install] lance l'installation, ou ouvre la page d'explications.
  document.addEventListener('click', async (e) => {
    if (!e.target.closest('[data-pwa-install]')) return;
    if (deferred) {
      deferred.prompt();
      const choice = await deferred.userChoice.catch(() => null);
      if (choice?.outcome === 'accepted') { hideBar(); deferred = null; } else snooze(3);
      return;
    }
    hideBar();
    location.hash = '#/installer';
  });

  window.vitakoPWA = { standalone, isIOS, canPrompt: () => !!deferred };
})();
