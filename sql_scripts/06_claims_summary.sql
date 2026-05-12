-- ============================================
-- Project: Pharmacy Rebate Analytics Dashboard
-- File: 06_claims_summary.sql
-- Purpose:
-- Generate overall pharmacy claims and
-- rebate KPI summary metrics.
-- ============================================

SELECT
    COUNT(claim_id) AS total_claims,

    SUM(total_cost) AS total_cost,

    SUM(rebate_amount) AS total_rebate,

    SUM(total_cost) - SUM(rebate_amount)
        AS net_cost,

    ROUND(
        (SUM(rebate_amount) /
        SUM(total_cost)) * 100,
        2
    ) AS rebate_percentage

FROM claims;







SELECT
    COUNT(claim_id) AS total_claims,
    SUM(total_cost) AS total_cost,
    SUM(rebate_amount) AS total_rebate,
    
    SUM(total_cost) - SUM(rebate_amount)
        AS net_cost,
        
    ROUND(
        SUM(rebate_amount) /
        SUM(total_cost) * 100,
        2
    ) AS rebate_percentage
FROM claims;
