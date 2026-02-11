import { AIRoutingAgent } from '../workflows/ai-routing';

console.log('=== AI Routing Scenarios ===\n');

const router = new AIRoutingAgent();

// Scenario 1: Direct route
console.log('Scenario 1: Direct Route (Ethereum → Polygon)');
const route1 = await router.findOptimalRoute('ethereum', 'polygon', 1000);
console.log('Path:', route1.path.join(' → '));
console.log('Fee:', route1.estimatedFee, 'USD | Time:', route1.estimatedTime, 's');
console.log('Reliability:', (route1.reliability * 100).toFixed(2) + '%');
console.log('');

// Scenario 2: Multi-hop route
console.log('Scenario 2: Multi-hop (Arbitrum → Base)');
const route2 = await router.findOptimalRoute('arbitrum', 'base', 5000);
console.log('Path:', route2.path.join(' → '));
console.log('Fee:', route2.estimatedFee, 'USD | Time:', route2.estimatedTime, 's');
console.log('Reliability:', (route2.reliability * 100).toFixed(2) + '%');
console.log('');

// Scenario 3: Via Ethereum hub
console.log('Scenario 3: Via Hub (Optimism → Arbitrum)');
const route3 = await router.findOptimalRoute('optimism', 'arbitrum', 2000);
console.log('Path:', route3.path.join(' → '));
console.log('Fee:', route3.estimatedFee, 'USD | Time:', route3.estimatedTime, 's');
console.log('Reliability:', (route3.reliability * 100).toFixed(2) + '%');
console.log('');

// Scenario 4: Same chain
console.log('Scenario 4: Same Chain (Polygon → Polygon)');
const route4 = await router.findOptimalRoute('polygon', 'polygon', 500);
console.log('Path:', route4.path.join(' → '));
console.log('Fee:', route4.estimatedFee, 'USD | Time:', route4.estimatedTime, 's');
console.log('Reliability:', (route4.reliability * 100).toFixed(2) + '%');
console.log('');

// Scenario 5: Large amount
console.log('Scenario 5: Large Transfer (Ethereum → Base, $50k)');
const route5 = await router.findOptimalRoute('ethereum', 'base', 50000);
console.log('Path:', route5.path.join(' → '));
console.log('Fee:', route5.estimatedFee, 'USD | Time:', route5.estimatedTime, 's');
console.log('Fee %:', (route5.estimatedFee / 50000 * 100).toFixed(3) + '%');
console.log('Reliability:', (route5.reliability * 100).toFixed(2) + '%');
console.log('');

console.log('✅ All routing scenarios tested');
