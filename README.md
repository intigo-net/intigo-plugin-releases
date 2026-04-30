# Intigo Plugin Releases

Public distribution repository for client-ready Intigo plugin packages.

## Purpose

This repository is used to publish signed/tagged release artifacts that clients can download directly from GitHub Releases.

## Current Packages

- WordPress / WooCommerce plugin package (`wordpress-intigo-parcels`)

## How Clients Use Releases

1. Open the latest release in GitHub.
2. Download the `.zip` plugin package from **Assets**.
3. In WordPress admin, go to **Plugins -> Add New -> Upload Plugin**.
4. Upload the zip, install, and activate.
5. Configure Intigo settings (API key + environment mode).

## Release Integrity

Each release includes:

- plugin archive (`.zip`)
- checksum file (`SHA256SUMS.txt`)
- release notes with installation and compatibility details

## Support

For onboarding or production issues, contact: `hello@intigo.tn`
