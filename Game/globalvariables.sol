// // SPDX-License-Identifier: MIT

// pragma solidity ^0.8.11;

// uint16 maxLevel = 10; 

// //Set a cap on incoming NFT stats
// uint maxNFTLikes = 4000; 
// uint maxNFTSalePrice = 100; //Assuming this is denominated ETH
// uint maxNFTNumberOfSales = 20; 
// uint maxNFTDaysInWallet = 365; 
// uint maxNFTDaysInExistence = 365; 

// /**
// * Opptionally apply a weighting to each stat
// * @dev The base stat is divided by this number. 1 = no penalty. 2 = 50% penalty. 
// * To Do: Allow for decimals, eg. 1.1
// */
// uint8 numberOfLikesWeighting = 1; 
// uint8 salePriceWeighting = 2; //50% penalty
// uint8 numberOfSalesWeighting = 1; 
// uint8 daysInWalletWeighting = 1; 
// uint8 daysInExistenceWeighting = 2; //50% penalty

// /**
// * Normalise all above caps so they equal 100 and we can combine them for an equally weighted total
// * To Do: dynamically normalise rather than relying on hard coded data
// */

// maxNFTLikes = maxNFTLikes/40; 
// maxNFTSalePrice = maxNFTSalePrice; 
// maxNFTNumberOfSales = maxNFTNumberOfSales*5; 
// maxNFTDaysInWallet = maxNFTDaysInWallet/3.65; 
// maxNFTDaysInExistence = maxNFTDaysInExistence/3.65; 

// /**
// * Apply weightings to each cap. This gives us the ability to tweak the attributes to ensure balanced gameplay
// */
// maxNFTLikes = maxNFTLikes/numberOfLikesWeighting; 
// maxNFTSalePrice = maxNFTSalePrice/salePriceWeighting; 
// maxNFTNumberOfSales = maxNFTNumberOfSales/numberOfSalesWeighting; 
// maxNFTDaysInWallet = maxNFTDaysInWallet/daysInWalletWeighting; 
// maxNFTDaysInExistence = maxNFTDaysInExistence/daysInExistenceWeighting; 