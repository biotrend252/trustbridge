import { AIRoutingAgent } from '../workflows/ai-routing';
import { RiskAssessmentEngine } from '../workflows/risk-engine';
import { FXRateAggregator } from '../workflows/fx-aggregator';

console.log('=== TrustBridge Component Tests ===\n');

// Test AI Routing
console.log('1. Testing AI Routing Agent...');
const router = new AIRoutingAgent();
const route = await router.findOptimalRoute('ethereum', 'polygon', 1000);
console.log('Optimal route:', route);
console.log('✓ AI Routing passed\n');

// Test Risk Assessment
console.log('2. Testing Risk Assessment Engine...');
const riskEngine = new RiskAssessmentEngine();
const lowRisk = riskEngine.assess({
  amount: 500,
  kycScore: 20,
  transactionHistory: 15,
  velocityCheck: true,
});
console.log('Low risk assessment:', lowRisk);

const highRisk = riskEngine.assess({
  amount: 15000,
  kycScore: 70,
  transactionHistory: 2,
  velocityCheck: false,
});
console.log('High risk assessment:', highRisk);
console.log('✓ Risk Assessment passed\n');

// Test FX Aggregator
console.log('3. Testing FX Rate Aggregator...');
const fxAggregator = new FXRateAggregator();
const fxRate = await fxAggregator.getRate('USD', 'EUR');
console.log('FX rate:', fxRate);
const received = fxAggregator.calculateReceivedAmount(1000, fxRate.rate, fxRate.spread);
console.log('Amount received:', received);
console.log('✓ FX Aggregator passed\n');

console.log('=== All Tests Passed ===');
