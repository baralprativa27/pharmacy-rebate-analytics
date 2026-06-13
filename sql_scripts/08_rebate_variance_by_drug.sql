-- ============================================
-- Project: Pharmacy Rebate Analytics Dashboard
-- File: 08_rebate_variance_by_drug.sql
-- Purpose:
-- Compare expected and actual rebate values
-- by drug to detect rebate variance trends.
--
-- Optimization Notes:
-- Pre-aggregate claim metrics by drug before
-- joining dimension tables to reduce join
-- volume and improve scalability for large datasets.
-- ============================================

WITH claim_summary AS (
    SELECT
        drug_id,
        SUM(total_cost) AS total_cost,
        SUM(rebate_amount) AS actual_rebate
    FROM claims
    GROUP BY drug_id
)

SELECT
    d.drug_name,
    
    cs.actual_rebate,
    
    ROUND(
        cs.total_cost * (r.rebate_rate / 100.0),
        2
    ) AS expected_rebate,
    
    ROUND(
        (cs.total_cost * (r.rebate_rate / 100.0))
        - cs.actual_rebate,
        2
    ) AS rebate_variance

FROM claim_summary cs

JOIN drugs d
    ON cs.drug_id = d.drug_id

JOIN rebate r
    ON cs.drug_id = r.drug_id

ORDER BY rebate_variance DESC;
