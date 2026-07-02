# Intigo Plugin Releases

Public distribution repository for client-ready Intigo plugin packages.

## Purpose

This repository is used to publish signed/tagged release artifacts that clients can download directly from GitHub Releases.

## Repository Layout

Each platform has its own folder, then versioned subfolders:

```text
wordpress/
  v0.1.0/
    intigo-wordpress-plugin-v0.1.0.zip
    VERSION_SUMMARY.md
    VALIDATION.txt
  v0.2.1/
    wordpress-intigo-parcels-v0.2.1.zip
    VERSION_SUMMARY.md
    VALIDATION.txt

shopify/
  v0.1.0/
    VERSION_SUMMARY.md
    VALIDATION.txt

prestashop/
  v0.1.0/
    prestashop-intigo-parcels-v0.1.0.zip
    VERSION_SUMMARY.md
    VALIDATION.txt
  v1.0.0/
    prestashop-intigo-parcels-v1.0.0.zip
    VERSION_SUMMARY.md
    VALIDATION.txt

systems/
  template/
    README.md
```

## Current Packages

- WordPress / WooCommerce plugin package — **latest:** `wordpress/v0.2.1`
- PrestaShop plugin package — **latest:** `prestashop/v1.3.5`
- Shopify release track initialized (`shopify/v0.1.0`, placeholder for next package)

## WordPress Install (Client)

1. Open `wordpress/v0.2.1/` (latest).
2. Download `wordpress-intigo-parcels-v0.2.1.zip`.
3. In WordPress admin, go to **Plugins -> Add New -> Upload Plugin**.
4. Upload the zip, install, and activate.
5. Open **Intigo -> Settings**, add API key, select Sandbox/Production mode.
6. Save settings and start managing orders from **Intigo -> Manage Orders**.

## PrestaShop Install (Client)

1. Open `prestashop/v1.3.5/` (latest).
2. Download `prestashop-intigo-parcels-v1.3.5.zip`.
3. In PrestaShop back-office, go to **Modules -> Module Manager -> Upload a module** and drag the zip.
4. Configure -> enter your Intigo API key (sandbox or production) -> Test connection.
5. **Sell -> Carriers** -> confirm **Intigo Delivery** is enabled and assign it to your zones / price ranges.
6. Manage orders from **Intigo -> Manage Orders** in the back-office menu.

Compatible with PrestaShop 1.7.x, 8.x and 9.x, PHP 7.2+. Validated on PrestaShop 1.7.8.11 / PHP 7.4.33.

## Release Integrity

Each release includes:

- plugin archive (`.zip`)
- version summary (`VERSION_SUMMARY.md`) describing what changed in that version
- validation guide (`VALIDATION.txt`) with checksum and verification steps
- optional checksum file (`SHA256SUMS.txt`) when provided for integrity workflows

## Support

For onboarding or production issues, contact: `hello@intigo.tn`
