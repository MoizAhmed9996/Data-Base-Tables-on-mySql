USE virtual_reality_education;

CREATE TABLE IF NOT EXISTS grade (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    assignment_id INT,
    grade DECIMAL(5, 2),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (assignment_id) REFERENCES assignment(assignment_id)
);

-- Inserting data into the grade table
INSERT INTO grade (student_id, assignment_id, grade) 
VALUES (1, 1, 92.5),
       (2, 1, 85.0),
       (3, 1, 88.2),
       (4, 4, 92.50),
       (5, 5, 87.00);

