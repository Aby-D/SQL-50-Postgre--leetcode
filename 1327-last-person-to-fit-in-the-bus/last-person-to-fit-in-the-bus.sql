-- Write your PostgreSQL query statement below
WITH CTE AS 
(SELECT person_name, turn,
 SUM(weight) over(ORDER BY turn) AS total_weight
 FROM Queue) 
(SELECT person_name FROM CTE
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1)
