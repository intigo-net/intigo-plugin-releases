# PrestaShop — Intigo Parcels v1.3.22

## What changed — recipient name shows the full "prénom nom"

Fixes a merchant report: **"Nom du destinataire"** showed only the first name
(e.g. "Ala" instead of "Ala abdesslam").

**Cause:** on some (guest, cash-on-delivery) checkouts the delivery address is
saved with only a first name, while the customer account has the full name. The
module built the recipient from the address alone, so only the first name showed.

**Fix:** when the delivery address has no surname, the module now completes it
from the order's **customer** — but only when it's clearly the same person (so a
delivery addressed to someone else is never changed). Applied both to the name
shown on the order panel and the name **sent to Intigo**.

Note: parcels already created at Intigo keep their original name — use
**Renvoyer** on the order to recreate with the corrected name. No schema change.
