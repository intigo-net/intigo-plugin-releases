# WordPress v0.2.5 - Version Summary

## What changed — checkout modal reliability fix

This release fixes a bug where the Intigo Delivery address-confirmation modal could
**flash open then immediately disappear** on some storefronts.

### Root cause

On the classic (shortcode) checkout, WooCommerce renders the shipping method
differently depending on how many rates are available:

- **Several rates** → radio buttons (one is selected).
- **A single rate** (e.g. Intigo Delivery is the only option) → a **hidden input**,
  with no radio.

The modal's selection detection only looked for a *checked radio*, so when Intigo was
the only available rate it wasn't recognized, and the background refresh loop closed
the modal ~250ms after it opened.

### The fix

- **Detection** now also reads the single hidden `shipping_method` input, so Intigo
  Delivery is recognized whether it's shown as a radio or as the lone rate.
- **No flicker** — the modal's auto-close only fires on a *settled* checkout state with
  a genuinely non-Intigo method chosen, never on a transient/refreshing page.
- **Hard gate** — if a customer reaches **Place Order** with Intigo selected but the
  address incomplete, the order is paused and the modal re-opens (instead of failing
  with a server error). Address collection is guaranteed whenever Intigo Delivery is
  the chosen shipping method.

The merchant's **Settings → Checkout experience → Address confirmation modal** toggle is
unchanged — this only makes that flow reliable when it's enabled.

## Artifact

- `wordpress-intigo-parcels-v0.2.5.zip`

## Compatibility

- WordPress 6.0+
- PHP 7.4+
- WooCommerce 7.0+ (tested up to 10.7, HPOS-ready)
- Classic (shortcode) checkout and Blocks checkout

## Support

For deployment help or issue triage: `hello@intigo.tn`
