USE virtual_reality_education;
CREATE TABLE IF NOT EXISTS progress_tracking (
    tracking_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    progress DECIMAL(5, 2),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- Inserting data into the progress_tracking table
INSERT INTO progress_tracking (student_id, course_id, progress) 
VALUES (1, 1, 60),
       (2, 1, 80),
       (3, 1, 40);