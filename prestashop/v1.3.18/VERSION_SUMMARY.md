# PrestaShop — Intigo Parcels v1.3.18

## What changed
Webhook status sync now maps Intigo's **real** status codes that were previously
missing from the mappable list, so they can move the native PrestaShop order state:

- 6001 — Retour prêt
- 6500 — Retour échange
- 6900 — Retour reçu
- 9000 — Annulé par le vendeur
- 9001 — Annulé par le système
- 9004 — Annulé

Existing delivered/return/pickup codes are unchanged. Verified end-to-end: a signed
`parcel.status_changed` webhook with code 6900 correctly transitions an order to "Livré".
