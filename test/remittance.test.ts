/**
 * Test script for TrustBridge workflow
 */

const testRemittance = {
  senderId: "user_123",
  recipientId: "user_456",
  amount: 1000,
  sourceCurrency: "USD",
  targetCurrency: "EUR",
  sourceChain: "ethereum",
  targetChain: "polygon",
};

console.log("Testing TrustBridge Remittance Workflow");
console.log("Request:", JSON.stringify(testRemittance, null, 2));
