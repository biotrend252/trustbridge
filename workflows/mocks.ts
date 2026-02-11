/**
 * Mock API responses for local testing
 */

export const mockKYCResponse = {
  verified: true,
  riskScore: 25,
  sanctioned: false,
};

export const mockFXRate = {
  rate: 0.92,
  provider: "MockFX",
  timestamp: Date.now(),
};

export const mockAIRouting = {
  optimalPath: ["ethereum", "polygon", "arbitrum"],
  estimatedFee: 2.5,
  estimatedTime: 180,
};

export const mockSanctionsCheck = {
  blocked: false,
  reason: null,
};
