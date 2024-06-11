
# Privacy

In this challenge, we have the below complexity to beat the level:

"Unlock this contract to beat the level."

As we know, the data on the blockchian is never private unless it is encrypted. In this challenge, we need to unlock the contract and this can be done by changing teh variable locked as true. 

We need to call the unlock() function and for that we need the array data[2] as key. We ened to understand how the slots are packed for the other data to get the data. The storage slots are in order - public and private variables are places one after another. Each slot can hold a 256-bit value.

When we declare a variable in Solidity, it is automatically assigned to the next available storage slot. It is important to note that every time we use a storage variable, we are reading or writing to an entire 32-byte slot, even if our variable only requires a small amount of space. 

Below is the slots packed in the contract - 

-`bool locked` - slot 0 (1 byte space)
-`uint ID` -  slot 1 (1 byte space)
-`uint8 flattening` - slot 2 (1 byte space)
-`uint8 denomination` - slot 2 (1 byte space)
-`uint16 awkwardness` -  2 (2 bytes spave)
-`bytes32[3] data` - slots 3 to 6. Array starts with new slots and occupies the full slot.

Here the data[2] is in slot 5. We can use web3.eth.getStorageAt(instance, 5) to extract the data and use cast to bytes16 and use it as _key in unlock() function.

## Steps for the above challenge
1. Understand in which slot data[2] lies. 
2. Use web3.eth.getStorageAt(instance, 5) to extract the data.
3. Cast the extracted data in step 2 to bytes 16.
4. Pass the data as the _key in unlock() functionof the contract to unlock it