
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
VALUES (1, 'Advanced VR Graphics', 'This lesson covers advanced graphics techniques in VR.'),
       (2, 'Advanced VR Techniques', 'Deep dive into VR programming.'),
       (3, 'VR in Classroom', 'Using VR for teaching and learning.'),
       (4, 'VR Engineering Applications', 'Engineering in virtual environments.'),
       (5, 'Design Principles', 'Designing effective VR interfaces.');
