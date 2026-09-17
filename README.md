# Sports Models Hub

Single GitHub Pages UI integrating two independently-developed projects:

- [`nfl-player-projections`](https://github.com/bsr-0/nfl-player-projections)
- [`march-madness-forecaster`](https://github.com/bsr-0/march-madness-forecaster)

## How it works

Each source repo owns its site: the model code writes `docs/` there, the
project's tests cover it, and it is **not** deployed from the source repo.
This hub is the only deployed site. A scheduled GitHub Actions workflow
(`.github/workflows/sync-docs.yml`) pulls each repo's `docs/` and copies it to
the same path it has in a local checkout:

```
index.html                              # landing page
madness/march-madness-forecaster/docs/  # synced copy of that repo's docs/ — do not edit here
nfl/nfl-player-projections/docs/        # synced copy of that repo's docs/ — do not edit here
```

Locally, `madness/march-madness-forecaster/` and `nfl/nfl-player-projections/`
are full checkouts of the source repos, so the same links resolve on disk and
on Pages. Those folders are ignored whole by this repo (`.gitignore`); the
synced `docs/` copies are force-added by the workflow in CI.

Runs every Tuesday at 13:00 UTC, or on-demand via the Actions tab
("Sync sub-project docs" → Run workflow).

Anything you put directly in a synced `docs/` folder will be deleted on the
next sync (`rsync --delete`). Edit the source repos instead.

## Setup (first time)

1. Push this folder to GitHub as e.g. `sports-models-hub`.
2. Settings → Pages → Source: deploy from branch `main`, folder `/ (root)`.
3. Settings → Actions → General → Workflow permissions → set to
   "Read and write permissions" (required for the sync workflow to push).
4. Run the workflow once manually (Actions tab) to populate the two `docs/`
   folders — until then the landing page links will 404.
