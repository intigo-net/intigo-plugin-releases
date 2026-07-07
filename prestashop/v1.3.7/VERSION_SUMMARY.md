# PrestaShop v1.3.7 — Version Summary

## COD amount by payment method + received-webhooks in the journal

Two additions on top of v1.3.6.

**Compatibility:** PrestaShop **1.7.x, 8.x and 9.x**, PHP **7.2+**.
Validated end-to-end on the client's **PrestaShop 1.7.8.0**, plus 1.7.8.11 / PHP 7.4, 8.1 and 9.1.3.

## What's new vs v1.3.6

### Cash-on-Delivery amount decided by the payment method
- The **Réglages → Encaissement à la livraison (COD)** section lists the shop's
  **actual payment solutions** (active payment modules + methods seen on orders —
  no hardcoded list) and lets the merchant tick which ones are **cash on delivery**.
- Result at parcel creation:
  - order paid with a **COD** method → Intigo collects the **exact order amount**;
  - order paid with **any other** method (online, cheque, bank transfer…) → Intigo
    collects **0** (the money is settled outside cash-on-delivery).
- Purely method-based (no paid-state guessing). Leaving the list empty = every
  order collects the full amount (unchanged behaviour).

### Received webhooks listed in the journal
- Every webhook received from the Intigo system is shown in **Journaux** with a
  clear French label and colour: *Webhook reçu — statut mis à jour*, *— colis
  inconnu*, *Webhook — signature invalide*, etc. Rows are highlighted so incoming
  webhooks are easy to spot.

### Carried forward
- v1.3.6 "Renvoyer avec le bon ramassage", v1.3.5 status→pickup cold-cache fix,
  v1.3.4 order-page zone auto-detect, v1.3.3 self-healing tabs + autoloader.

## How to use the COD setting

1. Go to **Intigo → Réglages → Encaissement à la livraison (COD)**.
2. Tick the payment method(s) that are **cash on delivery** in your shop.
3. Save. From then on, COD orders send the full amount to collect and every other
   order sends 0.

## Install / upgrade

1. Download `prestashop-intigo-parcels-v1.3.7.zip` (in this folder, or the GitHub Release page).
2. PrestaShop BO → **Modules → Module Manager → Upload a module** → drag the ZIP.
   (Upgrading preserves your settings, mappings and order↔parcel data.)

> Using a PrestaShop version not listed above? Contact the Intigo dev team at
> `hello@intigo.tn` before installing.
