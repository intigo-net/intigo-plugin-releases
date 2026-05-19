# PrestaShop v0.1.0 - Version Summary

## First public release

Native PrestaShop module that pushes orders to the Intigo delivery network.

**Compatibility:** PrestaShop 1.7.x and 8.x, PHP 7.2+.

## What's in v0.1.0

### Carrier registration

Adds **Intigo Delivery** as a standard PrestaShop carrier. Pricing is handled by PrestaShop's native carrier price/weight ranges — the plugin does NOT override pricing.

### Back-office order management

Central **Intigo → Manage Orders** page lists every order placed with Intigo Delivery, filterable by Pending / Pushed / Failed status.

### Dedicated parcel edit page

Cascading **City → District → Neighborhood** dropdowns populated live from Intigo's `/v3/regions/` API. Recipient name / phone / address are pre-filled from PrestaShop's shipping or invoice address.

### Push to Intigo

POST `/v3/parcels/` with the configured payload. The Intigo NID is stored and shown on the row. Failed attempts retain the error and are freely retryable.

### Auto-push mode (opt-in)

Pushes parcels as soon as orders are placed. Falls back to manual mode if required fields can't be resolved.

### Per-parcel actions

**Update / Cancel / Bordereau** against `/v3/parcels/{nid}/*` endpoints.

### Activity log

Circular buffer (200 entries) of every push attempt, settings save, region lookup. Viewable at **Intigo → Logs**.

### Settings page

Environment toggle (sandbox / production), API key, fallback adapter, auto / manual mode, default package size, cron URL.

### Hourly status sync endpoint

Token-protected endpoint to wire into PrestaShop's `cronjobs` module or system cron.

## Deliberately NOT in this release

- **No checkout-side injection.** Customer-facing checkout is pure PrestaShop. All Intigo-specific data is captured/edited from the back-office. Partners' custom checkout flows aren't touched.
- **No shipping price management.** PrestaShop's native carrier price/weight ranges handle that.
- **No injection into PrestaShop's address edit modal.** Intigo data lives in its own UI to avoid version-fragile DOM hacks.

## Install

1. Download `prestashop-intigo-parcels-v0.1.0.zip` (in this folder, or from the GitHub Release page).
2. PrestaShop BO → **Modules → Module Manager → Upload a module** → drag the ZIP.
3. Configure → enter your Intigo API key (sandbox or production) → **Test connection**.
4. **Sell → Carriers** → confirm **Intigo Delivery** is enabled and assign it to your zones / price ranges.
