# PrestaShop v1.3.8 — Version Summary

## Fix: address auto-detect on the Intigo Orders edit page

**Compatibility:** PrestaShop **1.7.x, 8.x and 9.x**, PHP **7.2+**. Validated on the
client's **PrestaShop 1.7.8.0**, plus 1.7.8.11 / PHP 7.4, 8.1 and 9.1.3.

## What's new vs v1.3.7

### Consistent zone detection on both order screens
- **Symptom:** opening an order from **Intigo → Commandes → "Préciser la zone"**
  showed an empty **Ville / Délégation**, while the native PrestaShop order view
  auto-detected the zone for the *same* order.
- **Cause:** the Intigo Orders edit page never ran the address auto-detection — it
  only displayed a zone that was already stored.
- **Fix:** the edit page now runs the **same auto-detection as the native order
  panel** (best-effort, persisted, one-time). Ville/Délégation are pre-filled from
  the customer's address; the merchant can still correct them in the dropdowns.

### Carried forward
- v1.3.7 COD-by-payment-method + webhooks-in-journal, v1.3.6 "Renvoyer avec le bon
  ramassage", v1.3.5 status→pickup cold-cache fix, v1.3.4 order-page zone detect.

## Install / upgrade

1. Download `prestashop-intigo-parcels-v1.3.8.zip` (in this folder, or the GitHub Release page).
2. PrestaShop BO → **Modules → Module Manager → Upload a module** → drag the ZIP.
   (Upgrading preserves your settings, mappings and order↔parcel data.)

> Using a PrestaShop version not listed above? Contact the Intigo dev team at
> `hello@intigo.tn` before installing.
