-- ============================================
-- Project: Pharmacy Rebate Analytics Dashboard
-- File: 03_plan_performance.sql
-- Purpose:
-- Analyze rebate performance, total cost,
-- and rebate percentage across insurance plans.
-- ============================================

SELECT
    p.plan_name,
    p.plan_type,
    COUNT(c.claim_id) AS total_claims,
    SUM(c.total_cost) AS total_cost,
    SUM(c.rebate_amount) AS total_rebate,
    
    ROUND(
        SUM(c.rebate_amount) /
        SUM(c.total_cost) * 100,
        2
    ) AS rebate_percentage
FROM claims c
JOIN plans p
    ON c.plan_id = p.plan_id
GROUP BY
    p.plan_name,
    p.plan_type
ORDER BY total_rebate DESC;
