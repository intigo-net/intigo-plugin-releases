# PrestaShop v1.3.0 — Version Summary

## Smart address matching, automatic shipping, and status sync

Native PrestaShop module that ships orders via the Intigo delivery network. This
release turns the module into a near-hands-free shipping desk: it auto-detects the
Intigo delivery zone from the customer's address, ships in bulk, syncs statuses
back from Intigo, and never breaks a core admin page.

**Compatibility:** PrestaShop **1.7.x, 8.x and 9.x**, PHP **7.2+**.
Validated end-to-end on **PrestaShop 1.7.8.11 / PHP 7.4.33** (client target), plus
PrestaShop 8.1 and 9.1.3.

## What's new vs v1.0.0

### Automatic address detection (always the nearest zone)
- Each order's Intigo **city / délégation / cité** is auto-detected from the
  free-text shipping address — no manual data entry.
- The resolver **always surfaces at least the nearest zone** — it never leaves an
  order unmatched. Confident matches are marked **Prête**; lower-confidence ones
  are filled and flagged **À vérifier** for a quick glance before sending.

### Postal-code shipping (dual path, automatic fail-over)
- A second, independent path resolves the zone from the **postal code**.
- The two methods **back each other up**: if the address match can't ship an
  order, the postal-code path does — and vice-versa. Far fewer stuck orders.

### Send to Intigo — one order or in bulk
- Send any order with one click, or **multi-select and bulk-send** from the orders
  list with filters (Prêtes à envoyer / À vérifier / Synchronisées / Échec).
- **Bordereau** (waybill) generation, with your internal **Référence** printed on
  it. Duplicate-send protection so a double-click never creates two parcels.

### Automatic shipping (opt-in, reference-gated)
- Optionally ship an order automatically when it reaches a chosen status.
- **Hard rule:** an order is **never auto-shipped without a Référence** — keeping
  automation explicit and under the merchant's control.

### Pickup addresses
- Manage your Intigo **pickup addresses**, map each to an order status, edit them,
  and **add/update GPS** in-place. GPS is required so parcels are never rejected.
- Filter the orders list by **pickup address**.

### Status synchronization (webhook)
- Intigo pushes **delivery-status updates back into PrestaShop** via a secure,
  signed webhook — order statuses stay in sync automatically.

### Rebuilt back office
- Modern, fully **French** UI with a clean **indigo / slate** palette (the previous
  orange accent has been retired), a KPI dashboard with charts, sidebar icons, and
  a new-orders badge.

### Hardening & security
- Every hook is wrapped — the module **never breaks a core admin page** and never
  blocks checkout. cURL transport; bounded, timed-out API calls.
- Input handling reviewed and hardened against reflected-XSS in admin links.
- **Uninstall preserves** your configuration and order↔parcel mapping.

## Install / upgrade

1. Download `prestashop-intigo-parcels-v1.3.0.zip` (in this folder, or the GitHub
   Release page).
2. PrestaShop BO → **Modules → Module Manager → Upload a module** → drag the ZIP.
   Upgrading from an earlier version applies automatically and preserves your setup.
3. **Intigo → Réglages** → enter your Intigo API key → **Tester la connexion**.
4. **Intigo → Adresses de ramassage** → add your pickup address(es) with GPS, and
   (optionally) map statuses for automatic shipping.
5. Manage and ship orders from **Intigo → Commandes**.

> Using a PrestaShop version not listed above? Contact the Intigo dev team at
> `hello@intigo.tn` before installing.
