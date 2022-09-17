// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract receiveEther {

    event receivedEth(uint amount);

    receive() external payable {}

    fallback() external payable {}

    function IreceiveEther() external payable {
        emit receivedEth(msg.value);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract sendEther {

    constructor() payable {} 

    function IsendEther(address payable _to, uint _amount) external {
        _to.transfer(_amount);
    }

    function IsendToIreceiveEther(address payable _to, uint _amount) external {

        (bool success, ) = _to.call{value: _amount}(abi.encodeWithSignature(
            "IreceiveEther()"
        ));
        require(success, "payment reverted");
    }

    function IsendToNotExist(address payable _to, uint _amount) external {
        (bool success, ) = _to.call{value: _amount}(abi.encodeWithSignature(
            "NotExist()"
        ));
        require(success, "payment reverted");
    }
}
