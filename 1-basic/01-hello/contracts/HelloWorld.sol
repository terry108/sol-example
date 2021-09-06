// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.3 and less than 0.8.0
pragma solidity ^0.8.0;

contract HelloWorld {
    string public greet = "Hello World!";
    string _name;
    uint256 number;

    function setName(string memory name) public {
        _name = name;
    }

    function getName() public view returns (string memory name) {
        return _name;
    }
    
    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public {
        number = num;
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }
}