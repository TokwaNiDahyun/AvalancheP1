# Budget Tracker Smart Contract

This Solidity program demonstrates a simple **budget tracker** smart contract. It allows users to manage their budget by adding income, subtracting expenses, and resetting the balance. The contract includes basic functionality to ensure the balance is updated correctly and contains error handling using Solidity's `require`, `assert`, and `revert` functions.

## Description

The **Budget Tracker** contract is designed to manage a personal budget. The contract allows users to:
- **Add Income**: Add positive amounts to the balance.
- **Subtract Expenses**: Subtract an expense if it's within the current balance.
- **Reset Balance**: Reset the balance to zero to indicate the start of a new budget cycle.

## Features
- **Add Income**: Users can deposit any positive amount to increase their balance.
- **Subtract Expense**: Users can subtract an expense that is less than or equal to their balance.
- **Reset Balance**: Users can reset the balance to zero, with checks in place to prevent resetting an already-zero balance.

## Getting Started

### Installing

1. Open [Remix IDE](https://remix.ethereum.org/), an online Solidity development environment.
2. Create a new file in Remix and save it with a `.sol` extension (e.g., `budgetTracker.sol`).
3. Copy and paste the provided code into the file.

```solidity
// SPDX-License-Identifier: MIT
// 202111212 - Joshua Renniel Pineda - TokwaNiDahyun
// budget tracker
pragma solidity 0.8.26;

contract budgetTracker {
    uint public balance;

    // Add income to the balance
    function addIncome(uint _amount) public {
        require(_amount > 0, "Income must be greater than zero");
        balance += _amount;
    }

    // Subtract an expense from the balance
    function subtractExpense(uint _expense) public {
        assert(balance > 0); // Ensure there is a balance to subtract from
        assert(_expense > 0 && _expense <= balance); // Ensure the expense is valid
        balance -= _expense;
    }

    // Reset the balance to zero
    function resetBalance() public {
        if (balance == 0) {
            revert("Balance is already zero, cannot reset");
        }
        balance = 0;
    }
}
```
### Executing Program

Follow these steps to compile, deploy, and use the contract:

#### Compile the Code:
1. Click on the **Solidity Compiler** tab in the left sidebar.
2. Set the compiler version to **0.8.26**.
3. Click the **Compile SmartContractProject.sol** button.

#### Deploy the Contract:
1. Click on the **Deploy & Run Transactions** tab in the left sidebar.
2. Select the **Injected Provider - MetaMask** environment if using MetaMask, or choose a local environment like **Remix VM**.
3. Deploy the contract by clicking the **Deploy** button.

#### Interact with the Contract:
- **Add Income:**
  1. Enter a positive amount to add as income in the _amount field.
  2. Click the `addIncome` button to increase the balance.
- **Subtract Expense:**
  1. Enter the amount to subtract as an expense in the _expense field.
  2. Click the `subtractExpense` button to decrease the balance.
- **Reset Balance:**
  1. Click the `resetBalance` button to reset the balance to zero (will only work if the balance is not zero).
 
#### Example Use Case:
  1. `Add Income:` The user deposits 100 units into their budget using the addIncome() function.
  2. `Subtract Expense:` The user subtracts 50 units using the subtractExpense() function.
  3. `Reset Balance:` Once the budget cycle is finished, the user can reset the balance to zero using the resetBalance() function.
     
## Authors

Metacrafter Joshua 

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
