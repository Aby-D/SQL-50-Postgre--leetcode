-- Write your PostgreSQL query statement below
SELECT employee_id FROM Employees
WHERE  manager_id  NOT IN (SELECT employee_id FROM Employees)
AND SALARY < 30000
ORDER BY employee_id