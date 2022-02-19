// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract VotingTest {
    mapping(string => uint256) public candidatesVotedCount;

    constructor() {
        candidatesVotedCount["SM"] = 5;
    }

    function getVotedCount(string memory _name)
        external
        view
        returns (uint256)
    {
        return candidatesVotedCount[_name];
    }
}
