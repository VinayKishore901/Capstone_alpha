pragma solidity ^0.5.0;

 
import "./Roles.sol";

 
contract DistributorRole {
  using Roles for Roles.Role;
  event DistributorAdded(address indexed account);
  event DistributorRemoved(address indexed account);
  Roles.Role private distributors;
  constructor() public {
    _addDistributor(msg.sender);
  }
  modifier onlyDistributor() {
    require(isDistributor(msg.sender));
    _;
  }
  function isDistributor(address account) public view returns (bool) {
    return Roles.has(distributors, account);
  }
  function addDistributor(address account) public onlyDistributor {
    _addDistributor(account);
  }
  function renounceDistributor() public {
    _removeDistributor(msg.sender);
  }
  function _addDistributor(address account) internal {
    Roles.add(distributors, account);
    emit DistributorAdded(account);
  }
  function _removeDistributor(address account) internal {
    Roles.remove(distributors, account);
    emit DistributorRemoved(account);
  }
}