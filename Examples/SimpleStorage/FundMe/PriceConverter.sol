// SPDX-License-Identifier: MIT
// 需要chainlink去中心化预言机提供eth实时价格，将相关功能打包进此库

pragma solidity 0.8.8;

// 需要chainlink去中心化预言机提供eth实时价格
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    // 得到eth当前价格
    function getPrice() internal view returns (uint256) {
        // ABI
        // Rinkeby测试网上的 ETH/USD价格合约地址: 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
        );
        //只需要其中的price数据
        (, int price, , , ) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    // 得到相应eth对应美元的价值
    function getConvertionRate(uint256 ethAmount)
        internal
        view
        returns (uint256)
    {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    // 版本
    function getVersion() internal view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
        );
        return priceFeed.version();
    }
}
