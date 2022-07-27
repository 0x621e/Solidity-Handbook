// SPDX-License-Identifier: SEE LICENSE IN LICENSE
// 计数函数，可以进行加一和减一操作

pragma solidity ^0.8.13;

contract Counter {
    uint256 public count;

    // 读取当前数字，不上链，不计算，view关键词
    function get() public view returns (uint256) {
        return count;
    }

    // 加一
    function inc() public {
        count += 1;
    }

    // 减一
    function dec() public {
        // 因为count不可为负值，所以当count=0时会报错
        count -= 1;
    }
}
