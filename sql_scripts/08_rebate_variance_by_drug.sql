-- ============================================
-- Project: Pharmacy Rebate Analytics Dashboard
-- File: 08_rebate_variance_by_drug.sql
-- Purpose:
-- Compare expected and actual rebate values
-- by drug to detect rebate variance trends.
-- ============================================

SELECT
    d.drug_name,

    SUM(c.rebate_amount) AS actual_rebate,

    ROUND(
        SUM(c.total_cost * (r.rebate_rate / 100)),
        2
    ) AS expected_rebate,

    ROUND(
        SUM(c.total_cost * (r.rebate_rate / 100))
        - SUM(c.rebate_amount),
        2
    ) AS rebate_variance

FROM claims c

JOIN drugs d
    ON c.drug_id = d.drug_id

JOIN rebate r
    ON c.drug_id = r.drug_id

GROUP BY
    d.drug_name

ORDER BY rebate_variance DESC;
