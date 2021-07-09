pragma solidity ^0.8.0;

contract MyContract {

// function functionName() visibilityKeyword modifierKeyword returns(dataType)

// private, internal, external, public

// view, pure

string name;

function setName(string memory _name) external {
    name = _name;
}

function getName() external view returns(string memory){
    return name;
}

}