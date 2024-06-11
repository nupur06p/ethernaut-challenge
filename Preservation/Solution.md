
# Preservation

In this challenge, we have the below complexity to beat the level:
"The goal of this level is for you to claim ownership of the instance you are given."

The Preservation contract defines some state variables, in which the first and second variable holds the addresses for the libraries and the third one is the owner in which we need to store our address. These addresses are predefined in the constructor and there's no way to change them.

The variable `setTimeSignature` defines a function signature which will be used in delegate call so it knows which function name to call. The functions `setFirstTime` and `setSecondTime` are taking a timestamp as input and making delegate calls to the libraries. So the only part we control here is the parameter uint `_timeStamp`.

`Library` Contract a variable called `storedTime` in slot 0 which maps to the variable address public `timeZone1Library` in the `Preservation` contract. The function `setTime()` is taking an input which is controlled by us and is stored inside the above variable.


## Steps for the above challenge

1. Create an attacker contract `PreservationAttack` and call the `setFirstTime()` function. In the function argument `_timeStamp`, pass the address of the `PreservationAttack`. This will make a delegatecall to the LibraryContract and call the `setTime()` function with the address of the `PreservationAttack` contract in_time. This will be stored in the parameter `storedTime` on slot 0.

2. Since the `Preservation` contract has the variable `timeZone1Library` in slot 0, it will get updated with the `PreservationAttack` address. Now we have control over one of the libraries. We will implement our own `setTime()` function in the `PreservationAttack` contract and accept an address and store it inside our own owner variable.

3. To make sure the value of the owner is updated in slot 2 of the `Preservation` contract, we will organize the slots in our contract accordingly. Now we will make another call to the `setFirstTime` function of the `Preservation` contract. Since we control the library's address, the execution flow will go to our own `PreservationAttack` contract and set the owner which will then be reflected in the `Preservation` contract as well.
