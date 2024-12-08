CREATE DATABASE Assignment7;
Use Assignment7;

-- Create the Country Table
CREATE TABLE Country (
CountryID INT AUTO_INCREMENT PRIMARY KEY, 
CountryName VARCHAR(100) NOT NULL
);

-- Create the Persons Table
CREATE TABLE Persons (
PersonID INT AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
CountryID INT,
FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);

-- Insert Sample Data into Tables
INSERT INTO Country (CountryName)
VALUES ('India'), ('United States'), ('Canada'), ('Australia'), ('Germany');

-- Insert data into Persons table
INSERT INTO Persons (Name, CountryID)
VALUES 
    ('Alice', 1), 
    ('Bob', 2), 
    ('Charlie', 3), 
    ('Diana', 4), 
    ('Eve', 5);

-- Add the DOB Column to the Persons Table
ALTER TABLE Persons
ADD DOB DATE;

-- Update the table with sample dates of birth
SET SQL_SAFE_UPDATES = 0; 
UPDATE Persons
SET DOB = '1990-01-15' WHERE Name = 'Alice';
UPDATE Persons
SET DOB = '1985-03-22' WHERE Name = 'Bob';
UPDATE Persons
SET DOB = '1992-07-11' WHERE Name = 'Charlie';
UPDATE Persons
SET DOB = '1980-10-05' WHERE Name = 'Diana';
UPDATE Persons
SET DOB = '1995-12-30' WHERE Name = 'Eve';

-- Create the Function to Calculate Age
DELIMITER //

CREATE FUNCTION CalculateAge(dob DATE) 
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE age INT;
SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());
RETURN age;
END; //

DELIMITER ;

-- Fetch the Age of All Persons
SELECT PersonID, Name, DOB, CalculateAge(DOB) AS Age
FROM Persons;

-- Find the Length of Each Country Name
SELECT CountryID, CountryName, LENGTH(CountryName) AS NameLength
FROM Country;

-- Extract the First Three Characters of Each Country Name
SELECT CountryID, CountryName, SUBSTRING(CountryName, 1, 3) AS FirstThreeChars
FROM Country;

-- Convert Country Names to Uppercase and Lowercase

SELECT CountryID, CountryName, 
UPPER(CountryName) AS UppercaseName,
LOWER(CountryName) AS LowercaseName
FROM Country;

