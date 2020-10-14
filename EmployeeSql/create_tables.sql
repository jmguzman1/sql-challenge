CREATE TABLE employees (
    emp_no integer NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(45) NOT NULL,
    birth_date date DEFAULT ('now'::text)::date NOT NULL,
	first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
	sex VARCHAR(45)NOT NULL,
	hire_date date DEFAULT ('now'::text)::date NOT NULL
);

CREATE TABLE departments (
  dept_no VARCHAR (45) NOT NULL PRIMARY KEY,
  dept_name VARCHAR (45) NOT NULL
);

CREATE TABLE dept_emp (
  emp_no INTEGER NOT NULL,
  dept_no VARCHAR(45) NOT NULL,
	FOREIGN KEY (emp_no) references employees(emp_no),
	FOREIGN KEY (dept_no) references departments(dept_no)
);

CREATE TABLE dept_manager (
  dept_no VARCHAR(45) NOT NULL,
  emp_no INTEGER NOT NULL,
	FOREIGN KEY (dept_no) references departments(dept_no),
	FOREIGN KEY (emp_no) references employees(emp_no)
);

CREATE TABLE salaries (
  emp_no integer NOT NULL,
  salary integer NOT NULL,
		FOREIGN KEY (emp_no) references employees(emp_no)
);

CREATE TABLE titles (
  title_id VARCHAR(45) NOT NULL,
  title VARCHAR(45) NOT NULL
);
