// Réglages du site Vitako. C'est le seul fichier à modifier pour brancher Supabase.
// Supabase > Project Settings > API Keys : "Project URL" (sans /rest/v1/) et la clé "publishable" (ou "anon public").
// La clé "anon" est faite pour être publique : la sécurité est assurée par la base (schema.sql).
// Ne mettez JAMAIS ici la clé "service_role".
window.VITAKO_CONFIG = {
  supabaseUrl: 'https://qcjlbxhyeusvwlsjmobm.supabase.co',
  supabaseAnonKey: 'sb_publishable_tV6rjLynB9TiTg-1OGNc6Q_qQgQWJcU',

  // Prix affiché par défaut. Le prix réel est lu dans la table settings (clé price_ar).
  // Prix normal et promotion (les valeurs de la table settings de Supabase ont priorité)
  price: 60000,
  promoPrice: 30000,
  promoUntil: '2026-11-30', // dernier jour inclus, heure de Madagascar
  accessDays: 30,

  // Numéros qui reçoivent les paiements, avec le nom du titulaire affiché aux étudiants.
  operators: [
    { id: 'mvola', name: 'MVola', number: '038 28 753 61', holder: 'Andrianiaina Philibert', prefixes: ['034', '038'] },
    { id: 'orange', name: 'Orange Money', number: '032 62 291 65', holder: 'ANDRIANIAINA PHILIBERT RANDRIAMIHANTA', prefixes: ['032', '037'] },
  ],

  // Vidéo de présentation de l'accueil (à côté du titre) : fichier .mp4/.webm dans assets/video/,
  // ou lien YouTube ou Vimeo. Laisser vide pour afficher l'illustration animée.
  heroVideo: 'assets/video/vitako-presentation.mp4',
  heroPoster: 'assets/video/vitako-presentation.jpg', // image affichée avant le chargement d'une vidéo .mp4 (facultatif)

  // Délai de validation annoncé aux étudiants.
  validationDelay: 'quelques minutes',
};
