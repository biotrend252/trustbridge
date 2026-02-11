// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/TrustBridgeReceiver.sol";
import "../src/StablecoinBridge.sol";
import "../src/ProofOfReserve.sol";

contract MockERC20 is Test {
    mapping(address => uint256) public balanceOf;
    
    function transfer(address to, uint256 amount) external returns (bool) {
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        return true;
    }
    
    function transferFrom(address from, address to, uint256 amount) external returns (bool) {
        balanceOf[from] -= amount;
        balanceOf[to] += amount;
        return true;
    }
    
    function mint(address to, uint256 amount) external {
        balanceOf[to] += amount;
    }
}

contract TrustBridgeTest is Test {
    TrustBridgeReceiver public receiver;
    StablecoinBridge public bridge;
    ProofOfReserve public por;
    MockERC20 public token;
    
    address public owner = address(1);
    address public forwarder = address(2);
    address public user = address(3);
    
    function setUp() public {
        vm.startPrank(owner);
        
        token = new MockERC20();
        receiver = new TrustBridgeReceiver(address(token));
        bridge = new StablecoinBridge(address(token), address(token));
        por = new ProofOfReserve(address(token), address(bridge));
        
        receiver.authorizeForwarder(forwarder);
        
        vm.stopPrank();
    }
    
    function testReceiverAuthorization() public {
        assertTrue(receiver.authorizedForwarders(forwarder));
        assertFalse(receiver.authorizedForwarders(user));
    }
    
    function testProcessTransfer() public {
        bytes32 transferId = keccak256("transfer1");
        
        vm.prank(forwarder);
        receiver.processTransfer(transferId, user, user, 1000e18, 92e16);
        
        (address sender,,,,,) = receiver.transfers(transferId);
        assertEq(sender, user);
    }
    
    function testBridgeInitiate() public {
        bytes32 transferId = keccak256("bridge1");
        uint256 amount = 1000e18;
        
        token.mint(user, amount);
        
        vm.startPrank(user);
        bridge.initiateBridge(transferId, amount);
        vm.stopPrank();
        
        assertTrue(bridge.processedTransfers(transferId));
    }
    
    function testProofOfReserve() public {
        token.mint(address(bridge), 5000e18);
        
        uint256 reserve = por.checkReserve();
        assertEq(reserve, 5000e18);
        
        bool verified = por.verifyReserve(4000e18);
        assertTrue(verified);
        
        bool failed = por.verifyReserve(6000e18);
        assertFalse(failed);
    }
}
