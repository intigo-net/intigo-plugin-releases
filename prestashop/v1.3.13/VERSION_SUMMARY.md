# PrestaShop v1.3.13 — Version Summary

## Fix follow-up: reference save on a stale table (order-independent heal)

v1.3.12 added an automatic table repair, but some `ADD COLUMN ... AFTER other_column`
statements could abort when that other column was itself still missing — so the
repair left a gap and the save could still fail ("Échec de l'enregistrement").

- The repair is now **order-independent** (it no longer depends on column position),
  so it reliably brings a stale table fully up to date.
- A save failure now shows and logs the **real database error** instead of a generic
  message.

Compatible with PrestaShop 1.7.x / 8.x / 9.x. Upload in **Modules → Module Manager**;
your data is preserved and the table is repaired automatically on the next save.
If the version doesn't change after upload, uninstall (data preserved) then re-upload.
