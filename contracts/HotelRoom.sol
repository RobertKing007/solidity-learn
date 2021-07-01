// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract HotelRoom {

  address payable public owner;

  enum Statuses {Vacant, Occupied }
  Statuses currentStatus;

  event Occupy (address _occupant, uint _value);

  constructor() payable public {
    owner = payable(msg.sender);
    currentStatus = Statuses.Vacant;

  }

  modifier onlyWhileVacant {
    require(currentStatus == Statuses.Vacant, "occupied");

    require(msg.value >= 2 ether, "Not enough ether");
    _;
  }

    modifier costs(uint _amount) {
    require(msg.value >= _amount, "Not enough ether");
    _;
  }

  receive() external payable onlyWhileVacant  costs(2 ether) {
    currentStatus = Statuses.Occupied;
    owner.transfer(msg.value);
    emit Occupy(msg.sender, msg.value);
  }
}
