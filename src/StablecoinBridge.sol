// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract StablecoinBridge is Ownable {
    IERC20 public immutable sourceToken;
    IERC20 public immutable targetToken;
    
    mapping(bytes32 => bool) public processedTransfers;
    
    event BridgeInitiated(bytes32 indexed transferId, address sender, uint256 amount);
    event BridgeCompleted(bytes32 indexed transferId, address recipient, uint256 amount);

    constructor(address _sourceToken, address _targetToken) Ownable(msg.sender) {
        sourceToken = IERC20(_sourceToken);
        targetToken = IERC20(_targetToken);
    }

    function initiateBridge(bytes32 transferId, uint256 amount) external {
        require(!processedTransfers[transferId], "Already processed");
        require(sourceToken.transferFrom(msg.sender, address(this), amount), "Transfer failed");
        
        processedTransfers[transferId] = true;
        emit BridgeInitiated(transferId, msg.sender, amount);
    }

    function completeBridge(bytes32 transferId, address recipient, uint256 amount) external onlyOwner {
        require(processedTransfers[transferId], "Not initiated");
        require(targetToken.transfer(recipient, amount), "Transfer failed");
        
        emit BridgeCompleted(transferId, recipient, amount);
    }
}
