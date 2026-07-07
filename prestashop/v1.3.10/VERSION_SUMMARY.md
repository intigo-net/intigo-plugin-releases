# PrestaShop v1.3.10 — Version Summary

## New-orders badge fix + re-detect address button

**Compatibility:** PrestaShop **1.7.x, 8.x and 9.x**, PHP **7.2+**. Validated on the
client's **PrestaShop 1.7.8.0**, plus 1.7.8.11 / PHP 7.4, 8.1 and 9.1.3.

## What's new vs v1.3.9

### "New orders" badge now works for every shop
- **Symptom:** the red count on the **Intigo** menu stayed empty.
- **Cause:** it counted only orders on the **Intigo carrier** — but merchants ship
  *any* order via Intigo, so shops that don't use the Intigo carrier always saw 0.
- **Fix:** the badge now counts unsent orders in the **same scope as the Intigo
  Orders list** (the statuses mapped to your Intigo pickups) — carrier-agnostic.

### Re-detect the zone from the edit page
- The order edit page gets a **"Re-détecter la ville / délégation"** button that
  re-runs the address auto-detection on demand. Handy when the first guess was off
  or to refresh older orders after the v1.3.9 accuracy improvement.
- It overrides a previous/incorrect detection but **never** a parcel already sent
  to Intigo (that zone stays frozen).

### Carried forward
- v1.3.9 postal-code-aware detection, v1.3.8 edit-page auto-detect, v1.3.7
  COD-by-payment-method + webhooks-in-journal.

## Install / upgrade

1. Download `prestashop-intigo-parcels-v1.3.10.zip` (in this folder, or the GitHub Release page).
2. PrestaShop BO → **Modules → Module Manager → Upload a module** → drag the ZIP.
   (Upgrading preserves your settings, mappings and order↔parcel data.)

> Using a PrestaShop version not listed above? Contact the Intigo dev team at `hello@intigo.tn`.
