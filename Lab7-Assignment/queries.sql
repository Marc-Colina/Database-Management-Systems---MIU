--Query # 1
SELECT
    *
FROM
    Employee
WHERE
    EmployeeName = 'Employee48764'
    AND EmployeePosition = 'Administrator';

--Query # 2
SELECT
    *
FROM
    Employee e
    JOIN Department d ON d.DepartmentID = e.EmployeeDepartment
WHERE
    EmployeeName = 'Employee48764'
    AND EmployeePosition = 'Administrator';

--Query # 3
SELECT
    *
FROM
    Employee e
    JOIN Department d ON d.DepartmentID = e.EmployeeDepartment
GROUP BY
    EmployeeName
HAVING
    EmployeeName = 'Employee48764'
    AND EmployeePosition = 'Administrator';