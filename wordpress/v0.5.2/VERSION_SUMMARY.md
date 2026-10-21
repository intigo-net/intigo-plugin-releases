# WordPress v0.5.2 - Version Summary

## What changed

### Fix

- **The address filters listed the wrong orders** (v0.5.1): the count was right but the rows under *Address issues / To check / Incomplete / Not detected* were not. The rows now match the filter. **Update from v0.5.1.**

### Manage Orders: search and filters

- **Search** by order number, customer name, phone, email, address or Intigo parcel NID.
- **Filter** by WooCommerce order status, sent / not sent to Intigo, creation dates (From / To, or Today / Last 7 days / Last 30 days) and address problem. Filters combine; **Reset filters** clears them.
- An orange banner shows how many orders have an address issue, with a **Show them** button.
- The list says "Showing x–y of N orders"; page size 10 / 30 / 50 / 100 per user.
- Filters, page size and page number are kept after Edit, Send, Confirm, Detect or Reset.
- French and Arabic translations included.

_Your Intigo settings are kept when updating._
