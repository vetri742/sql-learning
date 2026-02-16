CREATE DATABASE assignment;
USE assignment;

create table employee (
eid INT ,
fname VARCHAR(32),
lname VARCHAR(32),
city VARCHAR(32),
esal INT,
age INT,
PRIMARY KEY(eid)
);
insert into employee 
values
(101,'Rahul','Gandhi','Wayanad',45000,52),
(102,'Sonia','Gandhi','New Delhi',55000,75),
(103,'Priyanka','Gandhi','Nodia',65000,45),
(104,'Modi','Narendra','New Delhi',75000,69),
(105,'Rajni','Kanth','Chennai',85000,65),
(106,'Vijay','Setupathi','Chennai',95000,47),
(107,'Nayana','Tara','Chennai',25000,40),
(108,'Alia','Bhut','Mumbai',45000,31),
(109,'Mahesh','Bhut','Mumbai',15000,68),
(110,'Sonam','Kapoor','Mumbai',30000,27),
(111,'Anil','Kapoor','Mumbai',38000,40),
(112,'Raj','Kapoor','Mumbai',18000,78),
(113,'Vishnu','Manchu','Hyderabad',10000,40),
(114,'Manoj','Manchu','Hyderabad',12000,35);

INSERT INTO employee (eid,fname,lname,city,age)
values
(115,'Mohan','Manchu','Hyderabad',70);

--1) Write a query to fetch employee whose last name is same.

	SELECT*
	FROM employee
	WHERE lname IN(
	SELECT lname
	FROM employee
	GROUP BY lname
	HAVING count(*)>1);
	

--2. Write a query to fetch whose age is grater then 70.

	SELECT*FROM employee
	WHERE(age>70);
	
--3. Write a query to fetch employee with same city.

	SELECT*
	FROM employee
	WHERE city IN(
	SELECT city
	FROM employee
	GROUP BY city
	HAVING count(*)>1);
	
--4. Write a query to fetch whose name ends with 'h'.
	
	SELECT*FROM employee 
		WHERE lname LIKE ('%h');
		
--5. Write a query to count employee whose last name ends with 'i'.
	
	SELECT count(*)FROM employee
		WHERE lname LIKE ('%i');

--6. Write a query to find employee with highest salary.

	SELECT*FROM employee
		WHERE esal=(SELECT MAX(esal)FROM employee);


--7. Write a query to find employee with lowest salary.

		SELECT*FROM employee
			WHERE esal=(SELECT MIN(esal) FROM employee);

--8. Write a query to change last name of employee whose id is 102.
	
	UPDATE employee
		SET lname="agarwal"
		WHERE eid=102;
		
	SELECT*FROM employee;
	
--9. Write a query to find name of employee whose name start's with 'A' and city name starts with 'B'.

	SELECT fname FROM employee
		WHERE fname LIKE('A%') AND city LIKE ('B%');
		
		
--10. Write a query to find employee with highest salary in 'Bangalore'.

	SELECT*FROM employee
		WHERE city='Mumbai' AND esal=(SELECT MAX(esal)FROM employee WHERE city='Mumbai');
;

--11. Write a query to find employee who live in 'Hyderabad' with age above 70.

	SELECT*FROM employee
		WHERE city='Hyderabad' AND age>70; 
		
		
--12. Write a query to find employee with salary below 50000.

	SELECT*FROM employee
		WHERE esal<50000;
	
	
--13. Write a query to find name of employee with salary range between 20000 to 40000.

		SELECT*FROM employee
			WHERE esal BETWEEN 20000 AND 40000;

	
--15. Write a query to find employee whose first name third character is 'j'.

	SELECT*FROM employee
		WHERE fname LIKE ('__j%');
		
--16. Write a query to find employee whose first name third character is 'j' and live in 'Bangalore'.

	SELECT*FROM employee
		WHERE city='Bangalore' AND fname LIKE ('__j%');        
			
--17. Write a query to count employees whose first name third character is 'j'.
	
	SELECT count(*)FROM employee
		WHERE fname LIKE ('__j%');
		
--18. Write a query to fetch employee with lowest salary and add 10000 to its salary.
	SELECT*,
		esal+10000 AS updated_salary
		FROM employee
		WHERE esal=(SELECT MIN(esal)FROM employee); 

	
	
--19. Write a query to Sort the table by ascending.
	
		SELECT*FROM employee
		 ORDER BY eid ASC;
		
--20. Write a query to Sort the table by descending.
	
	SELECT*FROM employee
	ORDER BY eid DESC;
	
--21. Write a query to show employee whose name's last third word is 'j' and salary is more then 30000. 

	SELECT *FROM employee
	WHERE fname LIKE ('%j__') AND esal>30000;
	
--22. Write a query to show all employee who live in 'Bangalore' and  'Wayanad'.

	SELECT*FROM employee
		WHERE city='Bangalore' OR city='Wayanad';
		
--23. Write a query to fetch employee with first name count is 5.

	SELECT*FROM employee
		WHERE LENGTH(fname)=5;
	
--24. Write a query to group by employee with their age.

	SELECT age,COUNT(eid)
	FROM employee
	GROUP BY age;
	
--26. Write a query to find employee with null salary.

	SELECT*FROM employee
	WHERE esal IS NULL;
	
--27. Write a query to find employee whose cities are not null.

	SELECT*FROM employee
	WHERE city is NOT NULL;
	
--28. Write a query to delete data of employee whose id is 109.

	DELETE FROM employee
		WHERE eid=109;
		
--29. Write a query to group by employee with their age and show first three rows of data.
	
	SELECT age,COUNT(*) AS total_employee
	FROM employee
	GROUP BY age
	LIMIT 3;
	
--30. Write a query to group by employee of 'Hyderabad' by their last name.

	SELECT lname,count(*)AS  total_employee
	FROM employee
	WHERE city='Hyderabad'
	GROUP BY lname;

