// SPDX-License-Identifier: MIT
// 一个存储uint256 number和array people的简单合约
pragma solidity 0.8.8;

contract SimpleStorage {
    // 声明number和people，public关键词会自动生成getter函数，部署之后可以直接调用number和people的值
    uint256 number;
    People[] public people;

    // name到number的映射，可以根据name查询number
    mapping(string => uint256) public nameToNumber;

    // 声明People结构体
    struct People {
        string name;
        uint256 number;
    }

    // storeNumber函数将_number赋值给number
    // public关键词：内部外部均可调用storeNumber函数，下方的storePeople同理
    // 关于函数可见性的关键词：public内部外部均可调用；external只能从外部调用，内部可使用this.f()调用
    // internal只能从内部调用，继承合约可以调用
    // private只能从内部调用，继承合约不可以调用
    // 因为ExtraStorage合约要改写storeNumber()函数，所以要加virtual关键词
    function storeNumber(uint256 _number) public virtual {
        number = _number;
    }

    function retrieve() public view returns (uint256) {
        return number;
    }

    // storagePeople函数赋值给结构体People，并添加到数组people中
    // 将_number添加到对应_name的映射中
    // memory关键词：string _name只在调用函数赋值时使用，存在内存中，不上链，gas低，可修改
    // 关于数据的存储位置另外常用的还有storage和calldata：
    // storage，合约中的全局状态变量默认是storage，存储在链上，gas高，例如uint256 public number
    // calldata，与memory类似，存在内存中，不上链，gas低，不同点在于calldata后续不可修改
    // 数组/结构体/映射这三类变量必须声明存储位置，string在solidity中看作bytes的数组，uint等不需要，这就是为什么uint256 _number没有声明
    function storePeople(string memory _name, uint256 _number) public {
        people.push(People(_name, _number));
        nameToNumber[_name] = _number;
    }
}
