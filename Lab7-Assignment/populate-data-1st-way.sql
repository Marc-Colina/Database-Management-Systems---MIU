-
Insert
    data into Department table
INSERT INTO
    Department (DepartmentName, DepartmentHead)
VALUES
    ('Human Resources', 1),
    ('Finance', 2),
    ('Engineering', 3),
    ('Marketing', 4),
    ('Sales', 5);

-- Insert initial data into Employee table
INSERT INTO
    Employee (
        EmployeeName,
        EmployeePosition,
        EmployeeSalary,
        EmployeeDepartment
    )
VALUES
    ('John Doe', 'HR Manager', 60000, 1),
    ('Jane Smith', 'Finance Manager', 65000, 2),
    ('Alice Johnson', 'Chief Engineer', 70000, 3),
    ('Bob Brown', 'Marketing Manager', 62000, 4),
    ('Carol White', 'Sales Manager', 63000, 5);

-- Generating large dataset for Employee table
-- Here we create 1000 employees using a stored procedure and a loop
DELIMITER / / CREATE PROCEDURE PopulateEmployees() BEGIN DECLARE i INT DEFAULT 6;

WHILE i <= 1005 DO
INSERT INTO
    Employee (
        EmployeeName,
        EmployeePosition,
        EmployeeSalary,
        EmployeeDepartment
    )
VALUES
    (
        CONCAT('Employee', i),
        'Staff',
        40000 + (RAND() * 10000),
        1 + FLOOR(RAND() * 5)
    );

SET
    i = i + 1;

END WHILE;

END / / DELIMITER;

-- Call the procedure to populate employees
CALL PopulateEmployees();

-- Insert more data into Employee table starting from EmployeeID 50006
DELIMITER / / CREATE PROCEDURE AddMoreEmployees() BEGIN DECLARE i INT DEFAULT 50006;

DECLARE dept_count INT DEFAULT 5;

WHILE i <= 100005 DO
INSERT INTO
    Employee (
        EmployeeName,
        EmployeePosition,
        EmployeeSalary,
        EmployeeDepartment
    )
VALUES
    (
        CONCAT('Employee', i),
        'Staff',
        40000 + (RAND() * 10000),
        1 + FLOOR(RAND() * dept_count)
    );

SET
    i = i + 1;

END WHILE;

END / / DELIMITER;

-- Call the procedure to add more employees
CALL AddMoreEmployees();

DELIMITER / / CREATE PROCEDURE AddEvenMoreEmployees() BEGIN DECLARE i INT DEFAULT 100001;

DECLARE dept_count INT DEFAULT 5;

WHILE i <= 200000 DO
INSERT INTO
    Employee (
        EmployeeName,
        EmployeePosition,
        EmployeeSalary,
        EmployeeDepartment
    )
VALUES
    (
        CONCAT('Employee', i),
        'Staff',
        40000 + (RAND() * 10000),
        1 + FLOOR(RAND() * dept_count)
    );

SET
    i = i + 1;

END WHILE;

END / / DELIMITER;

-- Call the procedure to add even more employees
CALL AddEvenMoreEmployees();