mysql -uroot -proot
CREATE DATABASE business;
USE business;
CREATE TABLE department(
dept_id INT ,
dept_Name VARCHAR(32) NOT NULL,
dept_Location VARCHAR(32)DEFAULT 'Bengalore',
PRIMARY KEY (dept_id));

CREATE TABLE employees(
e_id INT,
e_name VARCHAR(32),
e_location VARCHAR(32),
d_id INT ,
PRIMARY KEY (e_id),
FOREIGN KEY (d_id) REFERENCES department(dept_id)
);

INSERT INTO department
VALUES
(101,"Software Developers","Chennai"),
(102,"Testers","Bangalore"),
(103,"Admin","Mumbai"),
(104,"Networking","Chennai"),
(105,"Devops","Kochi"),
(106,"Data analytics","Vizag");

INSERT INTO employees
VALUES
(1,"Virat","Delhi",101),
(2,"Rohit","Mumbai",101),
(3,"Dhoni","Ranchi",105),
(4,"Sachin","Mumbai",106),
(5,"Yuvraj","Punjab",103),
(6,"Hardik","Barado",104),
(7,"Ashwin","Chennai",102),
(8,"Rahul","Mangalore",101),
(9,"Ravishastri","Mumbai",105),
(10,"Ishant","Delhi",102),
(11,"Dravid","Bangalore",102),
(12,"Laxman","Hyderabad",102),
(13,"Sehwag","Delhi",104),
(14,"Raina","Lucknow",103),
(15,"Jadeja","Gujarat",106),
(16,"Vijay","Chennai",102),
(17,"Devilliars","Bangalore",101),
(18,"Bhuvi","Lucknow",106),
(19,"Shami","Kolkatta",104);

--fetch data from department,employees

SELECT * FROM 
department d,
employees emp
WHERE d.dept_id=emp.d_id;
+---------+---------------------+---------------+------+-------------+------------+------+
| dept_id | dept_Name           | dept_Location | e_id | e_name      | e_location | d_id |
+---------+---------------------+---------------+------+-------------+------------+------+
|     101 | Software Developers | Chennai       |    1 | Virat       | Delhi      |  101 |
|     101 | Software Developers | Chennai       |    2 | Rohit       | Mumbai     |  101 |
|     101 | Software Developers | Chennai       |    8 | Rahul       | Mangalore  |  101 |
|     101 | Software Developers | Chennai       |   17 | Devilliars  | Bangalore  |  101 |
|     102 | Testers             | Bangalore     |    7 | Ashwin      | Chennai    |  102 |
|     102 | Testers             | Bangalore     |   10 | Ishant      | Delhi      |  102 |
|     102 | Testers             | Bangalore     |   11 | Dravid      | Bangalore  |  102 |
|     102 | Testers             | Bangalore     |   12 | Laxman      | Hyderabad  |  102 |
|     102 | Testers             | Bangalore     |   16 | Vijay       | Chennai    |  102 |
|     103 | Admin               | Mumbai        |    5 | Yuvraj      | Punjab     |  103 |
|     103 | Admin               | Mumbai        |   14 | Raina       | Lucknow    |  103 |
|     104 | Networking          | Chennai       |    6 | Hardik      | Barado     |  104 |
|     104 | Networking          | Chennai       |   13 | Sehwag      | Delhi      |  104 |
|     104 | Networking          | Chennai       |   19 | Shami       | Kolkatta   |  104 |
|     105 | Devops              | Kochi         |    3 | Dhoni       | Ranchi     |  105 |
|     105 | Devops              | Kochi         |    9 | Ravishastri | Mumbai     |  105 |
|     106 | Data analytics      | Vizag         |    4 | Sachin      | Mumbai     |  106 |
|     106 | Data analytics      | Vizag         |   15 | Jadeja      | Gujarat    |  106 |
|     106 | Data analytics      | Vizag         |   18 | Bhuvi       | Lucknow    |  106 |
+---------+---------------------+---------------+------+-------------+------------+------+

SELECT 
   e.e_id AS Employee_ID,
   e.e_name AS Employee_Name,
   d.dept_Name Department_Name
