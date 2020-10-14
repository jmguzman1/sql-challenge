-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/NTGpNK
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "employees" (
    "emp_no" integer   NOT NULL,
    "emp_title_id" VARCHAR(45)   NOT NULL,
    "birth_date" date  DEFAULT ('now'::text)::date NOT NULL,
    "first_name" VARCHAR(45)   NOT NULL,
    "last_name" VARCHAR(45)   NOT NULL,
    "sex" VARCHAR(45)   NOT NULL,
    "hire_date" date  DEFAULT ('now'::text)::date NOT NULL
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR(45)   NOT NULL,
    "dept_name" VARCHAR(45)   NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR(45)   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(45)   NOT NULL,
    "emp_no" INTEGER   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" integer   NOT NULL,
    "salary" integer   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(45)   NOT NULL,
    "title" VARCHAR(45)   NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

