CREATE DATABASE IF NOT EXISTS virtual_reality_education;

USE virtual_reality_education;

CREATE TABLE IF NOT EXISTS course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2),
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id)
);

CREATE TABLE IF NOT EXISTS instructor (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    instructor_name VARCHAR(255) NOT NULL,
    specialization VARCHAR(255),
    bio TEXT
);

CREATE TABLE IF NOT EXISTS student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    country VARCHAR(100),
    age INT,
    gender ENUM('Male', 'Female', 'Other')
);

CREATE TABLE IF NOT EXISTS lesson (
    lesson_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    lesson_name VARCHAR(255) NOT NULL,
    content TEXT,
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE IF NOT EXISTS vr_environment (
    environment_id INT AUTO_INCREMENT PRIMARY KEY,
    environment_name VARCHAR(255) NOT NULL,
    description TEXT,
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE IF NOT EXISTS assignment (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    assignment_name VARCHAR(255) NOT NULL,
    description TEXT,
    deadline DATE,
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE IF NOT EXISTS grade (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    assignment_id INT,
    grade DECIMAL(5, 2),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (assignment_id) REFERENCES assignment(assignment_id)
);

CREATE TABLE IF NOT EXISTS progress_tracking (
    tracking_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    progress DECIMAL(5, 2),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

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

CREATE TABLE IF NOT EXISTS feedback_rating (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    rating INT,
    feedback TEXT,
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);
-- Insert data into instructor table
INSERT INTO instructor (instructor_name, specialization, bio) VALUES
('Alice Johnson', 'Virtual Reality', 'Expert in VR technology and applications.'),
('Bob Smith', 'Computer Science', 'Specialist in algorithms and data structures.'),
('Charlie Brown', 'Education', 'Focused on innovative teaching methods.'),
('Diana Prince', 'Engineering', 'Experienced in mechanical engineering.'),
('Evan Williams', 'Design', 'Skilled in UI/UX design.');

-- Insert data into course table
INSERT INTO course (course_name, description, price, instructor_id) VALUES
('Intro to VR', 'An introductory course to virtual reality concepts.', 100.00, 1),
('Advanced VR Programming', 'A course on advanced programming techniques in VR.', 200.00, 2),
('VR in Education', 'Using VR to enhance educational experiences.', 150.00, 3),
('VR Engineering', 'Engineering principles applied in VR environments.', 250.00, 4),
('Designing VR Interfaces', 'Creating user-friendly interfaces for VR applications.', 180.00, 5);

-- Insert data into student table
INSERT INTO student (student_name, email, country, age, gender) VALUES
('John Doe', 'john.doe@example.com', 'USA', 22, 'Male'),
('Jane Smith', 'jane.smith@example.com', 'Canada', 25, 'Female'),
('Alex Johnson', 'alex.johnson@example.com', 'UK', 30, 'Other'),
('Emily Davis', 'emily.davis@example.com', 'Australia', 28, 'Female'),
('Michael Brown', 'michael.brown@example.com', 'USA', 24, 'Male');

-- Insert data into lesson table
INSERT INTO lesson (course_id, lesson_name, content) VALUES
(1, 'Introduction to VR', 'Basics of virtual reality.'),
(2, 'Advanced VR Techniques', 'Deep dive into VR programming.'),
(3, 'VR in Classroom', 'Using VR for teaching and learning.'),
(4, 'VR Engineering Applications', 'Engineering in virtual environments.'),
(5, 'Design Principles', 'Designing effective VR interfaces.');

-- Insert data into vr_environment table
INSERT INTO vr_environment (environment_name, description, course_id) VALUES
('VR Classroom', 'A virtual classroom environment.', 1),
('VR Lab', 'A virtual lab for experiments.', 2),
('VR Playground', 'A virtual playground for kids.', 3),
('VR Workshop', 'A workshop for engineering projects.', 4),
('VR Studio', 'A studio for design projects.', 5);

-- Insert data into assignment table
INSERT INTO assignment (course_id, assignment_name, description, deadline) VALUES
(1, 'VR Basics Assignment', 'Assignment on VR basics.', '2024-06-30'),
(2, 'Advanced VR Project', 'Project on advanced VR techniques.', '2024-07-15'),
(3, 'Educational VR Case Study', 'Case study on VR in education.', '2024-08-01'),
(4, 'Engineering VR Task', 'Task on VR engineering applications.', '2024-07-20'),
(5, 'Design Interface Assignment', 'Assignment on VR interface design.', '2024-07-25');

-- Insert data into grade table
INSERT INTO grade (student_id, assignment_id, grade) VALUES
(1, 1, 85.50),
(2, 2, 90.00),
(3, 3, 88.75),
(4, 4, 92.50),
(5, 5, 87.00);

-- Insert data into progress_tracking table
INSERT INTO progress_tracking (student_id, course_id, progress) VALUES
(1, 1, 50.00),
(2, 2, 75.00),
(3, 3, 60.00),
(4, 4, 80.00),
(5, 5, 70.00);

-- Insert data into discussion_forum table
INSERT INTO discussion_forum (course_id, topic, message, student_id) VALUES
(1, 'VR Basics Discussion', 'Let’s discuss the basics of VR.', 1),
(2, 'Advanced VR Techniques', 'Questions on advanced VR techniques.', 2),
(3, 'VR in Education', 'How can we use VR in classrooms?', 3),
(4, 'VR Engineering Projects', 'Ideas for engineering projects in VR.', 4),
(5, 'VR Interface Design', 'Tips for designing VR interfaces.', 5);

-- Insert data into feedback_rating table
INSERT INTO feedback_rating (student_id, course_id, rating, feedback) VALUES
(1, 1, 4, 'Great introduction to VR.'),
(2, 2, 5, 'Very informative and detailed.'),
(3, 3, 4, 'Useful for educational purposes.'),
(4, 4, 5, 'Excellent course on VR engineering.'),
(5, 5, 4, 'Good tips on interface design.');
