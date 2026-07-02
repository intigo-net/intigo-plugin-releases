# PrestaShop v1.3.5 — Version Summary

## Fix: status → pickup-address mapping now always honored

A targeted fix to the pickup-address feature. The status→pickup mapping could be
ignored at send time, so parcels shipped from the **wrong pickup address**.

**Compatibility:** PrestaShop **1.7.x, 8.x and 9.x**, PHP **7.2+**.
Validated end-to-end on the client's **PrestaShop 1.7.8.0**, plus 1.7.8.11 / PHP 7.4, 8.1 and 9.1.3.

## What's new vs v1.3.4

### Pickup address mapping honored even with a cold cache
- **Symptom:** you map an order status to a pickup address (e.g. *"send intigo →
  AVENUE ABDELAZIZ THAALBI"*), but on staging the parcel ships from a **different**
  pickup address.
- **Cause:** before sending, the module verifies the chosen pickup has GPS
  coordinates, reading that from a local cache. When the cache was **empty or
  stale** (it's only filled when the *Adresses de ramassage* page is opened), the
  check couldn't confirm GPS, so it **discarded the mapped pickup and omitted it
  from the request** — and Intigo then used the **account-default** pickup.
- **Fix:**
  - The pickup list is **refreshed from the API at send time** when the cache is
    empty, so the GPS check has real data.
  - The mapped pickup is only replaced when the data **positively** shows it has no
    GPS; if GPS can't be verified, the mapping is **trusted and sent** (never
    silently dropped).

> Note: the pickup address is fixed when the parcel is first created (Intigo has no
> "change pickup" after creation). Set the order's status **before** the first
> "Envoyer à Intigo".

### Carried forward
- v1.3.4: auto-detect delivery zone on the native order page.
- v1.3.3: self-healing tabs, class autoloader, permission-aware navigation.

## Install / upgrade

1. Download `prestashop-intigo-parcels-v1.3.5.zip` (in this folder, or the GitHub Release page).
2. PrestaShop BO → **Modules → Module Manager → Upload a module** → drag the ZIP.
   (Upgrading is safe — your settings, mappings and order↔parcel data are preserved.)
3. In **Intigo → Adresses de ramassage**, confirm each status is mapped to the right
   pickup, then set an order to that status and send it.

> Using a PrestaShop version not listed above? Contact the Intigo dev team at
> `hello@intigo.tn` before installing.
