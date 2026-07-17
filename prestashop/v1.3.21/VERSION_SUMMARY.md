# PrestaShop — Intigo Parcels v1.3.21

## What changed — a friendlier dashboard + a coverage fix

This release polishes the **Tableau de bord** and fixes the "Couverture Intigo"
figure. No schema change; upgrade-safe.

- **Couverture Intigo fixed.** It now divides shipped parcels by your
  **Intigo-relevant orders** (orders in a pickup-mapped status or already sent) —
  the same scope as the Orders list — instead of every order the shop ever had.
  Before, a shop with lots of history showed a meaningless ~1% that never moved.
- **Personalized greeting.** The header greets you by name and time of day
  (matin / après-midi / soir), with a small Friday and New-Year touch.
- **Vos villes de livraison** — now a clean donut with a ranked legend and
  percentages; scales to the 24 Tunisian governorates (top 6 + "Autres").
- **Colis par adresse de ramassage** — a new breakdown of parcels by the pickup
  address they shipped from, ordered by index with per-pickup percentages.
- **Petits faits** — small friendly insights (jour le plus actif, colis ce mois-ci).
- **Less clutter.** Removed duplicated money / coverage / city figures so each
  number appears once.

Builds on the v1.3.20 pickup-integrity work (no default pickup fallback, per-order
pickup override, divergence warning, searchable per-order logs).
