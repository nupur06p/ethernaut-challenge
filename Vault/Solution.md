
# Vault

In this challenge, we have the below complexity to beat the level:

"Unlock the vault to pass the level!."

The `unlock` function of the contract `Vault` takes in the password that is set in the `constructor` and updates the `locked` variable as false, which unlocks the vault.

Everything in blockchain is public and transparent and so even if the `locked` variable is set as private, it does not mean the data is private and can ve viewed by others in the blockchian. If the data is not encrypted, anyone can view it in blockchain. 

There is no password function to get the password. However, it is stored in the storage slot 1. We need to read the password from its storage slot 1 and then pass it to the `unlock` function to unlock the vault. 

We can use web3.js to get the password as seen below. This will give us the output in bytes32. 

`web3.eth.getStorageAt(instance_address, 1)`

output: `0x412076657279207374726f6e67207365637265742070617373776f7264203a29`

If we need a string output we can use the below method and it gives us the text output

`web3.utils.hexToAscii(await web3.eth.getStorageAt(instance_address, 1))`

output: `A very strong secret password :)`

## Steps for the above challenge
1. Use the below equation for getting the password in bytes32.
    `web3.eth.getStorageAt(instance_address, 1)`
2. The vault is unlocked.
