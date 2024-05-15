-- Create Department table
CREATE TABLE Department(
    DepartmentID INT NOT NULL AUTO_INCREMENT,
    DepartmentName VARCHAR(255),
    DepartmentHead INT NOT NULL,
    PRIMARY KEY (DepartmentID)
);

-- Create Employee table
CREATE TABLE Employee(
    EmployeeID INT NOT NULL AUTO_INCREMENT,
    EmployeeName VARCHAR(255),
    EmployeePosition VARCHAR(255),
    EmployeeSalary DOUBLE,
    EmployeeDepartment INT NOT NULL,
    PRIMARY KEY (EmployeeID),
    FOREIGN KEY (EmployeeDepartment) REFERENCES Department(DepartmentID)
);

-- Insert Departments
INSERT INTO
    Department (DepartmentName, DepartmentHead)
VALUES
    ('HR', 1),
    ('Finance', 2),
    ('Engineering', 3),
    ('Marketing', 4),
    ('Sales', 5),
    ('IT', 6),
    ('Customer Support', 7),
    ('Research and Development', 8),
    ('Product', 9),
    ('Legal', 10),
    ('Operations', 11),
    ('Admin', 12),
    ('Supply Chain', 13),
    ('Procurement', 14),
    ('Business Development', 15),
    ('Quality Assurance', 16),
    ('Compliance', 17),
    ('Public Relations', 18),
    ('Risk Management', 19),
    ('Facilities', 20),
    ('Logistics', 21),
    ('Corporate Strategy', 22),
    ('Analytics', 23),
    ('Training', 24),
    ('Security', 25),
    ('Environmental Health and Safety', 26),
    ('Internal Audit', 27),
    ('Investor Relations', 28),
    ('Corporate Communications', 29),
    ('Executive', 30),
    ('Innovation', 31),
    ('Customer Experience', 32),
    ('Content', 33),
    ('Creative', 34),
    ('Brand', 35),
    ('Media', 36),
    ('Events', 37),
    ('Community', 38),
    ('Partner Relations', 39),
    ('Vendor Management', 40),
    ('Accounts', 41),
    ('Tax', 42),
    ('Treasury', 43),
    ('Planning', 44),
    ('Policy', 45),
    ('Government Relations', 46),
    ('Corporate Social Responsibility', 47),
    ('Sustainability', 48),
    ('Ethics', 49),
    ('Privacy', 50),
    ('Data Management', 51),
    ('Digital Transformation', 52),
    ('Technical Support', 53),
    ('Network', 54),
    ('Infrastructure', 55),
    ('Architecture', 56),
    ('Systems', 57),
    ('Database', 58),
    ('Application Development', 59),
    ('Mobile Development', 60),
    ('Web Development', 61),
    ('UX/UI Design', 62),
    ('Project Management', 63),
    ('Scrum', 64),
    ('Agile', 65),
    ('Service Delivery', 66),
    ('Change Management', 67),
    ('Asset Management', 68),
    ('Configuration Management', 69),
    ('Incident Management', 70),
    ('Problem Management', 71),
    ('Knowledge Management', 72),
    ('Release Management', 73),
    ('Testing', 74),
    ('Automation', 75),
    ('DevOps', 76),
    ('Cloud', 77),
    ('AI', 78),
    ('Machine Learning', 79),
    ('Data Science', 80),
    ('Big Data', 81),
    ('IoT', 82),
    ('Blockchain', 83),
    ('Cybersecurity', 84),
    ('Penetration Testing', 85),
    ('Forensics', 86),
    ('Identity and Access Management', 87),
    ('Governance', 88),
    ('Compliance Monitoring', 89),
    ('Threat Intelligence', 90),
    ('Vulnerability Management', 91),
    ('Security Operations', 92),
    ('Security Architecture', 93),
    ('Security Engineering', 94),
    ('Training and Awareness', 95),
    ('Risk Assessment', 96),
    ('Security Analytics', 97),
    ('Biometrics', 98),
    ('Encryption', 99),
    ('Endpoint Security', 100);

-- Insert Employees
-- Repeat insertion in chunks to ensure we get 50,000 employees
DELIMITER / / CREATE PROCEDURE InsertEmployees() BEGIN DECLARE counter INT DEFAULT 0;

WHILE counter < 500 DO
INSERT INTO
    Employee (
        EmployeeName,
        EmployeePosition,
        EmployeeSalary,
        EmployeeDepartment
    )
SELECT
    CONCAT('Employee', LPAD(FLOOR(RAND() * 50000), 5, '0')),
    CASE
        WHEN FLOOR(RAND() * 10) = 0 THEN 'Manager'
        WHEN FLOOR(RAND() * 10) = 1 THEN 'Developer'
        WHEN FLOOR(RAND() * 10) = 2 THEN 'Analyst'
        WHEN FLOOR(RAND() * 10) = 3 THEN 'Consultant'
        WHEN FLOOR(RAND() * 10) = 4 THEN 'Administrator'
        WHEN FLOOR(RAND() * 10) = 5 THEN 'Engineer'
        WHEN FLOOR(RAND() * 10) = 6 THEN 'Technician'
        WHEN FLOOR(RAND() * 10) = 7 THEN 'Coordinator'
        WHEN FLOOR(RAND() * 10) = 8 THEN 'Specialist'
        WHEN FLOOR(RAND() * 10) = 9 THEN 'Assistant'
    END,
    ROUND(RAND() * 90000 + 30000, 2),
    -- Salary range between 30000 and 120000
    FLOOR(RAND() * 100) + 1
FROM
    (
        SELECT
            1
        UNION
        SELECT
            2
        UNION
        SELECT
            3
        UNION
        SELECT
            4
        UNION
        SELECT
            5
        UNION
        SELECT
            6
        UNION
        SELECT
            7
        UNION
        SELECT
            8
        UNION
        SELECT
            9
        UNION
        SELECT
            10
        UNION
        SELECT
            11
        UNION
        SELECT
            12
        UNION
        SELECT
            13
        UNION
        SELECT
            14
        UNION
        SELECT
            15
        UNION
        SELECT
            16
        UNION
        SELECT
            17
        UNION
        SELECT
            18
        UNION
        SELECT
            19
        UNION
        SELECT
            20
    ) AS t1
    CROSS JOIN (
        SELECT
            1
        UNION
        SELECT
            2
        UNION
        SELECT
            3
        UNION
        SELECT
            4
        UNION
        SELECT
            5
        UNION
        SELECT
            6
        UNION
        SELECT
            7
        UNION
        SELECT
            8
        UNION
        SELECT
            9
        UNION
        SELECT
            10
        UNION
        SELECT
            11
        UNION
        SELECT
            12
        UNION
        SELECT
            13
        UNION
        SELECT
            14
        UNION
        SELECT
            15
        UNION
        SELECT
            16
        UNION
        SELECT
            17
        UNION
        SELECT
            18
        UNION
        SELECT
            19
        UNION
        SELECT
            20
    ) AS t2;

SET
    counter = counter + 1;

END WHILE;

END / / DELIMITER;

CALL InsertEmployees();

DROP PROCEDURE IF EXISTS InsertEmployees;