
/*
Assumptions
Let's assume there is a column in the EXPENSE table that tracks the approver of each expense (e.g approver_name or approver_id).
*/
SELECT
    e1.employee_id AS employee_id,
    CONCAT(e2.first_name, ' ', e2.last_name) AS approver_name
FROM
    EMPLOYEE e1
JOIN
    EMPLOYEE e2 ON e1.manager_id = e2.employee_id;
