-- ============================================
-- Project: Pharmacy Rebate Analytics Dashboard
-- File: 04_therapeutic_class_analysis.sql
-- Purpose:
-- Evaluate rebate and cost performance
-- across therapeutic classes.
--
-- Optimization Notes:
-- Join claims with drugs to enrich therapeutic class
-- before aggregating at class level for reporting.
-- ============================================

WITH claim_enriched AS (
    SELECT
        d.therapeutic_class,
        c.claim_id,
        c.total_cost,
        c.rebate_amount
    FROM claims c
    JOIN drugs d
        ON c.drug_id = d.drug_id
)

SELECT
    therapeutic_class,
    COUNT(claim_id) AS total_claims,
    SUM(total_cost) AS total_cost,
    SUM(rebate_amount) AS total_rebate,

    ROUND(AVG(rebate_amount), 2) AS avg_rebate

FROM claim_enriched
GROUP BY therapeutic_class
ORDER BY total_rebate DESC;
