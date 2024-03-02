-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Table: Departments
CREATE TABLE "departments" (
    "dept_no" VARCHAR(8)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL
);

-- check columns
-- check import
-- Table: dept_emp
CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL
);

-- check columns
-- check import
-- Table: dept_manager
CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "emp_no" INT   NOT NULL
);

-- check columns
-- check import
-- Table: employees
CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(5)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL
);

-- check columns
-- check import
-- Table: salaries
CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

-- check columns
-- check import
-- Table: title
CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL
);

ALTER TABLE "departments" ADD CONSTRAINT "fk_departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept_emp" ("dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

