# Prediction Models Hub

Single GitHub Pages site combining three independently-developed projects:

- [`nfl-player-projections`](https://github.com/bsr-0/nfl-player-projections) → `nfl/`
- [`march-madness-forecaster`](https://github.com/bsr-0/march-madness-forecaster) → `madness/`
- [`finance-quant`](https://github.com/bsr-0/finance-quant) → `finance/`

## How it works

The site is deployed from GitHub Actions (`.github/workflows/deploy.yml`) on
every push to `main`, daily on a schedule, and on-demand. The workflow
assembles `_site/` and uploads it as a Pages artifact — nothing is committed
back to this repo.

- `nfl/` and `madness/` are the static sites (HTML/JS/CSS plus the JSON
  payloads they load), maintained directly in this repo. Regenerate the
  payloads with the source repos' scripts and copy them here.
- `finance/` is pulled at deploy time from `finance-quant`'s committed `site/`
  folder, which that repo's daily-predictions pipeline rebuilds.
- `index.html` is the landing page linking to all three.

## Local layout

```
index.html   # landing page
nfl/         # NFL site (nfl/nfl-player-projections/ is the source repo, git-ignored)
madness/     # March Madness site (madness/march-madness-forecaster/ is the source repo, git-ignored)
finance/     # not present locally — assembled at deploy time
```

The source repos are cloned alongside the site folders for convenience but are
excluded from this repo via `.gitignore`.
