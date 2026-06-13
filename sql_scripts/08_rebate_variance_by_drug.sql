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

    ROUND(cs.actual_rebate, 2) AS actual_rebate,
    ROUND(cs.expected_rebate, 2) AS expected_rebate,

    ROUND(
        cs.expected_rebate - cs.actual_rebate,
        2
    ) AS rebate_variance

FROM claim_summary cs

JOIN drugs d
    ON cs.drug_id = d.drug_id

ORDER BY rebate_variance DESC;
