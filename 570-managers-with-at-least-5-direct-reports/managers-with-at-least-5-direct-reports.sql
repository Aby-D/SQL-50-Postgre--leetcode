-- Write your PostgreSQL query statement below
SELECT I.name FROM Employee I JOIN Employee II 
ON I.id = II.managerId 
GROUP BY II.managerId , I.name
HAVING COUNT(*) >=5 
