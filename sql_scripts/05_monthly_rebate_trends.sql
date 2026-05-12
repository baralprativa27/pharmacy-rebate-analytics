SELECT
    TO_CHAR(claim_date, 'YYYY-MM') AS claim_month,
    COUNT(claim_id) AS total_claims,
    SUM(total_cost) AS total_cost,
    SUM(rebate_amount) AS total_rebate
FROM claims
GROUP BY TO_CHAR(claim_date, 'YYYY-MM')
ORDER BY claim_month;
