// SPDX-License-Identifier: MIT
// 继承SimpleStorage合约并且改写其中的storeNumber()函数
pragma solidity 0.8.8;

// 引入SimpleStorage合约，便于继承
import "./SimpleStorage.sol";

// is关键词用于继承合约声明母合约
contract ExtraStorage is SimpleStorage {
    // 改写的函数需要用override关键词
    function storeNumber(uint256 _number) public override {
        number = _number + 5;
    }
}
