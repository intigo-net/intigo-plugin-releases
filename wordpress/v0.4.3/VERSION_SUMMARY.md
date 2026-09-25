# WordPress v0.4.3 - Version Summary

## What changed

### Add your pickup address from WordPress

- **Intigo → Settings → Pickup address** now has an **Add a pickup address** form: street, governorate, délégation (quartier optional) and the **GPS position** — with a **Use my position** button (use it from the pickup place itself) and a link to find the coordinates on Google Maps.
- It opens by itself when your Intigo account has no pickup address yet (parcels cannot be sent without one).
- Addresses that have no GPS get an **Add GPS** button: Intigo refuses parcels from a pickup address without GPS.
- The new address becomes the default pickup address when none was chosen.
- Manage Orders, the Edit window and the order box link straight to this form when a pickup address is missing.

### Also

- On Intigo's side, the **Référence marchand** is now printed on the bordereau for every creation route (including parcels sent by governorate only).
- Settings page no longer scrolls sideways on phones.

_Your Intigo settings are kept when updating._

## Artifact

- `wordpress-intigo-parcels-v0.4.3.zip`

## Update from an older version

Upload the zip in **Plugins -> Add New -> Upload Plugin**, then choose **Replace current with uploaded**.

## Compatibility

- WordPress 6.0+
- PHP 7.4+
- WooCommerce 7.0+ (tested up to 11.1, HPOS compatible)

## Support

For deployment help or issue triage: `hello@intigo.tn`
