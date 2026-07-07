# PrestaShop v1.3.9 — Version Summary

## Smarter address zone detection (postal-code aware)

**Compatibility:** PrestaShop **1.7.x, 8.x and 9.x**, PHP **7.2+**. Validated on the
client's **PrestaShop 1.7.8.0**, plus 1.7.8.11 / PHP 7.4, 8.1 and 9.1.3.

## What's new vs v1.3.8

### More accurate Ville / Délégation auto-detection
- **Symptom:** an address like *"…2091 Jardins d'el menzah 2"* was detected as
  **Jendouba / Ghardimaou** — the free-text guesser fuzzy-matched *"Jardins"* to a
  far-away *"Cité des Jardins"*.
- **Fix:** the detector now
  1. uses the **postal code** to isolate the locality (in Tunisian addresses the
     place name follows the postal code), which the guesser resolves far better
     than the full noisy line;
  2. prefers the candidate whose **delegation is actually named in the address**
     (e.g. the address says "el menzah" → the *El Menzah* delegation is chosen),
     which rejects far-away mismatches;
  3. strips postal digits and building words that added noise.
- Result: *"…2091 Jardins d'el menzah 2"* now resolves to **El Menzah (Tunis)**.
  Regression-checked against Fouchana, Ariana, Sousse and Sfax addresses.

### Carried forward
- v1.3.8 edit-page zone detect, v1.3.7 COD-by-payment-method + webhooks-in-journal.

## Install / upgrade

1. Download `prestashop-intigo-parcels-v1.3.9.zip` (in this folder, or the GitHub Release page).
2. PrestaShop BO → **Modules → Module Manager → Upload a module** → drag the ZIP.
   (Upgrading preserves your settings, mappings and order↔parcel data.)

> Using a PrestaShop version not listed above? Contact the Intigo dev team at `hello@intigo.tn`.
