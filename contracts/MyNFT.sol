// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721Enumerable, Ownable {

    string[] private promptDescription;
    string public baseUrl = "ipfs://bafybeidmme6am4y47ikr6keqr3cwh4q7psjnquiu3sieeuxe5rhpefszwm/";

    constructor() ERC721("Ishi Singla", "I S") {
        promptDescription = ["birds on the tree",
                                "fish in sea ",
                                "crabs in pan",
                                "watch on the wall" , 
                                "pillow on the bed"];
        for (uint256 i = 0; i < promptDescription.length; i++) {
            _mint(msg.sender, i + 1);
        }
    }

    function mint(uint256 quantity) external payable onlyOwner {
        require(quantity > 0, "Quantity must be greater than zero");
        require(totalSupply() + quantity <= 100, "Maximum NFT supply reached");

        uint256 newTokenId;
        for (uint256 i = 0; i < quantity; i++) {
            newTokenId = totalSupply() + 1;
            _mint(msg.sender, newTokenId);
        }
    }

    function _baseURI() internal view override returns (string memory) {
        return baseUrl;
    }

    function getPromptDescriptions() external view returns (string[] memory) {
        return promptDescription;
    }

    function addPromptDescription(string memory newDescription) external onlyOwner {
        promptDescription.push(newDescription);
    }

    function updateBaseUrl(string memory newBaseUrl) external onlyOwner {
        baseUrl = newBaseUrl;
    }
}
