pragma solidity ^0.8.0;
// SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    string private _name = "420itwas";
    string private _symbol = "420";
    uint8 private _decimals = 18;

    // Initial supply: 1,000,000 tokens
    uint256 private _initialSupply = 1000000 * 10**_decimals;

    // Constructor
    constructor(address initialOwner) ERC20(_name, _symbol) Ownable(initialOwner) {
        _mint(initialOwner, _initialSupply);
    }

    // Function to mint additional tokens (only owner)
    function mint(address account, uint256 amount) external onlyOwner {
        _mint(account, amount);
    }

    // Function to burn tokens (only owner)
    function burn(address account, uint256 amount) external onlyOwner {
        _burn(account, amount);
    }
}
