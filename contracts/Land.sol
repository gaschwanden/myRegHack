pragma solidity ^0.4.8;

import "./Building.sol";

contract Land {
  address public landOwner;         // not required on frontend
  bool public ownershipStructure;   // frontend are you freehold owner
  uint public propertyID;           // indentifyer of land -> frontend needs to capture postal address
  uint public key;                  // index for buildings not required on frontend
  address private infoHash;         // external storage address
  uint public sqm;                  // frontend area
  bool public additionalInfo;       // frontend capture addditional information e.g. images, planing overlay
  address[] public buildings;
  /*uint[] public map;*/
  mapping(uint=>uint) map;
  mapping(string=>string) details;
  uint[] public keys;
  uint test;


    function Land(string physicalAddress) {
      landOwner = msg.sender;
      key = 0;
      ownershipStructure = true;
      details['physicalAddress'] = physicalAddress;

    }

    function getNumberOfBuildings() returns (uint) {
      return buildings.length;
    }

    function createBuilding( bool ownershipStructure, uint numberOfUnits) returns (bool sufficient){
      if(msg.sender != landOwner)throw;
      if(ownershipStructure) {
        // createBuilding
        map[key] = buildings.length;
        buildings.push(new Building(numberOfUnits));
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

    function getDetail(string detail) returns (string) {
      return details[detail];
    }

}


