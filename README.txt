SALON DE BEAUTY — GUIDE (FR/EN/AR)
Fichiers: index.html, admin.html, supabase-setup.sql, logo.png (original, inchangé)

1. SUPABASE
 - Créez un projet sur supabase.com.
 - Authentication > Users > Add user: email + mot de passe de l'admin (cochez Auto Confirm).
 - Authentication > Providers/Settings: désactivez "Allow new users to sign up" (important).
 - Ouvrez supabase-setup.sql, remplacez admin@example.com (4 fois) par l'email de l'admin, puis SQL Editor > Run.
 - Settings > API: copiez "Project URL" et la clé "anon / publishable".
   N'utilisez JAMAIS la clé service_role.
 - Dans index.html ET admin.html, remplacez en haut du script:
   SB_URL='YOUR_SUPABASE_URL'  et  SB_KEY='YOUR_SUPABASE_ANON_KEY'.

2. GITHUB PAGES
 - Créez un dépôt, envoyez tous les fichiers (index.html à la racine).
 - Settings > Pages > Deploy from branch > main / root.
 - Site : https://USER.github.io/REPO/ — Admin : .../admin.html
 - Supabase > Authentication > URL Configuration: ajoutez cette URL en Site URL.

3. TEST RAPIDE
 Envoyez une réservation depuis le site, connectez-vous à admin.html: elle apparaît en Pending; testez Confirmer / Annuler / Supprimer.

Note sécurité: les visiteurs peuvent seulement créer des réservations "Pending". Seul l'email admin peut lire/modifier/supprimer.
