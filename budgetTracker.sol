// SPDX-License-Identifier: MIT
// 202111212 - Joshua Renniel Pineda - TokwaNiDahyun
// budget tracker
pragma solidity 0.8.26;

contract budgetTracker {
    uint public balance;

    function addIncome(uint _amount) public {
        require(_amount > 0, "income must be greater than zero");
        balance += _amount;
    }

    function subtractExpense(uint _expense) public {
        assert(balance > 0);
        assert(_expense > 0 && _expense <= balance);
        balance -= _expense;
    }

    function resetBalance() public {
        if (balance == 0) {
            revert("Balance is already zero, cannot reset"); 
        }
        balance = 0; 
    }
}
