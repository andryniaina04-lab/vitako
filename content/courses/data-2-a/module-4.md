Les clients étrangers (entreprises, organisations internationales, bureaux d'études) confient des données sensibles et des volumes importants. Ils attendent une protection stricte des données, des fichiers aux bons formats internationaux et une communication claire. Ce module vous prépare à ces exigences.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Protéger les données personnelles selon des règles strictes.
> 2. Éviter les pièges des formats internationaux : dates, nombres, encodage.
> 3. Échanger avec le vocabulaire anglais des données.
> 4. Travailler avec les outils de partage sécurisés des clients.
> 5. Rédiger un contrat et un devis pour un client étranger.

## Protéger les données personnelles

> [!definition] Donnée personnelle
> Toute information qui permet d'identifier une personne, directement (nom, numéro d'identité, photo) ou indirectement (adresse, téléphone, combinaison d'âge, village et profession). Certaines données sont **sensibles** : santé, origine, religion, opinions, données financières.

En Europe, le **RGPD** encadre strictement l'utilisation des données personnelles, y compris quand elles sont traitées par un prestataire à l'étranger. D'autres pays ont des règles comparables. Le client est responsable, mais il exige de vous des pratiques irréprochables, souvent écrites dans un **accord de traitement des données**.

### Les 10 règles de protection

1. **Utilisez les données uniquement** pour la mission confiée.
2. **Ne copiez jamais** les données sur un support personnel non autorisé (clé USB, Drive personnel, téléphone).
3. **Travaillez sur un ordinateur protégé** : mot de passe, verrouillage automatique, disque chiffré si possible.
4. **Utilisez les outils de partage du client** (voir plus bas), pas les vôtres.
5. **Ne partagez rien** par WhatsApp, e-mail non chiffré ou réseaux sociaux.
6. **Pas de cybercafé** ni de Wi-Fi public.
7. **Accès personnels** : jamais de partage de compte.
8. **Pseudonymisez** quand le client le demande (remplacer les noms par des codes).
9. **Signalez immédiatement** toute perte ou fuite de données.
10. **Supprimez** les données à la fin de la mission et confirmez-le par écrit.

> [!definition] Pseudonymisation
> Remplacer les informations qui identifient directement une personne (nom, téléphone) par un code (Q0127), en gardant la table de correspondance à part et protégée. Les données restent utilisables pour l'analyse, mais une personne qui voit le fichier ne sait pas à qui elles se rapportent.

## Les pièges des formats internationaux

### Dates

| Écrit | Pour un Européen | Pour un Américain |
| --- | --- | --- |
| 03/04/2026 | 3 avril 2026 | 4 mars 2026 (March 4) |

**Solution** : utilisez le format international **AAAA-MM-JJ** (2026-04-03) dans les fichiers d'échange, ou demandez le format au client. Vérifiez qu'Excel a bien reconnu les dates comme des dates (alignées à droite par défaut) et pas comme du texte.

### Nombres

| Élément | Français | Anglais |
| --- | --- | --- |
| Décimale | 3,5 | 3.5 |
| Milliers | 25 000 | 25,000 |
| Séparateur de colonnes d'un CSV | Souvent le point-virgule ( ; ) | Souvent la virgule ( , ) |

Un fichier CSV anglais ouvert avec un Excel en français peut tout mettre dans **une seule colonne**, ou transformer 3.5 en date. **Solution** : importez les CSV avec **Données → À partir d'un fichier texte/CSV** (ou Power Query) en choisissant le séparateur et les paramètres régionaux.

### Encodage des caractères

> [!definition] Encodage UTF-8
> La façon dont les lettres sont enregistrées dans un fichier texte. L'UTF-8 gère tous les alphabets et les accents. Un mauvais encodage transforme « Antsirabé » en « AntsirabÃ© ».

**Solution** : enregistrez les fichiers CSV en **CSV UTF-8** et précisez l'encodage à l'importation.

## Le vocabulaire anglais des données

| Anglais | Français |
| --- | --- |
| data entry | saisie de données |
| data cleaning | nettoyage de données |
| dataset | jeu de données |
| field / record | champ / enregistrement (ligne) |
| duplicate | doublon |
| missing value | valeur manquante |
| outlier | valeur aberrante |
| consistency check | contrôle de cohérence |
| data dictionary | dictionnaire des variables |
| error rate / accuracy | taux d'erreur / précision |
| batch | lot |
| turnaround time | délai de traitement |
| data processing agreement | accord de traitement des données |

> [!exemple] Message de livraison en anglais
> « Hi Mark, please find batch 03 (200 records) in the shared folder. Quality summary: 0.21 % error rate on a 20 % sample, no duplicates, 4 missing values flagged in the "Remarks" column (illegible fields). The data dictionary has been updated with two new codes. Next batch expected on Thursday. »

## Les outils de partage sécurisés

| Outil fourni par le client | Bonnes pratiques |
| --- | --- |
| **Dossier partagé de l'entreprise** (SharePoint, OneDrive, Google Drive d'entreprise) | Travailler directement dedans, sans télécharger si possible |
| **Serveur de transfert sécurisé** | Utiliser les identifiants personnels, ne pas les partager |
| **Bureau à distance ou VPN** | Les données restent sur les serveurs du client ; vous travaillez à distance |
| **Plateforme d'enquête** (KoboToolbox, ODK) | Comptes nominatifs avec les droits strictement nécessaires |

