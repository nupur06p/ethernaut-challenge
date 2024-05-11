
# Force

In the Force challenge, we have the below complexity to beat the level:

"The goal of this level is to make the balance of the contract greater than zero."

This contract does not contain any code, only a commented out ASCII art of a cat and we need to find a way to forcefully send Ether to this contract.

We can forcefully send Ether to this contract by creating a smart contract that uses selfdestruct() and updates the balance of the target contract. 

Let us understand, what is a selfdestruct function in Solidity-

The `selfdestruct(address payable recipient)` function transfers all Ether from the contract to a specified recipient address and removes the contract’s bytecode, rendering it inoperative. 

In this example, the contract ForceAttack.sol is created. In the constructor function of this contract the `Force` contract address is passed as the parameter. The constructor contains the `selfdestruct` function and this contract is deployed with a value of 1 wei.

The `selfdestruct` function has significant security risk if misused and hence has been deprecated.

## Steps for the above challenge
1. Create a `ForceAttack` contract, where target contract address is passed as parameter to the constructor.
2. A value of 1 wei is passed when the contract is deployed.
3. This level is complete by forcefully sending Ether to the given contract.