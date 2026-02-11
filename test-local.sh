#!/bin/bash

echo "🧪 TrustBridge Local Testing Environment"
echo "========================================"
echo ""

export PATH="$HOME/.foundry/bin:$PATH"

# Start Anvil in background
echo "🔧 Starting local Ethereum node (Anvil)..."
anvil --port 8545 > /dev/null 2>&1 &
ANVIL_PID=$!
sleep 2

if ! kill -0 $ANVIL_PID 2>/dev/null; then
    echo "❌ Failed to start Anvil"
    exit 1
fi

echo "✅ Anvil running on http://localhost:8545 (PID: $ANVIL_PID)"
echo ""

# Deploy contracts
echo "🚀 Deploying contracts to local network..."
PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
STABLECOIN_ADDRESS=0x5FbDB2315678afecb367f032d93F642f64180aa3

forge script script/Deploy.s.sol:DeployScript \
    --rpc-url http://localhost:8545 \
    --private-key $PRIVATE_KEY \
    --broadcast \
    -vv

if [ $? -eq 0 ]; then
    echo ""
    echo "═══════════════════════════════════════"
    echo "✅ LOCAL DEPLOYMENT SUCCESSFUL"
    echo "═══════════════════════════════════════"
    echo ""
    echo "Anvil is running. Press Ctrl+C to stop."
    echo ""
    echo "Test accounts:"
    echo "  Address: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"
    echo "  Private Key: 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"
    echo ""
    
    # Keep running
    wait $ANVIL_PID
else
    echo "❌ Deployment failed"
    kill $ANVIL_PID
    exit 1
fi
