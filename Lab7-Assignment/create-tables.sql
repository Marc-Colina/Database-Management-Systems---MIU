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
    EmployeePosition VARCHAR (255),
    EmployeeSalary DOUBLE,
    EmployeeDepartment INT NOT NULL,
    PRIMARY KEY (EmployeeID),
    FOREIGN KEY (EmployeeDepartment) REFERENCES Department(DepartmentID)
);