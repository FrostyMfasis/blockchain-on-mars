pragma solidity ^0.5.0;

//  I imported the following contracts from the OpenZeppelin library:
//    * `ERC20`
//    * `ERC20Detailed`
//    * `ERC20Mintable`
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol";

// I then created a constructor for the KaseiCoin contract and have the contract inherit the libraries that I imported from OpenZeppelin.
contract Kasei_Coin is ERC20, ERC20Detailed, ERC20Mintable {
    constructor(
        string memory name,
        string memory symbol,
        uint initial_supplys
    )
        ERC20Detailed(name, symbol, 18)
        public
    {
        // mint(msg.sender, initial_supplys);
    }
} 
