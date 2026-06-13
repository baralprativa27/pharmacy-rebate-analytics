-- ============================================
-- Project: Pharmacy Rebate Analytics Dashboard
-- File: 03_plan_performance.sql
-- Purpose:
-- Analyze rebate performance, total cost,
-- and rebate percentage across insurance plans.
--
-- Optimization Notes:
-- Pre-aggregate claims at plan level to reduce
-- repeated computation and simplify metric logic.
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
    ps.total_cost,
    ps.total_rebate,

    ROUND(
        ps.total_rebate / NULLIF(ps.total_cost, 0) * 100,
        2
    ) AS rebate_percentage

FROM plan_summary ps
JOIN plans p
    ON ps.plan_id = p.plan_id

ORDER BY ps.total_rebate DESC;
