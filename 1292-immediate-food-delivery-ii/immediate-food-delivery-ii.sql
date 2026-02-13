-- Write your PostgreSQL query statement below
SELECT ROUND (avg (CASE 
WHEN first.order_date=first.customer_pref_delivery_date THEN 1 ELSE 0 END)::NUMERIC* 100, 2) AS immediate_percentage
FROM ( SELECT * ,
RANK () OVER(PARTITION BY customer_id ORDER BY order_date) AS rn
FROM Delivery) AS first
WHERE first.rn=1