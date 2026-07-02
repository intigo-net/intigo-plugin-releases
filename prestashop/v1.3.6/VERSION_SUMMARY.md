# PrestaShop v1.3.6 — Version Summary

## New: "Renvoyer avec le bon ramassage" (fix a parcel's pickup after it's sent)

Adds a one-click way to correct a parcel that was created from the wrong pickup
address — for example, a parcel sent before the order's status was set.

**Compatibility:** PrestaShop **1.7.x, 8.x and 9.x**, PHP **7.2+**.
Validated end-to-end on the client's **PrestaShop 1.7.8.0**, plus 1.7.8.11 / PHP 7.4, 8.1 and 9.1.3.

## What's new vs v1.3.5

### "Renvoyer avec le bon ramassage" button
- On an order whose parcel is already created, a new button **cancels the existing
  parcel at Intigo and recreates it** from the pickup address mapped to the order's
  **current status**.
- Why: Intigo has no "change pickup" on an existing parcel. If a parcel was created
  from the wrong pickup (e.g. it was sent before you set the status, or before the
  status→pickup mapping existed), this is the only way to correct it.
- Safe by design: it **pre-checks that the parcel can be recreated before it
  cancels the old one**, so an order is never left without a parcel. If the
  recreate can't proceed (incomplete address), nothing is cancelled and you get a
  clear message.
- Verified: a parcel created at status *"send to intigo from chargiya"* (CHARGIYA 2
  ARIANA), then **Renvoyer** at status *"send intigo from AVENUE ABDELAZIZ THAALBI"*
  → old parcel cancelled, new parcel ships from **AVENUE ABDELAZIZ THAALBI**.

### Carried forward
- v1.3.5: status→pickup mapping honored even with a cold cache.
- v1.3.4: auto-detect delivery zone on the native order page.
- v1.3.3: self-healing tabs, class autoloader, permission-aware navigation.

## How to use

1. Set the order to the status whose pickup you want (**Intigo → Adresses de
   ramassage** defines the status → pickup mapping).
2. On the order, click **Renvoyer (bon ramassage)**.
3. The old parcel is cancelled and a new one is created from the correct pickup.

> For new orders, simply set the status **before** the first "Envoyer à Intigo" —
> Renvoyer is only needed to correct a parcel that already exists.

## Install / upgrade

1. Download `prestashop-intigo-parcels-v1.3.6.zip` (in this folder, or the GitHub Release page).
2. PrestaShop BO → **Modules → Module Manager → Upload a module** → drag the ZIP.
   (Upgrading is safe — settings, mappings and order↔parcel data are preserved.)

> Using a PrestaShop version not listed above? Contact the Intigo dev team at
> `hello@intigo.tn` before installing.
