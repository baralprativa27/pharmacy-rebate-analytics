-- ============================================
-- Project: Pharmacy Rebate Analytics Dashboard
-- File: 09_high_cost_claims_analysis.sql
-- Purpose:
-- Identify high-cost pharmacy claims and
-- analyze their rebate-adjusted financial impact.
--
-- Optimization Notes:
-- Filter applied on fact table before reporting
-- to reduce result set size and improve query
-- performance on large datasets.
-- ============================================

SELECT
    c.claim_id,
    d.drug_name,
    p.plan_name,

    ROUND(c.total_cost, 2) AS total_cost,

    ROUND(c.rebate_amount, 2) AS rebate_amount,

    ROUND(
        c.total_cost - c.rebate_amount,
        2
    ) AS net_cost

FROM claims c

JOIN drugs d
    ON c.drug_id = d.drug_id

JOIN plans p
    ON c.plan_id = p.plan_id

WHERE c.total_cost > 2000

ORDER BY c.total_cost DESC;