FROM 
department d,
employees e
WHERE d.dept_id=e.d_id;

+-------------+---------------+---------------------+
| Employee_ID | Employee_Name | Department_Name     |
+-------------+---------------+---------------------+
|           1 | Virat         | Software Developers |
|           2 | Rohit         | Software Developers |
|           8 | Rahul         | Software Developers |
|          17 | Devilliars    | Software Developers |
|           7 | Ashwin        | Testers             |
|          10 | Ishant        | Testers             |
|          11 | Dravid        | Testers             |
|          12 | Laxman        | Testers             |
|          16 | Vijay         | Testers             |
|           5 | Yuvraj        | Admin               |
|          14 | Raina         | Admin               |
|           6 | Hardik        | Networking          |
|          13 | Sehwag        | Networking          |
|          19 | Shami         | Networking          |
|           3 | Dhoni         | Devops              |
|           9 | Ravishastri   | Devops              |
|           4 | Sachin        | Data analytics      |
|          15 | Jadeja        | Data analytics      |
|          18 | Bhuvi         | Data analytics      |
+-------------+---------------+---------------------+

INSERT INTO employees(e_id,e_name,d_id)
VALUES
(22,"Bumrah",103),
(20,"Root",106),
(21,"Smith",102);

INSERT INTO employees(e_id,e_name,e_location)
VALUES
(23,"Kumble","Bangalore"),
(24,"Gayle","Bangalore"),
(25,"Bazz","Kochi");

_______________________________________________________________________________________________________________________

-- INNER JOIN returns rows only if matched.

SELECT 
e.e_name AS Employee_Name,

d.dept_id AS Department_ID,
d.dept_Name AS Department_Name,
d.dept_Location AS Department_Location
FROM
department d
INNER JOIN employees e
ON d.dept_id=e.d_id;

---------------+---------------+---------------------+---------------------+
| Employee_Name | Department_ID | Department_Name     | Department_Location |
+---------------+---------------+---------------------+---------------------+
| Virat         |           101 | Software Developers | Chennai             |
| Rohit         |           101 | Software Developers | Chennai             |
| Rahul         |           101 | Software Developers | Chennai             |
| Devilliars    |           101 | Software Developers | Chennai             |
| Ashwin        |           102 | Testers             | Bangalore           |
| Ishant        |           102 | Testers             | Bangalore           |
| Dravid        |           102 | Testers             | Bangalore           |
| Laxman        |           102 | Testers             | Bangalore           |
| Vijay         |           102 | Testers             | Bangalore           |
| Smith         |           102 | Testers             | Bangalore           |
| Yuvraj        |           103 | Admin               | Mumbai              |
| Raina         |           103 | Admin               | Mumbai              |
| Bumrah        |           103 | Admin               | Mumbai              |
| Hardik        |           104 | Networking          | Chennai             |
| Sehwag        |           104 | Networking          | Chennai             |
| Shami         |           104 | Networking          | Chennai             |
| Dhoni         |           105 | Devops              | Kochi               |
| Ravishastri   |           105 | Devops              | Kochi               |
| Sachin        |           106 | Data analytics      | Vizag               |
| Jadeja        |           106 | Data analytics      | Vizag               |
| Bhuvi         |           106 | Data analytics      | Vizag               |
| Root          |           106 | Data analytics      | Vizag               |
+---------------+---------------+---------------------+---------------------+


--LEFT JOIN returns all the data from left table and matched records from right table and even NULL

SELECT 
e.e_name AS Employee_Name,
d.dept_Name AS Department_Name

FROM
employees e
LEFT JOIN department d
ON d.dept_id=e.d_id;

