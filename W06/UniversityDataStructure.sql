-- Start the transaction
START TRANSACTION;

-- Create the College table
CREATE TABLE College (
    college VARCHAR(255),
    department VARCHAR(255),
    department_code VARCHAR(10),
    PRIMARY KEY (department_code)
);

-- Create the Course table
CREATE TABLE Course (
    department_code VARCHAR(10),
    course_num INT,
    course_title VARCHAR(255),
    credits INT,
    PRIMARY KEY (department_code, course_num),
    FOREIGN KEY (department_code) REFERENCES College(department_code)
);

-- Create the Section table
CREATE TABLE Section (
    year INT,
    term VARCHAR(10),
    course VARCHAR(255),
    section INT,
    faculty_fname VARCHAR(255),
    faculty_lname VARCHAR(255),
    capacity INT,
    PRIMARY KEY (year, term, course, section),
    FOREIGN KEY (course) REFERENCES Course(course_title)
);

-- Create the Student table
CREATE TABLE Student (
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    gender CHAR(1),
    city VARCHAR(255),
    state CHAR(2),
    birthdate DATE,
    PRIMARY KEY (first_name, last_name)
);

-- Create the Enrollment table
CREATE TABLE Enrollment (
    student_first_name VARCHAR(255),
    student_last_name VARCHAR(255),
    course VARCHAR(255),
    term VARCHAR(10),
    section INT,
    PRIMARY KEY (student_first_name, student_last_name, course, term, section),
    FOREIGN KEY (course, term, section) REFERENCES Section(course, term, section),
    FOREIGN KEY (student_first_name, student_last_name) REFERENCES Student(first_name, last_name)
);

-- Commit the transaction
COMMIT;
