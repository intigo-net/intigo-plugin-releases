# PrestaShop v1.3.14 — Version Summary

## Orders list date-range filter + carries the save fix

**New — filter orders by date**
On **Intigo → Commandes**, a **Du / Au** date range with an **Appliquer** button.
Nothing filters until you click Appliquer. The range is kept as you switch tab,
status and pages; **✕** clears it, and the tab counts respect the range.

**Included — the reference-save fix (from 1.3.13)**
The automatic table repair is now **order-independent** (an earlier repair could
abort when adding a column positioned after another still-missing column, leaving
the save broken), and a save failure now shows the **real database error**.

Upload in **Modules → Module Manager → Upload a module**. Data preserved; the table
self-repairs on the next save. If the version doesn't change, uninstall (data kept)
then re-upload.
