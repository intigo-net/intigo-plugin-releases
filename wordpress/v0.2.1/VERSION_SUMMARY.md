# WordPress v0.2.1 - Version Summary

## What changed in this version

### Customer-facing checkout (new)

- New **Intigo shipping method** registered in WooCommerce with four size-based rates: S / M / L / XL (1 / 6 / 7 / 8 DT).
- Cascading **city → district → neighborhood** selector exposed at checkout via a modal flow.
- Live validation checklist with HMAC-verified AJAX endpoints.
- Compatible with both Classic (shortcode) checkout and the WooCommerce **Blocks Checkout**.
- Address selections persisted onto the order and used as the source of truth when pushing to Intigo.

### Seller-owned package size

- Sellers now own per-product package size (S/M/L/XL) via product meta.
- New `Intigo_Size_Resolver` waterfall picks the size from product meta first, then falls back through cart-level metadata.
- Shipping rate at checkout follows the resolved size, so the displayed price reflects the actual parcel size that will be billed.
- Aligned with Intigo's fixed size grid — no toggle, no auto-derive heuristics.

### Auto-push to Intigo on order creation

- Multi-event auto-push wired into:
  - `woocommerce_order_status_processing`
  - `woocommerce_order_status_completed`
  - `woocommerce_payment_complete`
  - `woocommerce_thankyou`
- Idempotent: the order is pushed once, regardless of which event fires first for the active payment gateway.
- `order_to_payload` now reads the new `_intigo_*` order meta first and falls back to standard WooCommerce fields.

### HPOS (High-Performance Order Storage) compatibility

- Replaced `get_post_meta` / `update_post_meta` with `$order->get_meta()` / `$order->update_meta_data()` across admin and order-service code paths.
- Verified against WooCommerce 10.7+ where HPOS is the default.

### Admin UX

- Settings tab: **automatic vs manual** order-push toggle.
- Logs page capped at the most recent 200 entries with pagination (25 per page).
- Spacing and visual polish across Dashboard, Manage Orders, Logs, Documentation, Settings.

## Artifact

- `wordpress-intigo-parcels-v0.2.1.zip`

## Compatibility

- WordPress 6.0+
- PHP 7.4+
- WooCommerce 7.0+ (tested up to 10.7, HPOS-ready)

## Support

For deployment help or issue triage: `hello@intigo.tn`
