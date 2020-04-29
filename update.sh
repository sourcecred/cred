#!/bin/bash
set -eu


rm -rf ./docs
PATH_TO_THIS_REPOSITORY="$(pwd)"
export SOURCECRED_INITIATIVES_DIRECTORY=${PATH_TO_THIS_REPOSITORY}/initiatives
cd $sc
./scripts/build_static_site.sh \
  --target "$PATH_TO_THIS_REPOSITORY/docs"  \
  --project-file "$PATH_TO_THIS_REPOSITORY/project.json" \
  --weights "$PATH_TO_THIS_REPOSITORY/weights.json" \
  --cname cred.sourcecred.io

# Load it twice so we can access the scores -- it's a hack, pending real instance system
node ./bin/sourcecred.js load --project "$PATH_TO_THIS_REPOSITORY/project.json" --weights "$PATH_TO_THIS_REPOSITORY/weights.json"
node ./bin/sourcecred.js scores @sourcecred | jq '.' > "$PATH_TO_THIS_REPOSITORY/scores.json"
