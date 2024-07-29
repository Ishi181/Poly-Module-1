require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  networks: {
    sepolia: {
      url: "https://sepolia.infura.io/v3/29d5db0b28f24ebe826ce574035ffe71",
      chainId: 11155111,
      accounts: ["PRIVATE_KEY"]
    },
    polygon_amoy: {
      url: "https://rpc-amoy.polygon.technology/",
      chainId: 80002,
      accounts: ["PRIVATE_KEY"]
    }
  }
};
