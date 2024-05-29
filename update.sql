CREATE DATABASE IF NOT EXISTS virtual_reality_education;

USE virtual_reality_education;

CREATE TABLE IF NOT EXISTS course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2),
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id)
);

CREATE TABLE IF NOT EXISTS instructor (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    instructor_name VARCHAR(255) NOT NULL,
    specialization VARCHAR(255),
    bio TEXT
);

CREATE TABLE IF NOT EXISTS student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    country VARCHAR(100),
    age INT,
    gender ENUM('Male', 'Female', 'Other')
);

CREATE TABLE IF NOT EXISTS lesson (
    lesson_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    lesson_name VARCHAR(255) NOT NULL,
    content TEXT,
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE IF NOT EXISTS vr_environment (
    environment_id INT AUTO_INCREMENT PRIMARY KEY,
    environment_name VARCHAR(255) NOT NULL,
    description TEXT,
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE IF NOT EXISTS assignment (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    assignment_name VARCHAR(255) NOT NULL,
    description TEXT,
    deadline DATE,
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE IF NOT EXISTS grade (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    assignment_id INT,
    grade DECIMAL(5, 2),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (assignment_id) REFERENCES assignment(assignment_id)
);

CREATE TABLE IF NOT EXISTS progress_tracking (
    tracking_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    progress DECIMAL(5, 2),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE IF NOT EXISTS discussion_forum (
    discussion_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    topic VARCHAR(255) NOT NULL,
    message TEXT,
    student_id INT,
    post_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

CREATE TABLE IF NOT EXISTS feedback_rating (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    rating INT,
    feedback TEXT,
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);
-- Insert data into instructor table
INSERT INTO instructor (instructor_name, specialization, bio) VALUES
('Alice Johnson', 'Virtual Reality', 'Expert in VR technology and applications.'),
('Bob Smith', 'Computer Science', 'Specialist in algorithms and data structures.'),
('Charlie Brown', 'Education', 'Focused on innovative teaching methods.'),
('Diana Prince', 'Engineering', 'Experienced in mechanical engineering.'),
('Evan Williams', 'Design', 'Skilled in UI/UX design.');

-- Insert data into course table
INSERT INTO course (course_name, description, price, instructor_id) VALUES
('Intro to VR', 'An introductory course to virtual reality concepts.', 100.00, 1),
('Advanced VR Programming', 'A course on advanced programming techniques in VR.', 200.00, 2),
('VR in Education', 'Using VR to enhance educational experiences.', 150.00, 3),
('VR Engineering', 'Engineering principles applied in VR environments.', 250.00, 4),
('Designing VR Interfaces', 'Creating user-friendly interfaces for VR applications.', 180.00, 5);

-- Insert data into student table
INSERT INTO student (student_name, email, country, age, gender) VALUES
('John Doe', 'john.doe@example.com', 'USA', 22, 'Male'),
('Jane Smith', 'jane.smith@example.com', 'Canada', 25, 'Female'),
('Alex Johnson', 'alex.johnson@example.com', 'UK', 30, 'Other'),
('Emily Davis', 'emily.davis@example.com', 'Australia', 28, 'Female'),
('Michael Brown', 'michael.brown@example.com', 'USA', 24, 'Male');

-- Insert data into lesson table
INSERT INTO lesson (course_id, lesson_name, content) VALUES
(1, 'Introduction to VR', 'Basics of virtual reality.'),
(2, 'Advanced VR Techniques', 'Deep dive into VR programming.'),
(3, 'VR in Classroom', 'Using VR for teaching and learning.'),
(4, 'VR Engineering Applications', 'Engineering in virtual environments.'),
(5, 'Design Principles', 'Designing effective VR interfaces.');

-- Insert data into vr_environment table
INSERT INTO vr_environment (environment_name, description, course_id) VALUES
('VR Classroom', 'A virtual classroom environment.', 1),
('VR Lab', 'A virtual lab for experiments.', 2),
('VR Playground', 'A virtual playground for kids.', 3),
('VR Workshop', 'A workshop for engineering projects.', 4),
('VR Studio', 'A studio for design projects.', 5);

-- Insert data into assignment table
INSERT INTO assignment (course_id, assignment_name, description, deadline) VALUES
(1, 'VR Basics Assignment', 'Assignment on VR basics.', '2024-06-30'),
(2, 'Advanced VR Project', 'Project on advanced VR techniques.', '2024-07-15'),
(3, 'Educational VR Case Study', 'Case study on VR in education.', '2024-08-01'),
(4, 'Engineering VR Task', 'Task on VR engineering applications.', '2024-07-20'),
(5, 'Design Interface Assignment', 'Assignment on VR interface design.', '2024-07-25');

-- Insert data into grade table
INSERT INTO grade (student_id, assignment_id, grade) VALUES
(1, 1, 85.50),
(2, 2, 90.00),
(3, 3, 88.75),
(4, 4, 92.50),
(5, 5, 87.00);

-- Insert data into progress_tracking table
INSERT INTO progress_tracking (student_id, course_id, progress) VALUES
(1, 1, 50.00),
(2, 2, 75.00),
(3, 3, 60.00),
(4, 4, 80.00),
(5, 5, 70.00);

-- Insert data into discussion_forum table
INSERT INTO discussion_forum (course_id, topic, message, student_id) VALUES
(1, 'VR Basics Discussion', 'Let’s discuss the basics of VR.', 1),
(2, 'Advanced VR Techniques', 'Questions on advanced VR techniques.', 2),
(3, 'VR in Education', 'How can we use VR in classrooms?', 3),
(4, 'VR Engineering Projects', 'Ideas for engineering projects in VR.', 4),
(5, 'VR Interface Design', 'Tips for designing VR interfaces.', 5);

-- Insert data into feedback_rating table
INSERT INTO feedback_rating (student_id, course_id, rating, feedback) VALUES
(1, 1, 4, 'Great introduction to VR.'),
(2, 2, 5, 'Very informative and detailed.'),
(3, 3, 4, 'Useful for educational purposes.'),
(4, 4, 5, 'Excellent course on VR engineering.'),
(5, 5, 4, 'Good tips on interface design.');


-- QUERY 1

SELECT c.course_id, c.course_name, c.description, c.price, i.instructor_name
FROM course c
INNER JOIN instructor i ON c.instructor_id = i.instructor_id;

-- QUERY 2

SELECT c.course_id, c.course_name, c.description, c.price, i.instructor_name
FROM course c
INNER JOIN instructor i ON c.instructor_id = i.instructor_id
where c.price >=200 
order by c.course_id ;

-- QUERY 3

SELECT s.student_id, s.student_name, a.assignment_name, g.grade 
FROM student s
join grade g ON s.student_id = g.student_id
Join assignment a On g.assignment_id = a.assignment_id
order by g.grade;

-- QUERY 4

SELECT a.assignment_name, a.description, a.deadline, c.course_name
FROM assignment a
INNER JOIN course c ON a.course_id = c.course_id
WHERE a.deadline BETWEEN '2024-07-01' AND '2024-07-31';

-- QUERY 5

SELECT d.course_id,c.course_name,d.topic, d.message, s.student_name
FROM discussion_forum d
INNER JOIN student s ON d.student_id = s.student_id
INNER JOIN course c ON d.course_id = c.course_id
WHERE d.course_id = 2;

-- QUERY 6

SELECT c.course_name, l.lesson_name
FROM course c
LEFT JOIN lesson l ON c.course_id = l.course_id
WHERE c.course_name LIKE '%VR%';

-- QUERY 7

SELECT i.instructor_id,i.instructor_name, c.course_name
FROM instructor i
LEFT JOIN course c ON i.instructor_id = c.instructor_id
WHERE i.specialization = 'Education';

-- QUERY 8

SELECT g.student_id,a.assignment_name, g.grade
FROM assignment a
RIGHT JOIN grade g ON a.assignment_id = g.assignment_id
WHERE g.student_id = 3;

-- query 9 Count the number of records in a table.

SELECT COUNT(*) FROM student;

-- query 10 Calculate the total of a numeric column.

SELECT SUM(age) FROM student;

-- query 11 Calculate the average of a numeric column.

SELECT AVG(price) FROM course;

-- query 12 Calculate the total of a numeric column

SELECT SUM(price) FROM course;

-- query 13 Find the maximum value in a column.

SELECT MAX(age) FROM student;

-- query 14 Find the minimum value in a column.

SELECT MIN(age) FROM student;

-- query 15 Group records based on a column.

SELECT rating, COUNT(*) FROM feedback_rating GROUP BY rating;

-- query 16 Filter groups using HAVING clause.

SELECT rating, COUNT(*) FROM feedback_rating GROUP BY rating HAVING rating>4;

-- query 17 Concatenate values from different rows.

SELECT GROUP_CONCAT(student_name SEPARATOR ', ') FROM student;

-- query 18 Select the top N records from a table:

SELECT * FROM student LIMIT 3;

-- query 19 Select records with a specified offset.

SELECT * FROM student LIMIT 3 OFFSET 2;

-- query 20 Select records from a table based on multiple conditions:

SELECT * FROM grade WHERE student_id>2 AND grade<90;

-- query 21 Select records sorted by multiple columns:

SELECT * FROM grade ORDER BY assignment_id, student_id;

-- query 22 Select records where a column's value matches any value in a list:

SELECT * FROM student WHERE student_id IN (1, 5, 3);

-- query 23 Select records with values outside a specified range:

SELECT * FROM grade WHERE grade NOT BETWEEN 89 AND 95;

-- query 24 Select records with a specified offset.

SELECT * FROM student LIMIT 3 OFFSET 2;

-- query 25 Calculate the square root of a value:
-- This query returns the square root of the specified number.
SELECT SQRT(4);

-- query  26 Select Distinct Single Column
SELECT DISTINCT student_id FROM student;

-- query 27 Select Distinct Multiple Columns

SELECT DISTINCT rating, student_id FROM feedback_rating;

-- query 28 Using DISTINCT with COUNT

SELECT COUNT(DISTINCT rating) FROM feedback_rating;

-- query 29 Using DISTINCT with WHERE Clause

SELECT distinct student_id FROM student WHERE student_id>2;

-- query 30 Using DISTINCT with ORDER BY

SELECT DISTINCT rating ,student_id FROM feedback_rating ORDER BY rating;

-- query 31 Using DISTINCT with GROUP BY

SELECT DISTINCT rating, count(student_id) FROM feedback_rating GROUP BY rating;

-- query 32(Find the maximum grade achieved in each assignment)
SELECT a.assignment_name, MAX(g.grade) AS max_grade
FROM assignment a
LEFT JOIN grade g ON a.assignment_id = g.assignment_id
GROUP BY a.assignment_name;

-- query 33(List the courses with no assigned instructors)

SELECT c.course_name
FROM course c
LEFT JOIN instructor i ON c.instructor_id = i.instructor_id
WHERE i.instructor_id IS NULL;

-- query 34(Retrieve the names of instructors who teach more than 3 courses:)
SELECT i.instructor_name
FROM instructor i
INNER JOIN course c ON i.instructor_id = c.instructor_id
GROUP BY i.instructor_name
HAVING COUNT(c.course_id) > 3;


-- query 35(Calculate the total revenue generated from course sales)
SELECT SUM(price) AS total_revenue  FROM course;

-- query 36 (Find the average grade for each assignment)
SELECT a.assignment_name, AVG(g.grade) AS avg_grade
FROM assignment a
LEFT JOIN grade g ON a.assignment_id = g.assignment_id
GROUP BY a.assignment_name;

-- Query 37, Find the total number of assignments submitted by each student:
SELECT s.student_name, COUNT(a.assignment_id) AS num_assignments
FROM student s
LEFT JOIN grade g ON s.student_id = g.student_id
LEFT JOIN assignment a ON g.assignment_id = a.assignment_id
GROUP BY s.student_name;

-- Query 38 (Count the number of students in each course)
SELECT c.course_name, COUNT(s.student_id) AS num_students
FROM course c
LEFT JOIN student s ON c.course_id = s.course_id
GROUP BY c.course_name;

-- query 39(Retrieve the top 5 highest-priced courses:)
SELECT course_name, price FROM course ORDER BY price DESC LIMIT 5;

-- query 40(Find the average age of students:)
SELECT AVG(age) FROM student;


