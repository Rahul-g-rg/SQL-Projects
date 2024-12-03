-- Database assignment4
CREATE DATABASE Assignment4;
USE Assignment4;
-- Create Tables
CREATE TABLE Country (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population BIGINT,
    Area FLOAT
);

-- Create Persons Table
CREATE TABLE Persons (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population BIGINT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(100)
);

-- Insert Data into Country Table
INSERT INTO Country (Country_name, Population, Area)
VALUES
('USA', 331000000, 9833520),
('India', 1400000000, 3287263),
('Canada', 38000000, 9984670),
('UK', 68000000, 243610),
('Australia', 26000000, 7692024),
('Germany', 83000000, 357022),
('France', 67000000, 551695),
('China', 1440000000, 9596960),
('Japan', 126000000, 377975),
('Russia', 146000000, 17098242);

-- Insert Data into Persons Table
INSERT INTO Persons (Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
('John', 'Doe', 331000000, 4.5, 1, 'USA'),
('Jane', 'Smith', 1400000000, 3.8, 2, 'India'),
('Emily', 'Brown', 38000000, 4.7, 3, 'Canada'),
('Michael', 'Clark', 68000000, 4.2, 4, 'UK'),
('Sophia', 'Davis', 26000000, 4.1, 5, 'Australia'),
('William', 'Wilson', 83000000, 5.0, 6, 'Germany'),
('Olivia', 'Taylor', 67000000, 4.3, 7, 'France'),
('Liam', 'Johnson', 1440000000, 3.6, 8, 'China'),
('Noah', 'White', 126000000, 4.8, 9, 'Japan'),
('Emma', 'Lee', NULL, 4.9, NULL, NULL);

-- Queries for the Assignment
-- 1 List Distinct Country Names
SELECT DISTINCT Country_name FROM Persons;

-- Select First Names and Last Names with Aliases
SELECT Fname AS First_Name, Lname AS Last_Name FROM Persons;

-- Find All Persons with a Rating Greater Than 4.0
SELECT * FROM Persons WHERE Rating > 4.0;

-- Find Countries with a Population Greater Than 10 Lakhs
SELECT * FROM Country WHERE Population > 1000000;

-- Find Persons from 'USA' or with a Rating Greater Than 4.5
SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;

-- Find All Persons Where Country Name is NULL
SELECT * FROM Persons WHERE Country_name IS NULL;

-- Find All Persons from 'USA', 'Canada', and 'UK'
SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');

-- Find All Persons Not from 'India' and 'Australia'
SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');

-- Find All Countries with a Population Between 5 Lakhs and 20 Lakhs
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;

-- Find All Countries Whose Names Do Not Start with 'C'
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';
