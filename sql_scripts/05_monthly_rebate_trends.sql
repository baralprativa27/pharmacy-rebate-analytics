-- ============================================
-- Project: Pharmacy Rebate Analytics Dashboard
-- File: 05_monthly_rebate_trends.sql
-- Purpose:
-- Monitor monthly trends in claims,
-- total cost, and rebate recovery.
--
-- Optimization Notes:
-- Group by month-level truncated date instead
-- of string formatting for better performance
-- and time-series consistency.
-- ============================================

WITH monthly_summary AS (
    SELECT
        TRUNC(claim_date, 'MM') AS claim_month,
        COUNT(claim_id) AS total_claims,
        SUM(total_cost) AS total_cost,
        SUM(rebate_amount) AS total_rebate
    FROM claims
    GROUP BY TRUNC(claim_date, 'MM')
)

SELECT
    TO_CHAR(claim_month, 'YYYY-MM') AS claim_month,
    total_claims,
    total_cost,
    total_rebate
FROM monthly_summary
ORDER BY claim_month;
