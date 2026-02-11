import { FXRateAggregator } from './workflows/fx-aggregator';

console.log('🧪 Testing Real FX API Integration\n');

const fxAggregator = new FXRateAggregator();

console.log('Fetching real USD → EUR rate...');
const rate = await fxAggregator.getRate('USD', 'EUR');

console.log('\n✅ Real API Response:');
console.log('Provider:', rate.provider);
console.log('Rate:', rate.rate);
console.log('Spread:', (rate.spread * 100).toFixed(2) + '%');
console.log('Timestamp:', new Date(rate.timestamp).toLocaleString());

const amount = 1000;
const received = fxAggregator.calculateReceivedAmount(amount, rate.rate, rate.spread);
console.log(`\n💰 $${amount} USD = €${received.toFixed(2)} EUR`);
console.log('\n✅ Real API integration working!');
