# WordPress v0.2.6 - Version Summary

## What changed

### Product names in the parcel description

- The description sent to Intigo now includes the order's **product name(s)** alongside the order reference.
  - Example: `WooCommerce Order #123 - Product A, Product B x2`
  - Quantity is shown as `x<n>` when greater than 1; multiple products are comma-separated.
- Applies to **every** send path: automatic push, manual "Send to Intigo", and bulk batch create.
- Capped at 250 characters for API safety; falls back to just the order reference if an order has no line items.

_No changes to checkout, pricing, size resolution, or the API connection._

## Artifact

- `wordpress-intigo-parcels-v0.2.6.zip`

## Compatibility

- WordPress 6.0+
- PHP 7.4+
- WooCommerce 7.0+ (tested up to 10.7, HPOS-ready)

## Support

For deployment help or issue triage: `hello@intigo.tn`
