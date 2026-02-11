# TrustBridge Quick Start

## Prerequisites
```bash
# Add to PATH
export PATH="$HOME/.cre/bin:$HOME/.bun/bin:$PATH"
```

## Setup Steps

### 1. Create CRE Account
Visit https://platform.chain.link and sign up

### 2. Login
```bash
cre login
```

### 3. Initialize Project
```bash
cd trustbridge
cre init --project-name trustbridge --workflow-name remittance
```

### 4. Install Dependencies
```bash
bun install
```

### 5. Simulate Workflow
```bash
cre workflow simulate
```

## Test Request
```json
{
  "senderId": "user_123",
  "recipientId": "user_456",
  "amount": 1000,
  "sourceCurrency": "USD",
  "targetCurrency": "EUR",
  "sourceChain": "ethereum",
  "targetChain": "polygon"
}
```

## Next Steps
1. Get API keys for production (KYC, FX, Sanctions)
2. Wait for Feb 14 for Private Transactions
3. Deploy contracts to testnet
4. Test on Tenderly Virtual TestNets
5. Record demo video
6. Submit by March 1
