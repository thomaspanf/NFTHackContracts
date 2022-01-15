// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./Game/globalvariables.sol";


contract CardFactory is Ownable {

    event newCard(uint cardId, string name);

    struct Card {
        string name; 
        uint8 attribute1;
        uint8 attribute2; 
        uint8 attribute3; 
        uint8 skillPoints; 
        uint8 level; 
        uint8 winCount; 

    }

    Card[] public cards;

    mapping (uint => address) public cardToOwner;
    mapping (address => uint) ownerCardCount; 


    function _createCard(string memory _name, uint8 att1, uint8 att2, uint8 att3) internal {
        (att1, att2, att3) = _returnAttributesOfNFT(//need a function to get base NFT data here)
        cards.push(Card(_name, att1, att2, att3, 0, 0, 0)); 
        uint id = cards.length-1;
        cardToOwner[id] = msg.sender;
        emit newCard(id, _name);
    }

    /**
    * @dev Returns attributes based on base NFT data
    */ 
    function _returnAttributesOfNFT(uint _numberOfLikes, uint _lastSalePrice, uint _numberOfSales, uint _daysInWallet, uint _daysInExistence, string _cardOwner) internal returns (uint, uint, uint) { 
      //TO DO: Check incoming variables to ensure they are as expected

      //Apply weightings to base NFT data
      _numberOfLikes = _numberOfLikes/numberOfLikesWeighting; 
      _lastSalePrice = _lastSalePrice/salePriceWeighting; 
      _numberOfSales = _numberOfSales/numberOfSalesWeighting; 
      _daysInWallet = _daysInWallet/daysInWalletWeighting; 
      _daysInExistence = _daysInExistence/daysInExistenceWeighting; 

      //combine Likes, Sale Price annd Number of Sales into a metric for Skill 1
      uint skillOne = _numberOfLikes + _lastSalePrice + _numberOfSales;
      //combine Days In Wallet and Days In Existence into a single metric for Skill 2
      uint skillTwo = _daysInWallet + _daysInExistence; 
      //generate a random number between 1 and maxLevel using the users wallet as the seed for Skill 3
      uint skillThree = _generateRandomNumber(_cardOwner);
      
      returns(skillOne, skillTwo, skillThree); 
    }


    function _generateRandomNumber(string memory _str) private view returns (uint) {
      uint rand = uint(keccak256(abi.encodePacked(_str)));
      return rand % maxLevel;
    }

}