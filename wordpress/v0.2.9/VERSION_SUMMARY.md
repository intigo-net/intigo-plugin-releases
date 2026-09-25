# WordPress v0.2.9 - Version Summary

**Urgent fix — update from any earlier version.**

## What changed

### Saving an order in wp-admin no longer crashes the site

- Before: saving an order's edit screen (for example changing its status to "Processing") could stop the site with **"Internal Server Error"**. Deactivating the Intigo plugin made it go away.
- Cause: saving the Intigo box on the order re-triggered its own save without end, until PHP crashed.
- Now the Intigo box is saved once per save, and the order status, addresses and Intigo zone save normally.

_No other changes. Your Intigo settings are kept when updating._

## Artifact

- `wordpress-intigo-parcels-v0.2.9.zip`

## Update from an older version

Upload the zip in **Plugins -> Add New -> Upload Plugin**, then choose **Replace current with uploaded**.

## Compatibility

- WordPress 6.0+
- PHP 7.4+
- WooCommerce 7.0+ (tested up to 11.1, HPOS compatible)

## Support

For deployment help or issue triage: `hello@intigo.tn`
