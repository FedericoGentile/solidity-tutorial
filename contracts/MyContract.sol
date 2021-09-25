pragma solidity ^0.8.0;

contract MyContract {

    mapping (address=>uint) public age;

    function assignAge(uint _age) external {
        age[msg.sender] = _age;
    }

    function getAge(address _sender) external view returns(uint){
        return age[_sender];
    }

}