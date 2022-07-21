// SPDX-License-Identifier: MIT
// 用于部署多个SimpleStorage合约的工厂合约
pragma solidity 0.8.8;

// 引入SimpleStorage合约，便于工厂合约部署
import "./SimpleStorage.sol";

contract StorageFactory {
    // 声明SimpleStorage类型的合约数组
    SimpleStorage[] public simpleStorageArray;

    // 创建合约
    function createSimpleStorageContract() public {
        // new关键词用来创建函数
        SimpleStorage simpleStorage = new SimpleStorage();
        // 将新创建的simpleStorage合约添加到数组中
        simpleStorageArray.push(simpleStorage);
    }

    // 从一个合约调用另一合约需要两个条件：1）合约地址address，2）ABI
    // 传入1）需要调取的合约在数组中的编号，2）传入需要存储的数字
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber)
        public
    {
        // 通过对象.functionName来调取另一合约函数
        simpleStorageArray[_simpleStorageIndex].storeNumber(
            _simpleStorageNumber
        );
    }

    // 需要调取SimpleStorage中的retrieve()函数
    // 传入需要调取的合约在数组中的编号
    function sfRetrieve(uint256 _simpleStorageIndex)
        public
        view
        returns (uint256)
    {
        // 通过对象.functionName来调取另一合约函数
        return simpleStorageArray[_simpleStorageIndex].retrieve();
    }
}
