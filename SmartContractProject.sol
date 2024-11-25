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
