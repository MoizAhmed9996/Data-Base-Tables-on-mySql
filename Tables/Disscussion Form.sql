USE virtual_reality_education;

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

-- Inserting data into the discussion_forum table
INSERT INTO discussion_forum (course_id, topic, message, student_id) 
VALUES (1, 'Project Ideas', 'Share your ideas for the final VR project.', 1),
       (1, 'Graphics Discussion', 'Discuss advanced graphics techniques.', 2);