-- High Cost Claims Analysis

SELECT
    c.claim_id,
    d.drug_name,
    p.plan_name,

    ROUND(c.total_cost, 2) AS total_cost,

    ROUND(c.rebate_amount, 2) AS rebate_amount,

    ROUND(
        c.total_cost - c.rebate_amount,
        2
    ) AS net_cost

FROM claims c

JOIN drugs d
    ON c.drug_id = d.drug_id

JOIN plans p
    ON c.plan_id = p.plan_id

WHERE c.total_cost > 5000

ORDER BY c.total_cost DESC;
