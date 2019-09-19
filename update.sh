#!/bin/bash
set -eu


rm -rf ./docs
PATH_TO_THIS_REPOSITORY="$(pwd)"
cd $sc
./scripts/build_static_site.sh \
  --target $PATH_TO_THIS_REPOSITORY/docs  \
  --project-file $PATH_TO_THIS_REPOSITORY/projects/combined.json \
  --project-file $PATH_TO_THIS_REPOSITORY/projects/discourse.json \
  --project-file $PATH_TO_THIS_REPOSITORY/projects/github.json \
  --weights $PATH_TO_THIS_REPOSITORY/weights.json
