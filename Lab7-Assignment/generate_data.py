import random
from faker import Faker

# Initialize Faker
fake = Faker()

# Predefined list of department names
department_names = [
    "Human Resources", "Finance", "IT", "Marketing", "Sales", "Customer Service",
    "Research and Development", "Legal", "Administration", "Production",
    "Quality Assurance", "Logistics", "Procurement", "Training", "Public Relations",
    "Engineering", "Operations", "Health and Safety", "Facilities Management", "Security",
    "Compliance", "Product Management", "Business Development", "Strategy", "Investor Relations",
    "Internal Audit", "Corporate Communications", "Corporate Social Responsibility", "Risk Management", "Innovation",
    "Digital Transformation", "Data Analytics", "Project Management", "Supply Chain Management", "Environmental Affairs",
    "Sustainability", "Government Affairs", "Community Relations", "Content Management", "Design",
    "E-commerce", "Event Management", "Executive Office", "Franchise Management", "Global Operations",
    "Human Capital", "Information Security", "Knowledge Management", "Learning and Development", "Market Research"
]

# Create departments
departments = []
for i in range(100):
    department_name = department_names[i % len(department_names)] + " " + str((i // len(department_names)) + 1)
    department_head = random.randint(1, 50)  # Random head ID, should be adjusted based on employee IDs
    departments.append((department_name, department_head))

# Create employees
employees = []
for i in range(50000):
    employee_name = fake.name()
    employee_position = fake.job()
    employee_salary = round(random.uniform(30000, 150000), 2)
    employee_department = random.randint(1, 100)
    employees.append((employee_name, employee_position, employee_salary, employee_department))

# Generate SQL statements
department_sql = "INSERT INTO Department (DepartmentName, DepartmentHead) VALUES\n"
department_sql += ",\n".join([f"('{d[0]}', {d[1]})" for d in departments]) + ";\n"

employee_sql = "INSERT INTO Employee (EmployeeName, EmployeePosition, EmployeeSalary, EmployeeDepartment) VALUES\n"
employee_sql += ",\n".join([f"('{e[0]}', '{e[1]}', {e[2]}, {e[3]})" for e in employees]) + ";\n"

# Write to file
with open("insert_data.sql", "w") as f:
    f.write(department_sql)
    f.write(employee_sql)

print("Data generation complete. Check insert_data.sql for the SQL statements.")
