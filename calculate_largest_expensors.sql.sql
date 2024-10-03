
-- Anybody who's expensed more than 1000 of goods or services in SExI
SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,  
    e.manager_id,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name,
    SUM(EX.unit_price * EX.quantity) AS total_expensed_amount
FROM 
    EMPLOYEE e
JOIN 
    EXPENSE EX ON e.employee_id = EX.employee_id
LEFT JOIN 
    EMPLOYEE m ON e.manager_id = m.employee_id
GROUP BY 
    e.employee_id, e.first_name, e.last_name, e.manager_id, m.first_name, m.last_name
HAVING 
    SUM(EX.unit_price * EX.quantity) > 1000
ORDER BY 
    total_expensed_amount DESC;