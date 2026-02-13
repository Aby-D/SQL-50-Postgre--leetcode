-- Write your PostgreSQL query statement below
SELECT P.product_name, SUM(O.unit) AS unit
FROM Products P LEFT JOIN Orders O ON 
P.product_id=O.product_id
WHERE order_date >= '2020-02-01' AND order_date < '2020-03-01'
GROUP BY product_name
HAVING SUM(O.unit)>=100