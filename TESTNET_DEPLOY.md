# Quick Testnet Deployment Guide

## Step 1: Get Free Sepolia ETH (5 min)

### Option A: Alchemy Faucet (Easiest)
1. Go to: https://sepoliafaucet.com
2. Sign up for free Alchemy account
3. Paste your wallet address
4. Get 0.5 ETH instantly

### Option B: QuickNode Faucet
1. Go to: https://faucet.quicknode.com/ethereum/sepolia
2. Paste wallet address
3. Get 0.05 ETH (no signup needed)

## Step 2: Get Free RPC URL (2 min)

1. Go to: https://alchemy.com
2. Sign up (free)
3. Create new app:
   - Name: TrustBridge
   - Network: Ethereum Sepolia
4. Copy the HTTPS URL

## Step 3: Setup Environment (1 min)

```bash
cd /home/yourusername/kirocli/trustbridge

# Copy example
cp .env.example .env

# Edit .env and add:
# PRIVATE_KEY=your_metamask_private_key
# SEPOLIA_RPC_URL=https://eth-sepolia.g.alchemy.com/v2/YOUR_KEY
# STABLECOIN_ADDRESS=0x1c7D4B196Cb0C7B01d743Fbc6116a902379C7238
```

## Step 4: Deploy (2 min)

```bash
./deploy.sh
```

## Done! 🎉

Your contracts are now on Sepolia testnet!

Contract addresses will be in:
`broadcast/Deploy.s.sol/11155111/run-latest.json`

Verify on Etherscan:
https://sepolia.etherscan.io

---

## Total Time: ~10 minutes
## Total Cost: $0 (free testnet ETH)
