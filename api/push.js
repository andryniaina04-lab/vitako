// Envoi des notifications push (Web Push, RFC 8291 + VAPID RFC 8292), sans bibliothèque externe.
// Appelé par la base Supabase (pg_net) avec la liste des messages à envoyer.
// Variable d'environnement Vercel obligatoire : VAPID_PRIVATE_KEY (clé privée, jamais dans le code).
import crypto from 'node:crypto';

export const VAPID_PUBLIC_KEY = 'BEOoN28pcVHY6_6VBPMtPKCkMXvFTzx67sAXBMGRQ1ZgrQMHtU24tIdwLqrRF4zqyPhAh4suy0cpOEViDbmBiG8';
const SUPABASE_URL = 'https://qcjlbxhyeusvwlsjmobm.supabase.co';
const SUPABASE_PUBLISHABLE = 'sb_publishable_tV6rjLynB9TiTg-1OGNc6Q_qQgQWJcU';
const SUBJECT = 'mailto:contact@vitako.mg';

const b64u = (buf) => Buffer.from(buf).toString('base64').replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
const unb64u = (s) => Buffer.from(String(s).replace(/-/g, '+').replace(/_/g, '/'), 'base64');
const hmac = (key, data) => crypto.createHmac('sha256', key).update(data).digest();

function vapidKeyObject(publicB64u, privateB64u) {
  const pub = unb64u(publicB64u);
  return crypto.createPrivateKey({ format: 'jwk', key: { kty: 'EC', crv: 'P-256', d: b64u(unb64u(privateB64u)), x: b64u(pub.subarray(1, 33)), y: b64u(pub.subarray(33, 65)) } });
}

export function vapidHeader(endpoint, publicB64u, privateB64u) {
  const aud = new URL(endpoint).origin;
  const head = b64u(JSON.stringify({ typ: 'JWT', alg: 'ES256' }));
  const body = b64u(JSON.stringify({ aud, exp: Math.floor(Date.now() / 1000) + 12 * 3600, sub: SUBJECT }));
  const sig = crypto.sign('sha256', Buffer.from(`${head}.${body}`), { key: vapidKeyObject(publicB64u, privateB64u), dsaEncoding: 'ieee-p1363' });
  return `vapid t=${head}.${body}.${b64u(sig)}, k=${publicB64u}`;
}

// Chiffrement aes128gcm (RFC 8291) d'un message pour un abonnement (clés p256dh et auth du navigateur).
export function encrypt(payload, p256dhB64u, authB64u, salt = crypto.randomBytes(16), ephemeral = null) {
  const uaPublic = unb64u(p256dhB64u), authSecret = unb64u(authB64u);
  const ecdh = ephemeral || crypto.createECDH('prime256v1');
  if (!ephemeral) ecdh.generateKeys();
  const asPublic = ecdh.getPublicKey();
  const shared = ecdh.computeSecret(uaPublic);
  const prkKey = hmac(authSecret, shared);
  const ikm = hmac(prkKey, Buffer.concat([Buffer.from('WebPush: info\0'), uaPublic, asPublic, Buffer.from([1])]));
  const prk = hmac(salt, ikm);
  const cek = hmac(prk, Buffer.concat([Buffer.from('Content-Encoding: aes128gcm\0'), Buffer.from([1])])).subarray(0, 16);
  const nonce = hmac(prk, Buffer.concat([Buffer.from('Content-Encoding: nonce\0'), Buffer.from([1])])).subarray(0, 12);
  const cipher = crypto.createCipheriv('aes-128-gcm', cek, nonce);
  const ct = Buffer.concat([cipher.update(Buffer.concat([Buffer.from(payload), Buffer.from([2])])), cipher.final(), cipher.getAuthTag()]);
  const rs = Buffer.alloc(4); rs.writeUInt32BE(4096);
  return Buffer.concat([salt, rs, Buffer.from([asPublic.length]), asPublic, ct]);
}

async function sendOne(m, privateKey) {
  const body = encrypt(JSON.stringify(m.payload || {}), m.p256dh, m.auth);
  const r = await fetch(m.endpoint, {
    method: 'POST',
    headers: { Authorization: vapidHeader(m.endpoint, VAPID_PUBLIC_KEY, privateKey), 'Content-Encoding': 'aes128gcm', 'Content-Type': 'application/octet-stream', TTL: '86400', Urgency: 'high' },
    body,
  });
  return r.status;
}

async function secretOk(secret) {
  if (!secret || typeof secret !== 'string') return false;
  const r = await fetch(`${SUPABASE_URL}/rest/v1/rpc/push_check`, {
    method: 'POST',
    headers: { apikey: SUPABASE_PUBLISHABLE, Authorization: `Bearer ${SUPABASE_PUBLISHABLE}`, 'Content-Type': 'application/json' },
    body: JSON.stringify({ p_secret: secret }),
  });
  return r.ok && (await r.json()) === true;
}

export default async function handler(req, res) {
  if (req.method !== 'POST') { res.status(405).json({ error: 'method' }); return; }
  const privateKey = process.env.VAPID_PRIVATE_KEY;
  if (!privateKey) { res.status(500).json({ error: 'VAPID_PRIVATE_KEY manquante dans Vercel' }); return; }
  const data = typeof req.body === 'string' ? JSON.parse(req.body || '{}') : (req.body || {});
  if (!(await secretOk(data.secret))) { res.status(403).json({ error: 'forbidden' }); return; }
  const list = Array.isArray(data.messages) ? data.messages.slice(0, 500) : [];
  const gone = [], failed = [];
  let sent = 0;
  for (let i = 0; i < list.length; i += 20) {
    await Promise.all(list.slice(i, i + 20).map(async (m) => {
      try {
        const st = await sendOne(m, privateKey);
        if (st >= 200 && st < 300) sent++;
        else if (st === 404 || st === 410) gone.push(m.endpoint);
        else failed.push(st);
      } catch (e) { failed.push(String(e.message || e).slice(0, 80)); }
    }));
  }
  res.status(200).json({ sent, gone, failed: failed.length, errors: failed.slice(0, 5) });
}
