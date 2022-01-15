// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "@openzeppelin/contracts/access/Ownable.sol";
// import "./globalvariables.sol";


contract CardFactory is Ownable {

    event newCard(uint cardId, string name);

    struct Card {
        string name; 
        uint attribute1;
        uint attribute2; 
        uint attribute3; 
        uint8 skillPoints; 
        uint8 level; 
        uint8 winCount; 
    }

    Card[] public cards;

    mapping (uint => address) public cardToOwner;
    mapping (address => uint) ownerCardCount; 


    function createCard(string memory _name) external {
        // (att1, att2, att3) = _returnAttributesOfNFT; //need a function to get base NFT data here)
        cards.push(Card(_name, 0, 0, 0, 0, 0, 0));
        uint id = cards.length-1;
        cardToOwner[id] = msg.sender;
        emit newCard(id, _name);
    }



    //TODO change return value to null and have this be a setter instead
    // attributes are capped at 10 levels, but I can probably have them set to 1000
    // and divide by 100 for rouding and scope concerns. This current implementation does not work

    function setAttributes(
    uint _cardId, 
    uint _lastSalePrice, 
    uint _numberOfSales, 
    uint _daysInWallet, 
    uint _daysInExistence
    ) external { 

      //Apply weightings to base NFT data
      _lastSalePrice = _lastSalePrice/2; 
      _daysInExistence = _daysInExistence/2; 

      cards[_cardId].attribute1 = _lastSalePrice + _numberOfSales;
      cards[_cardId].attribute2 = _daysInWallet + _daysInExistence; 
      cards[_cardId].attribute3 = _generateRandomNumber(_cardId);
      
    }

    function _generateRandomNumber(uint _cardId) private pure returns (uint) {
      uint rand = uint(keccak256(abi.encodePacked(_cardId)));
      return rand % 10;
    }
}