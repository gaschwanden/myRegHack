pragma solidity ^0.4.8;

import "./Unit.sol";

contract Land {
  address public landOwner;         // not required on frontend
  bool public ownershipStructure;   // frontend are you freehold owner
  uint public propertyID;           // indentifyer of land -> frontend needs to capture postal address
  uint public key;                  // index for buildings not required on frontend
  address private infoHash;         // external storage address
  uint public sqm;                  // frontend area
  bool public additionalInfo;       // frontend capture addditional information e.g. images, planing overlay
  address[] public buildings;
  mapping(uint=>uint) map;
  uint[] public keys;


    function Land(uint _propertyID) {
      landOwner = msg.sender;
      propertyID = _propertyID;
      key = 0;
      ownershipStructure = true;

    }

    function getNumberOfBuildings() returns (uint) {
      return buildings.length;
    }

    function createBuilding(uint _propertyID, bool ownershipStructure, uint numberOfUnits) returns (bool sufficient){
      if(msg.sender != landOwner)throw;
      if(ownershipStructure) {
        // createBuilding
        map[key] = buildings.length;
        buildings.push(new building(propertyID,numberOfUnits));
        keys.push(key);
        key++;
        return true;
      } else {
        return false;
      }

    }

    function getBuildingByNumber(uint number) returns (address) {
        return buildings[number];
    }

}


///////////////////////////////////////////////////////////


contract building {
  address public buildingOwner;
  uint public propertyID;
  uint public numberOfUnits; // frontend capture
  bool public success;
  uint public unitID;
//   address[] public uintsArray;
   mapping(uint=>address) units;


  function building(uint _propertyID, uint _numberOfUnits) {
    buildingOwner = msg.sender;
    propertyID = _propertyID;
    numberOfUnits = _numberOfUnits;
    success = true;

    if(numberOfUnits>1){
      for (uint8 i = 0; i < numberOfUnits; i++){
        createUnits(i);
      }
    }
  }
  /*function getAddress() returns (address){
    return buildingOwner;

  }*/

  function createBuilding(uint _propertyID, uint _numberOfUnits) returns (bool success) {
    return success;
  }


  function createUnits(uint unitID) {

    if(msg.sender != buildingOwner)throw;
    // uintsArray.push(new Unit(buildingOwner, unitID));
    units[unitID] = new Unit(buildingOwner, unitID);

  }

  function getUnitById(uint unitID) returns (address){
      return units[unitID];
  }

}

///////////////////////////////////////////////////////////

contract units {
  bool owningLand;
  address public ownerUnit;
  uint propertyID;
  uint unitIdentifyer;  // frontend unit address
  uint priceUnit;       // frontend
  uint sqm;
  uint propertyIdentifyer;

	//event Transfer(address indexed _from, address indexed _to);

  modifier onlyOwner {
    if(msg.sender != ownerUnit) throw;
    _;

  }


	function units(uint i) {
		ownerUnit = msg.sender;
    propertyIdentifyer = i;
	}

  function changeOwner(address newOwner) {
    if (ownerUnit != msg.sender) throw;
    ownerUnit = newOwner;
  }

}