-- ============================================
-- Project: Pharmacy Rebate Analytics Dashboard
-- File: 02_rebate_leakage_analysis.sql
-- Purpose:
-- Compare expected rebate vs actual rebate
-- to identify potential rebate leakage.
--
-- Optimization Notes:
-- Aggregate claim metrics at drug level and
-- calculate expected rebate before joining
-- the drugs dimension.
-- ============================================

WITH claim_summary AS (
    SELECT
        c.drug_id,
        SUM(c.total_cost) AS total_cost,
        SUM(c.rebate_amount) AS actual_rebate,
        SUM(c.total_cost * r.rebate_rate) AS expected_rebate
    FROM claims c
    JOIN rebate r
        ON c.drug_id = r.drug_id
    GROUP BY c.drug_id
)

SELECT
    d.drug_name,

    ROUND(cs.total_cost, 2) AS total_cost,
    ROUND(cs.actual_rebate, 2) AS actual_rebate,
    ROUND(cs.expected_rebate, 2) AS expected_rebate,

    ROUND(
        cs.actual_rebate - cs.expected_rebate,
        2
    ) AS rebate_variance,

    ROUND(
        (cs.actual_rebate - cs.expected_rebate)
        / NULLIF(cs.expected_rebate, 0) * 100,
        2
    ) AS rebate_variance_pct

FROM claim_summary cs
JOIN drugs d
    ON cs.drug_id = d.drug_id

ORDER BY rebate_variance_pct DESC;
