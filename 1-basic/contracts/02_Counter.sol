// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.3;

// 计数器
contract Counter {
    uint256 private count;

    // 获取当前计数
    function get() public view returns (uint256) {
        return count;
    }

    // 加一
    function inc() public {
        count += 1;
    }

    // 减一
    function dec() public {
        count -= 1;
    }
}
