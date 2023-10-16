pragma solidity ^0.5.0;

import "./KaseiCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";


// I had the KaseiCoinCrowdsale contract inherit the following OpenZeppelin:
// * Crowdsale
// * MintedCrowdsale
contract KaseiCoinCrowdsale is Crowdsale, MintedCrowdsale{ // UPDATE THE CONTRACT SIGNATURE TO ADD INHERITANCE
    
    // I then provided parameters for all of the features of my crowdsale, such as the `rate`, `wallet` for fundraising, and `token`.
    constructor(
        uint256 rate,
        address payable wallet,
        Kasei_Coin token
    )
     public Crowdsale(rate, wallet, token) {
        // constructor can stay empty
    }
}


contract KaseiCoinCrowdsaleDeployer {
    // I created an `address public` variable called `kasei_token_address`.
    address public kasei_token_address;
    // I then created an `address public` variable called `kasei_crowdsale_address`.
    address public kasei_crowdsale_address;

    // Add the constructor.
    constructor(
       string memory name,
        string memory symbol,
        address payable wallet
    ) public {
        // I created a new instance of the KaseiCoin contract.
        Kasei_Coin token = new Kasei_Coin(name, symbol, 0);
        
        // I followed that up by assigning the token contract’s address to the `kasei_token_address` variable.
        kasei_token_address = address(token);

        // After that I created a new instance of the `KaseiCoinCrowdsale` contract
        KaseiCoinCrowdsale kaseicoincrowdsale =
            new KaseiCoinCrowdsale(1, wallet, token);
            
        // I then assigned the `KaseiCoinCrowdsale` contract’s address to the `kasei_crowdsale_address` variable.
        kasei_crowdsale_address = address(kaseicoincrowdsale);

        // I followed that up by setting the `KaseiCoinCrowdsale` contract as a minter
        token.addMinter(address(kaseicoincrowdsale));
        
        // Finally, I had the `KaseiCoinCrowdsaleDeployer` renounce its minter role.
        token.renounceMinter();
    }
}
