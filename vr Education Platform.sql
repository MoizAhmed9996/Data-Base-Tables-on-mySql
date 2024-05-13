CREATE DATABASE VIRTUAL_REALITY_EDUCATION_PLATFORM;
USE  VIRTUAL_REALITY_EDUCATION_PLATFORM;

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    title VARCHAR(45) NOT NULL,
    description TEXT,
    duration INT,
    course_stage varchar(20)
);


CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    bio TEXT,
    expertise_areas TEXT,
    contact_information TEXT
);

-- Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    email VARCHAR(50),
    school_organization VARCHAR(50),
    enrollment_date DATE
);


CREATE TABLE Lessons (
    lesson_id INT PRIMARY KEY,
    course_id INT,
    title VARCHAR(20) NOT NULL,
    description TEXT,
    duration INT, -- Duration in minutes or hours
    vr_environment_id INT
);

-- VR Environments Table
CREATE TABLE VR_Environments (
    vr_environment_id INT PRIMARY KEY,
    environment_name VARCHAR(50) NOT NULL,
    description TEXT
    );

-- Assignments Table
CREATE TABLE Assignments (
    assignment_id INT PRIMARY KEY,
    lesson_id INT,
    student_id INT,
    submission_date DATE,
    statusassiment varchar(15)
);

CREATE TABLE Grades (
    grade_id INT PRIMARY KEY,
    assignment_id INT,
    student_id INT,
    grade int,
    feedback TEXT
);

CREATE TABLE Progress_Tracking (
    progress_id INT PRIMARY KEY,
    student_id INT,
    lesson_id INT,
    completion_status VARCHAR(15),
    completion_date DATE
);

-- Discussion Forums Table
CREATE TABLE Discussion_Forums (
    forum_id INT PRIMARY KEY,
    course_id INT,
    topic VARCHAR(30),
    post_content TEXT,
    author VARCHAR(30)
);

CREATE TABLE Feedback_Ratings (
    feedback_id INT PRIMARY KEY,
    student_id INT,
    rating DECIMAL(3,2),
    comments TEXT
);


