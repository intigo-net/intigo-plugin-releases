# PrestaShop v1.3.12 — Version Summary

## Two client-found fixes: reference not saving + wrong zone

**Compatibility:** PrestaShop 1.7.x / 8.x / 9.x, PHP 7.2+.

### 1. "Informations enregistrées" but the Reference wasn't saved
On some orders the parcel table had been left **missing columns** by an incomplete
earlier upgrade. PrestaShop writes every column in one statement, so a single
missing column made **every save silently fail** — while the Orders list still
worked (it doesn't read those columns). Now:
- the schema self-repair covers **every** column and runs on upgrade;
- the save **self-heals and retries**, and shows a **real error** instead of a
  false success if it still can't write.

### 2. Wrong zone (e.g. El Menzah detected as "Jendouba")
The detector never read PrestaShop's separate **postal-code** field. It now uses
the postal code to isolate the locality, so "…2091 … Menzah" resolves to **El
Menzah** instead of a far-away fuzzy match.

## Install / upgrade
Upload `prestashop-intigo-parcels-v1.3.12.zip` in **Modules → Module Manager →
Upload a module**. Upgrading preserves your data and repairs the table automatically.

> If the version shown doesn't change after upload, do a clean reinstall:
> Uninstall the module (your data is preserved), then upload the zip again.
