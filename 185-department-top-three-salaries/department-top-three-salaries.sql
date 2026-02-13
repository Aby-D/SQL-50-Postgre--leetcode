-- Write your PostgreSQL query statement below
WITH RankedSalaries  AS 
(SELECT 
 e.name AS Employee, 
 e.salary,
 DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS rank_salary,
 e.departmentId 
 FROM Employee e)
 SELECT d.name AS Department,
 r.Employee,
 r.salary
 FROM Department d
 JOIN RankedSalaries r 
 ON r.departmentId=d.id
 WHERE r.rank_salary <=3