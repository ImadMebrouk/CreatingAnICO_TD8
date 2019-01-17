var ERC20 = artifacts.require("./ScratchToken.sol");


module.exports = function(deployer) {
  deployer.deploy(ERC20);
};
