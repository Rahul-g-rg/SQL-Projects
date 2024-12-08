Create DATABASE ASSIGNMENT5;
USE ASSIGNMENT5;
-- Create Tables Country and Persons 
Create table COUNTRY (
ID int Primary key,
COUNTRY_NAME VARCHAR (50),
POPULATION INT,
AREA FLOAT
);

Create Table PERSONS (
ID INT PRIMARY KEY,
FNAME VARCHAR(50),
LNAME VARCHAR(50),
POPULATION INT,
RATING FLOAT,
COUNTRY_ID INT,
COUNTRY_NAME VARCHAR(50),
FOREIGN KEY (COUNTRY_ID) REFERENCES COUNTRY(ID)
);

-- Insert sample data into the Country table
INSERT INTO COUNTRY (ID, COUNTRY_NAME, POPULATION, AREA) VALUES
(1, 'India', 1400000000, 3287263),
(2, 'USA', 331000000, 9833520),
(3, 'China', 1440000000, 9596961),
(4, 'Brazil', 213000000, 8515767),
(5, 'Germany', 83000000, 357022),
(6, 'France', 67000000, 551695),
(7, 'Italy', 60000000, 301340),
(8, 'UK', 68000000, 243610),
(9, 'Australia', 26000000, 7692024),
(10, 'Canada', 38000000, 9984670);

-- Insert sample data into the Persons table
INSERT INTO PERSONS (ID, FNAME, LNAME, POPULATION, RATING, COUNTRY_ID, COUNTRY_NAME) VALUES
(1, 'John', 'Doe', 1000, 4.5, 1, 'India'),
(2, 'Jane', 'Smith', 2000, 4.8, 2, 'USA'),
(3, 'Emily', 'Clark', 1500, 4.2, 3, 'China'),
(4, 'Michael', 'Brown', 800, 3.9, 4, 'Brazil'),
(5, 'Sarah', 'Johnson', 1700, 4.7, 5, 'Germany'),
(6, 'Chris', 'Davis', 2200, 4.1, 6, 'France'),
(7, 'Laura', 'Miller', 1300, 3.8, 7, 'Italy'),
(8, 'Daniel', 'Wilson', 1900, 4.3, 8, 'UK'),
(9, 'Sophia', 'Moore', 900, 4.0, 9, 'Australia'),
(10, 'Ryan', 'Taylor', 1400, 4.6, 10, 'Canada');

-- 1 Print the first three characters of Country_name from the Country table
SELECT LEFT (COUNTRY_NAME, 3) AS SHORTNAME FROM COUNTRY;

-- 2 Concatenate Fname and Lname from the Persons table
SELECT CONCAT(FNAME,' ',LNAME) AS FULL_NAME FROM PERSONS;

-- 3 Count the number of unique Country_name values from the Persons table
SELECT COUNT(DISTINCT COUNTRY_NAME) AS UNIQUE_COUNTRIES from PERSONS;

-- 4 Print the maximum Population from the Country table
SELECT MAX(POPULATION) AS MAX_POLULATION FROM COUNTRY;

-- 5 Print the minimum Population from the Persons table
SELECT MIN(POPULATION) AS MINPOPULATION FROM PERSONS;

-- 6 Insert 2 new rows into the Persons table with Lname as NULL and count Lname
INSERT INTO PERSONS (ID, FNAME, LNAME, POPULATION, RATING, COUNTRY_ID, COUNTRY_NAME) VALUES
(11, 'Liam', NULL, 1200, 4.4, 1, 'India'),
(12, 'Olivia', NULL, 900, 3.7, 2, 'USA');

SELECT COUNT(LNAME) AS COUNT_OF_LAST_NAME FROM PERSONS;

-- 7 Find the number of rows in the Persons table
SELECT COUNT(*) AS TOTALROWS FROM PERSONS;

-- 8 Show the Population of the first 3 rows from the Country table
SELECT POPULATION FROM COUNTRY LIMIT 3;

-- 9 Print 3 random rows of countries
SELECT * FROM COUNTRY ORDER BY RAND() LIMIT 3;

-- 10 List all persons ordered by their Rating in descending order
SELECT * FROM PERSONS ORDER BY RATING DESC;

-- 11 Find the total population for each country in the Persons table
SELECT COUNTRY_NAME, SUM(POPULATION) AS TOTAL_POPULATION FROM PERSONS
GROUP BY COUNTRY_NAME;

-- 12 Find countries in the Persons table with a total population greater than 50,000
SELECT COUNTRY_NAME
FROM PERSONS
GROUP BY COUNTRY_NAME
HAVING SUM(POPULATION) > 50000;

-- 13 List the total number of persons and average rating for each country (with > 2 persons
SELECT COUNTRY_NAME, COUNT(*) AS TOTAL_PERSONS, AVG(RATING) AS AVG_RATING FROM PERSONS
GROUP BY COUNTRY_NAME
HAVING COUNT(*) > 2
ORDER BY AVG_RATING ASC

