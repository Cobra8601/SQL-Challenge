DROP TABLE 
	departments
	dept_emp,
	dept_manager,
	employees,
	salaries,
	titles;

/* ############  CREATE TABLES  ############*/

/* Table: Departments */ 
CREATE TABLE departments ( 
	dept_no VARCHAR(8) NOT NULL,
	dept_name VARCHAR (30)
);
/* check columns */
SELECT*
FROM
	departments
;
/* check import */
SELECT* 
FROM 
	departments LIMIT 5
;

/* Table: dept_emp */
CREATE TABLE dept_emp ( 
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL
);
/* check columns */
SELECT*
FROM
	dept_emp
;
/* check import */
SELECT* 
FROM 
	dept_emp LIMIT 5
;
/* Table: dept_manager */
CREATE TABLE dept_manager ( 
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL
);
/* check columns */
SELECT*
FROM
	dept_manager
;
/* check import */
SELECT* 
FROM 
	dept_manager LIMIT 5
;

/* Table: employees */
CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(5),
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE
);
/* check columns */
SELECT*
FROM
	employees
;

/* check import */
SELECT* 
FROM 
	employees LIMIT 5
;

/* Table: salaries */
CREATE TABLE salaries ( 
	emp_no INT NOT NULL,
	salary INT
);
/* check columns */
SELECT*
FROM
	salaries
;

/* check import */
SELECT* 
FROM 
	salaries LIMIT 5
;

/* Table: title */
CREATE TABLE titles ( 
	title_id VARCHAR,
	title VARCHAR
);
/*check columns*/
SELECT*
FROM
	titles
;

/* check import */
SELECT* 
FROM 
	titles LIMIT 5
;

/* ############  DATA ANALYSIS  ############*/

/* Q1 List Emp #, lname, fname sex, salary */

SELECT
	salaries.salary,     	/*- go to the 'salaries' table and grab the column 'salary'*/
	employees.emp_no,     	/*- go to the 'employees' table and grab the column 'emp_no'*/
	employees.last_name,    /*- go to the 'employees' table and grab the column 'last_name'*/
	employees.first_name,   /*- go to the 'employees' table and grab the column 'first_name'*/
	employees.sex     		/*- go to the 'employees' table and grab the column 'sex'*/		
FROM
	 salaries                /*first table is the left table*/
		INNER JOIN           /*join it to*/
			employees        /*second table is on the right*/
				ON salaries.emp_no = employees.emp_no ; 

/* Q2 List fname, lname, hire date from 1986 */

SELECT
	first_name,    /*- go to the 'employees' table and grab the column 'first_name'*/
	last_name,    /*- go to the 'employees' table and grab the column 'last_name'*/
	hire_date    /*- go to the 'employees' table and grab the column 'hire_date'*/
FROM employees
	WHERE hire_date >= '1986-01-01' and
      hire_date < '1987-01-01' ;

/* Q3 List the manager of each dept, dept#, dept name, emp#, lname, fname */

SELECT
	employees.first_name,
	employees.last_name,
	employees.emp_no,
	dept_emp.dept_no,
	departments.dept_name
FROM employees
	INNER JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no 
	INNER JOIN dept_manager
	ON employees.emp_no = dept_manager.emp_no
	INNER JOIN departments
	ON dept_emp.dept_no = departments.dept_no;

/* Q4 List the dept#, dept name, emp#, lname, fname */

SELECT
	employees.first_name,
	employees.last_name,
	employees.emp_no,
	dept_emp.dept_no,
	departments.dept_name
FROM employees
	INNER JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no 
	INNER JOIN departments
	ON dept_emp.dept_no = departments.dept_no;

/* Q5 List the dept#, dept name, emp#, lname, fname */

SELECT
	employees.first_name,    /*- go to the 'employees' table and grab the column 'first_name'*/
	employees.last_name,    /*- go to the 'employees' table and grab the column 'last_name'*/
	employees.sex    /*- go to the 'employees' table and grab the column 'hire_date'*/
FROM employees
	WHERE first_name = 'Hercules' and
      last_name LIKE'B%' ;

/* Q6 List all the people in the sales dept w emp#, lname, fname */

SELECT
	employees.first_name,
	employees.last_name,
	employees.emp_no,
	dept_emp.dept_no,
	departments.dept_name
FROM employees
	INNER JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no 
	INNER JOIN departments
	ON dept_emp.dept_no = departments.dept_no
	WHERE departments.dept_name = 'Sales';

/* Q7 List each emp in Sales & Development depts, w emp#, lname, fname, dept name */

SELECT
	employees.first_name,
	employees.last_name,
	employees.emp_no,
	dept_emp.dept_no,
	departments.dept_name
FROM employees
	INNER JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no 
	INNER JOIN departments
	ON dept_emp.dept_no = departments.dept_no
	WHERE departments.dept_name = 'Sales' 
		OR departments.dept_name = 'Development' ;

/* Q8 List freq counts in desc order of all emp lnames (how many emps share a lst name) */

SELECT
	last_name,
	COUNT(last_name) AS "Totals of Last Names"
FROM employees
GROUP BY last_name
ORDER BY "Totals of Last Names" DESC ;
;