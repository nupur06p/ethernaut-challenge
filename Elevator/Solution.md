
# Elevator

In the Elevator challenge, we have the below complexity to beat the level:

"This elevator won't let you reach the top of your building. Right?"

We need to reach the top floor of the building and we can do that using the `goTo()` function. An instance of the building is created at the address of `msg.sender`. 

Inorder to set the `top` variable as true in the `goTo()` function, the `building.isLastFloor` condition should return false and that the condition is passed. 

We create an ElevatorAttack contract, where a new bool variable `last` is created. The function `isLastFloor()` converts the `last` variable to false and returns it. Next the `goTo()` function from the `Elevator.sol` contract is called and the floor number is passed. Since, the `last` variable is already false, it passes the condition `building.isLastFloor`, and hence the `top` variable value is set as true. 

## Steps for the above challenge

1. Create an `ElevatorAttack` contract using the instance of the `Elevator.sol` script.
2. Create a new variable `last` and set it as true. Next create a `isLastFloor()` function and change the `last` variable as false.
3. Next create an `attack` function and call the `goTo()` function of the `Elevator` contract. The condition `building.isLastFloor` is passed as the variable `last` is already false.
4. The variable `top` in the `Elevator` contract is now changed to true.