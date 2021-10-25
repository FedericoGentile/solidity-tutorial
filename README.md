# Table of Contents
- [Table of Contents](#table-of-contents)
- [Dependencies](#dependencies)
  - [Install node.js](#install-nodejs)
  - [Install Ganache](#install-ganache)
  - [Install Truffle](#install-truffle)
  - [Install Web3](#install-web3)
  - [Install Metamask](#install-metamask)
- [Set up a project](#set-up-a-project)
  - [Create folder structure](#create-folder-structure)
  - [Configure truffle](#configure-truffle)
- [Create a new contract](#create-a-new-contract)
- [Deploy the contract](#deploy-the-contract)
- [Interact with the contract](#interact-with-the-contract)
- [Variables](#variables)
  - [Types](#types)
  - [Visibility](#visibility)
  - [How to interact with variables](#how-to-interact-with-variables)
- [Functions](#functions)
  - [Visibility keywords](#visibility-keywords)
  - [Modifier keywords](#modifier-keywords)
  - [How to interact with functions](#how-to-interact-with-functions)
- [Special Variables and Functions](#special-variables-and-functions)
  - [List of built-in variables/functions](#list-of-built-in-variablesfunctions)
  - [How to interact with built-in variables/functions](#how-to-interact-with-built-in-variablesfunctions)
- [Control Structures](#control-structures)
  - [If statement](#if-statement)
  - [For loop](#for-loop)
  - [While loop](#while-loop)
- [Arrays](#arrays)
  - [Storage arrays](#storage-arrays)
  - [Memory arrays](#memory-arrays)
  - [Array as input of a function](#array-as-input-of-a-function)
  - [Array as output of a function](#array-as-output-of-a-function)
- [Mappings](#mappings)
  - [Declare a mapping](#declare-a-mapping)
  - [CRUD](#crud)
    - [Create](#create)
    - [Read](#read)
    - [Update](#update)
    - [Delete](#delete)
  - [Default value](#default-value)
  - [Nested mappings](#nested-mappings)
  - [Arrays in mappings](#arrays-in-mappings)
  - [How to interact with mappings](#how-to-interact-with-mappings)
- [Structs](#structs)
  - [Declare a struct](#declare-a-struct)
  - [CRUD](#crud-1)
    - [Create](#create-1)
    - [Read](#read-1)
    - [Update](#update-1)
    - [Delete](#delete-1)
  - [Array of structs](#array-of-structs)
  - [Mapping of structs](#mapping-of-structs)
  - [How to interact with structs](#how-to-interact-with-structs)
- [Enums](#enums)
  - [Declare an enum](#declare-an-enum)
  - [How to interact with enums](#how-to-interact-with-enums)
- [Events](#events)
  - [Declare an event](#declare-an-event)
  - [How to interact with events](#how-to-interact-with-events)
- [Memory Locations](#memory-locations)
  - [Storage](#storage)
  - [Memory](#memory)
  - [Stack](#stack)
  - [Calldata](#calldata)
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

## Install Web3
 Web3.js allows us to make requests to an individual Ethereum node with JSON RPC in order to read and write data to the network.

 Type in terminal:
```sh
npm install web3
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

# Variables

## Types
- **fixed-size types**
  - bool
  - unit
  - address
  - bytes32
- **varible-size types**
  - string
  - bytes
  - unit[]
  - mapping(unit => string)
- **user-defined data**
  - struct
  - enum

## Visibility
- **private**: the variable can be called only within the smart contract.
- **internal**: the variable can be called by other smart contracts by inheritance but not from the external.
- **public**: the variable can be called by the external.

Note: if you do not specify the variable visibility, it is automatically set as *private*.

## How to interact with variables
In your contract type:
```js
pragma solidity ^0.8.0;

contract MyContract {
  
  uint public variableName = 10;

}
```
Deploy the contract by typing in the terminal `truffle migrate` and then open the truffle console by typing `truffle console`. Then use the following commands to access the variable:
```sh
MyContract.deployed().then(function(i) { contract=i; })
```
```sh
contract.variableName().then(function(v){value=v;})
```
```sh
parseFloat(value)
```

# Functions
A function can be defined in this generic way:
```
function functionName() visibilityKeyword modifierKeyword returns(dataType)
```
## Visibility keywords
- **private**: the function can be called only within the smart contract.
-  **internal**: the function can be called by other smart contracts by inheritance but not from the external.
- **external**: the function can only be called from the outside from smart-contract.
- **public**: the function can be called within the smart contract and from the outside.

Note: when using the **private** or **internal** keyword, use *_FunctionName* as a convention.

## Modifier keywords
- **view**: the function is not capable of writing to the blockchain. It is a read-only function.
- **pure**: the function is not capable of writing to the blockchain but it allows to perform computations. It is a read-only function.
- *Nothing*: the function is capable of writing to the blockchain.

## How to interact with functions
In your contract type:
```js
pragma solidity ^0.8.0;

contract MyContract {
  
  string name;

    function setName(string memory _name) external {
        name = _name;
    }

    function getName() external view returns(string memory) {
        return name;
    }

}
```
This contract allows to assign a string to a variable and write it and read it from the blockchain.

Deploy the contract by typing in the terminal `truffle migrate` and then open the truffle console by typing `truffle console`. Then use the following commands to access the variable:
```sh
MyContract.deployed().then(function(i) { contract=i; })
```
```sh
contract.setName('variableName')
```
```sh
contract.getName()
```

# Special Variables and Functions

There are special variables and functions which always exist in the global namespace and are mainly used to provide information about the blockchain or are general-use utility functions.

## List of built-in variables/functions

- `blockhash(uint blockNumber) returns (bytes32)`: hash of the given block - only works for 256 most recent, excluding current, blocks
- `block.coinbase (address payable)`: current block miner’s address
- `block.difficulty (uint)`: current block difficulty
- `block.gaslimit (uint)`: current block gaslimit
- `block.number (uint)`: current block number
- `block.timestamp (uint)`: current block timestamp as seconds since unix epoch
- `gasleft() returns (uint256)`: remaining gas
- `msg.data (bytes calldata)`: complete calldata
- `msg.sender (address payable)`: sender of the message (current call)
- `msg.sig (bytes4)`: first four bytes of the calldata (i.e. function identifier)
- `msg.value (uint)`: number of wei sent with the message
- `now (uint)`: current block timestamp (alias for block.timestamp)
- `tx.gasprice (uint)`: gas price of the transaction
- `tx.origin (address payable)`: sender of the transaction (full call chain)

## How to interact with built-in variables/functions
In your contract type:
```js
pragma solidity ^0.8.0;

contract MyContract {
  
  function getSummary() external view returns(address, uint, uint){
    
        return (msg.sender, block.number, tx.gasprice);
  }

}
```
This contract has a function which returns the sender's address, the block number and the gas price for the transaction.

Deploy the contract by typing in the terminal `truffle migrate` and then open the truffle console by typing `truffle console`. Then use the following commands to access the variable:
```sh
MyContract.deployed().then(function(i) { contract=i; })
```
```sh
contract.getSummary().then(function(r){results=r;})
```
```sh
results[0]
parseFloat(results[1])
parseFloat(results[2])
```

# Control Structures
## If statement
To check if a condition is valid or not, an if statement is needed. In order to do so, you can write this function in the contract:
```js
pragma solidity ^0.8.0;

contract MyContract {
  
  string public output;
  string valueToCheck = "pizza";

  function ifStatement(string memory value) external returns(string memory){

      if(keccak256(abi.encodePacked(value)) != keccak256(abi.encodePacked(valueToCheck))){
          output = "Enjoy your meal";
          
      }
      else{
          output = "Time for a diet";
      }

      return output;

  }

}
```
You can combine multiple checks by using the **AND**/**OR** statements which are expressed with the following characters **&&**/**||**.

To interact with the function above, type the following commands in the truffle console:
```sh
MyContract.deployed().then(function(i) { contract=i; })
```
```sh
contract.ifStatement('pizza')
```
The expected result is `Time for a diet`.

## For loop
A for loop performs as many iterations as declared. In your contract type:
```js
pragma solidity ^0.8.0;

contract MyContract {
  
  uint public sum;
  function forLoop(uint end) external returns(uint){
      for(uint i=0; i<end; i++) {
          sum = sum+1;
      }
      return sum;
  }

}
```

To interact with the function above, type the following commands in the truffle console:
```sh
MyContract.deployed().then(function(i) { contract=i; })
```
```sh
contract.forLoop(10)
```
The expected result is `10`.

## While loop
A while loop performs operations until a certain condition is met. In your contract type:
```js
pragma solidity ^0.8.0;

contract MyContract {
  
  function whileLoop(uint end) external pure returns(string memory){
    uint j = 0;
    while(j<end) {
        j = j+1;
    }
    return "Done";
  }

}
```

To interact with the function above, type the following commands in the truffle console:
```sh
MyContract.deployed().then(function(i) { contract=i; })
```
```sh
contract.whileLoop(25000)
```
After a few seconds, the expected result is `Done`.

# Arrays
In Solidity, arrays can contain only one data type. There 2 typologies of arrays: **storage** and **memory**. They can only be manipulated inside of a function.

## Storage arrays
They are stored in the blockchain. The size does not need to be declered and they posess the `push` method. They are defined in the following way:
```js
uint[] nameArray;
```
To add an item to the array you can type:
```js
nameArray[0] = 23;
```
or 
```js
nameArray.push(5);
```
By using the lines written above, the array will contain the values 23 and 5.
To delete an item in a specific index, you can write the following line of code:
```js
delete nameArray[1];
```

## Memory arrays
They are declared only inside of a function, they have a fixed size and do not posess the `push` method.
To declare for example an array of size 10, the following line of code is needed:
```js
uint[] memory nameArray = new uint[](10);
```
To add an item to the array the index notation is required:
```js
nameArray[0] = 23;
```
To delete an item in a specific index, you can write the following line of code:
```js
delete nameArray[1];
```

## Array as input of a function
To pass an array as an input argument of a function you need to check the visibility keyword. If the function is of type **external** then:
```js
function funcName(uint[] calldata myArray) external {
  // some operation
}
```
If the function is of type **public** or **internal** then:
```js
function funcName(uint[] memory myArray) internal {
  // some operation
}
```
## Array as output of a function
To return an array as the output of a function the following lines of code are needed:
```js
function funcName() external returns(uint[] memory) {
  // some operation
}
```

# Mappings
They are very similar to Javascript object literals or Python dictionaries. The property and the value can be of different data types but once defined they cannot be mixed with other types.

## Declare a mapping
To declare a mapping the following expression can be used:
```js
// mapping(dataType1 => dataType2) mappingName;
mapping(address => uint) age;
```

## CRUD

### Create
Mappings are created inside of a function:
```js
function functionName() external {
  // mappingName[key] = value;
  age[msg.address] = 30;
}
```

### Read
You can read and access mapping content by specifying a key:
```js
function functionName() external {
  // mappingName[key]
  age[msg.address]; // values is 30
}
```

### Update
To update a value, just reference a key and assign a new value:
```js
function functionName() external {
  // mappingName[key] = newValue;
  age[msg.address] = 50; // old values was 30, new value is 50
}
```

### Delete
To delete and item use the `delete` keyword:
```js
function functionName() external {
  // delete mappingName[key];
  delete age[msg.address]; // no values assigned to msg.address
}
```

## Default value
It is possible to access keys which do not have any assigned value. This is because every datatype as a default value:
- 0 for uint
- '' for string
- False for bool
- ...

## Nested mappings
It is possible to nest mappings in the following way:
```js
// mapping(dataType1 => mapping(dataType2 => dataType3)) mappingName;
mapping(address => mapping(string => uint)) user;
```
To interact with it all the CRUD operations are valid. The only difference is that 2 keys need to referenced instead:
```js
function functionName() external {
  // mappingName[key1][key2]
  user[msg.address]['Alice'] = 23;
}
```

## Arrays in mappings
It is possible to combine arrays and mappings in the following way:
```js
// mapping(dataType1 => dataType2[]) mappingName;
mapping(address => uint[]) goals;
```
To manipulate this mapping, you don't need to instantiate the array as it is already done by default by Solidity:
 ```js
function functionName() external {
  // mappingName[key].push(value);
  goals[msg.address].push(5);
}
```
All the CRUD operations are still valid.

## How to interact with mappings
Consider the following smart-contract which allows to assign the age of the contract sender:
```js
pragma solidity ^0.8.0;

contract MyContract {

    mapping(address => uint) public age;

    function assignAge(uint _age) external {
        age[msg.sender] = _age;
    }

    function getAge(address _sender) external view returns(uint) {
        
        return age[_sender];
    }

}
```
Deploy the contract by typing in the terminal `truffle migrate` and then open the truffle console by typing `truffle console`. Then use the following commands to access the variable:
```js
MyContract.deployed().then(function(i) { contract=i;})
```
```js
contract.assignAge(31)
```
```js
contract.getAge('0x152aeDe78F7399fe36b1bB15093a7A3083dC6e95').then(function(r){result=r;}) // first address displayed in Ganache
```
```js
parseFloat(result) // 31
```
If the second address displayed in Ganache is used, the result should be 0.

# Structs
Structures are very good to store structured data. They are declared by defining a template which contains different fields which represent an object.

## Declare a struct
To declare a struct the following expression can be used:
```js
// struct structName {
// dataType1 fieldName1;
// dataType2 fieldName2;
// ...       ...; 
// }
struct Player {
  string name;
  address addr;
  uint goals;
}
```

## CRUD

### Create
An instance of the struct must be created within a function:
```js
function functionName() external {
  // structName memory variableName = structName(fieldValue1, fieldValue2, ...)
  Player memory player1 = Player('Messi', msg.sender, 40) // option 1

  // structName memory variableName = structName({fieldName1: fieldValue1, fieldName2: fieldValue2, ...})
  Player memory player2 = Player({goals:36, name:'Ronaldo', address:msg.sender}) // option 2
}
```

### Read
You can read and access struct content by specifying the field name:
```js
function functionName() external {
  // variableName.fieldName1;
  player1.goals; // values is 40
}
```

### Update
To update a value, just reference a filed and assign a new value:
```js
function functionName() external {
  // variableName.fieldName1;
  player1.goals = 50; // values is 50
}
```

### Delete
To delete a struct instance use the `delete` keyword:
```js
function functionName() external {
  // delete variableName;
  delete player1;
}
```

## Array of structs
It is possible to store structs inside of arrays in the following way:
```js
// structName[] arrayName;
Player[] players;

function functionName() external {
  // arrayName.push(variableName);
  players.push(player1);
  players.push(player2);
}
```

## Mapping of structs
It is possible to store structs inside of mappings in the following way:
```js
// mapping(dataType1 => structName) mappingName;
mapping(address => Player) players;

function functionName() external {
  // mappingName[key] = variableName;
  players['0x152aeDe78F7399fe36b1bB15093a7A3083dC6e95'] = player1;
  players['0x5Cd4a421f6E28E14Ba838b42BaADebAd4EB9A658'] = player2;
}
```

## How to interact with structs
Consider the following smart-contract which allows to assign the name and goals of each player and stores it into an array:
```js
pragma solidity ^0.8.0;

contract MyContract {

    struct Player {
        string name;
        uint goals;
    }

    Player[] public players;

    function addPlayer(string calldata _name, uint _goals) external {

        Player memory player = Player(_name, _goals);

        players.push(player);

    }

}
```
Deploy the contract by typing in the terminal `truffle migrate` and then open the truffle console by typing `truffle console`. Then use the following commands to access the variable:
```js
MyContract.deployed().then(function(i) { contract=i;})
```
```js
contract.addPlayer('messi',40)
```
```js
contract.players(0)
```

# Enums
Enums are a way to represent different options. The order of the options matters since the first on is corresponds to 0, the second to 1 and so on.

## Declare an enum
To declare an enum, the following expression can be used:
```js
// enum ENUMNAME {OPTION0, 
//                OPTION1,
//                ...
//                OPTIONX}
// ENUMNAME variableName;
enum LIGHT {ON,
            OFF}
LIGHT light;
```

## How to interact with enums
Consider the following smart-contract which allows to change the state of a light variable from ON to OFF:
```js
pragma solidity ^0.8.0;

contract MyContract {

    enum STATUS {ON, 
                 OFF}
    STATUS public light;

    function turnLight(string memory _state) external {
        if(keccak256(abi.encodePacked(_state))==keccak256(abi.encodePacked('on'))){
            light = STATUS.ON;
        }
        else{
            light = STATUS.OFF;
        }
    }

    function lightStatus() external view returns (STATUS){
        return light;
    }
}
```
Deploy the contract by typing in the terminal `truffle migrate` and then open the truffle console by typing `truffle console`. Then use the following commands to access the variable:
```js
MyContract.deployed().then(function(i) { contract=i;})
```
```js
contract.turnLight('on')
```
```js
contract.lightStatus().then(function(s){status=s;})
```
```js
parseFloat(status)
```
The status is `0` if the light is ON, `1` if OFF.

# Events
Events are used to propagate information from the smart-contract to the outside world. They allow to record that a specific activity (or event) has been triggered and it is possible to see its details.


## Declare an event
To declare an event the following expression can be used:
```js
// event EventName ( 
// dataType1 fieldName1,
// dataType2 fieldName2,
// ...       ...
//)
event Score(
        uint date,
        string player,
        string team
);
```
Once declared it is not sufficient to define the content of the event but it is required to be triggered by using the `emit` command.

## How to interact with events
Consider the following smart-contract which emits the event associated to a goal scored every time the function is called by the user. By doing so it is possible to certify that the event has taken place:
```js
pragma solidity ^0.8.0;

contract MyContract {

    event Score(
        uint date,
        string player,
        string team
    );

    function goalScored(string memory _player, string memory _team) external {
        emit Score(block.timestamp, _player, _team);
    }
}
```
Deploy the contract by typing in the terminal `truffle migrate` and then open the truffle console by typing `truffle console`. Then use the following commands to access the variable:
```js
MyContract.deployed().then(function(i) { contract=i;})
```
```js
contract.goalScored('Messi','Real Madrid')
contract.goalScored('Messi','Manchester United')
```
To check out all the events that have taken place since the first validation block type:
```js
contract.getPastEvents('allEvents',{fromBlock:0})
```

# Memory Locations
## Storage
When a variable is assigned a memory location of type **storage**, then the variable is stored in the blockchain. It can be read and not deleted. It is the default type if nothing is specified. [Example](#storage-arrays)
## Memory 
When a variable is assigned a memory location of type **memory**, then the variable is not stored in the blockchain rather it is kept in the memory of the virtual machine during the execution of the function. [Example](#how-to-interact-with-functions)
## Stack
This is the memory location of all the variables defined inside of a function. They exist during the execution time of the function itself.
## Calldata
This type of memory location is only available to variables which are linked to a function of type **external** or **public**. [Example](#how-to-interact-with-structs).