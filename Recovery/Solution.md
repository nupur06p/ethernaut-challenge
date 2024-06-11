
# Recovery

In this challenge, we have the below complexity to beat the level:

'A contract creator has built a very simple token factory contract. Anyone can create new tokens with ease. After deploying the first token contract, the creator sent 0.001 ether to obtain more tokens. They have since lost the contract address.

This level will be completed if you can recover (or remove) the 0.001 ether from the lost contract address.'

## Analysis

We need to find the lost contract address. Once this is found, we can just call the destroy() function on the contract to withdraw the funds since the visibility is set to public. Let's derive the lost address.

According to the Ethereum Yellow Paper -

'The address of the new account is defined as being the rightmost 160 bits of the Keccak hash of the RLP encoding of the structure containing only the sender and the account nonce.'

This means that the new address will be the rightmost 160 bits of the keccak256 hash of RLP encoding of sender/creator_address and their nonce.

1. sender address - It is the address that created the contract.
nonce - It is the number of contracts created by the factory contract or if it's an EOA, it will be the number of transactions by that account. In this case, it will be 1 assuming it is the first contract created by the factory.

2. RLP - The purpose of RLP is to encode arbitrarily nested arrays of binary data, and RLP is the primary encoding method used to serialize objects in Ethereum's execution layer.
    a. RLP for 20 byte address will be 0xd6, 0x94 according to the following sources: here, and here.
    b. RLP encoding for nonce 1 will be 0x01 because for all values under [0x00, 0x7f] (decimal [0, 127]) range, that byte is its own RLP encoding.
Now that we know the above values, we can calculate the first address created by the factory contract as:

`address lostcontract = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xd6), bytes1(0x94), address(<creator_address>), bytes1(0x01))))));`

Using the formula described above, we are calculating the address of the lost contract and calling the destroy() with any random address to withdraw the ether from the contract using selfdestruct.

## Takeaways
1. Contract addresses are deterministic. Creating sensitive business logic around contract addresses should be validated properly.
2. Ether can be sent to a non-existent contract therefore validations around the contract's balance should be enforced accordingly.
