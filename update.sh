#!/bin/bash
set -eu


rm -rf ./docs
PATH_TO_THIS_REPOSITORY="$(pwd)"
cd $sc
# ./scripts/build_static_site.sh \
  # --target "$PATH_TO_THIS_REPOSITORY/docs"  \
  # --project-file "$PATH_TO_THIS_REPOSITORY/projects/combined.json"
  # --weights "$PATH_TO_THIS_REPOSITORY/weights.json"
# Load it twice so we can access the scores -- it's a hack, pending real instance system
node ./bin/sourcecred.js load --project "$PATH_TO_THIS_REPOSITORY/projects/combined.json" --weights "$PATH_TO_THIS_REPOSITORY/weights.json"
node ./bin/sourcecred.js scores @sourcecred | jq '.' > "$PATH_TO_THIS_REPOSITORY/scores.json"
