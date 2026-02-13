-- Write your PostgreSQL query statement below
WITH Con AS (SELECT id, num,
LEAD(num) OVER(ORDER BY id) AS next,
Lag(num) OVER(ORDER BY id) AS pre
FROM Logs)
SELECT DISTINCT(num) AS ConsecutiveNums
FROM Con
WHERE num=next AND num= pre