# WordPress v0.4.0 - Version Summary

Includes everything since v0.2.11 (v0.3.0 was not published separately).

## What changed

### Delivery zones are detected automatically

- The plugin reads the address of every order — customer checkout **and** orders you create by hand in wp-admin — and matches it to Intigo's own list of governorates, délégations and quartiers.
- Each order shows a clear status in **Intigo → Manage Orders**:
  - **Ready** — matched with confidence; can be sent.
  - **To check** — nearest match, pre-filled; one click on **Confirm** and it is ready. Never sent before you confirm.
  - **Incomplete address** — with the exact reason (e.g. "Only the governorate was found. Add the délégation").
- The old guessing that could send a "Tunis" order to **Sfax** is gone.
- Zones chosen by the customer or by you are never overwritten. Zones set by earlier versions are kept (bare ones are shown as "To check").
- **Detect addresses** button to (re)check many orders at once.
- In Automatic mode, orders you create in wp-admin are also sent automatically when their zone is Ready and they have no other carrier.

### New Edit window and address search

- Shows the address as typed, the current status and its reason.
- One search box ("La Marsa", "Ennasr", "Sahloul"…) fills governorate, délégation and quartier in one pick; best matches first.
- The results list closes when you click outside, press Esc, or pick one; arrow keys + Enter work.
- Same search in the order page's **Intigo** box.

### A real message on every button

- "Parcel sent to Intigo — NID …", or the real reason when it fails (missing zone, invalid API key, …).
- "Settings saved", bulk send summary ("X sent, Y to check, Z failed"), messages on the WooCommerce order screen too.

### French and Arabic

- The whole plugin follows your WordPress language: English, French or Arabic (right-to-left).

## Artifact

- `wordpress-intigo-parcels-v0.4.0.zip`

## Update from an older version

Upload the zip in **Plugins -> Add New -> Upload Plugin**, then choose **Replace current with uploaded**. Your Intigo settings are kept.

## Compatibility

- WordPress 6.0+
- PHP 7.4+
- WooCommerce 7.0+ (tested up to 11.1, HPOS compatible)

## Support

For deployment help or issue triage: `hello@intigo.tn`
