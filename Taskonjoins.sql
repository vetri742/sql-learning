-----JOINS---------
CREATE DATABASE banking;
USE banking;

-------- CREATE TABLE CUSTOMERS-------
CREATE TABLE customers (
    customer_id INT ,
    customer_name VARCHAR(50),
    city VARCHAR(40),
    phone VARCHAR(15),
    join_date DATE,
	PRIMARY KEY (customer_id)
);

------CREATE TABLE ACCOUNTS------------

CREATE TABLE accounts (
    account_id INT ,
    cust_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    branch VARCHAR(40),
    open_date DATE,
	PRIMARY KEY (account_id),
	FOREIGN KEY (cust_id) REFERENCES customers(customer_id)
);

--------INSERT INTO TABLE CUSTOMERS--------

INSERT INTO customers VALUES
(1,'Arun','Chennai','900000001','2022-01-10'),
(2,'Bala','Bangalore','900000002','2022-02-12'),
(3,'Charan','Hyderabad',NULL,'2022-03-15'),
(4,'Deepak','Mumbai','900000004','2022-04-01'),
(5,'Eswar','Delhi',NULL,'2022-05-11'),
(6,'Farhan','Chennai','900000006','2022-06-19'),
(7,'Gokul','Pune','900000007','2022-07-25'),
(8,'Hari','Kochi',NULL,'2022-08-14'),
(9,'Imran','Chennai','900000009','2022-09-09'),
(10,'Jagan','Hyderabad','900000010','2022-10-30'),
(11,'Karthik','Bangalore',NULL,'2022-11-12'),
(12,'Lokesh','Mumbai','900000012','2022-12-01'),
(13,'Manoj','Delhi','900000013','2023-01-10'),
(14,'Naveen','Chennai',NULL,'2023-02-05'),
(15,'Omkar','Pune','900000015','2023-03-08'),
(16,'Prakash','Hyderabad','900000016','2023-04-21'),
(17,'Qadir','Kochi',NULL,'2023-05-17'),
(18,'Ramesh','Chennai','900000018','2023-06-13'),
(19,'Suresh','Bangalore','900000019','2023-07-02'),
(20,'Tarun','Mumbai',NULL,'2023-08-19');

---INSERT INTO TABLE ACCOUNTS------
INSERT INTO accounts VALUES
(101,1,'Savings',25000,'Chennai','2022-01-15'),
(102,2,'Current',54000,'Bangalore','2022-02-15'),
(103,3,'Savings',NULL,'Hyderabad','2022-03-18'), 
(104,4,'Savings',87000,'Mumbai','2022-04-10'),
(105,5,'Current',65000,NULL,'2022-05-15'), 
(106,6,'Savings',15000,'Chennai','2022-06-20'),
(107,7,'Savings',30000,'Pune','2022-07-30'),
(108,8,'Current',92000,'Kochi','2022-08-20'),
(109,9,'Savings',45000,'Chennai','2022-09-15'),
(110,10,'Savings',20000,'Hyderabad','2022-11-01'),
(111,11,'Current',72000,'Bangalore','2022-11-20'),
(112,12,'Savings',5000,'Mumbai','2022-12-05'),
(113,13,'Savings',38000,'Delhi','2023-01-15'),
(114,14,'Current',81000,'Chennai','2023-02-10'),
(115,15,'Savings',26000,'Pune','2023-03-12'),
(116,16,'Savings',47000,'Hyderabad','2023-04-25'),
(117,17,'Current',99000,'Kochi','2023-05-20'),
(118,18,'Savings',15000,'Chennai','2023-06-15'),
(119,19,'Savings',64000,'Bangalore','2023-07-10'),
(120,NULL,'Savings',12000,'Mumbai','2023-08-25'), 
(121,1,'Current',30000,'Chennai','2023-09-01'),
(122,3,'Savings',11000,'Hyderabad','2023-09-05'),
(123,5,'Savings',22000,'Delhi','2023-09-10'),
(124,20,'Savings',76000,'Pune','2023-09-12');


UPDATE accounts
SET balance=100
WHERE account_id=103;

----- INNER JOIN-----

SELECT c.customer_name, a.account_type, a.balance
FROM customers c
INNER JOIN accounts a
ON c.customer_id = a.cust_id;

+---------------+--------------+----------+
| customer_name | account_type | balance  |
+---------------+--------------+----------+
| Arun          | Savings      | 25000.00 |
| Arun          | Current      | 30000.00 |
| Bala          | Current      | 54000.00 |
| Charan        | Savings      |   100.00 |
| Charan        | Savings      | 11000.00 |
| Deepak        | Savings      | 87000.00 |
| Eswar         | Current      | 65000.00 |
| Eswar         | Savings      | 22000.00 |
| Farhan        | Savings      | 15000.00 |
| Gokul         | Savings      | 30000.00 |
| Hari          | Current      | 92000.00 |
| Imran         | Savings      | 45000.00 |
| Jagan         | Savings      | 20000.00 |
| Karthik       | Current      | 72000.00 |
| Lokesh        | Savings      |  5000.00 |
| Manoj         | Savings      | 38000.00 |
| Naveen        | Current      | 81000.00 |
| Omkar         | Savings      | 26000.00 |
| Prakash       | Savings      | 47000.00 |
| Qadir         | Current      | 99000.00 |
| Ramesh        | Savings      | 15000.00 |
| Suresh        | Savings      | 64000.00 |
| Tarun         | Savings      | 76000.00 |
+---------------+--------------+----------+

---- LEFT JOIN --------

