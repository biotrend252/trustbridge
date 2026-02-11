# 🌐 TrustBridge Web Demo

## Quick Start

### Start the Demo
```bash
./start-demo.sh
```

Or manually:
```bash
bun demo-server.ts
```

### Open in Browser
```
http://localhost:3000
```

## Features

### Interactive Form
- **From/To**: User IDs for sender and recipient
- **Amount**: Transfer amount in source currency
- **Currency**: USD, EUR, GBP support
- **Target Chain**: Polygon, Ethereum, Arbitrum, Optimism, Base

### Live Workflow Execution
Watch the workflow execute in real-time:

1. **KYC Verification** ✅
   - Verifies sender and recipient
   - Shows risk score

2. **AI Route Optimization** 🤖
   - Finds optimal cross-chain path
   - Shows fee, time, and reliability

3. **FX Rate Aggregation** 💱
   - Fetches best exchange rate
   - Shows provider and spread

4. **Risk Assessment** ⚠️
   - Calculates risk score
   - Blocks high-risk transactions

5. **Execute Transfer** 💸
   - Generates transaction hash
   - Shows confirmation

### Results Display
- Amount sent and received
- Total fee and percentage
- Transfer time
- **Savings vs traditional (92%)**

## Demo Data

Default test values:
- **From**: user_alice_123
- **To**: user_bob_456
- **Amount**: $1,000 USD
- **Target**: EUR on Polygon

Try different amounts and chains to see routing optimization!

## What It Demonstrates

✅ **All 4 Prize Tracks:**
- Privacy: Confidential workflow execution
- AI: Intelligent route optimization
- Risk: Real-time risk assessment
- DeFi: Cross-chain token transfers

✅ **Performance:**
- 0.50% fee (vs 6-7% traditional)
- 5-minute transfers (vs 2-5 days)
- 99% reliability

✅ **User Experience:**
- Simple, intuitive interface
- Real-time progress updates
- Clear cost breakdown

## Technical Stack

- **Frontend**: Vanilla HTML/CSS/JS
- **Backend**: Bun server
- **Modules**: TypeScript workflows (ES modules)
- **Components**: AI routing, risk engine, FX aggregator

## Customization

Edit `demo.html` to:
- Change styling
- Add more currencies
- Modify form fields
- Customize results display

## Production Deployment

For production, this would connect to:
- Real CRE workflows
- Deployed smart contracts
- Live API endpoints (KYC, FX, Sanctions)
- Private Transactions (Feb 14+)

## Screenshots for Demo Video

Capture these screens:
1. Form with default values
2. Processing animation
3. Step-by-step execution
4. Final success screen with metrics

Perfect for the 3-5 minute demo video! 🎥
