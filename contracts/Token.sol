// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract Token is ERC20 {
    address public admin;
    constructor() ERC20("Token", "TKN"){
        _mint(msg.sender, 100000 * 10 ** 18);
        admin = msg.sender;
    }

    function mint(address to, uint value) external {
        require(to == admin, "Address isn't admin");
        _mint(msg.sender, value);
    }
    function burn(uint amount) external {
        _burn(msg.sender, amount);
    }
}