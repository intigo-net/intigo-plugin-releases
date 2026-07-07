# PrestaShop v1.3.11 — Version Summary

## Fix: could not save the order edit form when the city wasn't detected

**Compatibility:** PrestaShop 1.7.x / 8.x / 9.x, PHP 7.2+.

### What was wrong
On the order edit page, if the **Ville** (city) had not been auto-detected yet, the
required-but-empty city dropdown made the browser **silently block the whole form**.
Clicking **Enregistrer** did nothing — the **Référence** and other fields never saved.

### Fix
The save buttons now **save as a draft** even with an incomplete zone (they bypass
the browser's HTML5 blocking). Completeness is still enforced **server-side** before
an actual send to Intigo, and the postal-code path still works. So you can always
save the reference now and finish the zone later.

## Install / upgrade
1. Download `prestashop-intigo-parcels-v1.3.11.zip`.
2. BO → **Modules → Module Manager → Upload a module** → drag the ZIP.
   (Upgrading preserves your settings, mappings and order↔parcel data.)
