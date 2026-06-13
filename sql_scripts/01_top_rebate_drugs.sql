-- ============================================
-- Project: Pharmacy Rebate Analytics Dashboard
-- File: 01_top_rebate_drugs.sql
-- Purpose:
-- Identify top rebate-generating drugs and
-- analyze therapeutic class contribution.
--
-- Optimization Notes:
-- Pre-aggregate claims by drug before joining
-- dimension tables to reduce row volume and
-- improve query maintainability.
-- ============================================

WITH rebate_by_drug AS (
    SELECT
        drug_id,
        SUM(rebate_amount) AS total_rebate
    FROM claims
    GROUP BY drug_id
)

SELECT
    d.drug_name,
    d.therapeutic_class,
    ROUND(rbd.total_rebate, 2) AS total_rebate

FROM rebate_by_drug rbd

JOIN drugs d
    ON rbd.drug_id = d.drug_id

ORDER BY total_rebate DESC;
