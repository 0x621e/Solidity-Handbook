// SPDX-License-Identifier: SEE LICENSE IN LICENSE
// 关于变量的三个作用域
pragma solidity ^0.8.13;

contract Variables {
    // 局部变量，在函数外部声明，存在链上
    string public stateText = "hello";
    uint256 public stateNum = 123;

    // 全局变量，固有语法，不管函数内外直接调用
    address sender = msg.sender;

    function localVariable() {
        // 本地变量，在函数内部声明，不存在链上
        uint256 localVariable = 1;

        // 全局变量，固有语法，不管函数内外直接调用
        uint256 timestamp = block.timestamp;
    }
}
