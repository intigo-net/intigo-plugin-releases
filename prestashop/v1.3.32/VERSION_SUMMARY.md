# PrestaShop — Intigo Parcels v1.3.32

## Une commande modifiée après l'envoi met à jour son colis

Quand une commande est modifiée dans PrestaShop **après** la création du colis
(quantité, produit retiré ou ajouté, prix), le colis Intigo suit désormais :

- **Seulement ce qui a changé** est envoyé à Intigo — le prix à encaisser et la
  liste des produits. L'ancienne synchronisation renvoyait **tout** le colis à
  chaque enregistrement de la commande (y compris quand notre propre webhook
  changeait l'état), ce qui écrasait l'adresse, la zone et le téléphone corrigés
  côté Intigo.
- **Uniquement tant que le colis n'est pas ramassé.** Après le ramassage, Intigo
  refuse toute modification : le module l'enregistre et l'affiche dans le panneau
  Intigo de la commande (« Le colis ne correspond plus à la commande », avec le
  prix du colis et celui de la commande), au lieu de se taire.
- Un enregistrement sans changement n'appelle plus Intigo.
- Le bouton **« Enregistrer les modifications »** ne dit plus « Colis mis à jour »
  quand un seul des trois appels de secours a réussi.

## Mise à jour

Installation par remplacement du module (zip). La mise à niveau ajoute deux
colonnes à `ps_intigo_parcel` (`sync_snapshot`, `sync_error`). Les colis déjà
envoyés sont comparés à partir de leur prochaine modification.

## Vérification

Testé sur PrestaShop 1.7.8.0 : modification de quantité → `PATCH /v3/parcels/{nid}`
avec le nouveau prix uniquement ; enregistrement sans changement → aucun appel ;
colis au statut 2001 → modification enregistrée, Intigo non appelé.
