-- we create the tables here

-- Create Department Table 

CREATE TABLE IF NOT EXISTS department (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    location TEXT NOT NULL
    );

-- Create Role Table

CREATE TABLE IF NOT EXISTS role (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL UNIQUE,
    salary DECIMAL CHECK(salary > 0)
    );

-- Create Employee Table

CREATE TABLE IF NOT EXISTS employee (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    role_id INTEGER,
    department_id INTEGER,
    hire_date DATE NOT NULL,
    FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE SET NULL,
    FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE SET NULL
    );


-- Design Database and Normalization
-- ====================================
-- Database : Student Management System
-- ====================================

-- Create Student Table
--  ------------------------
--  -> Ensure atomicity (1NF) by separating multi-valued attributes (e.g., phone number)
--  -> No redundant data (3NF), as department details are stored in a separate table
--  -> Ensure referential integrity (2NF) by linking students to their departments

CREATE TABLE IF NOT EXISTS students ( 
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    address TEXT NOT NULL,
    date_of_birth DATE NOT NULL,
    department_id INTEGER,
    FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE SET NULL
    );

-- student phone number table 
-- -------------------------------
-- -> Avoids multiple phone numbers in a single column (1NF)
-- -> Allows student to have multiple phone numbers  

CREATE TABLE IF NOT EXISTS student_phones (
    phone_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    phone_number TEXT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE
    );

-- CASCADE: if student is deleted, all their phone numbers are also deleted

-- Course Table
-- -> Ensures a student can take multiple courses [M:N (many-to-many) relationship]
CREATE TABLE IF NOT EXISTS courses (
    course_id INTEGER PRIMARY KEY AUTOINCREMENT,
    course_name TEXT NOT NULL UNIQUE
    );



-- Enrollment Table 
-- -> Implement Many-to-Many relationship between students and courses
-- -> Prevent duplicate enrollments for the same student and course
CREATE TABLE IF NOT EXISTS enrollments (
    enrollment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    course_id INTEGER,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
    );


-- Course Assignment Table
-- -> Implement Many-to-Many relationship between courses and employees
-- -> Prevent duplicate assignments for the same course
CREATE TABLE IF NOT EXISTS course_assignments (
    assignment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    employee_id INTEGER,
    course_id INTEGER,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES employee(id) ON DELETE CASCADE
    );