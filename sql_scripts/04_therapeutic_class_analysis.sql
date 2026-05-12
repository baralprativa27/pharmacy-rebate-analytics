SELECT
    d.therapeutic_class,
    COUNT(c.claim_id) AS total_claims,
    SUM(c.total_cost) AS total_cost,
    SUM(c.rebate_amount) AS total_rebate,
    
    ROUND(
        AVG(c.rebate_amount),
        2
    ) AS avg_rebate
FROM claims c
JOIN drugs d
    ON c.drug_id = d.drug_id
GROUP BY d.therapeutic_class
ORDER BY total_rebate DESC;
