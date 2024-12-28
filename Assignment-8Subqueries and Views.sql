CREATE database Assignment8;
USE Assignment8;
-- Create the Country Table:
CREATE TABLE Country (
Country_Id int auto_increment primary key,
Country_Name varchar(225) NOT NULL,
Population INT NOT NULL
);
-- Create the Persons Table:
Create table Persons (
Person_Id INT auto_increment primary key,
First_Name varchar(225) NOT NULL,
Last_name varchar(225) NOT NULL,
Country_Id INT NOT NULL,
Rating float,
foreign key (Country_Id) references Country(country_Id)
);

-- Insert Sample Data for Country:
INSERT INTO Country (Country_Name, Population) VALUES 
('USA', 331002651), 
('India', 1380004385), 
('UK', 67886011);

-- Insert Sample Data for Persons:
INSERT INTO Persons (First_Name, Last_Name, Country_Id, Rating) VALUES 
('John', 'Doe', 1, 4.5), 
('Jane', 'Smith', 2, 3.5), 
('William', 'Brown', 3, 3.0), 
('Emily', 'Davis', 1, 4.0);

-- Solve Subqueries and Views
-- 1. Find the number of persons in each country
SELECT Country.Country_Name, COUNT(Persons.Person_Id) AS Number_Of_Persons
FROM Country
LEFT JOIN Persons ON Country.Country_Id = Persons.Country_Id
GROUP BY Country.Country_Name;

-- 2. Find the number of persons in each country sorted from high to low.
SELECT Country.Country_Name, COUNT(Persons.Person_Id) AS Number_Of_Persons
FROM Country
LEFT JOIN Persons ON Country.Country_Id = Persons.Country_Id
GROUP BY Country.Country_Name
ORDER BY Number_Of_Persons DESC;

-- 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0.
SELECT Country.Country_Name, AVG(Persons.Rating) AS Average_Rating
FROM Country
LEFT JOIN Persons ON Country.Country_Id = Persons.Country_Id
GROUP BY Country.Country_Name
HAVING AVG(Persons.Rating) > 3.0;

-- 4. Find the countries with the same rating as the USA. (Use Subqueries)
SELECT Country_Name
FROM Country
WHERE Country_Id IN (
    SELECT Country_Id
    FROM Persons
    WHERE Rating IN (
        SELECT Rating 
        FROM Persons 
        WHERE Country_Id = 1
    )
);
-- 5. Select all countries whose population is greater than the average population of all nations.
SELECT Country_Name, Population
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);

-- Create Product Database and Customer Table
-- 1. Create Product Database:
CREATE DATABASE Product;
USE Product;
-- Create Customer Table:
CREATE TABLE Customer (
    Customer_Id INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(255) NOT NULL,
    Last_Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Phone_No VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Zip_Code VARCHAR(10),
    Country VARCHAR(100)
);
-- Insert Sample Data:
INSERT INTO Customer (First_Name, Last_Name, Email, Phone_No, Address, City, State, Zip_Code, Country) VALUES 
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St', 'Los Angeles', 'California', '90001', 'USA'),
('Jane', 'Smith', 'jane.smith@example.com', '9876543210', '456 Elm St', 'New York', 'New York', '10001', 'USA'),
('Emily', 'Davis', 'emily.davis@example.com', '5551234567', '789 Oak St', 'Dallas', 'Texas', '75001', 'USA');

-- Create and Use Views
-- 1. Create a view customer_info and perform SELECT:
CREATE VIEW customer_info AS
SELECT CONCAT(First_Name, ' ', Last_Name) AS Full_Name, Email
FROM Customer;

SELECT * FROM customer_info;

-- 2. Create a view US_Customers:
CREATE VIEW US_Customers AS
SELECT * 
FROM Customer
WHERE Country = 'USA';

-- 3. Create a view Customer_details:
CREATE VIEW Customer_details AS
SELECT CONCAT(First_Name, ' ', Last_Name) AS Full_Name, Email, Phone_No, State
FROM Customer;

-- 4. Update phone numbers of customers in California:
SET SQL_SAFE_UPDATES = 0;
UPDATE Customer
SET Phone_No = '0000000000'
WHERE State = 'California';

-- 5. Count the number of customers in each state (only states with > 5 customers):
SELECT State, COUNT(*) AS Number_Of_Customers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;
-- 6. Return the number of customers in each state from Customer_details:
SELECT State, COUNT(*) AS Number_Of_Customers
FROM Customer_details
GROUP BY State;

-- 7. Return all columns from Customer_details, sorted by state:
SELECT * 
FROM Customer_details
ORDER BY State ASC;








