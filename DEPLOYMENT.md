# Contract Deployment Guide

## Prerequisites

### 1. Get Testnet ETH
- **Sepolia**: https://sepoliafaucet.com
- **Polygon Mumbai**: https://faucet.polygon.technology
- **Arbitrum Sepolia**: https://faucet.quicknode.com/arbitrum/sepolia

### 2. Get RPC URLs
Sign up for free at:
- **Alchemy**: https://alchemy.com (recommended)
- **Infura**: https://infura.io
- **QuickNode**: https://quicknode.com

### 3. Setup Environment
```bash
cp .env.example .env
# Edit .env with your values:
# - PRIVATE_KEY (from MetaMask/wallet)
# - SEPOLIA_RPC_URL (from Alchemy)
# - STABLECOIN_ADDRESS (Sepolia USDC: 0x1c7D4B196Cb0C7B01d743Fbc6116a902379C7238)
```

## Deployment Steps

### Option 1: Automated Deployment (Recommended)
```bash
./deploy.sh
```

### Option 2: Manual Deployment
```bash
# Build contracts
forge build

# Deploy to Sepolia
forge script script/Deploy.s.sol:DeployScript \
    --rpc-url $SEPOLIA_RPC_URL \
    --broadcast \
    --verify \
    -vvvv
```

## After Deployment

### 1. Save Contract Addresses
Deployment creates: `broadcast/Deploy.s.sol/11155111/run-latest.json`

Extract addresses:
```bash
cat broadcast/Deploy.s.sol/11155111/run-latest.json | grep "contractAddress"
```

### 2. Update .env
```bash
# Add to .env:
RECEIVER_CONTRACT=0x...
BRIDGE_CONTRACT=0x...
POR_CONTRACT=0x...
```

### 3. Verify on Etherscan
Contracts auto-verify if `--verify` flag used.
Manual verify:
```bash
forge verify-contract <ADDRESS> src/TrustBridgeReceiver.sol:TrustBridgeReceiver \
    --chain sepolia \
    --constructor-args $(cast abi-encode "constructor(address)" $STABLECOIN_ADDRESS)
```

## Test Deployed Contracts

### Check Deployment
```bash
# Check TrustBridgeReceiver
cast call <RECEIVER_ADDRESS> "stablecoin()" --rpc-url $SEPOLIA_RPC_URL

# Check ProofOfReserve
cast call <POR_ADDRESS> "checkReserve()" --rpc-url $SEPOLIA_RPC_URL
```

### Authorize CRE Forwarder
```bash
# Get your CRE forwarder address from platform.chain.link
cast send <RECEIVER_ADDRESS> \
    "authorizeForwarder(address)" <FORWARDER_ADDRESS> \
    --rpc-url $SEPOLIA_RPC_URL \
    --private-key $PRIVATE_KEY
```

## Multi-Chain Deployment

Deploy to multiple chains for cross-chain testing:

```bash
# Polygon Mumbai
forge script script/Deploy.s.sol:DeployScript \
    --rpc-url $POLYGON_MUMBAI_RPC_URL \
    --broadcast

# Arbitrum Sepolia
forge script script/Deploy.s.sol:DeployScript \
    --rpc-url $ARBITRUM_SEPOLIA_RPC_URL \
    --broadcast
```

## Troubleshooting

### "Insufficient funds"
- Get testnet ETH from faucets above
- Check balance: `cast balance <YOUR_ADDRESS> --rpc-url $SEPOLIA_RPC_URL`

### "Invalid API key"
- Verify RPC URL in .env
- Test: `cast block-number --rpc-url $SEPOLIA_RPC_URL`

### "Contract verification failed"
- Verify manually using command above
- Or verify on Etherscan UI: https://sepolia.etherscan.io

## Gas Estimates

Deployment costs (Sepolia):
- TrustBridgeReceiver: ~0.002 ETH
- StablecoinBridge: ~0.0015 ETH
- ProofOfReserve: ~0.001 ETH
- **Total: ~0.0045 ETH**

## Next Steps

1. ✅ Deploy contracts
2. ⏳ Configure CRE workflows with contract addresses
3. ⏳ Test with `cre workflow simulate`
4. ⏳ Deploy CRE workflow to production
