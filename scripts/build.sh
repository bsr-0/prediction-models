#!/usr/bin/env bash
# Assemble the hub site into _site/ from the two project sites.
#
#   scripts/build.sh [NFL_DOCS] [MADNESS_DOCS]
#
# With no arguments, uses the sibling checkouts in this folder (local preview).
# CI passes the sparse-checkout paths instead. Preview with:
#   scripts/build.sh && python3 -m http.server -d _site 8000
set -euo pipefail
cd "$(dirname "$0")/.."

nfl="${1:-nfl/nfl-player-projections/docs}"
madness="${2:-madness/march-madness-forecaster/docs}"

for d in "$nfl" "$madness"; do
  [ -d "$d" ] || { echo "missing: $d" >&2; exit 1; }
done

rm -rf _site
mkdir -p _site
cp index.html .nojekyll _site/
rsync -a --exclude 'training_pit.json' "$nfl/"     _site/nfl/
rsync -a --exclude 'training_pit.json' "$madness/" _site/madness/
echo "built _site/ ($(du -sh _site | cut -f1))"
