# PrestaShop v1.3.16 — Version Summary

## Shipped orders no longer disappear from the list after a webhook status change

The Intigo Orders list decided "is this an Intigo order?" only by the order's
current status being one you mapped to a pickup address. But the webhook status-sync
intentionally moves a **shipped** order to a delivery status (e.g. *"en cours de
livraison"*) that isn't pickup-mapped — so the order **vanished** from the list and
you lost track of it.

- The list now also keeps **any order already sent to Intigo** (it has a parcel
  number), no matter what its status later becomes. Once shipped, it stays an Intigo
  order forever.
- The pickup-status mapping still controls which **new / not-yet-sent** orders appear.
- The webhook keeps updating statuses exactly as configured — nothing else changes.

Upload in **Modules → Module Manager → Upload a module**. Data preserved.
