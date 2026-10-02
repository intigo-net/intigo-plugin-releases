# WordPress v0.4.5 - Version Summary

## What changed

### Parcels sent with another Intigo account

- Every parcel now remembers which Intigo account (API key + environment) created it.
- If you change the API key, parcels created with the previous account are shown as **Sent with another Intigo account**: the plugin no longer syncs them, generates their bordereau or cancels them through the wrong account, and they no longer count as "in Intigo".
- A **Reset** button unlinks such a parcel from the order, so the order can be sent again with the current account.

### Reset the send (any order)

- **Manage Orders → More actions → Reset the send** (and in the order's Intigo box): unlinks the parcel from the order after a confirmation inside the window. The parcel is **not cancelled at Intigo** — cancel it there if needed. Zone, reference, notes, pickup and size are kept.

### Also

- The header shows **No API key** instead of "API connected" when no key is set.

_Your Intigo settings are kept when updating._

## Artifact

- `wordpress-intigo-parcels-v0.4.5.zip`

## Update from an older version

Upload the zip in **Plugins -> Add New -> Upload Plugin**, then choose **Replace current with uploaded**.

## Compatibility

- WordPress 6.0+
- PHP 7.4+
- WooCommerce 7.0+ (tested up to 11.1, HPOS compatible)

## Support

For deployment help or issue triage: `hello@intigo.tn`
