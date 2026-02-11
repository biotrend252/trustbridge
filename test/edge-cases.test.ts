import { RiskAssessmentEngine } from '../workflows/risk-engine';

console.log('=== Risk Assessment Edge Cases ===\n');

const riskEngine = new RiskAssessmentEngine();

// Test Case 1: High amount, low KYC score
console.log('Test 1: High Amount Transaction');
const test1 = riskEngine.assess({
  amount: 15000,
  kycScore: 20,
  transactionHistory: 50,
  velocityCheck: true,
});
console.log('Amount: $15,000, KYC: 20');
console.log('Result:', test1.riskLevel, '- Score:', test1.score);
console.log('Blocked:', test1.blocked, '| Manual Review:', test1.requiresManualReview);
console.log('');

// Test Case 2: New user, medium amount
console.log('Test 2: New User');
const test2 = riskEngine.assess({
  amount: 2000,
  kycScore: 30,
  transactionHistory: 2,
  velocityCheck: true,
});
console.log('Amount: $2,000, History: 2 transactions');
console.log('Result:', test2.riskLevel, '- Score:', test2.score);
console.log('Blocked:', test2.blocked, '| Manual Review:', test2.requiresManualReview);
console.log('');

// Test Case 3: High risk user
console.log('Test 3: High Risk User');
const test3 = riskEngine.assess({
  amount: 5000,
  kycScore: 85,
  transactionHistory: 3,
  velocityCheck: false,
});
console.log('Amount: $5,000, KYC: 85, Velocity: Failed');
console.log('Result:', test3.riskLevel, '- Score:', test3.score);
console.log('Blocked:', test3.blocked, '| Manual Review:', test3.requiresManualReview);
console.log('');

// Test Case 4: Critical risk - should block
console.log('Test 4: Critical Risk (Should Block)');
const test4 = riskEngine.assess({
  amount: 20000,
  kycScore: 90,
  transactionHistory: 1,
  velocityCheck: false,
  geolocation: 'XX',
});
console.log('Amount: $20,000, KYC: 90, High-risk country');
console.log('Result:', test4.riskLevel, '- Score:', test4.score);
console.log('Blocked:', test4.blocked, '| Reason:', test4.reason);
console.log('');

// Test Case 5: Perfect user
console.log('Test 5: Low Risk User');
const test5 = riskEngine.assess({
  amount: 500,
  kycScore: 10,
  transactionHistory: 100,
  velocityCheck: true,
});
console.log('Amount: $500, KYC: 10, History: 100 transactions');
console.log('Result:', test5.riskLevel, '- Score:', test5.score);
console.log('Blocked:', test5.blocked, '| Manual Review:', test5.requiresManualReview);
console.log('');

console.log('✅ All edge cases tested');
