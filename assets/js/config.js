// Réglages du site Vitako. C'est le seul fichier à modifier pour brancher Supabase.
// Supabase > Project Settings > API : copier "Project URL" et la clé "anon public".
// La clé "anon" est faite pour être publique : la sécurité est assurée par la base (schema.sql).
// Ne mettez JAMAIS ici la clé "service_role".
window.VITAKO_CONFIG = {
  supabaseUrl: '',
  supabaseAnonKey: '',

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
