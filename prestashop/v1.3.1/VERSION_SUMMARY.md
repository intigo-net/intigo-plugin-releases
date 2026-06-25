# PrestaShop v1.3.1 — Version Summary

## Status-driven workflow, mandatory reference, and per-profile access

A refinement release shaped by client feedback, on top of v1.3.0. Same smart
address matching and one-click / bulk shipping — now fitted to a merchant who runs
**several couriers** (each on different order statuses) and needs **role-based
access** for their team.

**Compatibility:** PrestaShop **1.7.x, 8.x and 9.x**, PHP **7.2+**.
Validated end-to-end on **PrestaShop 1.7.8.11 / PHP 7.4.33** (client target), plus
PrestaShop 8.1 and 9.1.3.

## What's new vs v1.3.0

### Only your Intigo orders, filtered by status
- The **Commandes** list now shows **only orders whose status is mapped to an
  Intigo pickup address** — so orders handled by other couriers stay out of the
  way.
- The orders filter is now **by order status** (the statuses you configured on the
  pickup-address page), not by address.

### Reference is mandatory — and visible everywhere it should be
- An order **cannot be shipped (manually or automatically) without a Référence** —
  the send button stays disabled until it's filled, and the server enforces it.
- The Référence now rides in the Intigo **`cid`** (correlation id), in the parcel
  **`description`** so it **prints on the bordereau** ("Commentaire"), and in
  **`additional_info`**.

### Products on the bordereau and in the order view
- The order's **product list** is sent to Intigo, so the **contents print on the
  bordereau**.
- The Intigo order **edit page** shows a **read-only summary** — client name,
  phone, address, total and products — so staff see who/what the order is for
  without editing it.

### Access management (new "Accès" tab)
- A new **Accès** page under Intigo: a simple **per-profile, per-page** checklist
  to control which employees can open which Intigo pages (Dashboard, Orders,
  Pickup addresses, Product sizes, Settings, Logs, Docs).
- It writes to **PrestaShop's native permissions** (Équipe → Permissions) — the
  two stay in sync. The Accès page itself is **SuperAdmin-only**.
- **Fix:** the Intigo pages are now granted to **every employee profile** on
  install/upgrade (PrestaShop only auto-grants SuperAdmin, so custom profiles such
  as "Logisticien" were previously locked out).

### Reliability & security
- Sent orders show their detected zone (postcode/city fallback) instead of blank.
- Reflected-XSS hardening on the orders filter parameter and the bordereau link.

## Install / upgrade

1. Download `prestashop-intigo-parcels-v1.3.1.zip` (in this folder, or the GitHub
   Release page).
2. PrestaShop BO → **Modules → Module Manager → Upload a module** → drag the ZIP.
   Upgrading from an earlier version applies automatically and preserves your setup
   (it also creates the new **Accès** page and unlocks the pages for your profiles).
3. **Intigo → Réglages** → enter your Intigo API key → **Tester la connexion**.
4. **Intigo → Adresses de ramassage** → add pickup address(es) with GPS and map a
   status to each.
5. **Intigo → Accès** → set which employee profile can open which page (optional).
6. Manage and ship orders from **Intigo → Commandes**.

> Using a PrestaShop version not listed above? Contact the Intigo dev team at
> `hello@intigo.tn` before installing.
