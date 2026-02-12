// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/TrustBridgeReceiver.sol";
import "../src/StablecoinBridge.sol";
import "../src/ProofOfReserve.sol";

contract DeployScript is Script {
    function run() external {
        string memory privateKeyStr = vm.envString("PRIVATE_KEY");
        uint256 deployerPrivateKey = vm.parseUint(privateKeyStr);
        address stablecoin = vm.envAddress("STABLECOIN_ADDRESS");
        
        vm.startBroadcast(deployerPrivateKey);

        // Deploy TrustBridgeReceiver
        TrustBridgeReceiver receiver = new TrustBridgeReceiver(stablecoin);
        console.log("TrustBridgeReceiver deployed at:", address(receiver));

        // Deploy StablecoinBridge
        address targetToken = stablecoin; // Same for testnet
        StablecoinBridge bridge = new StablecoinBridge(stablecoin, targetToken);
        console.log("StablecoinBridge deployed at:", address(bridge));

        // Deploy ProofOfReserve
        address reserveAddress = address(bridge);
        ProofOfReserve por = new ProofOfReserve(stablecoin, reserveAddress);
        console.log("ProofOfReserve deployed at:", address(por));

        vm.stopBroadcast();
    }
}
