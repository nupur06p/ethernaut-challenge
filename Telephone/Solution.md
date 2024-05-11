
# Telephone

In the Telephone challenge, we have the below complexity to beat the level:

"Claim ownership of the contract below to complete this level."


We can change the owner of the contract at two places, the constructor and the `changeOwner` function. Since we cannot make modifications in the constructor, we need to utilize the `changeOwner` function.

The `changeOwner` function checks whether `tx.origin`, is not equal to `msg.sender`. Inorder to exploit this contract, we need to know the difference between `tx.origin` and `msg.sender`: `tx.origin`identifies the original sender of a transaction. It points to the external account initiating the transaction and remains constant throughout subsequent smart contract interactions, while `msg.sender` refers to the the sender of the current call. When a transaction moves through several smart contracts, the `msg.sender` value changes to indicate the most recent contract address in the call chain.

When EOA calls `Telephone` contract, both `msg.sender` and `tx.origin` remains the same. 

We create a `TelephoneAttack` contract to exploit the vulnerability. The `TelephoneAttack` contract has an instance of the `Telephone` contract and when the `TelephoneAttack` contract calls the `Telephone` contract the `tx.origin` and `msg.sender` are not teh same. Hence, we are able to change the owner and claom the ownership of the contract.

## Steps for the above challenge
1. Create a `TelephoneAttack` contract which calls the `Telephone` contract.
2. The `changeOwner` function is called in the `TelephoneAttack` contract.
3. Ownership is claimed.