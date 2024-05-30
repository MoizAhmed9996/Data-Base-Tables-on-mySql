-- table 1 (Course)--
USE virtual_reality_education;

CREATE TABLE IF NOT EXISTS course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2),
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id)
);

-- Inserting data into the course table
INSERT INTO course (course_name, description, price, instructor_id) 
VALUES ('Advanced Virtual Reality Programming', 'Learn advanced concepts in VR programming and development.', 99.99, 1);
