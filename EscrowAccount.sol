// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Escrow{

    address agent;
    mapping(address => uint256) public deposits;

    modifier onlyAgent(){
        require(msg.sender == agent, "Only Agent can Perform this Operation");
        _;
    }

 constructor(){
        agent = msg.sender;
    }

function depoist(address payee) public payable {
    deposits[payee] +=msg.value;
}

function withdraw(address payable payee) public payable onlyAgent{
    payee.transfer(deposits[payee]);
    deposits[payee]=0;
}


}
