-- ============================================
-- Project: Pharmacy Rebate Analytics Dashboard
-- File: 07_high_cost_drugs.sql
-- Purpose:
-- Identify drugs contributing highest total pharmacy spend.
-- ============================================

SELECT
    d.drug_name,
    d.therapeutic_class,

    COUNT(c.claim_id) AS total_claims,
    ROUND(SUM(c.total_cost), 2) AS total_cost
    
    ROUND(
        AVG(c.total_cost),
        2
    ) AS average_claim_cost

FROM claims c
JOIN drugs d
    ON c.drug_id = d.drug_id

GROUP BY
    d.drug_name,
    d.therapeutic_class

ORDER BY total_cost DESC;
