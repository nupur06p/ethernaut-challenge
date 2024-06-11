
# GatekeeperOne

In this challenge, we have the below complexity to beat the level:

"Make it past the gatekeeper and register as an entrant to pass this level"

We need to overcome three modifiers here to make past the gatekeeper. 

To make the msg.sender and tx.origin different, we need to create an intermediary contract that will make function calls to the Gatekeeper contract. This will make our caller's address the tx.origin and our deployed contract's address will be the msg.sender as received by the Gatekeeper.

Let us look at gate three first and then go to gate two. Let us understand the concept of data type downcasting and upcasting along with bitmasking.

When we convert a bigger data type into a smaller one such as uint32 into uint16, the smaller variable will lose some data. Eg: If we have a variable uint32 someVar = 0x12345678 and we convert it into uint16, we will be left with 0x5678.

Similarly, if we wanted to convert uint16 into uint32, the above value will become 0x00005678.

Let's now discuss about Bit masking. This is just the & bitwise operation. Eg: 1 AND 0 will be 0. 1 AND 1 will become 1. We will make use of bitmasking when we submit the final key to this gate.

Let's assume that we have to send the following value as our key - 0x B1 B2 B3 B4 B5 B6 B7 B8. We are taking 8 bytes because the function enter() needs an argument of bytes8 _gateKey.

1. The first statement asks us to satisfy the following condition:

    0x B5 B6 B7 B8 == 0x 00 00 B7 B8

We can observe that B5 and B6 will be 0.

2. The second statement will become:

   0x 00 00 00 00 B5 B6 B7 B8 != 0x B1 B2 B3 B4 B5 B6 B7 B8

This shows that the bytes B1, B2, B3, and B4 can be anything but 0.

3. The third statement will be:

   0x B5 B6 B7 B8 == 0x 00 00 (last two bytes of tx.origin)

We can see that B7 and B8 will be the last two bytes of the address of our `tx.origin`.

Hence, the key will be -
0x ANY_DATA ANY_DATA ANY_DATA ANY_DATA 00 00 SECOND_LAST_BYTE_OF_ADDRESS LAST_BYTE_OF_ADDRESS

Let us now understand how bitmasking works:

Since we need to use our tx.origin address to build our key, we can use the AND operation to set the value of B5 and B6 to 0, and the last two bytes (FFFF) to our tx.origin's last two bytes i.e.,

bytes8(uint64(tx.origin)) & 0xFFFFFFFF0000FFFF

Here, we are taking uint64 value of tx.origin since we need 8 bytes and doing an AND operation with the value 0xFFFFFFFF0000FFFF.

Compare it with our 0xB1B2B3B4B5B6B7B8 example shown above. The first four bytes are all F (not 0), B5 and B6 are 0, and the last two bytes are F because this will help retain our last two address bytes.

This will give us our final key needed to clear the gate.

Let us now look at gate two. Let us use the bruteforce method in the function and increment the gas in each function call until one of the values hits the spot.

We are making using of `.call()` to make a function call to the `enter()` function. This will allow us to specify the exact amount of gas to send. There's a for loop which goes from 0 to 300. This is just a random value we chose.

The amount of gas is in the form of i + (8191 * k). Assuming that i is the amount of gas used before the function gasleft() was called, and the remaining is a multiple of 8191. If we fix k at a certain value, all we need is to find i. I'll take k to be 3 and i will go from 0 to 300.

Once the loop starts, since the function enter() returns a bool, we are storing the return in a success variable and checking if it's true, therefore breaking the loop once our gas value is accepted.

## Steps for the above challenge
1. Create an intermediary contract that will make function calls to the Gatekeeper contract.
2. Generated the key `bytes8(uint64(tx.origin)) & 0xFFFFFFFF0000FFFF` as per the calculation discussed above to ovecome gate two.
3. Applied the bruteforce method to increment the gas in each function call until one of the values hits the spot.