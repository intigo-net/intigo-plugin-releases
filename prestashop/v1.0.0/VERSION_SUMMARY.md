# PrestaShop v1.0.0 — Version Summary

## First production release (Fnac Darty Tunisie)

Native PrestaShop module that ships orders via the Intigo delivery network, with a
rebuilt back-office UI and size-based carrier pricing.

**Compatibility:** PrestaShop **1.7.x, 8.x and 9.x**, PHP **7.2+**.
Validated end-to-end on **PrestaShop 1.7.8.11 / PHP 7.4.33** (client target), plus
PrestaShop 8.1 and 9.1.3.

## What's new vs v0.1.0

### Rebuilt back-office UI (Intigo brand)
- Clean, card-based screens with the **Intigo palette: white / black / orange**.
- Persistent in-page navigation bar (Dashboard · Orders · Product sizes · Logs · Settings · Docs) on every screen, plus an expandable **Intigo** dropdown in the BO sidebar.
- Toast notifications for actions; readable contrast; consistent spacing.

### French by default
- The whole module UI defaults to **French**.

### Size-based shipping pricing
- The **Intigo Delivery** carrier now charges by the order's package size (S/M/L/XL), resolved from each product's Intigo size (set in **Product Sizes**) and aggregated to the largest item, falling back to the default size.
- Per-size prices are merchant-configurable in **Settings**.

### Product Sizes management
- Searchable product list with a per-product size selector (bulk save).

### Robustness / production hardening
- The module **never breaks a core admin page** — every hook is wrapped and no-ops when the module isn't configured.
- Opening an order before configuration shows a safe notice instead of crashing.
- **cURL** transport (no dependency on PrestaShop's bundled Guzzle, whose API varies by version).
- API calls are bounded (timeouts) and never block checkout.

### Data safety
- **Uninstall preserves** your configuration (API key, prices, tracking URL) and the order↔parcel mapping; reinstall/upgrade no longer loses your setup. The carrier is revived in place (no duplicate carriers).

### Carrier
- Customer tracking URL points to the Intigo app on Google Play.
- Carrier logo bundled and applied on install.

## Install

1. Download `prestashop-intigo-parcels-v1.0.0.zip` (in this folder, or the GitHub Release page).
2. PrestaShop BO → **Modules → Module Manager → Upload a module** → drag the ZIP.
3. **Intigo → Réglages** → enter your Intigo API key (Sandbox or Production) → **Tester la connexion**.
4. **Intigo → Tailles produits** → assign per-product sizes (or keep the default).
5. **Intigo → Réglages → Tarif de livraison par taille** → enter your negotiated rates.
6. Manage orders from **Intigo → Commandes**.

> Using a PrestaShop version not listed above? Contact the Intigo dev team at
> `hello@intigo.tn` before installing.
