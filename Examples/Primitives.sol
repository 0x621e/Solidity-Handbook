// SPDX-License-Identifier: SEE LICENSE IN LICENSE
// 关于变量类型的一些例子
pragma solidity ^0.8.13;

contract Primitives {
    // 布尔类型
    bool public boo = true;

    /*
    正整数型，可以为0
        uint8范围：0 到 2 ** 8 - 1
        uint16范围：0 到 2 ** 16 - 1
        ...
        uint256范围：0 到 2 ** 256 - 1
    */
    uint8 public u8 = 1;
    uint public u256 = 456;
    uint public u = 123; // uint默认为uint256

    /*
    整数型，可以为负
    int256范围：-2 ** 255 到 2 ** 255 - 1
    int128范围：-2 ** 127 到 2 ** 127 - 1
    */
    int8 public i8 = -1;
    int public i256 = 456;
    int public i = -123; // int默认为int256

    // 最大最小值
    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    // 地址类型
    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    /*
    在Solidity中，字节分为两种：

     - 定长数组
     - 不定长数组
     
    bytes默认为不定长数组，等同于byte[] .
    */
    bytes1 a = 0xb5; //  [10110101]
    bytes1 b = 0x56; //  [01010110]

    // 未赋值变量均有一个初始值
    bool public defaultBoo; // false
    uint public defaultUint; // 0
    int public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
}
