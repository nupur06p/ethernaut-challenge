
# King

In the King challenge, we have the below complexity to beat the level:

"The contract represents a very simple game: whoever sends it an amount of ether that is larger than the current prize becomes the new king. On such an event, the overthrown king gets paid the new prize, making a bit of ether in the process! As ponzi as it gets xD

Such a fun game. Your goal is to break it. 

When you submit the instance back to the level, the level is going to reclaim kingship. You will beat the level if you can avoid such a self proclamation."

As observed in the `constructor` of the `King` contract, if we send ether more than the `prize` amount, we can overthrow the king. The prize amount is sent to the overthrown king. Hence, this contract has the vulnerability of DOS (Denial of Service), since if the next king cannot accept ethers then kingship cannot be claimed. 

The `receive()` function is vulnerable in this contract. If we create an `Attack` function which sends a higher `msg.value` amount than the prize value, then we can become the `king`. We can make a `receive()` function with revert statement such that once the `king` is changed it cannot be overthrown. Hence, the kingship cannot be reclaimed.

## Steps for the above challenge
1. Create a `KingAttack` contract where the `King` contract address along with a higher `msg.value` than the prize amount is passed to the constructor.
2. The kingship is claimed.
3. The `receive()` function in the `KingAttack` contract is created with a `revert()` statement such that anyone who tries to send ethers, the function will revert and they cannot claim kingship.
