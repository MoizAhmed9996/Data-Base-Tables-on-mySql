USE virtual_reality_education;

CREATE TABLE IF NOT EXISTS instructor (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    instructor_name VARCHAR(255) NOT NULL,
    specialization VARCHAR(255),
    bio TEXT
);

# inserting values into it#
-- Inserting data into the instructor table
INSERT INTO instructor (instructor_name, specialization, bio) 
VALUES ('Dr. Sarah Johnson', 'Virtual Reality Programming', 'Dr. Sarah Johnson has been working in VR programming for over a decade.');
