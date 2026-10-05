# WordPress v0.5.0 - Version Summary

## What changed

### Delivery fee per product

- New **Delivery fee (TND)** field in the product's Intigo Delivery box.
- Empty = the global price from Settings (default, nothing changes). A number overrides it for that product; `0` = free delivery.
- A cart with several products pays the **highest** fee. Products without their own fee are priced by the global size grid as before. Variations use their parent product's fee.
- French and Arabic translations included.

_Your Intigo settings are kept when updating._
