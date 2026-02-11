// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract ProofOfReserve {
    IERC20 public immutable token;
    address public immutable reserveAddress;
    
    event ReserveChecked(uint256 balance, uint256 timestamp);

    constructor(address _token, address _reserveAddress) {
        token = IERC20(_token);
        reserveAddress = _reserveAddress;
    }

    function checkReserve() external view returns (uint256) {
        return token.balanceOf(reserveAddress);
    }

    function verifyReserve(uint256 minRequired) external returns (bool) {
        uint256 balance = token.balanceOf(reserveAddress);
        emit ReserveChecked(balance, block.timestamp);
        return balance >= minRequired;
    }
}
