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
    RELEASE_NOTES.md
    SHA256SUMS.txt

shopify/
  v0.1.0/
    README.md

systems/
  template/
    README.md
```

## Current Packages

- WordPress / WooCommerce plugin package (`wordpress/v0.1.0`)
- Shopify release track initialized (`shopify/v0.1.0`, placeholder for next package)

## WordPress Install (Client)

1. Open `wordpress/v0.1.0/`.
2. Download `intigo-wordpress-plugin-v0.1.0.zip`.
3. In WordPress admin, go to **Plugins -> Add New -> Upload Plugin**.
4. Upload the zip, install, and activate.
5. Open **Intigo -> Settings**, add API key, select Sandbox/Production mode.
6. Save settings and start managing orders from **Intigo -> Manage Orders**.

## Release Integrity

Each release includes:

- plugin archive (`.zip`)
- checksum file (`SHA256SUMS.txt`)
- release notes with installation and compatibility details

## Support

For onboarding or production issues, contact: `hello@intigo.tn`
