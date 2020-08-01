# SourceCred's Own Cred Instance

This repository contains SourceCred's own Cred instance, as well as some GitHub
actions for keeping it up to date.

You can view this as an example of what a fully configured SourceCred instance
looks like.

Some features to note:
- The Cred is recalculated every six hours.
- It deploys to GitHub pages.
- Config and permanent data (e.g. the Ledger) are stored in the master branch.
  All output or site data are stored in the gh-pages branch.
- The `config/grain.json` file specifies how much Grain to distribute every
  week. The `maxSimultaneousDistributions` parameter determines how many weeks
  of "back-distributions" to generate if the command hasn't been run in a while
  (or ever).
- Run `yarn load && yarn graph && yarn score && yarn site && yarn serve` if you
  want to load the data, create and score the graph, setup the site, and then
  serve on localhost.
- Run `yarn grain` if you want to distribute Grain using the current scores and the
  `config/grain.json`.

