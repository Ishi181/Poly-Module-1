# METACRAFTERS-POLY_Module1
## BRIDGING OF THE ASSETS BTW ONE CHAIN AND OTHER 

# Getting Started

## Discription

1. Clone the repository by : `git clone https://github.com/punks783/Polygon_module_1.git` .
2. `cd Polygon_module_1`.
3. run `npm install`.
4. next check the `hardhat.config.js` file and make necessary changes and also check `contracts/MyNFTS.sol` file .
5. run : `npx hardhat run scripts/deploy.js --network sepolia` to deploy the smart contract on the ETH testnet.
6. run : `node scripts/batchmint.js` . to mint 5 NFTS at one go !
7. run : `npx hardhat run scripts/batchtransfer.js --network sepolia` to send nfts to the Fx portal and => Matic testnet chain and at end we get our balance also !.

## MyNFT Smart Contract Explanation : 

This is a Solidity smart contract for creating and managing Non-Fungible Tokens (NFTs) using the ERC721 standard. The contract extends the ERC721Enumerable contract from the OpenZeppelin library to provide additional functionalities. The contract allows the owner to mint new NFTs with unique token IDs and provides functions for querying and managing the NFTs.

## Program Explanation

### mint: Allows the owner to mint a specified quantity of new NFTs, ensuring the total supply does not exceed 100.
```
function mint(uint256 quantity) external payable onlyOwner {
    require(quantity > 0, "Quantity must be greater than zero");
    require(totalSupply() + quantity <= 100, "Maximum NFT supply reached");

    uint256 newTokenId;
    for (uint256 i = 0; i < quantity; i++) {
        newTokenId = totalSupply() + 1;
        _mint(msg.sender, newTokenId);
    }
}
```

### _baseURI: Internal function that returns the base URL for the metadata.
```
function _baseURI() internal view override returns (string memory) {
    return baseUrl;
}
```

### getPromptDescriptions: Public function to retrieve the prompt descriptions.
```
function getPromptDescriptions() external view returns (string[] memory) {
    return promptDescription;
}
```

### addPromptDescription: Allows the owner to add a new prompt description.
```
function addPromptDescription(string memory newDescription) external onlyOwner {
    promptDescription.push(newDescription);
}
```

### updateBaseUrl: Allows the owner to update the base URL for the metadata.
```
function updateBaseUrl(string memory newBaseUrl) external onlyOwner {
    baseUrl = newBaseUrl;
}
```

## Executing Program

## Environment
This code we are running on the online Solidity IDE that is https://remix.ethereum.org/ here we'll perform the code. as we are on the remix website just by clicking on the start coding we'll able to do coding in Solidity.

```
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
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the ("Compile "the name of the file" ") for ex. comple first.sol button. Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "MyNFT.sol" contract from the dropdown menu, and then click on the "Deploy" button. then u can see a the below of the option ' Deployed/Unpinned Contracts ' expand it and balances mint burn etc and now u can see our code is ready to run 

# AUTHORS
* Contributed by name : Ishi Singla
* Email ID : ishisingla181@gmail.com

# LICENSE
This project is licensed under the MIT License - see the LICENSE.md file for details.

