# WordPress v0.4.2 - Version Summary

## What changed

### Pickup address on every bordereau

- New **Pickup address** card in **Intigo → Settings**: choose which of your Intigo pickup addresses Intigo collects from (pre-set to the first one with GPS). Each order can use another one (**Manage Orders → Edit**).
- It is sent with every parcel, so the sender block of the bordereau is filled.
- If your Intigo account has no pickup address with GPS (or the chosen one was deleted), the plugin **refuses to send** and tells you what to fix, instead of creating a parcel without a sender.

### What prints on the bordereau

- **Reference** (Edit window) → printed as **Référence marchand**, with a barcode (also sent as `cid`).
- **Notes / delivery instructions** → printed under **Commentaire**, after the products.
- Known limitation on Intigo's side: parcels sent **by governorate only** (Intigo finds the délégation) do not print the Référence marchand yet.

_Your Intigo settings are kept when updating._

## Artifact

- `wordpress-intigo-parcels-v0.4.2.zip`

## Update from an older version

Upload the zip in **Plugins -> Add New -> Upload Plugin**, then choose **Replace current with uploaded**.

## Compatibility

- WordPress 6.0+
- PHP 7.4+
- WooCommerce 7.0+ (tested up to 11.1, HPOS compatible)

## Support

For deployment help or issue triage: `hello@intigo.tn`
