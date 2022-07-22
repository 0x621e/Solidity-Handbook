// SPDX-License-Identifier: MIT
// 用户可以发送eth到FundMe，并设定发送eth最小额度，以美元计价
// 有提取功能withdraw

pragma solidity 0.8.8;

contract FundMe {
    uint256 public minimumUSD = 50;

    // public任何人都可以调取，payable可以接受eth，激活msg.value和call.value
    function fund() public payable {
        // require进行判断，如果条件不满足，require之后的代码不会执行，不扣gas；require之前的代码也会恢复初始条件，扣gas
        require(msg.value > minimumUSD, "Didn't send enough!");
    }
}
