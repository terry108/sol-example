// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/HelloWorld.sol";

contract TestHelloWorld {
    function testName() public {
        HelloWorld hello = new HelloWorld();
        string memory expected = "terry";
        hello.setName(expected);
        Assert.equal(hello.getName(), expected, "someoneGreet should be terry");
    }
}
