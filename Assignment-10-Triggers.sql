CREATE DATABASE Assignment10;
use Assignment10;

-- Create the teachers Table
CREATE TABLE teachers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    subject VARCHAR(50) NOT NULL,
    experience INT NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- Insert Rows into the teachers Table
INSERT INTO teachers (name, subject, experience, salary)
VALUES
    ('Alice', 'Math', 12, 80000),
    ('Bob', 'Science', 8, 75000),
    ('Catherine', 'English', 15, 90000),
    ('David', 'History', 5, 70000),
    ('Eva', 'Math', 3, 65000),
    ('Frank', 'Physics', 11, 85000),
    ('Grace', 'Biology', 7, 72000),
    ('Hank', 'Chemistry', 9, 78000);

-- Create a teacher_log Table
CREATE TABLE teacher_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT NOT NULL,
    action VARCHAR(50) NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create the before_insert_teacher Trigger
-- Create a trigger to prevent negative salary values

DELIMITER $$

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END$$

DELIMITER ;

-- Create the after_insert_teacher Trigger
-- Create a trigger to log inserts into the teacher_log table

DELIMITER $$

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END$$

DELIMITER ;

-- Create the before_delete_teacher Trigger
-- Create a trigger to prevent deletion of teachers with more than 10 years of experience
DELIMITER $$

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete teachers with more than 10 years of experience';
    END IF;
END$$

DELIMITER ;

-- Create the after_delete_teacher Trigger
-- Create a trigger to log deletions into the teacher_log table

DELIMITER $$

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END$$

DELIMITER ;






