pragma solidity ^0.8.0;

contract MyContract {

    // transactions tx
    // tx.gasprice (uint): gas price of the transaction
    // tx.origin (address payable): sender of the transaction (full call chain)


    // message msg
    // msg.data (bytes calldata): complete calldata
    // msg.sender (address payable): sender of the message (current call)
    // msg.sig (bytes4): first four bytes of the calldata (i.e. function identifier)
    // msg.value (uint): number of wei sent with the message


    // blocks
    // block.coinbase (address payable)`: current block miner’s address
    // block.difficulty (uint): current block difficulty
    // block.gaslimit (uint): current block gaslimit  
    // block.number (uint): current block number
    // block.timestamp (uint): current block timestamp as seconds since unix epoch

    function getSummary() external view returns(address, uint, uint) {
        return (msg.sender, block.number, tx.gasprice);
    }


}