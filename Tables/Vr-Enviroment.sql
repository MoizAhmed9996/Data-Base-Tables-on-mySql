USE virtual_reality_education;
CREATE TABLE IF NOT EXISTS vr_environment (
    environment_id INT AUTO_INCREMENT PRIMARY KEY,
    environment_name VARCHAR(255) NOT NULL,
    description TEXT,
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- Inserting data into the vr_environment table
INSERT INTO vr_environment (environment_name, description, course_id) 
VALUES ('VR Game World', 'A simulated environment for testing VR games.', 1);
