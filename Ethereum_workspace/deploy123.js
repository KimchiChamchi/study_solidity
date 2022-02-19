const Web3 = require("web3");
const fs = require("fs");

const ABI = JSON.parse(
  fs.readFileSync("./contracts_Voting_test_sol_VotingTest.abi").toString()
);
const BYTECODE = fs
  .readFileSync("./contracts_Voting_test_sol_VotingTest.bin")
  .toString();
// console.log(ABI);
// console.log(BYTECODE);
async () => {
  const web3 = new Web3(Web3.givenProvider || "http://localhost:7545");
  const accounts = await web3.eth.getAccounts().then((address) => {
    console.log(address);
    return address;
  });
  const votingContract = new web3.eth.Contract(ABI); //, '/* 스마트컨트랙트 배포 후 주소 */
};
// async function initWeb3() {
//   const web3 = new Web3(Web3.givenProvider || "http://localhost:7545");

//   let accounts = await web3.eth.getAccounts().then((data) => {
//     return data;
//   });

//   console.log(accounts[0]);
//   let SampleContract = new web3.eth.Contract(ABI);
// }

votingContract
  .deploy({
    data: BYTECODE,
  })
  .send({
    from: accounts[0],
    gas: 1000000,
    gasPrice: "300000",
  })
  .then((newContractsInstance) => {
    console.log(newContractsInstance.options.address);
  });

// votingContract.methods
//   .getVotedCount("SM")
//   .call()
//   .then((data) => {
//     console.log("Voted Count: " + data);
//   });
//votingContract.options.address =
