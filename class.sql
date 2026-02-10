CREATE DATABASE fsd;
USE fsd;
-- LEARNT CONSTRAINTS---- 

CREATE TABLE students(
	s_id INT UNIQUE,
	s_name VARCHAR(32)NOT NULL,
	s_salary FLOAT CHECK(s_salary>=20000),
	s_location VARCHAR(32) DEFAULT "chennai");
DESC students;
-- Insert values into TABLE
CREATE TABLE students(
	s_id INT PRIMARY KEY,
	s_name VARCHAR(32)NOT NULL,
	s_salary FLOAT CHECK(s_salary>=20000),
	s_location VARCHAR(32) DEFAULT "chennai"); 
	
 INSERT INTO students
    VALUES
     (02,"hari",23000,"bangalore"),
     (06,"aari",23000,"bangalore"),
     (07,"paari",23000,"bangalore");


SELECT*FROM students;

DROP TABLE students;

--by using the below command we can see whole table including schema got deleted

DESC students;

-- primary key wont allow dublicates as well as null values
-- _______________ITS A COMBINATION OF UNIQUE+NOT NULL_______________

CREATE TABLE students(
	s_id INT PRIMARY KEY,
	s_name VARCHAR(32)NOT NULL,
	s_salary FLOAT CHECK(s_salary>=20000),
	s_location VARCHAR(32) DEFAULT "chennai"); 

INSERT INTO students
VALUES
     (02,"hari",23000,"bangalore"),
     (06,"rohit",53000,"mumbai"),
     (07,"mohit",30000,"nepal");
	 
SELECT*FROM students;

UPDATE students
SET s_name="john"
WHERE s_id=02;

SELECT*FROM students;
