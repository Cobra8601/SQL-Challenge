# SQL-Challenge
# Created Tables
    Departments    n=9   
    dept_emp       n=331,603 
    dept_manager    n=24
    employees      n=300,024
    salaries       n=300,024
    title          
    
    Checked all columns to be present and data import.
    Imported the CSV files to respective table.
    Checked import of each table - limit to 5 rows.

# Q1 
  List Emp #, lname, fname, sex, salary  Selected column salary from table salaries.
  
  Selected columns emp_no, last_name, first_name, sex from table employees.
  Join table salaries (left) with table employees (right) on column emp_no.
  Result:  N = 300,024

# Q2 
  List fname, lname, hire date from 1986 columns first_name, last_name, hire_date from table     employees.
  
  Subqueried hire_date with a WHERE statement for all dates between 1/1/1986 through 1/1/1987.
  Result: N = 36,150

# Q3 
  List the manager of each dept, dept#, dept name, emp#, laname, fname  
  
  Selected columns first_name, last_name, emp_no, from table employees.
  Selected columns dept_no from table dept_emp.
  Selected columns dept_name from table departments.
  Inner Join 1 with table employees and dept_emp on emp_no.
  Inner Join 2 with table employees and dept_manager on emp_no.
  Inner Join 3 with table dept_emp and departments  on dept_no.
  Result: N = 24

# Q4 
  List the dept #, dept name, emp#, laname, and fname
  
  Use program from Q3 - Remove INNER JOIN for dept_manager.
  Result: N = 331,603

 # Q5 
  List the dept#, dept name, emp#, lname, fname  
  
  Select columns first_name last_name from Table employees.
  Subqueried first_name with a WHERE statement for 'Hercules' using AND operator, also queried   last_name with wildcard LIKE searching for all names starting with B. 
  Result:  N = 20

# Q6 
  List all the people in the sales dept w emp# lname fname
  Use program from Q4.
  Add a WHERE statement for table departments column dept_name to extract for item 'Sales'.
  Result: N = 52,245

# Q7 
  List each employee in sales and development depts w emp#, lname, fname, and dept name
  
  Use program from Q6.
  Add operator OR to include column dept_name from table departments.
  Result: N = 137,952

# Q8  
  List freq counts in desc order of all employee lnames 
  
  Select column last_name from table employees.
  Count the last_name AS "Total of Last Names".
  Group them by last_name.
  Order by descending.
  Result: N = 1638
