// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.8.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.8.2/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@4.8.2/security/Pausable.sol";
import "@openzeppelin/contracts@4.8.2/access/Ownable.sol";
import "@openzeppelin/contracts@4.8.2/token/ERC20/extensions/ERC20Capped.sol";

/// @custom:security-contact fufidex@gmail.com
/// @custom:dex-website https://fufi.exchange for mainnet exchange
/// @custom:github-repo https://github.com/fufiprotocol
contract FuFiToken is ERC20, ERC20Burnable, Pausable, Ownable {
    constructor() ERC20("FuFi Utility & Governance Token", "FFT") ERC20Capped( 10000000000 * 10 ** decimals() ) {
        _mint(msg.sender, 1800000000 * 10 ** decimals()); //1.8B = 0.2B(Airdrop) + 0.1B(IDO) + 1.5B(Founding Team)
    }

    function decimals() public view virtual override returns (uint8) {
        return 6;
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
