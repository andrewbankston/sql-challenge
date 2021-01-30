-- List the following details of each employee: employee number, last name, first name, sex, and salary
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
FROM Employees
JOIN Salaries
  ON Employees.emp_no = Salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM Employees
WHERE EXTRACT(year from hire_date) = 1986;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name
SELECT DepartmentManager.dept_no, Departments.dept_name, DepartmentManager.emp_no, Employees.last_name, Employees.first_name
FROM DepartmentManager
JOIN Departments
  ON DepartmentManager.dept_no = Departments.dept_no
JOIN Employees
  ON DepartmentManager.emp_no = Employees.emp_no;

-- List the deprtment of each employee with the following information: employee number, last name, first name, and department name
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
JOIN DepartmentEmployee
  ON Employees.emp_no = DepartmentEmployee.emp_no
JOIN Departments
  ON DepartmentEmployee.dept_no = Departments.dept_no;
  
-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B"
SELECT first_name, last_name, sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
JOIN DepartmentEmployee
  ON Employees.emp_no = DepartmentEmployee.emp_no
JOIN Departments
  ON DepartmentEmployee.dept_no = Departments.dept_no
WHERE Departments.dept_no IN
(
  SELECT dept_no
  FROM Departments
  WHERE dept_name = 'Sales'
);

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
JOIN DepartmentEmployee
  ON Employees.emp_no = DepartmentEmployee.emp_no
JOIN Departments
  ON DepartmentEmployee.dept_no = Departments.dept_no
WHERE Departments.dept_no IN
(
  SELECT dept_no
  FROM Departments
  WHERE dept_name = 'Sales' OR dept_name = 'Development'
);

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
SELECT last_name, COUNT(last_name)
FROM Employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;