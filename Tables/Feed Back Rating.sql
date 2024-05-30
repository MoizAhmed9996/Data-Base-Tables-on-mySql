USE virtual_reality_education;

CREATE TABLE IF NOT EXISTS feedback_rating (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    rating INT,
    feedback TEXT,
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);



-- Inserting data into the feedback_rating table
INSERT INTO feedback_rating (student_id, course_id, rating, feedback) 
VALUES (1, 1, 4, 'The course content is challenging but rewarding.'),
       (2, 1, 5, 'Excellent course, highly recommended for aspiring VR developers.')
       (3, 3, 4, 'Useful for educational purposes.'),
       (4, 4, 5, 'Excellent course on VR engineering.'),
       (5, 5, 4, 'Good tips on interface design.');
