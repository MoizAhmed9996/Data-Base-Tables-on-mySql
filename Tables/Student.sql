 USE virtual_reality_education;
 CREATE TABLE IF NOT EXISTS student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    country VARCHAR(100),
    age INT,
    gender ENUM('Male', 'Female', 'Other')
);

 
 -- Inserting data into the student table
INSERT INTO student (student_name, email, country, age, gender) 
VALUES ('Michael Brown', 'michael@example.com', 'USA', 28, 'Male'),
       ('Emily White', 'emily@example.com', 'Canada', 24, 'Female'),
       ('Alex Wong', 'alex@example.com', 'UK', 30, 'Other');
