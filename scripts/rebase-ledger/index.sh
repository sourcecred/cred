#!/bin/bash

exit() {
    exit_code=$?
    if [ $exit_code -ne 0 ]; then
        mv ./data/ledger-backup.json ./data/ledger.json
        rm ./data/ledger-result.json
    else
        mv ./data/ledger-result.json ./data/ledger.json
        rm ./data/ledger-backup.json
    fi
    
}

set -e
trap exit EXIT

cp ./data/ledger.json ./data/ledger-backup.json

git fetch

git reset --hard origin/main

node ./scripts/rebase-ledger/rebase-test.js
echo "Safety test passed. Proceeding with rebase."

node ./scripts/rebase-ledger/index.js \
    "./data/ledger.json" \
    "./data/ledger-backup.json" \
    > ./data/ledger-result.json \
    /

echo "Rebase complete. Commit and push changes."
