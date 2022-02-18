// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Voting {
    // 당선자 발표 이벤트
    event AnnouncementOfResults(string name, uint256 age);

    // 후보자 구조체
    struct Candidate {
        string name; // 후보자 이름
        uint8 age; // 후보자 나이
        // uint8 poll; // 득표수
    }

    // 투표하면 후보자 주소를 통해 득표하도록 매핑
    mapping(address => uint256) public poll;
    // 투표하면 내 주소를 통해 투표지 사라지도록 매핑
    mapping(address => uint256) public suffrage;

    // 투표하기 함수
    function vote(address _candidate) public {
        // 투표를 이미 한 사람은 투표지를 사용했으니 멈춰!
        require(suffrage[msg.sender] == 1);
        // 후보에게 투표하면 내 투표지는 -1
        suffrage[msg.sender] = suffrage[msg.sender] - 1;
        // 후보에게 투표하면 해당 주소로 매핑해서 +1
        poll[_candidate] = poll[_candidate] + 1;
        // 내 투표로 인해 해당 후보자가 10표째 득표라면
        if (poll[_candidate] == 10) {
            // 당선함수 실행
            _election(_candidate);
        }
    }

    // 축 당선 발표 함수
    function _election(address _candidate) {}

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
