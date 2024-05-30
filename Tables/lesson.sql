
USE virtual_reality_education;

CREATE TABLE IF NOT EXISTS lesson (
    lesson_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    lesson_name VARCHAR(255) NOT NULL,
    content TEXT,
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- Inserting data into the lesson table
INSERT INTO lesson (course_id, lesson_name, content) 
VALUES (1, 'Advanced VR Graphics', 'This lesson covers advanced graphics techniques in VR.');
