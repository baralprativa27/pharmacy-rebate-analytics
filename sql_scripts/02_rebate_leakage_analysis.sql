-- ============================================
-- Project: Pharmacy Rebate Analytics Dashboard
-- File: 02_rebate_leakage_analysis.sql
-- Purpose:
-- Compare expected rebate vs actual rebate
-- to identify potential rebate leakage.
-- ============================================

SELECT
    d.drug_name,
    c.total_cost,
    c.rebate_amount AS actual_rebate,
    ROUND(c.total_cost * (r.rebate_rate / 100), 2) AS expected_rebate,
    
    ROUND(
        (c.total_cost * (r.rebate_rate / 100))
        - c.rebate_amount,
        2
    ) AS rebate_variance
FROM claims c
JOIN drugs d
    ON c.drug_id = d.drug_id
JOIN rebate r
    ON c.drug_id = r.drug_id
ORDER BY rebate_variance DESC;
