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
  
  
For instructions on how to run the instance locally, see the [Setup and Usage Guide](https://github.com/sourcecred/template-instance#setup-and-usage).
