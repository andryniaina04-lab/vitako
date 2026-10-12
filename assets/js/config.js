// Réglages du site Vitako. C'est le seul fichier à modifier pour brancher Supabase.
// Supabase > Project Settings > API Keys : "Project URL" (sans /rest/v1/) et la clé "publishable" (ou "anon public").
// La clé "anon" est faite pour être publique : la sécurité est assurée par la base (schema.sql).
// Ne mettez JAMAIS ici la clé "service_role".
window.VITAKO_CONFIG = {
  supabaseUrl: 'https://qcjlbxhyeusvwlsjmobm.supabase.co',
  supabaseAnonKey: 'sb_publishable_tV6rjLynB9TiTg-1OGNc6Q_qQgQWJcU',

  // Prix affiché par défaut. Le prix réel est lu dans la table settings (clé price_ar).
  price: 25000,
  accessDays: 30,

  // Numéros qui reçoivent les paiements.
  operators: [
    { id: 'mvola', name: 'MVola', number: '038 28 753 61', prefixes: ['034', '038'] },
    { id: 'orange', name: 'Orange Money', number: '032 62 291 65', prefixes: ['032', '037'] },
  ],

  // Délai de validation annoncé aux étudiants.
  validationDelay: '12 h',
};
