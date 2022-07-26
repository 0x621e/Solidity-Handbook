// SPDX-License-Identifier: MIT
// 用户可以发送eth到FundMe，并设定发送eth最小额度，以美元计价
// 有提取功能withdraw

pragma solidity 0.8.8;

// 需要chainlink去中心化预言机提供eth实时价格
import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;
    uint256 public minimumUSD = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    // public任何人都可以调取，payable可以接受eth，激活msg.value和call.value
    function fund() public payable {
        // require进行判断，如果条件不满足，require之后的代码不会执行，不扣gas；require之前的代码也会恢复初始条件，扣gas
        // msg.value为eth数量，将其转换为usd价格
        require(
            msg.value.getConvertionRate() >= minimumUSD,
            "Didn't send enough!"
        );
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }
}
