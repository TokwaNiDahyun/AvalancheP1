// SPDX-License-Identifier: MIT
// 202111212 - Joshua Renniel Pineda - TokwaNiDahyun
pragma solidity 0.8.26;

contract SmartContractProject {
    address public owner;
    mapping(address => uint) public balances;

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value >= 1 ether, "Please deposit at least 1 Ether");
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint _amountInEther) public {
        uint _amountInWei = _amountInEther * 1 ether; // convert Ether to Wei
        
        assert(_amountInEther > 0);

        (bool success, ) = msg.sender.call{value: _amountInWei}("");
        if (!success) {
            revert("Transaction failed. Please try again later.");
        }
    }

    function checkContractBalance() public view returns (uint) {
        if (msg.sender != owner) {
            revert("Only the owner can check the contract balance");
        }
        return address(this).balance / 1 ether;
    }
}
