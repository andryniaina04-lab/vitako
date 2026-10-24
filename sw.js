// Service worker de l'application Vitako (site installable).
// Stratégie « réseau d'abord » : on prend toujours la dernière version en ligne ; la copie en cache
// ne sert que sans connexion. Les appels à Supabase et aux autres sites ne passent jamais par le cache.
const CACHE = 'vitako-app-v1';
const CORE = ['/', '/index.html', '/manifest.json', '/assets/img/app/icon-192.png'];

self.addEventListener('install', (e) => {
  e.waitUntil(caches.open(CACHE).then((c) => c.addAll(CORE)).then(() => self.skipWaiting()));
});

self.addEventListener('activate', (e) => {
  e.waitUntil(caches.keys()
    .then((keys) => Promise.all(keys.filter((k) => k !== CACHE).map((k) => caches.delete(k))))
    .then(() => self.clients.claim()));
});

// Garde une seule version de chaque fichier (ex. app.js?v=…) pour ne pas remplir le téléphone.
async function store(req, res) {
  const c = await caches.open(CACHE);
  const url = new URL(req.url);
  for (const k of await c.keys()) {
    const u = new URL(k.url);
    if (u.pathname === url.pathname && u.search !== url.search) await c.delete(k);
  }
  await c.put(req, res);
}

self.addEventListener('fetch', (e) => {
  const req = e.request;
  if (req.method !== 'GET') return;
  const url = new URL(req.url);
  if (url.origin !== self.location.origin) return;
  if (/\.(mp4|webm|pdf)$/i.test(url.pathname)) return;
  e.respondWith(
    fetch(req).then((res) => {
      if (res.ok && res.type === 'basic') { const copy = res.clone(); e.waitUntil(store(req, copy)); }
      return res;
    }).catch(async () => (await caches.match(req)) || (req.mode === 'navigate' ? caches.match('/index.html') : Response.error())),
  );
});

// Notifications push : affichage (avec le son du téléphone) et ouverture de la bonne page au toucher.
self.addEventListener('push', (e) => {
  let d = {};
  try { d = e.data ? e.data.json() : {}; } catch (err) { d = { body: e.data ? e.data.text() : '' }; }
  e.waitUntil(self.registration.showNotification(d.title || 'Vitako', {
    body: d.body || '',
    icon: '/assets/img/app/icon-192.png',
    badge: '/assets/img/app/icon-192.png',
    tag: d.tag || 'vitako',
    renotify: true,
    data: { url: d.url || '/' },
  }));
});

self.addEventListener('notificationclick', (e) => {
  e.notification.close();
  const url = new URL(e.notification.data?.url || '/', self.location.origin).href;
  e.waitUntil(self.clients.matchAll({ type: 'window', includeUncontrolled: true }).then((list) => {
    const open = list.find((c) => c.url.startsWith(self.location.origin));
    if (open) { open.navigate(url).catch(() => {}); return open.focus(); }
    return self.clients.openWindow(url);
  }));
});
