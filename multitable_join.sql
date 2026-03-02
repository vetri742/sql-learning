mysql -uroot -proot
CREATE DATABASE college;
USE college;
CREATE TABLE student_name(
student_id INT ,
student_name VARCHAR(32) NOT NULL,
student_loc VARCHAR(32) DEFAULT ('CHENNAI'),
PRIMARY KEY (student_id)


);

INSERT INTO student_name
VALUES
(1,"VIRAT","BANGALORE"),
(2,"ROHIT","MANGALORE"),
(3,"MOHIT","BANKONK"),
(4,"RAHUL","BANGLADESH"),
(5,"VIRU","PONDI");

CREATE TABLE courses(
course_id INT ,
course_name VARCHAR(32),
PRIMARY KEY (course_id)
);

INSERT INTO courses
VALUES
(101,"full stack developement"),
(102,"Data Scientist"),
(103,"Data analyst"),
(104,"Devops Engineer"),
(105,"Software Tester"),
(106,"Cloud Computing"),
(107,"Cyber Security");

CREATE TABLE enrollments(
studentID INT,
courseID INT,
FOREIGN KEY (courseID) REFERENCES courses(course_id),
FOREIGN KEY (studentID) REFERENCES student_name(student_id)
);
INSERT INTO enrollments
VALUES
(1,101),
(2,106),
(3,103),
(4,107),
(1,104);

SELECT*FROM student_name;
+------------+--------------+-------------+
| student_id | student_name | student_loc |
+------------+--------------+-------------+
|          1 | VIRAT        | BANGALORE   |
|          2 | ROHIT        | MANGALORE   |
|          3 | MOHIT        | BANKONK     |
|          4 | RAHUL        | BANGLADESH  |
|          5 | VIRU         | PONDI       |
+------------+--------------+-------------+
SELECT*FROM courses;
+-----------+-------------------------+
| course_id | course_name             |
+-----------+-------------------------+
|       101 | full stack developement |
|       102 | Data Scientist          |
|       103 | Data analyst            |
|       104 | Devops Engineer         |
|       105 | Software Tester         |
|       106 | Cloud Computing         |
|       107 | Cyber Security          |
+-----------+-------------------------+

SELECT*FROM enrollments;
+-----------+----------+
| studentID | courseID |
+-----------+----------+
|         1 |      101 |
|         2 |      106 |
|         3 |      103 |
|         4 |      107 |
|         1 |      104 |
+-----------+----------+


--fetch data of students and their selected courses.
SELECT s.student_name, C.course_name
FROM student_name S
INNER JOIN enrollments 	E
ON s.student_id=E.studentID
INNER JOIN courses C
ON C.course_id=E.courseID;
+--------------+-------------------------+
| student_name | course_name             |
+--------------+-------------------------+
| VIRAT        | full stack developement |
| VIRAT        | Devops Engineer         |
| ROHIT        | Cloud Computing         |
| MOHIT        | Data analyst            |
| RAHUL        | Cyber Security          |
+--------------+-------------------------+
--fetch data of all students with their courses and also list out the ones who is not enrolled for any course

SELECT s.student_name, C.course_name
FROM student_name S
LEFT JOIN enrollments 	E
ON s.student_id=E.studentID
LEFT JOIN courses C
ON C.course_id=E.courseID;
+--------------+-------------------------+
| student_name | course_name             |
+--------------+-------------------------+
| VIRAT        | full stack developement |
| VIRAT        | Devops Engineer         |
| ROHIT        | Cloud Computing         |
| MOHIT        | Data analyst            |
| RAHUL        | Cyber Security          |
| VIRU         | NULL                    |
+--------------+-------------------------+

-- list out all the courses and also the students who selected those courses also list out the courses that is not selected by any
SELECT  C.course_name,S.student_name
FROM student_name S
RIGHT JOIN enrollments 	E
ON s.student_id=E.studentID
RIGHT JOIN courses C
ON C.course_id=E.courseID;

+-------------------------+--------------+
| course_name             | student_name |
+-------------------------+--------------+
| full stack developement | VIRAT        |
| Data Scientist          | NULL         |
| Data analyst            | MOHIT        |
| Devops Engineer         | VIRAT        |
| Software Tester         | NULL         |
| Cloud Computing         | ROHIT        |
| Cyber Security          | RAHUL        |
+-------------------------+--------------+

-- list out the data of all the students and the courses including NULL VALUES


SELECT s.student_name, C.course_name
FROM student_name S
LEFT JOIN enrollments 	E
ON s.student_id=E.studentID
LEFT JOIN courses C
ON C.course_id=E.courseID

UNION

SELECT  C.course_name,S.student_name
FROM student_name S
RIGHT JOIN enrollments 	E
ON s.student_id=E.studentID
RIGHT JOIN courses C
ON C.course_id=E.courseID;

+-------------------------+-------------------------+
| student_name            | course_name             |
+-------------------------+-------------------------+
| VIRAT                   | full stack developement |
| VIRAT                   | Devops Engineer         |
| ROHIT                   | Cloud Computing         |
| MOHIT                   | Data analyst            |
| RAHUL                   | Cyber Security          |
| VIRU                    | NULL                    |
| full stack developement | VIRAT                   |
| Data Scientist          | NULL                    |
| Data analyst            | MOHIT                   |
| Devops Engineer         | VIRAT                   |
| Software Tester         | NULL                    |
| Cloud Computing         | ROHIT                   |
| Cyber Security          | RAHUL                   |
+-------------------------+-------------------------+