# PrestaShop v1.3.3 — Version Summary

## Critical upgrade fix: missing pages & class-loading on in-place upgrades

A reliability release for shops that **upgrade the module by uploading new files**
over an existing install. Same shipping workflow as v1.3.2 — now the new pages
appear and the back office never crashes, regardless of how the shop reached this
version.

**Compatibility:** PrestaShop **1.7.x, 8.x and 9.x**, PHP **7.2+**.
Validated end-to-end on the client's **PrestaShop 1.7.8.0**, plus 1.7.8.11 / PHP 7.4, 8.1 and 9.1.3.

## What's new vs v1.3.2

### Fix — "Adresses de ramassage" page inaccessible after an in-place upgrade
- **Symptom:** after upgrading in place, the *Pickup addresses* page could not be
  opened — **even by the SuperAdmin** — and the module appeared only under
  **"Configure"**.
- **Cause:** when a new page ships under a version a shop already has recorded,
  PrestaShop runs no upgrade script, so the new admin tab was never created. A
  PrestaShop controller with no tab has no authorization role, so the page is
  inaccessible to everyone.
- **Fix (self-healing):** the module now **detects and recreates any missing Intigo
  tab on back-office load** and re-grants access — existing broken installs repair
  themselves the next time an admin opens the BO. A proper `upgrade-1.3.3.php` also
  runs on install/upgrade as the canonical path.

### Fix — "Attempted to load class IntigoAdminUi" crash
- On some shops a module page could fatal with *"Attempted to load class
  IntigoAdminUi from the global namespace"*. The module now registers a small
  **class autoloader** so its classes always resolve, regardless of which admin
  route loads first or the PrestaShop version.

### In-page navigation respects permissions
- The Intigo top navigation bar now **hides tabs the current employee's profile
  cannot access**, matching the left-hand menu (e.g. the *Accès* page stays
  admin-only). No more dead links to pages a user can't open.

## Install / upgrade

1. Download `prestashop-intigo-parcels-v1.3.3.zip` (in this folder, or the GitHub Release page).
2. PrestaShop BO → **Modules → Module Manager → Upload a module** → drag the ZIP.
   (Upgrading an existing install is safe — your API key, prices and order↔parcel
   mapping are preserved.)
3. Open the back office once as an admin — any missing Intigo pages self-heal.
4. Manage everything from the **Intigo** menu (Tableau de bord · Commandes ·
   Adresses de ramassage · Tailles produits · Journaux · Réglages · Aide).

> Using a PrestaShop version not listed above? Contact the Intigo dev team at
> `hello@intigo.tn` before installing.
