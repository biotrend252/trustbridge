#!/bin/bash

source .env

echo "Testing FX API..."
curl "https://v6.exchangerate-api.com/v6/${FX_API_KEY}/latest/USD"
echo ""
echo "✅ If you see JSON data above with conversion_rates, your API key works!"
