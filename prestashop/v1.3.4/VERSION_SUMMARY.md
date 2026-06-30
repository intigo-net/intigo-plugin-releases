# PrestaShop v1.3.4 — Version Summary

## Auto-detect the delivery zone on the native order page

A follow-up to v1.3.3. Same shipping workflow — now **pre-existing orders** opened
from PrestaShop's own order page have their **Ville / Délégation detected
automatically**, instead of showing "— choisir une ville —".

**Compatibility:** PrestaShop **1.7.x, 8.x and 9.x**, PHP **7.2+**.
Validated end-to-end on the client's **PrestaShop 1.7.8.0**, plus 1.7.8.11 / PHP 7.4, 8.1 and 9.1.3.

## What's new vs v1.3.3

### Address auto-detection on the native order panel
- **Symptom:** opening an older order from **Commandes → (order) → Voir** showed the
  address text but empty **Ville** and **Délégation**, forcing manual selection.
- **Cause:** the Intigo zone auto-detection ran only on the **Intigo → Commandes**
  list, not on PrestaShop's own order page. Orders placed before Intigo was set up
  had no stored zone, so the panel showed nothing.
- **Fix:** the order panel now auto-detects the Intigo zone (city / délégation /
  cité) from the customer's address and pre-fills the selectors.
  - Runs **once per order** and persists the result (reopening is instant — no
    repeat lookup).
  - Respects a merchant's manual entry; never overwrites it.
  - Fully guarded — an unmatchable address or a temporary lookup outage tries once
    and never blocks or slows the order page on later views.

### Carried forward from v1.3.3
- Self-healing tab creation (fixes the **Adresses de ramassage** page being
  inaccessible — even to SuperAdmin — after an in-place upgrade).
- Class autoloader (fixes the "Attempted to load class IntigoAdminUi" crash).
- Permission-aware in-page navigation (hides tabs a profile can't open).

## Install / upgrade

1. Download `prestashop-intigo-parcels-v1.3.4.zip` (in this folder, or the GitHub Release page).
2. PrestaShop BO → **Modules → Module Manager → Upload a module** → drag the ZIP.
   (Upgrading is safe — your API key, prices and order↔parcel mapping are preserved.)
3. Open an order from **Commandes** — the Intigo zone fills in automatically.

> Using a PrestaShop version not listed above? Contact the Intigo dev team at
> `hello@intigo.tn` before installing.
