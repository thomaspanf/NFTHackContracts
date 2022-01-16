// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "./cardfactory.sol"; 


contract CardHelper is CardFactory {

    modifier onlyOwnerOf(uint _cardId) {
        require (msg.sender == cardToOwner[_cardId]);
        _;
    }

    function iterateLevels(uint _cardId, uint8 _expCost) internal {
      cards[_cardId].level++; 
      cards[_cardId].skillPoints++; 
      cards[_cardId].winCount -= _expCost; 
    }

    function levelUp(uint _cardId) external onlyOwnerOf(_cardId) {
        require (cards[_cardId].level < 10, "you've reached the max level!");
            uint level = cards[_cardId].level;
            uint8 winCount = cards[_cardId].winCount; 

            if(level == 1 && winCount >= 1) iterateLevels(_cardId, 1); 
            if(level == 2 && winCount >= 2) iterateLevels(_cardId, 2);
            if(level == 3 && winCount >= 3) iterateLevels(_cardId, 3);
            if(level == 4 && winCount >= 3) iterateLevels(_cardId, 3);   
            if(level == 5 && winCount >= 3) iterateLevels(_cardId, 3);
            if(level == 6 && winCount >= 3) iterateLevels(_cardId, 3);
            if(level == 7 && winCount >= 4) iterateLevels(_cardId, 4);    
            if(level == 8 && winCount >= 4) iterateLevels(_cardId, 4);      
            if(level == 9 && winCount >= 5) iterateLevels(_cardId, 5);  
    }

    function levelUpAttri(uint _cardId, uint _attrNum) external onlyOwnerOf(_cardId) {
        require (cards[_cardId].skillPoints >= 1 , "not enough skillpoints to level!");
        require (_attrNum == 1 || _attrNum == 2 || _attrNum == 3, "invalid attribute"); 
            if(_attrNum == 1) cards[_cardId].attribute1++; 
            if(_attrNum == 2) cards[_cardId].attribute2++; 
            if(_attrNum == 3) cards[_cardId].attribute3++; 
        cards[_cardId].skillPoints--; 
    }   
    
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