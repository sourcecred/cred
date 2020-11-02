# SourceCred's Own Cred Instance

This repository contains SourceCred's own Cred instance, as well as some GitHub
actions for keeping it up to date.

You can view this as an example of what a fully configured SourceCred instance
looks like.

Some features to note:
- The Cred is recalculated every 24 hours.
- It deploys to GitHub pages.
- Config and permanent data (e.g. the Ledger) are stored in the master branch.
  All output or site data are stored in the gh-pages branch.
- The `config/grain.json` file specifies how much Grain to distribute every
  week. The `maxSimultaneousDistributions` parameter determines how many weeks
  of "back-distributions" to generate if the command hasn't been run in a while
  (or ever).
- Run `yarn go` to load all the data and recalculate scores. Run `yarn go --no-load` if you
  don't want to load data from scratch.
- Run `yarn serve` to locally serve the frontend.
- Run `yarn grain` if you want to distribute Grain using the current scores and the
  `config/grain.json`.

