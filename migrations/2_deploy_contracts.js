 
var PharmacistRole = artifacts.require("./PharmacistRole.sol");
var PatientRole = artifacts.require("./PatientRole.sol");
var ManufacturerRole = artifacts.require("./ManufacturerRole.sol");
var DistributorRole = artifacts.require("./DistributorRole.sol");
module.exports = function(deployer) {
  deployer.deploy(PharmacistRole);
  deployer.deploy(ManufacturerRole);
  deployer.deploy(DistributorRole);
};