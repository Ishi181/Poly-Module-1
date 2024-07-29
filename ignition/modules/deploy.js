const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("deploy", (m) => {
  const dep = m.contract("MyNFT", []);

  return { dep };
});