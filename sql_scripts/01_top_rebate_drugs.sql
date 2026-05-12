-- ============================================
-- Project: Pharmacy Rebate Analytics Dashboard
-- File: 01_top_rebate_drugs.sql
-- Purpose:
-- Identify top rebate-generating drugs and
-- analyze therapeutic class contribution.
-- ============================================

SELECT
    d.drug_name,
    SUM(c.rebate_amount) AS total_rebate
FROM claims c
JOIN drugs d
    ON c.drug_id = d.drug_id
GROUP BY d.drug_name
ORDER BY total_rebate DESC;
