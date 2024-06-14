-- Data Analysis
-- 1.	List the employee number, last name, first name, sex, and salary of each employee.
SELECT  "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Employees".sex, "Salaries".salary
FROM "Employees"
INNER JOIN "Salaries" ON "Employees".emp_no = "Salaries".emp_no
;

-- 2.	List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE EXTRACT(Year from hire_date)=1986
;

-- 3.	List the manager of each department along with their department number, department name, employee number,
--last name, and first name.
SELECT "Department".dept_no, "Department".dept_name, "Department_Managers".emp_no, "Employees".first_name, "Employees".last_name
FROM "Department"
INNER JOIN "Department_Managers" ON "Department".dept_no = "Department_Managers".dept_no
INNER JOIN "Employees" ON "Department_Managers".emp_no = "Employees".emp_no
;

-- 4.	List the department number for each employee along with that employee’s employee number, last name, 
--first name, and department name.
SELECT "Department_Employees".dept_no, "Department_Employees".emp_no, "Employees".last_name, "Employees".first_name, "Department".dept_name
FROM "Department_Employees"
INNER JOIN "Department" ON "Department_Employees".dept_no = "Department".dept_no
INNER JOIN "Employees" ON "Department_Employees".emp_no = "Employees".emp_no
;

-- 5.	List first name, last name, and sex of each employee whose first name is 
--Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
;

-- 6.	List each employee in the Sales department, including their employee number, last name, and first name.
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name
FROM "Employees"
INNER JOIN "Department_Employees" ON "Employees".emp_no = "Department_Employees".emp_no
INNER JOIN "Department" ON "Department_Employees".dept_no = "Department".dept_no
WHERE dept_name = 'Sales'
;

-- 7.	List each employee in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Department".dept_name
FROM "Employees"
INNER JOIN "Department_Employees" ON "Employees".emp_no = "Department_Employees".emp_no
INNER JOIN "Department" ON "Department_Employees".dept_no = "Department".dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'
;

-- 8.	List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name)
SELECT "Employees".last_name, COUNT (last_name) as COUNT
FROM "Employees"
GROUP BY last_name
ORDER BY COUNT DESC
;


