# PrestaShop v1.3.15 — Version Summary

## THE fix: reference/fields wouldn't save when a name or address had an apostrophe

The real cause of "Informations enregistrées" but nothing saved (e.g. customer
**"Salma B'chir"**, address **"Rue d'Alger"**): parcel values were written to the
database **without escaping the apostrophe**, which broke the SQL update on an order
that already had a parcel. Names/addresses with `'` are common, so this hit real
orders.

- All parcel values (recipient name, address, reference, etc.) are now **properly
  escaped** — apostrophes and special characters save correctly.
- Verified with "Salma B'chir" and "O'Brien D'Souza".

Also included from recent versions: the Orders **date-range filter** (Du/Au +
Appliquer), the postcode-aware zone detection, and the schema self-repair.

Upload in **Modules → Module Manager → Upload a module**. Your data is preserved.
