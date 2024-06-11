
# Delegation

In this challenge, we have the below complexity to beat the level:

"The goal of this level is for you to claim ownership of the instance you are given."

In this example, the deployed contract is `Delegation` contract thats calls the `Delegate` contract. The `Delegation` contract has the `Fallback()` function that uses a low level function call `delegatecall` to execute the code inside `Delegate` contract.

Let us first understand what is a Fallback() function. 

As quoted from Solidity docs: The `fallback` function is executed on a call to the contract if none of the other functions match the given function signature, or if no data was supplied at all and there is no receive Ether function. The `fallback` function always `receives data`, but in order to also receive Ether it must be marked payable.

Here, in this example the Fallback function is not marked payable and hence, it receives data.

Let us now understand the `delegate` call. Delegate call is a special, low level function call intended to invoke functions from another contract. The advantage of `delegatecall()` is that it can preserve the current, calling contract’s context. This context includes its storage and its msg.sender, msg.value attributes.

## Working mechanism of DelegateCall

1. Contract A initiates a `delegate` call to Contract B, specifying which function to execute in Contract B.

2. During the `delegate` call, Contract B’s code runs as if it were part of Contract A. This means Contract B can access and modify Contract A’s storage.

3. After the `delegate` call is completed, Contract A’s storage will be updated with any changes made by Contract B.

Note: Same state variable should be defined in the contract B and the order should be same as well.

Quick Note on Storage: Ethereum stores data in storage “slots”, which are these 32 byte sized slots. Every time we save a variable to storage, it automatically occupies the remaining space in the current slot, or the next slot in sequence.

4. When a function is executed with a `delegate` call these values do not change.
* address(this)
* msg.sender
* msg.value

5. If ContractA utilises a delegate call to call a function from ContractB, the following two statements are true:
a. Contract A’s state variables can be read and written.
b. Contract B’s state variables are never read or written.

The slot 0 of the `Delegation` contract also stores the owner, the exact variable we wish to change. Furthermore, it seems that if we manage to invoke the fallback function in `Delegation.sol` to invoke `pwn()`, we will become the calling contract’s owner.

## Steps for the above challenge
1. We need to trigger the `fallback()` in `Delegation` contract to invoke `pwn()` function using `msg.data`. 
2. Execution of `pwn()` function will make the user the owner of the `Delegate` contract, as well as `Delegation` contract because of the storage layout and naming of both contracts. 