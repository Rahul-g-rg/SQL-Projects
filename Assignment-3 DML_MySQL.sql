create database Assignment3;
-- create the Managers table
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_Name VARCHAR(50),
    DOB DATE,
    Age INT CHECK (Age > 0),
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Gender ENUM('Male', 'Female', 'Other'),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2) NOT NULL
);
-- Insert 10 Rows
INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary)
VALUES
(1, 'John', 'Doe', '1980-05-10', 44, 'Male', 'IT', 30000),
(2, 'Jane', 'Smith', '1985-07-15', 39, 'Female', 'HR', 25000),
(3, 'Mark', 'Taylor', '1990-12-01', 34, 'Male', 'Finance', 40000),
(4, 'Aaliya', 'Khan', '1992-08-22', 32, 'Female', 'IT', 35000),
(5, 'Michael', 'Brown', '1983-11-05', 41, 'Male', 'Marketing', 28000),
(6, 'Emily', 'Davis', '1995-03-19', 29, 'Female', 'Finance', 20000),
(7, 'Daniel', 'White', '1988-10-12', 36, 'Male', 'IT', 32000),
(8, 'Sophia', 'Green', '1993-06-07', 31, 'Female', 'HR', 22000),
(9, 'Chris', 'Black', '1984-09-23', 40, 'Male', 'Sales', 27000),
(10, 'Laura', 'Wilson', '1989-04-16', 35, 'Female', 'IT', 30000);

-- Queries for Each Requirement Retrieve the name and date of birth of the manager with Manager_Id = 1
SELECT First_name, Last_Name, DOB 
FROM Managers 
WHERE Manager_Id = 1;

-- Annual income of all managers
SELECT Manager_Id, First_name, Last_Name, (Salary * 12) AS Annual_Income
FROM Managers;

-- Records of all managers except Aaliya
SELECT * 
FROM Managers 
WHERE First_name != 'Aaliya';

-- Details of managers whose department is IT and earns more than 25000 per month

SELECT * 
FROM Managers 
WHERE Department = 'IT' AND Salary > 25000;

-- Details of managers whose salary is between 10000 and 35000
SELECT * 
FROM Managers 
WHERE Salary BETWEEN 10000 AND 35000;
