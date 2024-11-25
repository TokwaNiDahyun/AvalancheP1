# Ether Deposit, Withdrawal, and Check

This Solidity program demonstrates a basic smart contract for managing Ether deposits and withdrawals. It includes features for secure transactions, balance tracking, and contract balance verification by the owner.

## Description

The **Smart Contract Project** is a foundational contract written in Solidity, showcasing essential functionalities for managing user deposits and withdrawals. It allows users to deposit Ether, withdraw funds within their balance limits, and ensures only the contract owner can check the contract's total balance.

## Getting Started

### Installing

1. Open [Remix IDE](https://remix.ethereum.org/), an online Solidity development environment.
2. Create a new file in Remix and save it with a `.sol` extension (e.g., `SmartContractProject.sol`).
3. Copy and paste the provided code into the file.
```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract SmartContractProject {
    address public owner;
    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0, "Please deposit at least 1 Ether");
        balances[msg.sender] += msg.value;
        assert(balances[msg.sender] >= msg.value);
    }

    function withdraw(uint256 _amountInEther) public {
        uint256 _amountInWei = _amountInEther * 1 ether; // convert Ether to Wei
        require(_amountInEther > 0, "Please withdraw at least 1 Ether");
        require(balances[msg.sender] >= _amountInWei, "Insufficient balance");

        balances[msg.sender] -= _amountInWei;

        (bool success, ) = msg.sender.call{value: _amountInWei}("");
        if (!success) {
            revert("Please try again later.");
        }

        assert(balances[msg.sender] >= 0);
    }

    function checkContractBalance() public view returns (uint256) {
        require(msg.sender == owner, "Only the owner can check the contract balance");
        return address(this).balance;
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
- **Deposit Ether:**
  1. Enter the amount of Ether to deposit in the value field.
  2. Click the `deposit` button to send Ether to the contract.
- **Withdraw Ether:**
  1. Enter the amount (in Ether) to withdraw in the `_amountInEther` field.
  2. Click the `withdraw` button.
- **Check Contract Balance:**
  1. Only the contract owner can use this function.
  2. Click the `checkContractBalance` button to view the contract's total balance.

## Authors

Metacrafter Joshua 

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
