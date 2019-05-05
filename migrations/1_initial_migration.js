// const Migrations = artifacts.require("/Migrations.sol");

// module.exports = function(deployer) {
//   deployer.deploy(Migrations);
// };

const Migrations = artifacts.require('./Migrations.sol');
module.exports = deployer => deployer.deploy(Migrations);