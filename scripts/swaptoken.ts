import { ethers } from "hardhat";

import {SwapToken} from "../typechain/SwapToken"

async function SwapTokenS() {
  
  let owner = "0x21891a1eb8001df6df0d3bf04aae621b13b444d6";
  let to = "0x1fac8c73a4aa68a79223b18598483c3535c232f6";
  let amounttoTransfer = 20;
  let firstTokenAddr = "0x111111111117dC0aa78b770fA6A738034120C302";
  let secondTokenAddr = "0x7Fc66500c84A76Ad7e9c93437bFc5Ac33E2DDaE9";
    const executeSwap = (await ethers.getContractAt(
      "IswapToken",
     " 0x4bf010f1b9beda5450a8dd702ed602a104ff65ee"
    )) as SwapToken;

    // address _owner,address _to,uint amount, address _firstTokenAddress,address secondTokenAddr
   await  executeSwap.executeswapToken(
      owner,
      to,
      amounttoTransfer,
      firstTokenAddr,
      secondTokenAddr
    );

   

  




}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
SwapTokenS().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
