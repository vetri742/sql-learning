CREATE DATABASE fk;
USE fk;
CREATE TABLE dept(
dept_id INT,
dept_name VARCHAR(32) NOT NULL,
dept_location VARCHAR(32),
dept_budget INT CHECK(dept_budget>20000),
PRIMARY KEY(dept_id)
);

CREATE TABLE employee(
emp_id INT,
emp_name VARCHAR(32) NOT NULL,
emp_city VARCHAR(32) NOT NULL,
d_id INT,
PRIMARY KEY(emp_id),
FOREIGN KEY(d_id) references dept (dept_id)
);
INSERT INTO dept
VALUES
(101,"IT","delhi",50000),
(102,"electronics","chennai",80000),
(103,"admin","madurai",60000),
(104,"sales","bangalore",90000);
INSERT INTO employee
VALUES
(1,"virat","india",101),
(2,"krishna","india",101),
(3,"wood","usa",103),
(4,"hari","srilanka",104);
select*from dept,employee;
INSERT INTO employee
VALUES
(5,"archer","egypt",102);
select*from dept,employee;
SELECT *
from
employee e , dept d
where e.d_id=d.dept_id;

SELECT 
	emp_id AS Employee_ID,
	emp_name AS Employee_Name,
	emp_city AS Employee_City,
	dept_name AS DepartmentName
FROM 
employee e,dept d
WHERE e.d_id=d.dept_id;