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


    function createCard(string memory _name, uint _att1, uint _att2) external {
        cards.push(Card(_name, 0, 0, 0, 0, 1, 0));
        uint id = cards.length-1;
        cardToOwner[id] = msg.sender;
        setAttributes(id, _att1, _att2);
        emit newCard(id, _name);
    }

    function iterateWins(uint _cardId) internal{
        cards[_cardId].winCount++; 
    }

    // attributes are capped at 10 levels, but I can probably have them set to 1000
    // and divide by 100 for rouding and scope concerns. This current implementation won't
    // work if we want the levels to be capped at 10. 

    function setAttributes(
    uint _cardId, 
    uint _att1, 
    uint _att2
    ) internal { 

      cards[_cardId].attribute1 = _att1;
      cards[_cardId].attribute2 = _att2;
      cards[_cardId].attribute3 = uint(keccak256(abi.encode(_cardId)))%10; 
      
    }

}