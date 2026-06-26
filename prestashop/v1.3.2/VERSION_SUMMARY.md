# PrestaShop v1.3.2 — Version Summary

## Multi-profile access fix, 1.7.8.0 polish, bulk bordereau & flexible status sync

A client-feedback round, validated on the client's actual **PrestaShop 1.7.8.0**
(as well as 1.7.8.11). Same shipping workflow as v1.3.1, now correct for teams with
custom employee profiles and richer status handling.

**Compatibility:** PrestaShop **1.7.x, 8.x and 9.x**, PHP **7.2+**.

## What's new vs v1.3.1

### Works for every employee profile (not just the admin)
- **Fix:** the Intigo pages now render fully styled for **any** profile (Logisticien,
  Commercial, …). PrestaShop only ran our hooks (which load the CSS/JS) for the
  SuperAdmin before, so other profiles saw an **unstyled** page — now every profile
  gets module access, while still respecting the per-page limits you set in **Accès**.
- Icons now render on **1.7.8.0** too: the Material Icons font is bundled with the
  module (1.7.8.0's back office didn't provide it on our pages, so nav/badge/KPI
  icons showed as text).

### Bulk bordereau
- Select several sent orders and generate **one combined bordereau** in a click —
  with the same filters/multi-select as bulk send.

### Flexible status sync (webhook)
- Map **each Intigo status** (13 of them) to **any PrestaShop order status** — many
  Intigo statuses can point at the same one.
- New **toggle** "Mettre à jour les commandes": ON = the webhook moves your order
  status automatically; OFF = your orders are left untouched.
- The orders list now shows the **live Intigo status** of each parcel (kept current
  by the webhook), even when auto-update is off.

### Orders list
- Each order now shows its **Intigo Référence** in the table.

### Reference
- The Référence is sent in the parcel `cid`, printed on the bordereau (description),
  and also carried in the API note field (`additional_info`).

## Install / upgrade

1. Download `prestashop-intigo-parcels-v1.3.2.zip` (in this folder, or the GitHub
   Release page).
2. PrestaShop BO → **Modules → Module Manager → Upload a module** → drag the ZIP.
   Upgrading applies automatically and preserves your setup, your **Accès**
   restrictions, and your webhook mapping.
3. **Intigo → Réglages** → API key + (optionally) the **Webhook** status mapping.
4. **Intigo → Accès** → set which employee profile can open which page.
5. Ship from **Intigo → Commandes**.

> Using a PrestaShop version not listed above? Contact the Intigo dev team at
> `hello@intigo.tn` before installing.
