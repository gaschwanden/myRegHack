pragma solidity ^0.4.8;

import "./Unit.sol";

contract Building {
  address public buildingOwner;
//   uint public propertyID;
  uint public numberOfUnits; // frontend capture
  bool public success;
  uint public unitID;
//   address[] public uintsArray;
   mapping(uint=>address) units;


  function Building(uint _numberOfUnits) {
    buildingOwner = msg.sender;
    // propertyID = _propertyID;
    numberOfUnits = _numberOfUnits;
    success = true;

    if (numberOfUnits > 1) {
      for (uint8 i = 0; i < numberOfUnits; i++){
        createUnits(i);
      }
    }
  }
  /*function getAddress() returns (address){
    return buildingOwner;

  }*/

//   function createBuilding(uint , uint _numberOfUnits) returns (bool success) {
//     return success;
//   }


  function createUnits(uint unitID) {
    if(msg.sender != buildingOwner)throw;
    // uintsArray.push(new Unit(buildingOwner, unitID));
    units[unitID] = new Unit(buildingOwner, unitID);

  }

  function getUnitById(uint unitID) returns (address){
      return units[unitID];
  }

}