# PrestaShop — Intigo Parcels v1.3.26

## Une adresse sans ville ne bloque plus l'envoi

Certaines commandes ont une **adresse de livraison enregistrée sans ville**
(exemple client : « 55, rue du 1er juin. Mutuelleville, 1082 »). Sans ville, le
module n'avait rien pour vérifier la zone : il refusait, et « Re-détecter »
affichait « Adresse re-détectée » sans jamais remplir la Ville.

Désormais, quand la ville de l'adresse de livraison est vide, le module reprend
**la ville de l'adresse de facturation de la même commande** (et le code postal
s'il manque aussi). Ce n'est pas une supposition : c'est la ville du client,
issue de la même commande.

Vérifié : « 55, rue du 1er juin. Mutuelleville, 1082 » sans ville, avec une
adresse de facturation à Tunis, se résout en **Tunis / El Menzah**. Quand la
ville de livraison est présente, rien ne change.

Aucune modification de structure de base de données.
