# WordPress v0.4.1 - Version Summary

## What changed

### Addresses are detected by themselves

- Opening **Edit** on an order detects its address and pre-fills Governorate › Délégation › Quartier.
- **Intigo → Manage Orders** detects the orders still marked "Not detected" in the background and updates their status live — no button to click.
- The governorate list is ready as soon as the window opens.

### Address as text, délégation optional

- New **Delivery address** field (pre-filled from the order) in the Edit window and in the order's Intigo box.
- The délégation is now optional: with the governorate and the address, **Send to Intigo** sends the parcel by name and **Intigo finds the délégation in the address**. The confirmation tells you which délégation Intigo used, with a warning if it could only use the governorate's chef-lieu.
- Automatic and bulk sending stay strict (governorate + délégation confirmed). A "To check" match must be confirmed or corrected before it can be sent.

### Reference and notes

- **Reference (cid)** — your own reference for the parcel, sent to Intigo as `cid` (max 50 characters).
- **Notes / delivery instructions** — sent to Intigo as delivery instructions (`additional_info`, max 250 characters).

_Your Intigo settings are kept when updating._

## Artifact

- `wordpress-intigo-parcels-v0.4.1.zip`

## Update from an older version

Upload the zip in **Plugins -> Add New -> Upload Plugin**, then choose **Replace current with uploaded**.

## Compatibility

- WordPress 6.0+
- PHP 7.4+
- WooCommerce 7.0+ (tested up to 11.1, HPOS compatible)

## Support

For deployment help or issue triage: `hello@intigo.tn`
