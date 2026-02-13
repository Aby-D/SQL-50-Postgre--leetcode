-- Write your PostgreSQL query statement below
SELECT I.product_id, I.year AS first_year, I.quantity, I.price
FROM Sales I JOIN
(SELECT product_id, MIN(year) AS year  FROM Sales 
GROUP BY product_id)II
ON I.product_id=II.product_id AND I.year=II.year