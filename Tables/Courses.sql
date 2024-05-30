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
VALUES ('Advanced Virtual Reality Programming', 'Learn advanced concepts in VR programming and development.', 99.99, 1),
('Advanced VR Programming', 'A course on advanced programming techniques in VR.', 200.00, 2),
('VR in Education', 'Using VR to enhance educational experiences.', 150.00, 3),
('VR Engineering', 'Engineering principles applied in VR environments.', 250.00, 4),
('Designing VR Interfaces', 'Creating user-friendly interfaces for VR applications.', 180.00, 5);

