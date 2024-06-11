
# GatekeeperTwo

In this challenge, we have the below complexity to beat the level:

'This gatekeeper introduces a few new challenges. Register as an entrant to pass this level.'

The msg.sender and tx.origin should be different for gate one challenge. We need to create an intermediary contract that will make function calls to the Gatekeeper contract. 

In Solidity, we can use low-level codes by using assembly in YUL. They can be used inside assembly {...}. extcodesize is one such opcode that returns the code's size of any address.

caller() is the address of the call sender. In the  gate two, the variable x stores the size of the code on the caller()'s address, i.e., the contract which will be making a call to Gatekeeper Two's instance. We need to use another contract to make sure we pass the validation in the first gate.

The x variable is being checked to make sure that the size of the contract's code is 0, in other words, an EOA should make the call and not another contract.

This is where constructor's come into play. During a contract's initialization, or when it's constructor is being called, its runtime code size will always be 0.

So when we put our exploit logic and call it from inside a constructor, the return value of extcodesize will always return zero. This essentially means that all our exploit code will be called from inside of our contract's constructor to go through the second gate.

To expolit gate three, we use a simple XOR operation. We know that A XOR B = C is equal to A XOR C = B.

We can very easily find the value of the unknown _gateKey simply by using the following code:

bytes8 myKey = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ (uint64(0) - 1));

## Steps for the above challenge
1. Create an attack contract and in the constructor create an instance of `GateKeeperTwo` contract. 
2. The generated `_gateKey` as per the above discussion is used.
3. The `_gateKey` value is passed into the instance of `GateKeeperTwo` contract to call the `enter` function.
