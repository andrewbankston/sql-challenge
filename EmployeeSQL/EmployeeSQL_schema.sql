CREATE TABLE Titles (
	title_id VARCHAR(30),
	title VARCHAR(30),
	PRIMARY KEY (title_id)
);

CREATE TABLE Employees (
	emp_no INT,
	emp_title VARCHAR(30),
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(30),
	hire_date DATE,
	PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title) REFERENCES Titles(title_id)
);

CREATE TABLE Salaries (
	emp_no INT,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Departments (
	dept_no VARCHAR(30),
	dept_name VARCHAR(30),
	PRIMARY KEY (dept_no)
);

CREATE TABLE DepartmentManager (
	dept_no VARCHAR(30),
	emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE DepartmentEmployee (
	emp_no INT,
	dept_no VARCHAR(30),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

select * from employees;