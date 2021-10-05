pragma solidity ^0.8.0;

contract MyContract {

    enum STATUS {
        ON,
        OFF
    }
    STATUS public light;

    function turnLight(string memory _state) external {

        if(keccak256(abi.encodePacked(_state)) == keccak256(abi.encodePacked('on'))){
            light = STATUS.ON;
        }
        else{
            light = STATUS.OFF;
        }

    }

    function lightStatus() external view returns(STATUS){
        return light;
    }

}