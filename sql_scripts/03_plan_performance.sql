-- ============================================
-- Project: Pharmacy Rebate Analytics Dashboard
-- File: 03_plan_performance.sql
-- Purpose:
-- Analyze rebate performance, total cost,
-- and rebate percentage across insurance plans.
--
-- Optimization Notes:
-- Aggregate claim metrics at plan level before
-- joining the plans dimension to simplify
-- reporting and metric calculations.
-- ============================================

WITH plan_summary AS (
    SELECT
        c.plan_id,
        COUNT(c.claim_id) AS total_claims,
        SUM(c.total_cost) AS total_cost,
        SUM(c.rebate_amount) AS total_rebate
    FROM claims c
    GROUP BY c.plan_id
)

SELECT
    p.plan_name,
    p.plan_type,
    ps.total_claims,
    ROUND(ps.total_cost, 2) AS total_cost,
    ROUND(ps.total_rebate, 2) AS total_rebate,
 
    ROUND(
        ps.total_rebate / NULLIF(ps.total_cost, 0) * 100,
        2
    ) AS rebate_percentage

FROM plan_summary ps
JOIN plans p
    ON ps.plan_id = p.plan_id

ORDER BY total_rebate DESC;
