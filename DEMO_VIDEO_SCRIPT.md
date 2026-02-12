# 🎬 TrustBridge Demo Video Script

**Target Length:** 3-5 minutes  
**Goal:** Show judges how TrustBridge solves the $30B remittance fee problem

---

## 📋 Before Recording

### Setup Checklist:
- [ ] Start web server: `./start-web3.sh`
- [ ] Open browser to http://localhost:3000
- [ ] Have MetaMask ready (Sepolia network)
- [ ] Close unnecessary tabs/windows
- [ ] Test your microphone
- [ ] Practice once without recording

### Recording Tools:
- **Screen recorder**: OBS Studio (free), Loom, or built-in screen recorder
- **Audio**: Clear microphone, quiet room
- **Resolution**: 1080p recommended

---

## 🎥 Demo Script (3-5 minutes)

### INTRO (30 seconds)

**[Show GitHub README or title slide]**

> "Hi, I'm [Your Name], and this is TrustBridge - a privacy-preserving cross-border remittance platform built for the Chainlink Convergence Hackathon.
>
> Traditional remittances cost 6-7% in fees and take 2-5 days. That's $30 billion wasted annually. TrustBridge reduces fees to 0.5% and completes transfers in 5 minutes - a 92% cost savings."

---

### THE PROBLEM (30 seconds)

**[Show web interface - don't interact yet]**

> "Let me show you how it works. Imagine sending $1,000 from the US to Europe. With traditional services like Western Union, you'd pay $60-70 in fees and wait days.
>
> With TrustBridge, you pay just $5 and it's done in minutes."

---

### THE SOLUTION (2-3 minutes)

**[Start interacting with the interface]**

#### 1. Connect Wallet (20 seconds)

> "First, users connect their Web3 wallet. TrustBridge supports MetaMask, Coinbase Wallet, WalletConnect, and Trust Wallet."

**[Click "Connect Wallet" → Select MetaMask → Approve connection]**

> "I'm connecting with MetaMask on Sepolia testnet where our contracts are deployed."

#### 2. Fill Transfer Form (30 seconds)

> "Now let's send $1,000 from USD to EUR, from Ethereum to Polygon."

**[Fill in the form:]**
- Amount: 1000
- From Currency: USD
- To Currency: EUR
- From Chain: Ethereum
- To Chain: Polygon

> "Behind the scenes, TrustBridge uses Chainlink Runtime Environment to orchestrate five critical steps."

#### 3. Execute Transfer (90 seconds)

**[Click "Send Transfer" and narrate each step as it animates]**

> "Step 1: KYC Verification - Using Chainlink's Confidential HTTP, we verify identity privately without exposing personal data.
>
> Step 2: FX Rate Lookup - We aggregate real-time exchange rates from multiple sources to get the best rate. Currently 1 USD equals 0.84 EUR.
>
> Step 3: AI Route Optimization - Our AI finds the cheapest cross-chain path. In this case: Ethereum to Arbitrum to Polygon, saving 40% on gas fees.
>
> Step 4: Risk Assessment - Real-time fraud detection checks the transaction. This one is low risk and approved.
>
> Step 5: Smart Contract Execution - The transfer executes on our deployed contracts on Sepolia testnet."

**[Wait for "Transfer Complete" message]**

#### 4. Show Results (30 seconds)

> "And we're done! The recipient gets €840, we paid just $5 in fees - that's 0.5% compared to the typical 6-7%.
>
> That's a 92% cost savings, and it took 5 minutes instead of 2-5 days."

---

### TECHNICAL HIGHLIGHTS (45 seconds)

**[Can show code/contracts or stay on results screen]**

> "TrustBridge is built on:
>
> - **Chainlink Runtime Environment** for workflow orchestration
> - **Confidential HTTP** for privacy-preserving KYC
> - **AI-powered routing** for cost optimization
> - **Smart contracts** deployed on Sepolia - you can verify them on Etherscan
> - **Real FX APIs** for live exchange rates
>
> The platform is production-ready and targets four prize tracks: Privacy, CRE & AI, Risk & Compliance, and DeFi & Tokenization."

---

### CLOSING (15 seconds)

**[Show GitHub repo or final slide]**

> "TrustBridge makes cross-border payments faster, cheaper, and more private. Check out the full code on GitHub, and thank you for watching!"

---

## 🎯 Key Points to Emphasize

1. **The Problem**: $30B wasted on remittance fees
2. **The Solution**: 92% cost savings, 5-minute transfers
3. **The Tech**: Chainlink CRE, AI routing, privacy-preserving
4. **The Demo**: Live working interface with real contracts
5. **The Impact**: Real-world utility for millions of people

---

## 💡 Pro Tips

### Do:
- ✅ Speak clearly and enthusiastically
- ✅ Show the working demo (most important!)
- ✅ Mention Chainlink technologies used
- ✅ Highlight the cost savings (92%)
- ✅ Keep it under 5 minutes

### Don't:
- ❌ Spend too long on setup/intro
- ❌ Get stuck on technical details
- ❌ Apologize for anything
- ❌ Go over 5 minutes
- ❌ Forget to show the actual demo!

---

## 📤 After Recording

### Checklist:
- [ ] Watch the video - does it flow well?
- [ ] Check audio quality
- [ ] Trim any dead air/mistakes
- [ ] Export in high quality (1080p, MP4)
- [ ] Upload to YouTube (unlisted) or hackathon platform
- [ ] Add video link to GitHub README

---

## 🔗 What to Show

**Must Show:**
1. The web interface
2. Wallet connection
3. Transfer form
4. All 5 workflow steps animating
5. Final results with cost savings

**Nice to Have:**
- GitHub repo
- Deployed contract on Etherscan
- Architecture diagram
- Code snippets

---

## 🎬 Ready to Record?

1. Start the web server: `./start-web3.sh`
2. Open http://localhost:3000
3. Start your screen recorder
4. Follow this script
5. Have fun and be confident!

**You've built something amazing - now show it off!** 🚀

---

## 📞 Need Help?

If you get stuck:
- Practice without recording first
- Record in segments and edit together
- Keep it simple - the demo speaks for itself
- Remember: Judges want to see it WORK, not perfection

**Good luck!** 🎉
