-- Create and select the database
create database SQL_PROJECT;
use SQL_PROJECT;

-- Create table
create table student(
StudentID int primary key,
First_Name varchar(20),
Last_Name varchar(20),
Age int,
Gender varchar(10)
);

Create table courses(
CourseID int primary key,
Course_Name varchar(20)
);

CREATE TABLE Enrollment (
    EnrollmentID INT,
    StudentID INT,
    CourseID INT,
    Grade VARCHAR(2) -- Assuming Grade is represented by letters like 'A', 'B', etc
);

-- Insert values into the table
insert into student values(101, "Kiana", "Johnson", 20, "Female");
insert into student values(102, "Alice", "Johnson", 21, "Female"),
(103, "David", "Wilson", 23, "Male"),
(104, "Meggan", "Smith", 21, "Female"),
(105, "Michael", "Benson", 23, "Male"),
(106, 'Bob', 'Johnson', 21, 'Male'),
(107,'Jane', 'Smith', 21, 'Male'),
(108,'John', 'Doe', 20, 'Male'),
(109,'Carol', 'Davis', 21, 'Female'),
(110,'Emma', 'Anderson', 22, 'Female');

insert into student values(111, 'Jackson', 'Adams', 22, 'Male'),
(112, 'Sofia', 'Mitchell', 20, 'Female'),(113, 'Samuel', 'Green', 23, 'Male'),(114, 'Ava', 'Hughes', 21, 'Female'),
(115, 'Oliver', 'Torres', 22, 'Male'),(116, 'Bella', 'Richardson', 20, 'Female'),(117,'Grayson', 'Reed', 23, 'Male'),
(118,'Lila', 'Martinez', 21, 'Female'),(120, 'Noah', 'Foster', 22, 'Male'),(121,'Aria', 'Parker', 20, 'Female'),
(122, 'Riley', 'Foster', 23, 'Female'),(123, 'Carter', 'Ross', 21, 'Male'),(124, 'Savannah', 'Turner', 22, 'Female'),
(125, 'Mason', 'Brooks', 20, 'Male'),(126, 'Zoey', 'Coleman', 23, 'Female'),(127, 'Caleb', 'Davis', 21, 'Male'),
(128, 'Stella', 'Morgan', 22, 'Female'),(129, 'Elijah', 'Turner', 20, 'Male'),(130, 'Ava', 'Gray', 23, 'Female'),
(131, 'Liam', 'Rodriguez', 21, 'Male'),(132, 'Harper', 'Baker', 22, 'Female'),(133, 'Aiden', 'Foster', 20, 'Male'),
(134, 'Penelope', 'Ward', 23, 'Female'),(135, 'Dylan', 'Cooper', 21, 'Male'),(136, 'Scarlett', 'Hill', 22, 'Female'),
(137, 'Isaac', 'Hall', 20, 'Male'),(138, 'Ella', 'Brooks', 23, 'Female'),(139, 'Nathan', 'Adams', 21, 'Male'),
(140, 'Addison', 'Carter', 22, 'Female'),(141, 'Christopher', 'Harris', 20, 'Male'),(142, 'Lily', 'Turner', 23, 'Female'),
(143, 'Jackson', 'Lewis', 21, 'Male'),(144, 'Zoey', 'Wilson', 22, 'Female'), (145, 'Mason', 'King', 20, 'Male'),
(146, 'Chloe', 'Green', 23, 'Female'),(147, 'Benjamin', 'Scott', 21, 'Male'),(148, 'Sophia', 'Hall', 22, 'Female'),
(149, 'Daniel', 'Clark', 20, 'Male'),(150, 'Ava', 'Martin', 23, 'Female');

insert into courses values(1, "Mathematics"),
(2, "History"),(3, "Computer Science"),(4, "English Literature"),(5, "Physics"),
(6, "Mathematics"), (7, "Political Science"),(9, "Geography"),(10, "Chemistry"),
(11, 'Business Analytics'),(13, 'Data Science'),(14, 'Geology'),(15, 'Architecture');

insert into Enrollment values(1,101,1,92),(2,102,2,78),(3,103,3,65),
(4,104,4,87),(5,105,5,75),(6,106,6,94),(7,107,7,81),(8,108,8,89),(9,109,9,72),(10,110,10,85);
insert into enrollment values(11, 111, 3, 85),(12, 112, 5, 80),(13, 125, 4, 83),(14, 126, 15, 68),(15, 127, 3, 91),(16, 128, 8, 79),(17, 129, 2, 88),
(18, 130, 12, 74),(19, 131, 11, 86),(20, 132, 9, 77),(21, 133, 7, 93),(22, 134, 6, 82),(23, 135, 5, 69),(24, 136, 10, 84),
(25, 137, 1, 73),(26, 138, 14, 96),(27, 139, 15, 70),(28, 140, 13, 95),(29, 141, 4, 67),(30, 142, 8, 98),(31, 143, 3, 76),
(32, 144, 2, 89),(33, 145, 12, 81),(34, 146, 1, 92),(35, 147, 9, 78),(36, 148, 6, 85),(37, 149, 15, 74),(38, 150, 11, 88),
(39, 151, 7, 80),(40, 152, 10, 67),(41, 153, 14, 96),(42, 154, 13, 72),(43, 155, 5, 84),(44, 156, 4, 89),(45, 157, 8, 73),
(46, 158, 3, 91),(47, 159, 2, 77),(48, 160, 12, 82),(49, 161, 1, 69),(50, 162, 9, 87);

-- Retrieve information from tables
select * from student;
select * from courses;
select * from enrollment;

-- Delete row from table
delete from enrollment
where StudentID = 101 and CourseID = 6;

-- Delete a row from courses where courseid is 111.
delete from courses
where CourseID = 111;

-- Update studentid from table enrollment where enrollmentid is 50
update enrollment
set StudentID = 150
where enrollmentid = 50;

-- Total number of students and courses
SELECT COUNT(StudentID) AS total_students
FROM student
union
SELECT COUNT(CourseID) AS total_courses
FROM courses;

SELECT 'Total Students' AS category, COUNT(StudentID) AS total_count
FROM student
UNION
SELECT 'Total Courses' AS category, COUNT(CourseID) AS total_count
FROM courses;

-- Number of students enrolled for computer science course 
select * from student
join Enrollment on Student.studentID = Enrollment.studentID
join Courses on Enrollment.courseID = Courses.courseID
where courses.Course_Name = "Computer Science";

-- Average grades per course
SELECT CourseID, AVG(Grade) AS AverageGrade
FROM enrollment
GROUP BY CourseID
ORDER BY AverageGrade DESC;

-- Average grades per student
SELECT StudentID, AVG(Grade) AS AverageGrade
FROM enrollment
GROUP BY StudentID
ORDER BY AverageGrade DESC;

-- Students enrolled for each course
SELECT CourseID, COUNT(*) AS EnrollmentCount
FROM enrollment
GROUP BY CourseID
ORDER BY EnrollmentCount DESC;

-- Retrieve the total number of students enrolled in each course
SELECT
    c.CourseID,
    c.Course_Name,
    COUNT(e.StudentID) AS total_students_enrolled
FROM
    courses c
JOIN
    enrollment e ON c.CourseID = e.CourseID
GROUP BY
    c.courseid, c.Course_Name;

-- Retrieve the groups of grades and find the total number of students in each group.
SELECT
    CASE
        WHEN grade >= 90 THEN 'A'
        WHEN grade >= 80 THEN 'B'
        WHEN grade >= 70 THEN 'C'
        WHEN grade >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_group,
    COUNT(studentID) AS total_students
FROM
    enrollment
GROUP BY
    grade_group;
