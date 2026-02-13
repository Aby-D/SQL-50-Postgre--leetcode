-- Write your PostgreSQL query statement below
SELECT A.visited_on, SUM(B.amount) AS amount, ROUND(SUM(B.amount)/7.0, 2) AS average_amount FROM
(SELECT visited_on, SUM(amount) AS amount
FROM Customer
GROUP BY visited_on)A
JOIN
(SELECT  visited_on, SUM(amount) AS amount
FROM Customer
GROUP BY visited_on)B
ON B.visited_on BETWEEN  A.visited_on -INTERVAL '6 DAYS' AND A.visited_on
GROUP BY A.visited_on
HAVING COUNT(B.visited_on)= 7
ORDER BY A.visited_on