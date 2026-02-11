const server = Bun.serve({
  port: 3000,
  async fetch(req) {
    const url = new URL(req.url);
    
    // Serve Web3 App
    if (url.pathname === '/' || url.pathname === '/index.html') {
      const file = Bun.file('./web3-app.html');
      return new Response(file, {
        headers: { 'Content-Type': 'text/html' }
      });
    }
    
    // Serve demo HTML
    if (url.pathname === '/demo.html') {
      const file = Bun.file('./demo.html');
      return new Response(file, {
        headers: { 'Content-Type': 'text/html' }
      });
    }
    
    // Serve TypeScript modules
    if (url.pathname.startsWith('/workflows/')) {
      const filePath = '.' + url.pathname;
      const file = Bun.file(filePath);
      
      if (await file.exists()) {
        return new Response(file, {
          headers: { 
            'Content-Type': 'application/javascript',
            'Access-Control-Allow-Origin': '*'
          }
        });
      }
    }
    
    return new Response('Not Found', { status: 404 });
  },
});

console.log(`🌐 TrustBridge Web3 App running at http://localhost:${server.port}`);
console.log('');
console.log('✅ Full Web3 interface with wallet connection');
console.log('✅ Connect MetaMask or use Anvil directly');
console.log('✅ Real blockchain transactions');
console.log('');
console.log('Open your browser and connect your wallet!');
