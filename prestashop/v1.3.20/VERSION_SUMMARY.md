# PrestaShop — Intigo Parcels v1.3.20

## What changed — pickup address integrity (never guessed) + searchable logs

This release fixes a bug where a parcel could be created on Intigo with the
**wrong pickup address** (e.g. Sousse instead of Sfax): when the internet
connection was flaky, the module's pickup resolver fell back to the **default**
pickup and shipped from the wrong place.

**The pickup is no longer guessed.** It is resolved purely locally — no network
call — from either the merchant's per-order choice or the status→pickup mapping.
If neither resolves, **the parcel is not sent**; the order is flagged *"Adresse de
ramassage requise"* until the merchant sets the pickup.

- **No more default fallback.** The global default pickup setting was removed. A
  send is either explicitly correct or it's blocked — it can no longer route to a
  fallback address on a bad connection.
- **Pickup switcher in the order edit modal** (and the Orders-list edit page): a
  dropdown defaulting to the pickup mapped to the order's status; pick another to
  force it (the choice is remembered).
- **Divergence warning + one-click resend.** If a parcel was already sent and the
  status later maps to a different pickup, the order shows a clear warning with a
  **Renvoyer (bon ramassage)** button (Intigo can't change a created parcel's
  pickup, so it cancels + recreates).
- **Better logs.** Every order status change is logged with the **detected pickup
  address** and the **order id**; the Logs page now has an order-id column and a
  filter, so you can pull one order's full history.

Upgrade-safe: two nullable columns are added idempotently; no data migration.
Note: orders whose status has no pickup mapping will now block at send until a
pickup is chosen (that is the fix) — make sure your status→pickup mapping is set.
