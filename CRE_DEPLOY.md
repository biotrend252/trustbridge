# CRE Workflow Deployment Guide

## Step 1: Create CRE Account (5 min)

1. Go to: https://platform.chain.link
2. Sign up with email
3. Verify email
4. Enable 2FA (required)

## Step 2: Login with CLI (2 min)

```bash
export PATH="$HOME/.cre/bin:$PATH"
cre login
```

Follow the prompts to authenticate.

## Step 3: Initialize Project (3 min)

```bash
cd /home/yourusername/kirocli/trustbridge

# Initialize CRE project
cre init --project-name trustbridge --workflow-name remittance

# This creates:
# - .cre/ directory
# - cre.yaml configuration
# - Workflow structure
```

## Step 4: Configure Workflow (5 min)

Edit `cre.yaml`:

```yaml
version: 1
workflows:
  - name: remittance
    trigger:
      type: http
    runtime: typescript
    entry: workflows/remittance.ts
```

## Step 5: Test Simulation (2 min)

```bash
# Test locally first
cre workflow simulate --workflow remittance

# With test data
cre workflow simulate --workflow remittance --data '{
  "senderId": "user_alice_123",
  "recipientId": "user_bob_456",
  "amount": 1000,
  "sourceCurrency": "USD",
  "targetCurrency": "EUR",
  "sourceChain": "ethereum",
  "targetChain": "polygon"
}'
```

## Step 6: Deploy to CRE Network (5 min)

```bash
# Deploy workflow
cre workflow deploy --workflow remittance

# This will:
# - Upload your workflow code
# - Deploy to CRE network
# - Return a workflow ID
# - Give you a trigger URL
```

## Step 7: Test Deployed Workflow (2 min)

```bash
# Trigger the deployed workflow
cre workflow trigger --workflow remittance --data '{
  "senderId": "user_alice_123",
  "amount": 1000
}'

# Or use the HTTP endpoint
curl -X POST https://cre.chain.link/workflows/YOUR_WORKFLOW_ID \
  -H "Content-Type: application/json" \
  -d '{"senderId":"user_alice_123","amount":1000}'
```

## Step 8: Monitor Execution (1 min)

```bash
# View workflow runs
cre workflow runs --workflow remittance

# View logs
cre workflow logs --workflow remittance --run-id RUN_ID
```

---

## Total Time: ~25 minutes
## Cost: FREE (CRE is free during hackathon)

## What You Get:
✅ Deployed CRE workflow  
✅ Workflow ID for submission  
✅ HTTP trigger endpoint  
✅ Execution logs  
✅ Production-ready deployment  

## For Submission:
Include in your hackathon submission:
- Workflow ID
- Trigger URL
- Example execution logs
- Screenshots of CRE dashboard

This proves your workflow runs on CRE! 🎉
