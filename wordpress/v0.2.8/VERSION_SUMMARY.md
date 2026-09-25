# WordPress v0.2.8 - Version Summary

Also includes the v0.2.7 changes, which were not published separately.

## What changed

### v0.2.8 — WooCommerce compatibility warning fixed

- The plugin now declares compatibility with WooCommerce **High-Performance Order Storage (HPOS)**.
  - Before, WooCommerce listed the plugin as "incompatible with the currently enabled features" and showed a warning banner on every admin page, although the plugin already worked with HPOS.
- Tested up to WooCommerce 11.1.

### v0.2.7 — Parcel source declared to Intigo

- Parcel-creation calls now tell Intigo which plugin and shop created each parcel (`platform`, `version`, `shop_url`), in the request body and the `X-Intigo-Platform` / `-Platform-Version` / `-Shop` headers.
  - Intigo uses it to trace an address it cannot match back to the shop that produced it.
  - Optional on Intigo's side: a missing or malformed value never blocks a parcel.
- `shop_url` is now a bare host (`boutique.tn`) instead of the full site URL.

_No changes to checkout, pricing, size resolution, or settings. Updating keeps your existing Intigo configuration._

## Artifact

- `wordpress-intigo-parcels-v0.2.8.zip`

## Update from an older version

Upload the zip in **Plugins -> Add New -> Upload Plugin**, then choose **Replace current with uploaded**.

## Compatibility

- WordPress 6.0+
- PHP 7.4+
- WooCommerce 7.0+ (tested up to 11.1, HPOS compatible)

## Support

For deployment help or issue triage: `hello@intigo.tn`
