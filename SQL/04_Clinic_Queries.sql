SELECT sales_channel, SUM(amount) AS revenue
WHERE date_part('year', datetime) = 2021
GROUP BY 1
)
SELECT
COALESCE(r.month, e.month) AS month,
COALESCE(r.revenue,0) AS revenue,
COALESCE(e.expense,0) AS expense,
COALESCE(r.revenue,0) - COALESCE(e.expense,0) AS profit,
CASE WHEN COALESCE(r.revenue,0) - COALESCE(e.expense,0) > 0 THEN 'profitable' ELSE 'not-profitable' END AS status
FROM rev r
FULL OUTER JOIN exp e USING (month)
ORDER BY month;


-- B4: For each city find the most profitable clinic for a given month (example: 2021-09)
WITH target_rev AS (
SELECT date_trunc('month', cs.datetime) AS month, cs.cid, SUM(cs.amount) AS revenue
FROM clinic_sales cs
WHERE date_trunc('month', cs.datetime) = date_trunc('month', TIMESTAMP '2021-09-01')
GROUP BY 1,2
),
exp_tbl AS (
SELECT date_trunc('month', e.datetime) AS month, e.cid, SUM(e.amount) AS expense
FROM expenses e
WHERE date_trunc('month', e.datetime) = date_trunc('month', TIMESTAMP '2021-09-01')
GROUP BY 1,2
),
profit AS (
SELECT t.cid, (COALESCE(t.revenue,0) - COALESCE(ex.expense,0)) AS profit
FROM target_rev t
LEFT JOIN exp_tbl ex ON ex.cid = t.cid AND ex.month = t.month
)
SELECT cl.city, p.cid, cl.clinic_name, p.profit
FROM (
SELECT c.cid, c.profit,
ROW_NUMBER() OVER (PARTITION BY cl.city ORDER BY c.profit DESC) rn
FROM profit c
JOIN clinics cl ON cl.cid = c.cid
) p
JOIN clinics cl ON cl.cid = p.cid
WHERE p.rn = 1;


-- B5: For each state find the second least profitable clinic for a given month (example: 2021-09)
WITH profit_per_clinic AS (
SELECT cl.state, cl.cid,
COALESCE(rev_tbl.revenue,0) - COALESCE(exp_tbl.expense,0) AS profit
FROM clinics cl
LEFT JOIN (
SELECT cid, SUM(amount) AS revenue
FROM clinic_sales
WHERE date_trunc('month', datetime) = date_trunc('month', TIMESTAMP '2021-09-01')
GROUP BY cid
) rev_tbl ON rev_tbl.cid = cl.cid
LEFT JOIN (
SELECT cid, SUM(amount) AS expense
FROM expenses
WHERE date_trunc('month', datetime) = date_trunc('month', TIMESTAMP '2021-09-01')
GROUP BY cid
) exp_tbl ON exp_tbl.cid = cl.cid
)
SELECT state, cid, profit
FROM (
SELECT *,
ROW_NUMBER() OVER (PARTITION BY state ORDER BY profit ASC) rn
FROM profit_per_clinic
) t
WHERE rn = 2;