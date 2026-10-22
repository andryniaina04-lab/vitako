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
