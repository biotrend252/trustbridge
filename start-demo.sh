#!/bin/bash

echo "🌐 Starting TrustBridge Web Demo..."
echo ""

export PATH="$HOME/.bun/bin:$PATH"

# Check if bun is available
if ! command -v bun &> /dev/null; then
    echo "❌ Bun not found. Please install Bun first."
    exit 1
fi

echo "📦 Installing dependencies..."
cat > package.json << 'EOF'
{
  "name": "trustbridge-demo",
  "type": "module",
  "scripts": {
    "dev": "bun --hot demo-server.ts"
  }
}
EOF

echo "🚀 Starting development server..."
echo ""
echo "Open your browser to: http://localhost:3000"
echo "Press Ctrl+C to stop"
echo ""

bun --hot demo-server.ts
