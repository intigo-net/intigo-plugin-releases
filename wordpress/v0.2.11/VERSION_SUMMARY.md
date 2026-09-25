# WordPress v0.2.11 - Version Summary

**Urgent fixes — update from any earlier version.** Includes the v0.2.9 fix.

## What changed

### Intigo → Manage Orders no longer breaks after a refund (v0.2.11)

- Before: after refunding any order, **Manage Orders stopped loading** (blank "Internal Server Error", or a page cut after a few orders where the **Edit** button did nothing).
- Cause: the plugin's order lists also picked up WooCommerce refunds, which have no address or phone.
- Now every Intigo screen only lists real orders.

### Manage Orders is sturdier (v0.2.10)

- Opening Manage Orders no longer saves every order or calls the Intigo API just to display it.
- If one order still cannot be displayed, only its row shows the reason (also in Intigo → Logs); the rest of the page and the Edit window keep working.

### Saving an order no longer crashes the site (v0.2.9)

- Saving an order in wp-admin (e.g. changing its status) could stop the site with "Internal Server Error". Fixed.

_No other changes. Your Intigo settings are kept when updating._

## Artifact

- `wordpress-intigo-parcels-v0.2.11.zip`

## Update from an older version

Upload the zip in **Plugins -> Add New -> Upload Plugin**, then choose **Replace current with uploaded**.

## Compatibility

- WordPress 6.0+
- PHP 7.4+
- WooCommerce 7.0+ (tested up to 11.1, HPOS compatible)

## Support

For deployment help or issue triage: `hello@intigo.tn`
