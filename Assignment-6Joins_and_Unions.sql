CREATE DATABASE ASSIGNMENT6;
USE ASSIGNMENT6;
-- Create the Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area FLOAT
);

-- Create the Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

-- Insert Data

-- Insert rows into Country table
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'India', 1400000000, 3287263),
(2, 'USA', 331000000, 9833520),
(3, 'China', 1440000000, 9596961),
(4, 'Brazil', 213000000, 8515767),
(5, 'Germany', 83000000, 357022);

-- Insert rows into Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 1000, 4.5, 1, 'India'),
(2, 'Jane', 'Smith', 2000, 4.8, 2, 'USA'),
(3, 'Emily', 'Clark', 1500, 4.2, 3, 'China'),
(4, 'Michael', 'Brown', 800, 3.9, 4, 'Brazil'),
(5, 'Sarah', 'Johnson', 1700, 4.7, 5, 'Germany');

-- 1 Perform Inner Join, Left Join, and Right Join on the tables

-- Inner Join
SELECT Country.Id as CountryId,
Country.Country_name as CountryName,
Persons.Fname as FirstName,
Persons.Lname as LastName 
from Country
INNER JOIN Persons
ON Country.Id = Persons.Country_Id;

-- Left Join
SELECT
Country.Id AS CountryId,
Country.Country_name AS CountryName,
Persons.Fname AS FirstName,
Persons.Lname AS LastName 
FROM Country
LEFT JOIN Persons
ON Country.Id = Persons.Country_Id;

-- Right Join
SELECT
Country.Id AS CountryId, 
Country.Country_name AS CountryName,
Persons.Fname AS FirstName,
Persons.Lname AS LastName 
FROM Country
RIGHT JOIN Persons 
ON Country.Id = Persons.Country_Id;

-- List all distinct country names from both tables
SELECT Country_name FROM Country
UNION
SELECT Country_name FROM Persons;

-- List all country names from both tables, including duplicates
SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;

-- Round the ratings of all persons to the nearest integer in the Persons table
-- Update the ratings
SET SQL_SAFE_UPDATES = 0;
UPDATE Persons 
SET Rating = ROUND(Rating);
SET SQL_SAFE_UPDATES = 1;

-- Check the updated values
SELECT Id, Fname, Lname, Rating FROM Persons;

