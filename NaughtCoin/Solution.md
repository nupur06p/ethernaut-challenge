
# NaughtCoin

In this challenge, we have the below complexity to beat the level:


'NaughtCoin is an ERC20 token and you're already holding all of them. The catch is that you'll only be able to transfer them after a 10 year lockout period. Can you figure out how to get them out to another address so that you can transfer them freely? Complete this level by getting your token balance to 0.'

To understand this level, we must know what an ERC20 token standard is. It is an API for tokens that defines certain standard function calls, parameters, and events and anyone who intends to create an ERC20 token must follow those standards. This makes it easier for all the developers using these tokens to predict their usage and interactions.

To transfer the tokens out of our account we could have called the transfer() function but since it is using a modifier that is checking for the timelock period, we can't do this.

This is where the knowledge of ERC20 is used. There are more ways to transfer tokens out of a contract. The transfer() function is one of the methods and the other one is approve() and transferFrom(). Both approve() and transferFrom() are used in conjunction in the exploit function.

Since the Naught Coin contract is inheriting from ERC20, and the modifier lockTokens() is not enforcing the timelock on the transferFrom() function, we are free to call the approve and transferFrom to transfer all the tokens out of our account.


## Steps for the above challenge
1. Create an attack contract calling the instance of `NaughtCoin` contract.
2. The `approve()` function is called to approve our own address to spend the total token balance.
3. The `transferFrom()` function is called to transfer the approved tokens from our account to any random account.
