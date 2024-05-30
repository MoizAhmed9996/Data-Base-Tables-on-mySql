USE virtual_reality_education;
CREATE TABLE IF NOT EXISTS assignment (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    assignment_name VARCHAR(255) NOT NULL,
    description TEXT,
    deadline DATE,
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- Inserting data into the assignment table
INSERT INTO assignment (course_id, assignment_name, description, deadline) 
VALUES (1, 'Final VR Project', 'Develop a fully functional VR application.', '2024-07-15');
