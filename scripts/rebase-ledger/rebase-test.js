const { rebase } = require("./rebase-ledger.js");
const isEqual = require("lodash.isequal");

const base = "./data/ledger.json";
const target = "./scripts/rebase-ledger/ledger-dirty.json";
try {
  const { ledger1, ledger2, ledgerResult } = rebase(base, target);
  if (ledgerResult.eventLog().length != ledger1.eventLog().length + 1)
    throw "Length did not match expected.";
  const lastEvent = ledgerResult.eventLog()[ledgerResult.eventLog().length - 1];
  if (
    !isEqual(lastEvent.action, {
      identityId: "pUYjRXzPzbhy6fVLsbYhPw",
      type: "TOGGLE_ACTIVATION",
    })
  )
    throw "Last event did not match expected." + JSON.stringify(lastEvent.action);
} catch (e) {
  console.log("Safety test failed.");
  throw e;
}
