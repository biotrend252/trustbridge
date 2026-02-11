## API Integration Guide

### 1. KYC Provider Options

**Onfido** (Recommended)
```typescript
const response = await this.http.confidentialPost({
  url: 'https://api.onfido.com/v3/checks',
  headers: {
    'Authorization': `Token token=${process.env.ONFIDO_API_KEY}`,
  },
  body: {
    applicant_id: senderId,
    report_names: ['identity_enhanced'],
  },
});
```

**Jumio**
```typescript
const response = await this.http.confidentialPost({
  url: 'https://api.jumio.com/api/v4/verifications',
  headers: {
    'Authorization': `Bearer ${process.env.JUMIO_API_KEY}`,
  },
  body: { userId: senderId },
});
```

### 2. FX Rate Providers

**Fixer.io**
```typescript
const response = await this.http.confidentialGet({
  url: `https://api.fixer.io/latest`,
  params: { base: from, symbols: to },
  headers: { 'apikey': process.env.FIXER_API_KEY },
});
```

**CurrencyLayer**
```typescript
const response = await this.http.confidentialGet({
  url: 'https://api.currencylayer.com/live',
  params: { 
    access_key: process.env.CURRENCYLAYER_KEY,
    source: from,
    currencies: to,
  },
});
```

### 3. Sanctions Screening

**ComplyAdvantage**
```typescript
const response = await this.http.confidentialPost({
  url: 'https://api.complyadvantage.com/searches',
  headers: {
    'Authorization': `Bearer ${process.env.COMPLY_API_KEY}`,
  },
  body: {
    search_term: userId,
    fuzziness: 0.6,
  },
});
```

**Chainalysis**
```typescript
const response = await this.http.confidentialPost({
  url: 'https://api.chainalysis.com/api/risk/v2/entities',
  headers: {
    'Token': process.env.CHAINALYSIS_KEY,
  },
  body: { address: walletAddress },
});
```

### 4. AI Routing (OpenAI)

```typescript
const response = await this.http.post({
  url: 'https://api.openai.com/v1/chat/completions',
  headers: {
    'Authorization': `Bearer ${process.env.OPENAI_API_KEY}`,
  },
  body: {
    model: 'gpt-4',
    messages: [{
      role: 'user',
      content: `Find optimal route from ${sourceChain} to ${targetChain} for ${amount} USD`,
    }],
  },
});
```

### Cost Estimates (Monthly)

- **Onfido**: $2-5 per check
- **Fixer.io**: Free tier (1000 requests/month)
- **ComplyAdvantage**: $0.10-0.50 per search
- **OpenAI**: $0.03 per 1K tokens

### Free Alternatives for Testing

- **KYC**: Mock service or Persona (sandbox)
- **FX**: exchangerate-api.com (free tier)
- **Sanctions**: OFAC public list (free)
- **AI**: Local LLM or rule-based routing
