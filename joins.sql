CREATE DATABASE exercise;
USE exercise;
CREATE TABLE customers(
c_Id INT,
c_Name VARCHAR(32) NOT NULL,
loc VARCHAR(32) DEFAULT "Bangalore",
age INT CHECK(age>=15),
PRIMARY KEY(c_Id)
);

DESC customers;

CREATE TABLE orders(
	order_Id INT,
	details VARCHAR(32) NOT NULL,
	amount FLOAT NOT NULL,
	status VARCHAR(32) DEFAULT 'InProgress',
	cust_Id int,
	PRIMARY KEY(order_ID),
	FOREIGN KEY(cust_Id) REFERENCES customers(c_Id)
);

DESC orders;

INSERT INTO customers
VALUES
(101,'Rahul','Bangalore',52),
(102,'Sonia','New Delhi',81),
(103,'Priyanka','Chennai',42),
(104,'Modi','New Delhi',76),
(105,'Amith','New Delhi',72);

INSERT INTO orders
VALUES
(5001,'Marker Pen',30.30,'Delivered',101),
(5002,'Lenovo Mouse',4000.40,'InProgress',101),
(5003,'Think Pad',108000.80,'Canceled',102),
(5004,'Water Bootle',500.50,'InProgress',102),
(5005,'wacom Pad',8000.80,'Delivered',103),
(5006,'HP Printer',19000.19,'InProgress',103),
(5007,'Iphone 5s',6000.60,'Canceled',103),
(5008,'Apple Mac Pro',180000.18,'InProgress',103),
(5009,'Samsung Watch',28000.29,'Delivered',103),
(5010,'Iphone 15 Cover',700.70,'InProgress',103),
(5011,'Iphone 18',95000.95,'Canceled',101);

--FETCH customer Name , ORDER Details, Amount 
--FROM customers, Orders tables.

SELECT customers.c_Name AS CustomerName,
       orders.details AS Product,
	   orders.amount AS ProductPrice
FROM customers,orders
WHERE orders.cust_Id=customers.c_Id;	 

--query 1: display customers IF they placed any orders;

SELECT c.c_Id,c.c_Name,o.order_Id,o.details
FROM customers c
INNER JOIN orders o
ON c.c_id=o.cust_id

	-- INNER JOIN returns only the matching rows from both sides

--query 2: display ALL customers  their placed orders

SELECT c.c_Id, c.c_Name, o.order_Id, o.details
FROM customers c
LEFT JOIN orders o
ON c.c_Id = o.cust_Id

	--LEFT JOIN returns all rows from the left table and only matching rows from the right table , otherwise NULL.




