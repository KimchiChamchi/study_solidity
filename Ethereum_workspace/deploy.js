const Web3 = require("web3");
const fs = require("fs");

const ABI = JSON.parse(
  fs.readFileSync("./bin/contracts/VotingTest.abi").toString()
);
const BYTECODE = fs.readFileSync("./bin/contracts/VotingTest.bin").toString();

// console.log(ABI);
// console.log(BYTECODE);

const accounts = [];
const web3 = new Web3(Web3.givenProvider || "http://localhost:8545");
async function init() {
  await web3.eth.getAccounts().then((data) => {
    //console.log(data);
    data.forEach((x) => {
      accounts.push(x);
    });
  });
}

init().then(() => {
  console.log(accounts);

  const votingContract = new web3.eth.Contract(ABI);
  votingContract
    .deploy({
      data: BYTECODE,
    })
    .send({
      from: accounts[1],
      gas: 1500000,
      gasPrice: "30000000000000",
    })
    .then((newContractsInstance) => {
      console.log(newContractsInstance.options.address);

      newContractsInstance.methods
        .getVotedCount("SM")
        .call()
        .then((data) => {
          console.log("Voted Count : " + data);
        });
    });
});
