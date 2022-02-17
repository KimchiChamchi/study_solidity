pragma solidity ^0.5.11;

contract MyContract {
    uint256 value;

    // value 가져오기
    function getValue() external view returns (uint256) {
        return value;
    }

    // value 값 전달받은 인자로 변경하기
    function setValue(uint256 _value) external {
        value = _value;
    }
}
