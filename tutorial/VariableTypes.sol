pragma solidity ^0.5.11;

contract MyContract {
    //1. 고정 크기 유형
    bool isReady;
    uint256 a;
    address recipient; // 받는사람
    bytes32 data; // 문자열에 주로 사용.

    //2. 가변 크기 유형
    string name;
    bytes _data;
    uint256[] amounts;
    mapping(uint256 => string) users;

    //3. 사용자 정의 데이터
    struct User {
        uint256 id;
        string name;
        uint256[] friendIds;
    }
    enum Color {
        RED,
        GREEN,
        BLUE
    }
}
