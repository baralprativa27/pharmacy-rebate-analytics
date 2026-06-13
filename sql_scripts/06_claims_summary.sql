-- ============================================
-- Project: Pharmacy Rebate Analytics Dashboard
-- File: 06_claims_summary.sql
-- Purpose:
-- Generate overall pharmacy claims and
-- rebate KPI summary metrics.
--
-- Optimization Notes:
-- Pre-aggregation using CTE improves readability
-- and is suitable for large-scale claims data.
-- ============================================

WITH claim_summary AS (
    SELECT
        c.drug_id,
        COUNT(c.claim_id) AS total_claims,
        SUM(c.total_cost) AS total_cost,
        SUM(c.rebate_amount) AS total_rebate,
        SUM(c.total_cost * r.rebate_rate) AS expected_rebate
    FROM claims c
    JOIN rebate r
        ON c.drug_id = r.drug_id
    GROUP BY c.drug_id
)

SELECT
    SUM(total_claims) AS total_claims,
    SUM(total_cost) AS total_cost,
    SUM(total_rebate) AS total_rebate,

    SUM(total_cost) - SUM(total_rebate) AS net_cost,

    ROUND(
        SUM(total_rebate) / NULLIF(SUM(total_cost), 0) * 100,
        2
    ) AS rebate_percentage,

    ROUND(
        (SUM(total_rebate) - SUM(expected_rebate))
        / NULLIF(SUM(expected_rebate), 0) * 100,
        2
    ) AS rebate_variance_percentage

FROM claim_summary;
