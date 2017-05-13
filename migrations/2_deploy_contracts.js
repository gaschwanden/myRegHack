var ConvertLib = artifacts.require("./ConvertLib.sol");
var MetaCoin = artifacts.require("./MetaCoin.sol");
var LandRegistry = artifacts.require("./LandRegistry.sol");
var Land = artifacts.require("./Land.sol");
// var Building = artifacts.require("./Building.sol");
// var Unit = artifacts.require("./Unit.sol");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, MetaCoin);
  deployer.deploy(LandRegistry);
  deployer.deploy(Land);
  // deployer.deploy(Building);
  // deployer.deploy(Unit);
};
