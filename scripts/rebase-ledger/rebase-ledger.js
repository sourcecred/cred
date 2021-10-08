const fs = require("fs");
const sc = require("sourcecred").sourcecred;
const isEqual = require("lodash.isequal");

module.exports = {
  rebase: (base, target) => {
    const data1 = fs.readFileSync(base, "utf8");
    const ledger1 = sc.ledger.ledger.Ledger.parse(data1);
    const ledgerResult = sc.ledger.ledger.Ledger.parse(data1);
    const ledgerLog1 = ledger1.eventLog();

    const data2 = fs.readFileSync(target, "utf8");
    const ledger2 = sc.ledger.ledger.Ledger.parse(data2);
    const ledgerLog2 = ledger2.eventLog();

    const firstIndex = ledgerLog2.findIndex(
      (x, i) => !isEqual(ledgerLog1[i], x)
    );
    if (firstIndex === -1) {
      throw "No local events to rebase.";
    }
    let i = firstIndex;
    for (; i < ledgerLog2.length; i++) {
      try {
        ledgerResult._createAndProcessEvent(ledgerLog2[i].action);
      } catch {
        throw "There was a conflict. You will need to manually redo the actions onto the ledger in the main branch.";
      }
    }
    return { ledger1, ledger2, ledgerResult };
  },
};
