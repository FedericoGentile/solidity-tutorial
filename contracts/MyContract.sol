pragma solidity ^0.8.0;

contract MyContract {

    // storage
    uint[] public myArray1;

    function myFunc1(uint end) external returns(uint[] memory){
        for(uint i=0; i<end; i++){
            myArray1.push(i*2);
        }

        return myArray1;
    }

    // memory
    function myFunc2() external pure returns(uint[] memory){
        uint[] memory myArray2 = new uint[](10);

        for(uint i=0; i<myArray2.length; i++){
            myArray2[i] = i*2;
        }

        return myArray2;
    }



    //function myFunc3(uint[] calldata _myArray) external {
    //
    //}

    //function myFunc3(uint[] memory _myArray) internal {
    //
    //}
}