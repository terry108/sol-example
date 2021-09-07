// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

// Variables are declared as either storage, memory or calldata to explicitly specify the location of the data.

// storage - variable is a state variable (store on blockchain)
// memory - variable is in memory and it exists while a function is being called
// calldata - special data location that contains function arguments, only available for external functions
// 1. memory ： (内存) 即数据在内存中，因此数据仅在其生命周期内（函数调用期间）有效。
// 2. storage：（链上存储空间），就是状态变量保存的位置，只要合约存在就一直存储．
// 3. calldata：（调用数据），一个特殊只读数据位置，用来保存函数调用参数（之前仅针对外部函数）。

contract DataLocations {
    uint[] public arr;
    mapping(uint => address) map;
    struct MyStruct {
        uint foo;
    }
    mapping(uint => MyStruct) myStructs;

    function f() public {
        // call _f with state variables
        _f(arr, map, myStructs[1]);

        // get a struct from a mapping
        MyStruct storage myStruct = myStructs[1];
        // create a struct in memory
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(
        uint[] storage _arr,
        mapping(uint => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        // do something with storage variables
    }

    // You can return memory variables
    function g(uint[] memory _arr) public returns (uint[] memory) {
        // do something with memory array
    }

    function h(uint[] calldata _arr) external {
        // do something with calldata array
    }
}
