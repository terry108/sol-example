// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract testABIEncode {
    uint256 public storedData;
    bytes public abiEncode;
    bytes public encodePacked;
    bytes public encodeWithSelector;
    bytes public encodeWithSignature;

    function set(uint256 store) public {
        storedData = store;
    }

    function encode() public {
        abiEncode = abi.encode(storedData);
        encodePacked = abi.encodePacked(storedData);
        encodeWithSelector = abi.encodeWithSelector(
            bytes4(keccak256("set(uint256)")),
            storedData
        );
        encodeWithSignature = abi.encodeWithSignature(
            "set(uint256)",
            storedData
        );
    }
}

contract encodeDifference {
    function diff(uint8 _num1)
        public
        pure
        returns (bytes memory, bytes memory)
    {
        return (abi.encode(_num1), abi.encodePacked(_num1));
    }
}

contract MyContract {
    function function1() public {}

    function getBalance(address _address) public view returns (uint256) {}

    function getValue(uint256 _value) public pure returns (uint256) {
        return _value;
    }
}

contract MyTest {
    MyContract mc = new MyContract();

    function getSelector() view public returns (bytes4,bytes4) {
        return (
            mc.function1.selector,
            mc.getBalance.selector
        );
    } 

    function callValue(uint256 _x) public view returns (uint256) {
        bytes4 selector = mc.getValue.selector;
        bytes memory data = abi.encodeWithSelector(selector, _x);
        (bool success,bytes memory rs)=address(mc).staticcall(data);
        require(success);

        return abi.decode(rs,(uint256));
    }
}