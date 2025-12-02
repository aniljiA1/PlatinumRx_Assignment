SELECT u.user_id, b.room_no, b.booking_date
SUM(bc.item_quantity * i.item_rate) AS bill_amount
FROM booking_commercials bc
JOIN items i ON i.item_id = bc.item_id
WHERE bc.bill_date >= '2021-10-01'::date
AND bc.bill_date < '2021-11-01'::date
GROUP BY bc.bill_id
HAVING SUM(bc.item_quantity * i.item_rate) > 1000;


-- A4: Most ordered and least ordered item of each month of year 2021
WITH monthly_item_qty AS (
SELECT
date_trunc('month', bc.bill_date) AS month,
bc.item_id,
i.item_name,
SUM(bc.item_quantity) AS total_qty
FROM booking_commercials bc
JOIN items i USING (item_id)
WHERE bc.bill_date >= '2021-01-01'::date
AND bc.bill_date < '2022-01-01'::date
GROUP BY 1, 2, 3
),
ranked AS (
SELECT *,
ROW_NUMBER() OVER (PARTITION BY month ORDER BY total_qty DESC) AS rn_desc,
ROW_NUMBER() OVER (PARTITION BY month ORDER BY total_qty ASC) AS rn_asc
FROM monthly_item_qty
)
SELECT month, item_id, item_name, total_qty, 'most_ordered' AS kind
FROM ranked WHERE rn_desc = 1
UNION ALL
SELECT month, item_id, item_name, total_qty, 'least_ordered' AS kind
FROM ranked WHERE rn_asc = 1
ORDER BY month, kind;


-- A5: Customers with the second highest bill value of each month of 2021
WITH bill_totals AS (
SELECT
date_trunc('month', bc.bill_date) AS month,
bc.bill_id,
bc.booking_id,
bk.user_id,
SUM(bc.item_quantity * i.item_rate) AS bill_amount
FROM booking_commercials bc
LEFT JOIN bookings bk ON bk.booking_id = bc.booking_id
JOIN items i ON i.item_id = bc.item_id
WHERE bc.bill_date >= '2021-01-01'::date
AND bc.bill_date < '2022-01-01'::date
GROUP BY 1,2,3,4
),
ranked AS (
SELECT bt.*,
DENSE_RANK() OVER (PARTITION BY month ORDER BY bill_amount DESC) AS amt_rank
FROM bill_totals bt
)
SELECT month, bill_id, booking_id, user_id, bill_amount
FROM ranked
WHERE amt_rank = 2
ORDER BY month;