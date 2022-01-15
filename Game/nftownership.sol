// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./cardhelper.sol"; 

contract NFTOwnership is CardHelper, ERC721 {

    constructor() ERC721("BattleNFT", "BNFT") {} 

    mapping (uint => address) tradeApproval;

    function balanceOf(address _owner) override external view returns (uint256) {
        return ownerCardCount[_owner];
    }



}