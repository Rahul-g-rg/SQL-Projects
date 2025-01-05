CREATE DATABASE Company;
USE Company;

--  Create the Worker Table
-- Recreate the Worker table with the required structure:
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,
    JoiningDate DATETIME,
    Department CHAR(25)
);
-- Insert Test Data
-- Add some sample data for testing:
INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES 
(1, 'John', 'Doe', 50000, '2023-01-01', 'HR'),
(2, 'Jane', 'Smith', 60000, '2023-02-01', 'IT'),
(3, 'Bob', 'Brown', 55000, '2023-03-01', 'Marketing');

-- Verify the data:
SELECT * FROM Worker;

-- Create the UpdateDepartment Procedure
-- Define the stored procedure to update the department:

DELIMITER $$

CREATE PROCEDURE UpdateDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END $$

DELIMITER ;

-- Verify the Procedure
-- Ensure the procedure was created successfully:

SHOW PROCEDURE STATUS WHERE Db = 'Company';

-- Test the Procedure
-- Call the procedure to update the department of a worker. For example:
CALL UpdateDepartment(1, 'Finance');

-- Check the updated data:
SELECT * FROM Worker WHERE Worker_Id = 1;
-- Additional Verification
SELECT DATABASE();
SHOW TABLES;
DESCRIBE Worker;
