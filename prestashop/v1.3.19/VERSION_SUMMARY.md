# PrestaShop — Intigo Parcels v1.3.19

## What changed
The **Orders** list now has a single unified filter form. Category, order status
and date range are combined into **one `method="get"` form** that applies all
three together (AND) only when the merchant clicks **Appliquer** — no control
navigates on its own anymore. A **Réinitialiser** link clears every filter back
to the full list.

- Category tabs → a `<select>` (live counts folded into the option labels, e.g.
  "À vérifier (12)"), with the **En attente** category now selectable.
- Status filter → plain state-id values, `onchange` auto-navigation removed.
- Date range folded into the same form; one **Appliquer**, one **Réinitialiser**.
- "Détecter les adresses" and the bulk-send bar stay outside the filter form.

Same GET parameter names (`f`, `st`, `date_from`, `date_to`), so old bookmarks and
pagination links still resolve. UI-only change — no schema change. Verified live on
PrestaShop 1.7.8.x: combined AND filtering, no premature apply, reset, back-compat
URLs and cross-page persistence all confirmed.
