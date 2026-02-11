#!/bin/bash

echo "🚀 TrustBridge Contract Deployment"
echo "==================================="
echo ""

export PATH="$HOME/.foundry/bin:$PATH"

# Check if .env exists
if [ ! -f .env ]; then
    echo "❌ .env file not found!"
    echo "Copy .env.example to .env and fill in your values:"
    echo "  cp .env.example .env"
    exit 1
fi

source .env

# Validate required vars
if [ -z "$PRIVATE_KEY" ] || [ "$PRIVATE_KEY" = "your_private_key_here" ]; then
    echo "❌ PRIVATE_KEY not set in .env"
    exit 1
fi

if [ -z "$SEPOLIA_RPC_URL" ] || [[ "$SEPOLIA_RPC_URL" == *"your-key"* ]]; then
    echo "❌ SEPOLIA_RPC_URL not set in .env"
    exit 1
fi

echo "📋 Deployment Configuration:"
echo "  Network: Sepolia Testnet"
echo "  Stablecoin: $STABLECOIN_ADDRESS"
echo ""

# Build contracts
echo "🔨 Building contracts..."
forge build
if [ $? -ne 0 ]; then
    echo "❌ Build failed"
    exit 1
fi
echo "✅ Build successful"
echo ""

# Deploy
echo "🚀 Deploying contracts to Sepolia..."
forge script script/Deploy.s.sol:DeployScript \
    --rpc-url $SEPOLIA_RPC_URL \
    --broadcast \
    --verify \
    -vvvv

if [ $? -eq 0 ]; then
    echo ""
    echo "═══════════════════════════════════════"
    echo "✅ DEPLOYMENT SUCCESSFUL"
    echo "═══════════════════════════════════════"
    echo ""
    echo "Contract addresses saved in:"
    echo "  broadcast/Deploy.s.sol/11155111/run-latest.json"
    echo ""
    echo "Next steps:"
    echo "1. Note the deployed contract addresses"
    echo "2. Update .env with contract addresses"
    echo "3. Configure CRE to use these contracts"
else
    echo ""
    echo "❌ Deployment failed"
    echo "Check your RPC URL and private key"
fi
