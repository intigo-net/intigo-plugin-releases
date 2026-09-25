# WordPress v0.4.4 - Version Summary

## What changed

### A suggestion instead of "Incomplete address"

- When the customer wrote no governorate and no Intigo délégation or cité matches exactly (e.g. **"bjaoua"**), the zone is now pre-filled with the **address search's first suggestion** (e.g. *Ariana › Sidi Thabet › Bejaoua 2*) and marked **To check**.
- It is **never sent before you confirm it** (Confirm, or correct it in Edit).
- A governorate written anywhere in the address still limits the suggestion to that governorate (a "…Tunis" address is never suggested in Sfax).
- An address without any real word (e.g. "H, H, R") stays **Incomplete address**.
- Orders already marked "Incomplete address" by earlier versions are checked again automatically when you open **Manage Orders** or their **Edit** window.

_Your Intigo settings are kept when updating._

## Artifact

- `wordpress-intigo-parcels-v0.4.4.zip`

## Update from an older version

Upload the zip in **Plugins -> Add New -> Upload Plugin**, then choose **Replace current with uploaded**.

## Compatibility

- WordPress 6.0+
- PHP 7.4+
- WooCommerce 7.0+ (tested up to 11.1, HPOS compatible)

## Support

For deployment help or issue triage: `hello@intigo.tn`
