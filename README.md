# Prediction Models Hub

Single GitHub Pages site combining two independently-developed projects:

| Path        | Source repo                                                                  | Folder  |
|-------------|------------------------------------------------------------------------------|---------|
| `/nfl/`     | [`nfl-player-projections`](https://github.com/bsr-0/nfl-player-projections)   | `docs/` |
| `/madness/` | [`march-madness-forecaster`](https://github.com/bsr-0/march-madness-forecaster) | `docs/` |

Live at https://bsr-0.github.io/prediction-models/

## How it works

This repo holds only the landing page and the deploy workflow. Each project's
site is maintained in its own repo; `.github/workflows/deploy.yml` sparse-checks
out those folders, runs `scripts/build.sh` to assemble `_site/`, and deploys it
as a Pages artifact. Nothing is committed back here.

Deploys run on every push to `main` and on-demand (Actions → "Deploy site" →
Run workflow). Nothing runs on a schedule and the source repos do not trigger
the hub. After pushing new data to a source repo, run the workflow by hand to
publish it.

## Local preview

The source repos are cloned as siblings (git-ignored here):

```
nfl/nfl-player-projections/
madness/march-madness-forecaster/
```

```
scripts/build.sh && python3 -m http.server -d _site 8000
```
