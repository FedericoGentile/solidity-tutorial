# Dependencies

## Install node.js
Node.js is an open-source, cross-platform, back-end JavaScript runtime environment that runs on the V8 engine and executes JavaScript code outside a web browser. 

Download from this link: [https://nodejs.org](https://nodejs.org)

## Install Ganache
Ethereum Ganache is a local in-memory blockchain designed for development and testing. It simulates the features of a real Ethereum network, including the availability of a number of accounts funded with test Ether. 

Download from this link: [https://www.trufflesuite.com/ganache](https://www.trufflesuite.com/ganache)

## Install Truffle
Truffle is a development environment, testing framework and asset pipeline for Ethereum, aiming to make life as an Ethereum developer easier.

Type in terminal:
```sh
npm install -g truffle
```

## Install Metamask
MetaMask is a software cryptocurrency wallet used to interact with the Ethereum blockchain. It allows users to access their Ethereum wallet through a browser extension or mobile app, which can then be used to interact with decentralized applications.

Download from this link: [https://metamask.io/download.html](https://metamask.io/download.html)

# Set up a project
## Create folder structure
In your desired folder type in the terminal:
```sh
truffle init
```
The following folders and files will be created:
- contracts
- migrations
- test
- truffle-config.js

## Configure truffle
Open Ganache and copy the *RPC SERVER* information and paste it into the truffle-config.js file:
```js
development: {
    host: "HTTP://127.0.0.1", // Localhost (default: none)
    port: 7545,               // Standard Ethereum port (default: none)
    network_id: "*",          // Any network (default: none)
},
```

Update also which solidity version is going to be compiled. In the same configuration file replace for example:
```js
// Configure your compilers
  compilers: {
    solc: {
       version: "0.8.0",    // Fetch exact version from solc-bin (default: truffle's version)
      // docker: true,        // Use "0.5.1" you've installed locally with docker (default: false)
      // settings: {          // See the solidity docs for advice about optimization and evmVersion
      //  optimizer: {
      //    enabled: false,
      //    runs: 200
      //  },
      //  evmVersion: "byzantium"
      // }
    }
  },
  ```



# Create a new contract
In the contract folder create a solidity contract for example: *MyContract.sol*

Open the file and initiate the contract for example:
```js
pragma solidity ^0.8.0;

contract MyContract {

}
```

# Deploy the contract
To deploy the contract on the Ethereum blockchain, go to migrations and create a new file and name it *2_deploy_contracts.js*. Open it and add the following lines of code:
```js
const MyContract = artifacts.require("MyContract.sol");

module.exports = function (deployer) {
  deployer.deploy(MyContract);
};
```

Finally type in the terminal:
```sh
truffle migrate
```

Notice that deploying a contract costs some ETH (*gas used* x *gas price*).

# Interact with the contract
Start the truffle console by typing in the terminal:
```sh
truffle console
```
Load the contract with the following command:
```sh
MyContract.deployed().then(function(i) { contract=i; })
```
Access the contract's attributes by typing in the console:
```sh
contract.attribute
```