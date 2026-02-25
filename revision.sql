--TO CREATE DATABASE;
-- 1st lets check the existing databases;
SHOW databases;
CREATE DATABASE revision;
-- switch to DATABASE
USE revision;
CREATE TABLE students(
student_id INT ,
student_name VARCHAR(32) NOT NULL,
student_dept VARCHAR(32) ,
student_loc VARCHAR(32) DEFAULT ('Bengaluru'),
student_age INT CHECK(student_age>18));

-- INSERT INTO TABLES students
INSERT INTO students 
VALUES 
(1,"vetri","MCA","Chennai",22),
(2,"rohit","BCA","Bangalore",20),
(3,"virat","MCOM","Vizag",23),
(4,"suresh","BCOM","Delhi",24),
(5,"sakthi","MBA","Hyderabad",20),
(6,"bumrah","BBA","Mumbai",25);

-- PERFORM CRUD OPERATIONS;
	-- RETRIVE DATA;
	
SELECT*FROM students;

-- Update student detail;
UPDATE students
SET student_age=26
WHERE student_id=6;


-- Delete student details;
DELETE from students 
WHERE student_id=4;

-- fetch data from students  whose age is greater than 22;
SELECT *FROM students
WHERE (student_age>22);

--fetch data from students from same department;

SELECT * FROM students
WHERE student_dept IN (
 SELECT student_dept FROM students
 GROUP BY student_dept
 HAVING COUNT(*)>1
 );
 
-- no students with same department here so insert a student data with same department;
INSERT INTO students
VALUES
(7,"raina","MCA","Patna",21);

--fetch data from students from same department;

SELECT * FROM students
WHERE student_dept IN (
 SELECT student_dept FROM students
 GROUP BY student_dept
 HAVING COUNT(*)>1
 );
 

-- change the city name of one student;

UPDATE students
SET student_loc="Bangalore"
WHERE student_id=3;

-- Fetch data of students who belongs to same location;

SELECT * FROM students
WHERE student_loc IN(
SELECT student_loc FROM students
GROUP BY student_loc
HAVING COUNT(*)>1);

-- fetch data from students whose name ends with t.

SELECT*FROM students
WHERE student_name LIKE("%t");

-- write a query to fetch employee whose name ends (t) and city name ends with (e);

SELECT*FROM students
WHERE student_name like ("%t") AND student_loc LIKE ("%e");

-- write a query to group by students with their age

SELECT student_age , COUNT(student_age)
FROM students
GROUP BY student_age;

