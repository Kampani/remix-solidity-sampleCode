// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract visibilityTest { 
    uint public x;
    function setX(uint _x) external {
        x = _x;
    }

    function getX() public view returns (uint) {
        return x;
    }
}

contract tryAccess {
    // This contract will try to access and modify the private state variable x in contract visibilityTest

    function accessX(address _testContract) external view returns (uint) {
        return visibilityTest(_testContract).getX();
    }

    function modifyX(address _testContract, uint _x) external {
        visibilityTest(_testContract).setX(_x);
    }
}
