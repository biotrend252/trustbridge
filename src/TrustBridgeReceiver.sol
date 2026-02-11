// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

/**
 * @title TrustBridgeReceiver
 * @notice Receives and processes cross-border remittance data from CRE
 */
contract TrustBridgeReceiver is Ownable {
    struct Transfer {
        address sender;
        address recipient;
        uint256 amount;
        uint256 fxRate;
        uint256 timestamp;
        bool completed;
    }

    mapping(bytes32 => Transfer) public transfers;
    mapping(address => bool) public authorizedForwarders;
    
    IERC20 public immutable stablecoin;

    event TransferInitiated(bytes32 indexed transferId, address sender, address recipient, uint256 amount);
    event TransferCompleted(bytes32 indexed transferId);
    event ForwarderAuthorized(address forwarder);

    constructor(address _stablecoin) Ownable(msg.sender) {
        stablecoin = IERC20(_stablecoin);
    }

    modifier onlyForwarder() {
        require(authorizedForwarders[msg.sender], "Not authorized");
        _;
    }

    function authorizeForwarder(address forwarder) external onlyOwner {
        authorizedForwarders[forwarder] = true;
        emit ForwarderAuthorized(forwarder);
    }

    function processTransfer(
        bytes32 transferId,
        address sender,
        address recipient,
        uint256 amount,
        uint256 fxRate
    ) external onlyForwarder {
        require(transfers[transferId].timestamp == 0, "Transfer exists");

        transfers[transferId] = Transfer({
            sender: sender,
            recipient: recipient,
            amount: amount,
            fxRate: fxRate,
            timestamp: block.timestamp,
            completed: false
        });

        emit TransferInitiated(transferId, sender, recipient, amount);
    }

    function completeTransfer(bytes32 transferId) external onlyForwarder {
        Transfer storage transfer = transfers[transferId];
        require(transfer.timestamp > 0, "Transfer not found");
        require(!transfer.completed, "Already completed");

        uint256 receivedAmount = (transfer.amount * transfer.fxRate) / 1e18;
        require(stablecoin.transfer(transfer.recipient, receivedAmount), "Transfer failed");

        transfer.completed = true;
        emit TransferCompleted(transferId);
    }

    function getTransfer(bytes32 transferId) external view returns (Transfer memory) {
        return transfers[transferId];
    }
}
