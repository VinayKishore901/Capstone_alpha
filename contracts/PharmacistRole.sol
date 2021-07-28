pragma solidity ^0.5.0;

 
import "./Roles.sol";

 
contract PharmacistRole {
  using Roles for Roles.Role;

   
  event PharmacistAdded(address indexed account);
  event PharmacistRemoved(address indexed account);

   Roles.Role private pharmacists;
   constructor() public {
    _addPharmacist(msg.sender);
  }

   modifier onlyPharmacist() {
    require(isPharmacist(msg.sender));
    _;
  }

   function isPharmacist(address account) public view returns (bool) {
    return Roles.has(pharmacists, account);
  }

   function addPharmacist(address account) public onlyPharmacist {
    _addPharmacist(account);
  }

   function renouncePharmacist() public {
    _removePharmacist(msg.sender);
  }

   function _addPharmacist(address account) internal {
    Roles.add(pharmacists, account);
    emit PharmacistAdded(account);
  }

   function _removePharmacist(address account) internal {
    Roles.remove(pharmacists, account);
    emit PharmacistRemoved(account);
  }
}