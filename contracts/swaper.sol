//SPDX-License_identifier:MIT;

pragma solidity ^0.8.4;

import "./IAggregate.sol";
import "./Ierc.sol";

contract swapToken{

 AggregatorV3Interface internal priceFeed;
  AggregatorV3Interface internal priceFeed2;

  IERC20 fromToken;
  IERC20 toToken;


    constructor() {
        //1INCH
        priceFeed = AggregatorV3Interface(0xc929ad75B72593967DE83E7F7Cda0493458261D9);
        //AAVE
        priceFeed2 = AggregatorV3Interface(0x547a514d5e3769680Ce22B2361c10Ea13619e8a9);
        
    }

     function getLatestPrice() public view returns (int) {
        (
            /*uint80 roundID*/,
            int price,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeed.latestRoundData();
        return price;
    }

     function getLatestPrice1() public view returns (int) {
        (
            /*uint80 roundID*/,
            int price,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeed2.latestRoundData();
        return price;
    }



function executeswapToken(address _owner,address _to,uint amount, address _firstTokenAddress,address secondTokenAddr)public {
   //1INCH
    uint256 price1 = uint(getLatestPrice());
     uint256 price2 = uint(getLatestPrice1());
    uint256 ammountTotransfer = uint(price1/price2);
    fromToken = IERC20(_firstTokenAddress);
    toToken = IERC20(secondTokenAddr);
    fromToken.transferFrom(_owner, _to, amount);
    toToken.transferFrom(_to, _owner,ammountTotransfer);
    



}


    

  


}