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

    function NFTbattle(Card memory _card1, Card memory _card2, uint attributeNum) 
    external view returns (Card memory winner) {

      if(attributeNum == 1){
        if(_card1.attribute1 > _card2.attribute1){
          return flipWinner(3) ? _card1 : _card2;
        }
      }
      else if(attributeNum == 2){
        if(_card1.attribute2 > _card2.attribute2){
          return flipWinner(3) ? _card1 : _card2;
        }
      }
      else if(attributeNum == 3){
        if(_card1.attribute3 > _card2.attribute3){
          return flipWinner(3) ? _card1 : _card2;
        }
      } else return _card1; 
    }
}