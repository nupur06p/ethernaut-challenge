
# Token

In the Token challenge, we have the below complexity to beat the level:

"The goal of this level is for you to hack the basic token contract.

You are given 20 tokens to start with and you will beat the level if you somehow manage to get your hands on any additional tokens. Preferably a very large amount of tokens."

This solidity contract is of version `^0.6.0` where SafeMath library from OpenZeppelin was not used. Hence, we had the overflow and underflow problem in solidity and we did lose large amounts of funds due to this vulnerability.

Let us understand what is an overflow and underflow problem. The smallest and the largest number which a uint256 can store is between 0 to 2^256-1. 

An overflow occurs when the variable reaches their maximum capacity (byte size) and resets back to its inital minimum point, which is 0, because it can't hold any more numbers. 

An underflow happens when the variable is at its minimum capacity, and cannot store any smaller numbers so it wraps back around to its maximum size. 

Hence, if we subtract 1 from a uint256 that is equal to 0, we will get 2^256-1. If we add 1 to a uint8 that is equal to 2^256-1, we will get 0.

Hence, inorder to hack the contract, we can underflow `balances[msg.sender]` with the line `balances[msg.sender] -= _value`, to get the largest number a uint256 can store, which is 2^256 - 1. Now, we already have 20 tokens initially. Hence, to hack the level we call transfer() with a value of 21. This is done in contract `TokenAttack.sol`, where we create an instance of `Token` contract and then call the function `transfer` and pass address as `msg.sender` and `21` as number of tokens.

## Steps for the above challenge
1. A contarct `TokenAttack` is created with an instance of contract `Toekn`.
2. The function `transfer` is called, the address is passed as msg.sender and number of tokens 21.
3. Now we have sent 21 tokens from our initial supply of 20 tokens.
