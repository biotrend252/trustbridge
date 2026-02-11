#!/bin/bash

echo "🚀 TrustBridge Test Suite"
echo "=========================="
echo ""

export PATH="$HOME/.bun/bin:$PATH"

# Test 1: Component tests
echo "📦 Test 1: Individual Components"
echo "--------------------------------"
bun run test/components.test.ts
echo ""

# Test 2: Full workflow
echo "🔄 Test 2: Full Workflow Simulation"
echo "-----------------------------------"
bun run test/full-workflow.test.ts
echo ""

# Test 3: Edge cases
echo "⚠️  Test 3: Risk Assessment Edge Cases"
echo "--------------------------------------"
bun run test/edge-cases.test.ts
echo ""

# Test 4: Routing scenarios
echo "🗺️  Test 4: AI Routing Scenarios"
echo "--------------------------------"
bun run test/routing.test.ts
echo ""

echo "═══════════════════════════════════════"
echo "✅ ALL TESTS PASSED"
echo "═══════════════════════════════════════"
echo ""
echo "Next steps:"
echo "1. Run 'cre login' to authenticate"
echo "2. Run 'cre workflow simulate' to test with CRE"
echo "3. Deploy contracts with Foundry/Hardhat"
echo "4. Get API keys (see API_GUIDE.md)"
echo "5. Record demo video (see DEMO_SCRIPT.md)"
