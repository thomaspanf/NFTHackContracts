// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "./cardhelper.sol"; 

contract Battle is CardHelper {

    function flipWinner(uint256 _probability) internal view returns (bool) {
      uint256 blockValue = uint256(blockhash(block.number-1));
      uint256 lastDigit = blockValue % 10;

      bool result = true; 

      for (uint i = 0; i < _probability; i++){
        if (lastDigit == i) {
          result = false;
        } 
      }
      return result;
    }

    function NFTbattle(uint _cardId0, uint _cardId1, uint attributeNum) 
    external view returns (uint winner) {

      if(attributeNum == 1){
        if(cards[_cardId0].attribute1 > cards[_cardId1].attribute1){
          return flipWinner(3) ? _cardId0 : _cardId1;
        }
      }
      else if(attributeNum == 2){
        if(cards[_cardId0].attribute2 > cards[_cardId1].attribute2){
          return flipWinner(3) ? _cardId0 : _cardId1;
        }
      }
      else if(attributeNum == 3){
        if(cards[_cardId0].attribute3 > cards[_cardId1].attribute3){
          return flipWinner(3) ? _cardId0 : _cardId1;
        }
      } else return _cardId0; 
    }
}