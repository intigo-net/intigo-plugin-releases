# WordPress v0.2.3 - Version Summary

Covers everything since the last public release (v0.2.1): the v0.2.2 and v0.2.3 changes.

## What changed

### v0.2.3 — Assign Intigo size from the Products list

- New **"Intigo Size" column** in WooCommerce → Products, showing each product's assigned bucket (or `Default · X` when it falls back to the plugin default).
- **Quick Edit** one product's size inline, and **Bulk Edit** many at once (with a `— No change —` default that leaves products untouched).
- **Filter** above the list by size, or by *Unassigned*.
- Reuses the existing `_intigo_product_size` meta and `Intigo_Size_Resolver` — no schema, checkout, pricing, or resolver changes.
- Per-variation sizes remain out of scope (the resolver reads product-level size).

### v0.2.2 — Optional checkout address-confirmation modal

- New **Intigo → Settings → Checkout experience → Address confirmation modal** toggle (`checkout_modal_enabled`, default **on**, so upgrades behave exactly as before).
- When **on**, customers who pick Intigo Delivery must confirm recipient details and choose their Intigo city/district before placing the order.
- When **off**, the modal and its forced validation are removed entirely; the Intigo zone is resolved automatically from the standard WooCommerce address when the parcel is pushed (single / automatic / manual send).
- Fix: the bulk **Create Parcels (Batch)** action now resolves the zone from the order address too, so modal-off stores don't batch-push an unresolved zone.

## Artifact

- `wordpress-intigo-parcels-v0.2.3.zip`

## Compatibility

- WordPress 6.0+
- PHP 7.4+
- WooCommerce 7.0+ (tested up to 10.7, HPOS-ready)

## Support

For deployment help or issue triage: `hello@intigo.tn`
