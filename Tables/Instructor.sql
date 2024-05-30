USE virtual_reality_education;

CREATE TABLE IF NOT EXISTS instructor (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    instructor_name VARCHAR(255) NOT NULL,
    specialization VARCHAR(255),
    bio TEXT
);

# inserting values into it#
-- Inserting data into the instructor table
INSERT INTO instructor (instructor_name, specialization, bio) VALUES 
('Alice Johnson', 'Virtual Reality', 'Expert in VR technology and applications.'),
('Bob Smith', 'Computer Science', 'Specialist in algorithms and data structures.'),
('Charlie Brown', 'Education', 'Focused on innovative teaching methods.'),
('Diana Prince', 'Engineering', 'Experienced in mechanical engineering.'),
('Evan Williams', 'Design', 'Skilled in UI/UX design.');


