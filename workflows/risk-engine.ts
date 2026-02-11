/**
 * Risk Assessment Engine
 */

interface RiskFactors {
  amount: number;
  kycScore: number;
  transactionHistory: number;
  velocityCheck: boolean;
  geolocation?: string;
}

interface RiskResult {
  riskLevel: 'low' | 'medium' | 'high' | 'critical';
  score: number;
  blocked: boolean;
  reason?: string;
  requiresManualReview: boolean;
}

export class RiskAssessmentEngine {
  private readonly THRESHOLDS = {
    low: 30,
    medium: 60,
    high: 80,
    critical: 95,
  };

  private readonly HIGH_RISK_COUNTRIES = ['XX', 'YY', 'ZZ'];

  assess(factors: RiskFactors): RiskResult {
    let score = 0;

    // KYC score weight: 40%
    score += factors.kycScore * 0.4;

    // Amount risk weight: 30%
    if (factors.amount > 10000) score += 30;
    else if (factors.amount > 5000) score += 20;
    else if (factors.amount > 1000) score += 10;

    // Transaction history weight: 20%
    if (factors.transactionHistory < 5) score += 20;
    else if (factors.transactionHistory < 10) score += 10;

    // Velocity check weight: 10%
    if (!factors.velocityCheck) score += 10;

    // Geolocation check
    if (factors.geolocation && this.HIGH_RISK_COUNTRIES.includes(factors.geolocation)) {
      score += 15;
    }

    const riskLevel = this.getRiskLevel(score);
    const blocked = score >= this.THRESHOLDS.critical;
    const requiresManualReview = score >= this.THRESHOLDS.high && !blocked;

    return {
      riskLevel,
      score,
      blocked,
      reason: blocked ? 'Risk score exceeds threshold' : undefined,
      requiresManualReview,
    };
  }

  private getRiskLevel(score: number): 'low' | 'medium' | 'high' | 'critical' {
    if (score >= this.THRESHOLDS.critical) return 'critical';
    if (score >= this.THRESHOLDS.high) return 'high';
    if (score >= this.THRESHOLDS.medium) return 'medium';
    return 'low';
  }
}
