-- ============================================
-- Project: Pharmacy Rebate Analytics Dashboard
-- File: 02_rebate_leakage_analysis.sql
-- Purpose:
-- Compare expected rebate vs actual rebate
-- to identify potential rebate leakage.
-- ============================================

SELECT
    d.drug_name,
    ROUND(SUM(c.total_cost), 2) AS total_cost,
    ROUND(SUM(c.rebate_amount), 2) AS actual_rebate,
    ROUND(SUM(c.total_cost * r.rebate_rate), 2) AS expected_rebate,
    ROUND(
        (
            (
                SUM(c.rebate_amount)
                - SUM(c.total_cost * r.rebate_rate)
            )
            / SUM(c.total_cost * r.rebate_rate)
        ) * 100, 2) AS rebate_variance_pct
FROM claims c
JOIN drugs d
    ON c.drug_id = d.drug_id
JOIN rebate r
    ON c.drug_id = r.drug_id
GROUP BY d.drug_name
ORDER BY rebate_variance_pct DESC;
