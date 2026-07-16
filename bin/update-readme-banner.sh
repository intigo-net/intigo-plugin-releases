#!/usr/bin/env bash
#
# update-readme-banner.sh — keep the "Latest working versions" banner in README.md
# in sync with the published release folders.
#
# The banner is derived automatically: for each platform, the newest version folder
# (semver order) that actually contains a .zip package is treated as the latest
# working release. No version argument to pass — publish a new `<platform>/vX.Y.Z/`
# folder with its zip, run this script, and the banner updates itself.
#
# Usage:
#   bin/update-readme-banner.sh          # rewrite the banner in README.md
#   bin/update-readme-banner.sh --check  # write nothing; exit 1 if the banner is stale
#
# The banner lives between the <!-- LATEST:START --> / <!-- LATEST:END --> markers
# in README.md. Everything between them is regenerated; the markers must exist.
#
set -euo pipefail

# Platforms to report, in display order. "dir|Display Name".
PLATFORMS=(
  "prestashop|PrestaShop"
  "wordpress|WordPress / WooCommerce"
  "shopify|Shopify"
)

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
README="$ROOT/README.md"

CHECK=0
[ "${1:-}" = "--check" ] && CHECK=1

[ -f "$README" ] || { echo "ERROR: README.md not found at $README" >&2; exit 2; }
grep -q '<!-- LATEST:START' "$README" || {
  echo "ERROR: <!-- LATEST:START --> marker not found in README.md" >&2; exit 2; }
grep -q '<!-- LATEST:END'   "$README" || {
  echo "ERROR: <!-- LATEST:END --> marker not found in README.md" >&2; exit 2; }

# Newest v*/ folder under $1 that contains a .zip (semver order). Empty if none.
latest_packaged_version() {
  local platform_dir="$1" d
  while IFS= read -r d; do
    [ -n "$d" ] || continue
    if compgen -G "$d/*.zip" >/dev/null 2>&1; then
      basename "$d"        # e.g. v1.3.19
      return 0
    fi
  done < <(find "$ROOT/$platform_dir" -maxdepth 1 -mindepth 1 -type d -name 'v*' 2>/dev/null | sort -Vr)
  return 0
}

# Build the banner block (blockquote lines) from the folders on disk.
block="> **Latest working versions**"$'\n'">"
found_any=0
for entry in "${PLATFORMS[@]}"; do
  dir="${entry%%|*}"
  name="${entry##*|}"
  ver="$(latest_packaged_version "$dir")"
  [ -n "$ver" ] || continue    # skip platforms with no packaged release yet
  found_any=1
  block+=$'\n'"> - **${name}** — \`${ver}\` → [\`${dir}/${ver}/\`](${dir}/${ver}/)"
done

if [ "$found_any" -eq 0 ]; then
  echo "ERROR: no packaged release folders found under ${PLATFORMS[*]%%|*}" >&2
  exit 2
fi

# Splice the freshly built block between the markers.
blockfile="$(mktemp)"
trap 'rm -f "$blockfile" "$blockfile.new"' EXIT
printf '%s\n' "$block" > "$blockfile"

awk -v bf="$blockfile" '
  BEGIN { while ((getline line < bf) > 0) blk = blk line ORS; sub(ORS "$", "", blk) }
  /<!-- LATEST:START/ { print; print blk; skip = 1; next }
  /<!-- LATEST:END/   { skip = 0; print; next }
  !skip { print }
' "$README" > "$blockfile.new"

if cmp -s "$README" "$blockfile.new"; then
  echo "README banner already up to date."
  exit 0
fi

if [ "$CHECK" -eq 1 ]; then
  echo "README banner is STALE. Run: bin/update-readme-banner.sh" >&2
  exit 1
fi

mv "$blockfile.new" "$README"
echo "README banner updated:"
sed -n '/<!-- LATEST:START/,/<!-- LATEST:END/p' "$README"
