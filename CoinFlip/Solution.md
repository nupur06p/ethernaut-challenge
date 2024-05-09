
# CoinFlip

In the CoinFlip challenge, we have the below challenges to beat the level:

"This is a coin flipping game where you need to build up your winning streak by guessing the outcome of a coin flip. To complete this level you'll need to use your psychic abilities to guess the correct outcome 10 times in a row."

In the `CoinFlip` contract, the blockValue depends on the `block.number` to achieve randomness. However, these values are not random and can be exploited and the `blockhash` is introduced.

The blockchash is divided by a constant number `FACTOR`, that determines the `coinFlip`. If the `coinFlip` is 1 or 0, accordingly `side` variable is updated as true or false. 

The side variable is checked with the input `_guess` and the `consecutiveWins` is updated and true is returned else the `consecutiveWins` equals to 0 and false is returned. 

## Winning  Streak
A new contract `CoinFlipAttack` is created. It contains a copy of the `CoinFlip` contract. The address of the `CoinFlip` contract is used in the constructor to create an instance of the `CoinFlip` contract named `victim`.

The `winnerAttack` function contains the similar updates for variables like `blockValue`, `coinFlip`, `side` as seen in `CoinFlip` contract. 

The instance of `CoinFlip` contract `vitim` is used to call the `flip` function and the `side` calculated in simialr manner as `CoinFlip` contract is passed to the instance `victim`. Each time the `winnerAttack` function is called it gives us the accurate result.

## Steps for the above challenge 
1. Created a `CoinFlipAttack` function having instance of the `CoinFlip` contract.
2. Calculated the `side` variable with same parameters as in the `CoinFlip` contract.
3. The instance of `CoinFlip` contract is used to call the `flip` function and the calculated `side` variable is passed.
4. The outcome is gives us the accurate result for every wins.