-- List the following details of each employee: 
--employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, 
	   employees.last_name,
	   employees.first_name, 
	   employees.sex, 
	   salaries.salary
FROM employees LEFT JOIN salaries 
ON employees.emp_no=salaries.emp_no;

-- List first name, last name, and hire date for employees 
--who were hired in 1986.
SELECT employees.last_name, employees.first_name, employees.hire_date 
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no, 
	   departments.dept_name,
	   dept_manager.emp_no, 
	   employees.last_name,
	   employees.first_name
FROM dept_manager
INNER JOIN departments ON dept_manager.dept_no=departments.dept_no
INNER JOIN employees ON dept_manager.emp_no=employees.emp_no;


-- List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, 
	   employees.last_name, 
	   employees.first_name, 
	   departments.dept_name
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no;


--List first name, last name, and sex for employees 
--whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees 
WHERE first_name='Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, 
	   employees.last_name, 
	   employees.first_name, 
	   departments.dept_name
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no=employees.emp_no
INNER JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, 
	   employees.last_name, 
	   employees.first_name, 
	   departments.dept_name
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no=employees.emp_no
INNER JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name='Sales' OR departments.dept_name='Development';

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT last_name, COUNT(*) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;
