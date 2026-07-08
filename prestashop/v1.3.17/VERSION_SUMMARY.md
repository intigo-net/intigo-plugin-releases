# PrestaShop v1.3.17 — Version Summary

## Webhook status mapping is now reliable

When an Intigo status changes, the webhook sets your order to the PrestaShop status
you configured (e.g. Intigo **Livré** → your **"livré avec intigo"**). That mapping
could be stored as several conflicting copies internally, so the webhook sometimes
applied the **wrong** status.

- The map is now read from the **latest saved copy** and stored as a **single clean
  record**; the upgrade collapses any existing duplicates.
- Verified end-to-end: an Intigo "Livré" webhook applies your mapped status to the
  order, and (from v1.3.16) the order stays in the Intigo list afterwards.

Upload in **Modules → Module Manager → Upload a module**. Data preserved.
