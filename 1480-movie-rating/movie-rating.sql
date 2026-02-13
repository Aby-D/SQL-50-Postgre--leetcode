-- Write your PostgreSQL query statement below
(SELECT name AS results FROM Users U 
LEFT JOIN MovieRating MR 
ON U.user_id=MR.user_id 
GROUP BY name
ORDER BY COUNT(rating) DESC, name ASC 
LIMIT 1)

UNION ALL

(SELECT title  FROM Movies M
LEFT JOIN MovieRating MR 
ON M.movie_id=MR.movie_id 
WHERE created_at >= '2020-02-01' AND created_at < '2020-03-01'
GROUP BY title
ORDER BY AVG(rating) DESC, title ASC 
LIMIT 1)