#!/bin/bash

echo "🚀 Starting TrustBridge Full Web3 App"
echo "======================================"
echo ""

export PATH="$HOME/.foundry/bin:$HOME/.bun/bin:$PATH"

# Start Anvil
echo "🔧 Starting Anvil (local blockchain)..."
anvil --port 8545 > /tmp/anvil.log 2>&1 &
ANVIL_PID=$!
sleep 3

if ! kill -0 $ANVIL_PID 2>/dev/null; then
    echo "❌ Failed to start Anvil"
    exit 1
fi

echo "✅ Anvil running on http://localhost:8545"
echo ""

# Deploy contracts
echo "🚀 Deploying contracts..."
export PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
export STABLECOIN_ADDRESS=0x5FbDB2315678afecb367f032d93F642f64180aa3

forge script script/Deploy.s.sol:DeployScript \
    --rpc-url http://localhost:8545 \
    --broadcast > /tmp/deploy.log 2>&1

if [ $? -eq 0 ]; then
    echo "✅ Contracts deployed"
    echo ""
else
    echo "❌ Deployment failed"
    kill $ANVIL_PID
    exit 1
fi

# Start web server
echo "🌐 Starting web server..."
echo ""
echo "═══════════════════════════════════════════════════════════"
echo "✅ TrustBridge Web3 App Ready!"
echo "═══════════════════════════════════════════════════════════"
echo ""
echo "🌐 Open: http://localhost:3000"
echo ""
echo "Features:"
echo "  ✅ Connect MetaMask or use Anvil directly"
echo "  ✅ Real blockchain transactions"
echo "  ✅ Live wallet balance"
echo "  ✅ Contract interactions"
echo "  ✅ Full workflow execution"
echo ""
echo "Press Ctrl+C to stop everything"
echo "═══════════════════════════════════════════════════════════"
echo ""

# Cleanup on exit
trap "kill $ANVIL_PID 2>/dev/null" EXIT

bun demo-server.ts
