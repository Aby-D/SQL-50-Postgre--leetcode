-- Write your PostgreSQL query statement below
WITH First_login AS(SELECT player_id, MIN(event_date) AS first_login_date 
FROM Activity
GROUP BY player_id)

SELECT ROUND((COUNT(A.player_id)::NUMERIC/COUNT(F.player_id)::NUMERIC), 2) AS fraction
FROM  First_login F LEFT JOIN Activity A
ON F.player_id = A.player_id 
AND A.event_date = F.first_login_date + INTERVAL '1 DAY'