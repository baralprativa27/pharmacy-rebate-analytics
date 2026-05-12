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

    SUM(total_cost) - SUM(rebate_amount) AS net_cost,

    ROUND(
        (SUM(rebate_amount) / SUM(total_cost)) * 100,
        2
    ) AS rebate_percentage,

    ROUND(
        (
            (SUM(rebate_amount) - SUM(total_cost * r.rebate_rate))
            / SUM(total_cost * r.rebate_rate)
        ) * 100,
        2
    ) AS rebate_variance_percentage

FROM claims c
JOIN rebate r
    ON c.drug_id = r.drug_id;
