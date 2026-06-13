-- ============================================
-- Project: Pharmacy Rebate Analytics Dashboard
-- File: 01_top_rebate_drugs.sql
-- Purpose:
-- Identify top rebate-generating drugs and
-- analyze therapeutic class contribution.
--
-- Optimization Notes:
-- Pre-aggregate claims by drug to reduce row
-- volume before joining dimension tables.
-- This improves performance at scale.
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
    rbd.total_rebate

FROM rebate_by_drug rbd

JOIN drugs d
    ON rbd.drug_id = d.drug_id

ORDER BY rbd.total_rebate DESC;
