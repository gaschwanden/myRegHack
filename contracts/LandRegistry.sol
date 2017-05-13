pragma solidity ^0.4.8;

import "./Land.sol";

contract LandRegistry {
    mapping(address=>address) registry;

    function LandRegistry() {
    }

    function registerLand(address owner, string physicalAddress) returns (bool) {
        registry[owner] = new Land(physicalAddress);
    }

    function getLandByOwner(address owner) returns(address) {
        return registry[owner];
    }
}


