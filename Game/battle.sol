// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "./cardhelper.sol"; 

contract Battle is CardHelper {
    // For some reason, this function seems to pick the value entered first as the winner if the attributes are equal
    // runBattle( 0, 1, 1) will say that 0 is the winner every time even if the attribute value is equal


    function pickRandWinner(uint _cardId0, uint _cardId1) internal view returns (uint winner) {
      uint256 blockValue = uint256(blockhash(block.number-1));
      uint256 lastDigit = blockValue % 10;

      if(lastDigit < 5){
        return _cardId0;
      } else {
        return _cardId1; 
      }

    }

    function NFTbattle(uint _cardId0, uint _cardId1, uint attributeNum) 
    internal view returns (uint winner) {

      if(attributeNum == 1 && cards[_cardId0].attribute1 > cards[_cardId1].attribute1) {
        return _cardId0;
      } else if (attributeNum == 1 && cards[_cardId0].attribute1 < cards[_cardId1].attribute1) {
        return _cardId1; 
      } else if (attributeNum == 1 && cards[_cardId0].attribute1 == cards[_cardId1].attribute1) {
        return pickRandWinner(_cardId0, _cardId1);
      }

      if(attributeNum == 2 && cards[_cardId0].attribute2 > cards[_cardId1].attribute2) {
        return _cardId0;
      } else if (attributeNum == 2 && cards[_cardId0].attribute2 < cards[_cardId1].attribute2) {
        return _cardId1; 
      } else if (attributeNum == 2 && cards[_cardId0].attribute2 == cards[_cardId1].attribute2) {
        return pickRandWinner(_cardId0, _cardId1);
      }

      if(attributeNum == 3 && cards[_cardId0].attribute3 > cards[_cardId1].attribute3) {
        return _cardId0;
      } else if (attributeNum == 3 && cards[_cardId0].attribute3 < cards[_cardId1].attribute3) {
        return _cardId1; 
      } else if (attributeNum == 3 && cards[_cardId0].attribute3 == cards[_cardId1].attribute3) {
        return pickRandWinner(_cardId0, _cardId1);
      }

    }

    function RunBattle(uint _cardId0, uint _cardId1, uint attributeNum) external returns (uint winner) {

      if(NFTbattle(_cardId0, _cardId1, attributeNum) == _cardId0){
        levelUp(_cardId0);
        iterateWins(_cardId0); 
        return _cardId0; 
      } else {
        levelUp(_cardId1);
        iterateWins(_cardId1); 
        return _cardId1; 
      }
    }

}