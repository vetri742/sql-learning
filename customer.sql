CREATE DATABASE details;
USE details;
CREATE TABLE customer_tab(
customer_id INT,
customerr_name VARCHAR(32) NOT NULL,
gender VARCHAR(32),
location VARCHAR(32) DEFAULT "Bengalore",
PRIMARY KEY(customer_id)
);
CREATE TABLE order_tab(
order_id INT,
order_details VARCHAR(32) NOT NULL,
amount FLOAT  CHECK(amount>1000),
cust_id INT,
order_status VARCHAR(32),
PRIMARY KEY(order_id),
FOREIGN KEY (cust_id) REFERENCES customer_tab(customer_id)
);
INSERT INTO customer_tab
VALUES
(1,"virat","male","delhi"),
(2,"dhoni","male","ranchi"),
(3,"smrithi","female","bengalore"),
(4,"rohit","male","mumbai"),
(5,"priya","female","chennai");

INSERT INTO order_tab
VALUES
(101,"Bat","2000.25",1,"Delivered"),
(102,"helmet","3400.25",3,"pending"),
(103,"ball","1500",5,"In progress"),
(104,"whey protein","15000",1,"Delivered"),
(105,"laptop","25000",3,"pending"),
(106,"Bike","230000",2,"In progress"),
(107,"Book","10000",2,"cancelled"),
(109,"gloves","19000",4,"Delivered"),
(110,"Iphone","30000",4,"pending"),
(111,"watch","1500",5,"Delivered");
SELECT
	customerr_name AS CUSTOMER_NAME,
	order_details AS ORDER_DETAILS,
	order_status AS ORDER_STATUS
	
FROM
customer_tab c,order_tab O
WHERE
	c.customer_id=o.cust_id;


