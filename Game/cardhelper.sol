// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "./cardfactory.sol"; 


contract CardHelper is CardFactory {

    modifier onlyOwnerOf(uint _cardId) {
        require (msg.sender == cardToOwner[_cardId]);
        _;
    }

    function iterateLevels(uint _cardId) internal {
      cards[_cardId].level++; 
      cards[_cardId].skillPoints++; 
      cards[_cardId].winCount = 0; 
    }

    function levelUp(uint _cardId) external onlyOwnerOf(_cardId) {
        require (cards[_cardId].level < 10, "you've reached the max level!");
            if(cards[_cardId].level == 1 && cards[_cardId].winCount >= 1) iterateLevels(_cardId); 
            if(cards[_cardId].level == 2 && cards[_cardId].winCount >= 2) iterateLevels(_cardId);
            if(cards[_cardId].level == 3 && cards[_cardId].winCount >= 3) iterateLevels(_cardId);
            if(cards[_cardId].level == 4 && cards[_cardId].winCount >= 4) iterateLevels(_cardId);   
            if(cards[_cardId].level == 5 && cards[_cardId].winCount >= 6) iterateLevels(_cardId);
            if(cards[_cardId].level == 6 && cards[_cardId].winCount >= 8) iterateLevels(_cardId);
            if(cards[_cardId].level == 7 && cards[_cardId].winCount >= 11) iterateLevels(_cardId);    
            if(cards[_cardId].level == 8 && cards[_cardId].winCount >= 15) iterateLevels(_cardId);  
            if(cards[_cardId].level == 9 && cards[_cardId].winCount >= 20) iterateLevels(_cardId);  
    }

    ///external call allows users to select which attribute they want to level up if they have a skill point
    function levelUpAttri(uint _cardId, uint _attrNum) external onlyOwnerOf(_cardId) {
        require (cards[_cardId].skillPoints >= 1 , "not enough skillpoints to level!");
        require (_attrNum == 1 || _attrNum == 2 || _attrNum == 3, "invalid attribute"); 
            if(_attrNum == 1) cards[_cardId].attribute1++; 
            if(_attrNum == 2) cards[_cardId].attribute1++; 
            if(_attrNum == 3) cards[_cardId].attribute1++; 
        cards[_cardId].skillPoints--; 
    }   
    
    ///retun list of cards owned by certain address 
    function getCardsByOwner(address _owner) external view returns(uint[] memory) {
        uint[] memory result = new uint[](ownerCardCount[_owner]);
        uint counter = 0;
        for (uint i = 0; i < cards.length; i++){
            if (cardToOwner[i] == _owner) {
                result[counter] = i; 
                counter++;
            }
        }
        return result; 
    }


}