## Contrat et devis pour un client étranger

### Les clauses importantes

1. **La description** du travail : volume, type de documents, règles de saisie.
2. **La qualité** garantie et sa méthode de mesure.
3. **Les délais** par lot.
4. **La protection des données** : accord de traitement, règles de sécurité, suppression en fin de mission.
5. **Le prix** : à l'heure, à la ligne, au document ou au lot, en devises.
6. **Les conditions de paiement** : par lot livré et accepté, ou mensuel.
7. **Les corrections** : les erreurs trouvées par le client dans un délai donné sont corrigées gratuitement.

### Estimer un devis par lot

1. **Testez** sur un échantillon réel (au moins 20 documents).
2. **Mesurez** le temps de saisie **et** de contrôle.
3. **Ajoutez** le temps de gestion (préparation, rapports, échanges) et une marge pour les imprévus.
4. **Convertissez** en prix par document ou par lot.

> [!madagascar]
> Facturez en euros ou en dollars et vérifiez, avant le premier lot, qu'un moyen de paiement fonctionne depuis Madagascar (virement international, Payoneer, plateforme). Les possibilités de PayPal sont limitées pour Madagascar. Conservez chaque facture et chaque relevé.

> [!retenir]
> - 10 règles de protection des données, dont : pas de copie personnelle, pas de WhatsApp, suppression en fin de mission.
> - Dates en AAAA-MM-JJ, séparateurs et décimales vérifiés, fichiers en UTF-8.
> - Un vocabulaire anglais de base pour les échanges et les rapports.
> - Les outils de partage du client, pas les vôtres.
> - Un devis fondé sur un test réel, avec qualité, délais et protection des données écrits.

## Exercice pratique : un client international

> [!exercice] Exercice pratique · 2 heures 30
> 1. Créez un fichier CSV avec des dates américaines, des décimales avec un point et des noms accentués ; importez-le correctement dans Excel avec Power Query.
> 2. Pseudonymisez un fichier de 30 personnes : remplacez noms et téléphones par des codes, et gardez la table de correspondance dans un fichier séparé protégé par mot de passe.
> 3. Rédigez votre liste personnelle des 10 règles de protection appliquées à votre poste.
> 4. Rédigez en anglais un message de livraison de lot avec résumé de qualité.
> 5. Rédigez un devis pour 2 000 documents à partir d'un test sur 20 documents.
>
> **À livrer** : le fichier importé, le fichier pseudonymisé (sans la table), votre liste, votre message et votre devis.