+---------------+---------------------+
| Employee_Name | Department_Name     |
+---------------+---------------------+
| Virat         | Software Developers |
| Rohit         | Software Developers |
| Dhoni         | Devops              |
| Sachin        | Data analytics      |
| Yuvraj        | Admin               |
| Hardik        | Networking          |
| Ashwin        | Testers             |
| Rahul         | Software Developers |
| Ravishastri   | Devops              |
| Ishant        | Testers             |
| Dravid        | Testers             |
| Laxman        | Testers             |
| Sehwag        | Networking          |
| Raina         | Admin               |
| Jadeja        | Data analytics      |
| Vijay         | Testers             |
| Devilliars    | Software Developers |
| Bhuvi         | Data analytics      |
| Shami         | Networking          |
| Root          | Data analytics      |
| Smith         | Testers             |
| Bumrah        | Admin               |
| Kumble        | NULL                |
| Gayle         | NULL                |
| Bazz          | NULL                |
+---------------+---------------------+

--RIGHT JOIN returns all data from right table and matched records from left table including NULL values
SELECT 
d.dept_Name AS DEPARTMENT,
e.e_name AS NAME
FROM 
department d
RIGHT JOIN employees e
ON d.dept_id=e.d_id;

+---------------------+-------------+
| DEPARTMENT          | NAME        |
+---------------------+-------------+
| Software Developers | Virat       |
| Software Developers | Rohit       |
| Devops              | Dhoni       |
| Data analytics      | Sachin      |
| Admin               | Yuvraj      |
| Networking          | Hardik      |
| Testers             | Ashwin      |
| Software Developers | Rahul       |
| Devops              | Ravishastri |
| Testers             | Ishant      |
| Testers             | Dravid      |
| Testers             | Laxman      |
| Networking          | Sehwag      |
| Admin               | Raina       |
| Data analytics      | Jadeja      |
| Testers             | Vijay       |
| Software Developers | Devilliars  |
| Data analytics      | Bhuvi       |
| Networking          | Shami       |
| Data analytics      | Root        |
| Testers             | Smith       |
| Admin               | Bumrah      |
| NULL                | Kumble      |
| NULL                | Gayle       |
| NULL                | Bazz        |
+---------------------+-------------

-- FULL JOIN returns all records from both TABLES

SELECT 
e.e_name AS Employee_Name,

d.dept_id AS Department_ID,
d.dept_Name AS Department_Name,
d.dept_Location AS Department_Location
FROM
department d
LEFT JOIN employees e
ON d.dept_id=e.d_id

UNION

SELECT 
e.e_name AS Employee_Name,

d.dept_id AS Department_ID,
d.dept_Name AS Department_Name,
d.dept_Location AS Department_Location
FROM
department d
RIGHT JOIN employees e
ON d.dept_id=e.d_id;

+---------------+---------------+---------------------+---------------------+
| Employee_Name | Department_ID | Department_Name     | Department_Location |
+---------------+---------------+---------------------+---------------------+
| Virat         |           101 | Software Developers | Chennai             |
| Rohit         |           101 | Software Developers | Chennai             |
| Rahul         |           101 | Software Developers | Chennai             |
| Devilliars    |           101 | Software Developers | Chennai             |
| Ashwin        |           102 | Testers             | Bangalore           |
| Ishant        |           102 | Testers             | Bangalore           |
| Dravid        |           102 | Testers             | Bangalore           |
| Laxman        |           102 | Testers             | Bangalore           |
| Vijay         |           102 | Testers             | Bangalore           |
| Smith         |           102 | Testers             | Bangalore           |
| Yuvraj        |           103 | Admin               | Mumbai              |
| Raina         |           103 | Admin               | Mumbai              |
| Bumrah        |           103 | Admin               | Mumbai              |
| Hardik        |           104 | Networking          | Chennai             |
| Sehwag        |           104 | Networking          | Chennai             |
| Shami         |           104 | Networking          | Chennai             |
| Dhoni         |           105 | Devops              | Kochi               |
| Ravishastri   |           105 | Devops              | Kochi               |
| Sachin        |           106 | Data analytics      | Vizag               |
| Jadeja        |           106 | Data analytics      | Vizag               |
| Bhuvi         |           106 | Data analytics      | Vizag               |
| Root          |           106 | Data analytics      | Vizag               |
| Kumble        |          NULL | NULL                | NULL                |
| Gayle         |          NULL | NULL                | NULL                |
| Bazz          |          NULL | NULL                | NULL                |
+---------------+---------------+---------------------+---------------------+