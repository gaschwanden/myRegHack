pragma solidity ^0.4.2;

import "./ConvertLib.sol";

// This is just a simple example of a coin-like contract.
// It is not standards compatible and cannot be expected to talk to other
// coin/token contracts. If you want to create a standards-compliant
// token, see: https://github.com/ConsenSys/Tokens. Cheers!

contract Unit {
	mapping (string => address) agreement;
    uint id;
    mapping (string => string) attributes;
    struct Attrubutes {
        string floor;
        string no_bedroom;
        string no_bathroom;
    }

    event Transfer(address indexed _from, address indexed _to);

	function Unit(address owner, uint unitId) {
		agreement['owner'] = owner;
        id = unitId;
	}

    function changeOwner(address newOwner) returns(bool result) {
        if (agreement['owner'] != msg.sender) throw;
        agreement['owner'] = newOwner;
        Transfer(agreement['owner'], newOwner);
        return true;
    }


    function getOwner() returns (address owner) {
        return agreement['owner'];
    }

    function getId() returns (uint id) {
        return id;
    }

    function getAttribute(string attribute) returns(string) {
        return attributes[attribute];
    }

    function setAttribute(string attribute, string value) returns(bool) {
        if (msg.sender == agreement['owner']) {
            attributes[attribute] = value;
            return true;
        }
        return false;
    }
}
