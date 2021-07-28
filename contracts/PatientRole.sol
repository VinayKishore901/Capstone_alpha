pragma solidity ^0.5.0;

 import "./Roles.sol";

 contract PatientRole {
  using Roles for Roles.Role;

   event PatientAdded(address indexed account);
  event PatientRemoved(address indexed account);

   Roles.Role private patients;

   constructor() public {
    _addPatient(msg.sender);
  }

   modifier onlyPatient() {
    require(isPatient(msg.sender));
    _;
  }

   function isPatient(address account) public view returns (bool) {
    return Roles.has(patients, account);
  }

   function addPatient(address account) public onlyPatient {
    _addPatient(account);
  }

   function renouncePatient() public {
    _removePatient(msg.sender);
  }

   function _addPatient(address account) internal {
    Roles.add(patients, account);
    emit PatientAdded(account);
  }

   function _removePatient(address account) internal {
    Roles.remove(patients, account);
    emit PatientRemoved(account);
  }
}