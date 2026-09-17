# Sports Models Hub

Single GitHub Pages UI combining two independently-developed projects:

- [`nfl-player-projections`](https://github.com/bsr-0/nfl-player-projections)
- [`march-madness-forecaster`](https://github.com/bsr-0/march-madness-forecaster)

## How it works

This repo does not contain source code for either model. A scheduled GitHub
Actions workflow (`.github/workflows/sync-docs.yml`) pulls the built
`docs/` folder from each source repo and copies it into `nfl/` and
`madness/` here. `index.html` is a small landing page linking to both.

Runs every Tuesday at 13:00 UTC, or on-demand via the Actions tab
("Sync sub-project docs" → Run workflow).

## Setup (first time)

1. Push this repo to GitHub as e.g. `sports-models-hub`.
2. Settings → Pages → Source: deploy from branch `main`, folder `/ (root)`.
3. Settings → Actions → General → Workflow permissions → set to
   "Read and write permissions" (required for the sync workflow to push).
4. Run the workflow once manually (Actions tab) to populate `nfl/` and
   `madness/` for the first time — until then those folders are empty
   and the landing page links will 404.

## Folders

```
index.html   # landing page
nfl/         # synced copy of nfl-player-projections/docs — do not edit directly
madness/     # synced copy of march-madness-forecaster/docs — do not edit directly
```

Anything you put directly in `nfl/` or `madness/` will be deleted on the
next sync (`rsync --delete`). Edit the source repos instead.
