const { rebase } = require("./rebase-ledger.js");
const fs = require("fs");

const [base, target] = process.argv.slice(2);
const { ledger1, ledger2, ledgerResult } = rebase(base, target);
console.log(ledgerResult.serialize());
