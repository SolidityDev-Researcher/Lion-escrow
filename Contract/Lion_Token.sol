// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract LionEscrowToken is ERC20("Lion Escrow Token", "LET"), Ownable(msg.sender) {

    function mint() public onlyOwner {
        _mint(msg.sender, 8_000_000 * 10**18);
    }

}