SELECT c.customer_id, c.customer_name, a.account_id, a.account_type
FROM customers c
LEFT JOIN accounts a
ON c.customer_id = a.cust_id;

+-------------+---------------+------------+--------------+
| customer_id | customer_name | account_id | account_type |
+-------------+---------------+------------+--------------+
|           1 | Arun          |        101 | Savings      |
|           1 | Arun          |        121 | Current      |
|           2 | Bala          |        102 | Current      |
|           3 | Charan        |        103 | Savings      |
|           3 | Charan        |        122 | Savings      |
|           4 | Deepak        |        104 | Savings      |
|           5 | Eswar         |        105 | Current      |
|           5 | Eswar         |        123 | Savings      |
|           6 | Farhan        |        106 | Savings      |
|           7 | Gokul         |        107 | Savings      |
|           8 | Hari          |        108 | Current      |
|           9 | Imran         |        109 | Savings      |
|          10 | Jagan         |        110 | Savings      |
|          11 | Karthik       |        111 | Current      |
|          12 | Lokesh        |        112 | Savings      |
|          13 | Manoj         |        113 | Savings      |
|          14 | Naveen        |        114 | Current      |
|          15 | Omkar         |        115 | Savings      |
|          16 | Prakash       |        116 | Savings      |
|          17 | Qadir         |        117 | Current      |
|          18 | Ramesh        |        118 | Savings      |
|          19 | Suresh        |        119 | Savings      |
|          20 | Tarun         |        124 | Savings      |
+-------------+---------------+------------+--------------+

-------- RIGHT JOIN--------

SELECT c.*
FROM customers c
RIGHT JOIN accounts a
ON c.customer_id = a.cust_id;

+-------------+---------------+-----------+-----------+------------+
| customer_id | customer_name | city      | phone     | join_date  |
+-------------+---------------+-----------+-----------+------------+
|        NULL | NULL          | NULL      | NULL      | NULL       |
|           1 | Arun          | Chennai   | 900000001 | 2022-01-10 |
|           1 | Arun          | Chennai   | 900000001 | 2022-01-10 |
|           2 | Bala          | Bangalore | 900000002 | 2022-02-12 |
|           3 | Charan        | Hyderabad | NULL      | 2022-03-15 |
|           3 | Charan        | Hyderabad | NULL      | 2022-03-15 |
|           4 | Deepak        | Mumbai    | 900000004 | 2022-04-01 |
|           5 | Eswar         | Delhi     | NULL      | 2022-05-11 |
|           5 | Eswar         | Delhi     | NULL      | 2022-05-11 |
|           6 | Farhan        | Chennai   | 900000006 | 2022-06-19 |
|           7 | Gokul         | Pune      | 900000007 | 2022-07-25 |
|           8 | Hari          | Kochi     | NULL      | 2022-08-14 |
|           9 | Imran         | Chennai   | 900000009 | 2022-09-09 |
|          10 | Jagan         | Hyderabad | 900000010 | 2022-10-30 |
|          11 | Karthik       | Bangalore | NULL      | 2022-11-12 |
|          12 | Lokesh        | Mumbai    | 900000012 | 2022-12-01 |
|          13 | Manoj         | Delhi     | 900000013 | 2023-01-10 |
|          14 | Naveen        | Chennai   | NULL      | 2023-02-05 |
|          15 | Omkar         | Pune      | 900000015 | 2023-03-08 |
|          16 | Prakash       | Hyderabad | 900000016 | 2023-04-21 |
|          17 | Qadir         | Kochi     | NULL      | 2023-05-17 |
|          18 | Ramesh        | Chennai   | 900000018 | 2023-06-13 |
|          19 | Suresh        | Bangalore | 900000019 | 2023-07-02 |
|          20 | Tarun         | Mumbai    | NULL      | 2023-08-19 |
+-------------+---------------+-----------+-----------+------------+

----------- FULL JOIN ----------------

SELECT c.customer_id, c.customer_name, a.account_id, a.account_type
FROM customers c
LEFT JOIN accounts a
ON c.customer_id = a.cust_id

UNION

SELECT c.customer_id, c.customer_name, a.account_id, a.account_type
FROM customers c
RIGHT JOIN accounts a
ON c.customer_id = a.cust_id;

+-------------+---------------+------------+--------------+
| customer_id | customer_name | account_id | account_type |
+-------------+---------------+------------+--------------+
|           1 | Arun          |        101 | Savings      |
|           1 | Arun          |        121 | Current      |
|           2 | Bala          |        102 | Current      |
|           3 | Charan        |        103 | Savings      |
|           3 | Charan        |        122 | Savings      |
|           4 | Deepak        |        104 | Savings      |
|           5 | Eswar         |        105 | Current      |
|           5 | Eswar         |        123 | Savings      |
|           6 | Farhan        |        106 | Savings      |
|           7 | Gokul         |        107 | Savings      |
|           8 | Hari          |        108 | Current      |
|           9 | Imran         |        109 | Savings      |
|          10 | Jagan         |        110 | Savings      |
|          11 | Karthik       |        111 | Current      |
|          12 | Lokesh        |        112 | Savings      |
|          13 | Manoj         |        113 | Savings      |
|          14 | Naveen        |        114 | Current      |
|          15 | Omkar         |        115 | Savings      |
|          16 | Prakash       |        116 | Savings      |
|          17 | Qadir         |        117 | Current      |
|          18 | Ramesh        |        118 | Savings      |
|          19 | Suresh        |        119 | Savings      |
|          20 | Tarun         |        124 | Savings      |
|        NULL | NULL          |        120 | Savings      |
+-------------+---------------+------------+--------------+