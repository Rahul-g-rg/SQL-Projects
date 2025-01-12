CREATE DATABASE library;
USE library;

-- Create Tables
-- 1. Branch Table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT NOT NULL,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- 2. Employee Table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- 3. Books Table
CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

-- 4. Customer Table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- 5. IssueStatus Table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- 6. ReturnStatus Table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

-- Insert Sample Data
-- Branch Table:
INSERT INTO Branch VALUES 
(1, 101, 'Main Street, City', '1234567890'),
(2, 102, 'Elm Avenue, City', '0987654321');

-- Employee Table:
INSERT INTO Employee VALUES 
(1, 'John Doe', 'Manager', 60000, 1),
(2, 'Jane Smith', 'Assistant', 40000, 1),
(3, 'Paul Adams', 'Manager', 75000, 2);

-- Books Table:
INSERT INTO Books VALUES 
(101, 'MySQL Essentials', 'Technology', 30.00, 'yes', 'John Smith', 'Tech Press'),
(102, 'Data Structures', 'Education', 25.00, 'no', 'Mark Lee', 'EduWorld'),
(103, 'World History', 'History', 40.00, 'yes', 'Emily Clarke', 'Histories Inc');

-- Customer Table:
INSERT INTO Customer VALUES 
(1, 'Alice', 'Maple Street, City', '2021-12-01'),
(2, 'Bob', 'Oak Lane, City', '2020-11-15'),
(3, 'Catherine', 'Pine Drive, City', '2022-06-20');

-- IssueStatus Table:
INSERT INTO IssueStatus VALUES 
(1, 1, 'MySQL Essentials', '2023-06-15', 101),
(2, 3, 'World History', '2023-06-10', 103);

-- ReturnStatus Table:
INSERT INTO ReturnStatus VALUES 
(1, 1, 'MySQL Essentials', '2023-06-20', 101);

-- Queries

-- 1. Retrieve book title, category, and rental price of all available books:
SELECT Book_title, Category, Rental_Price 
FROM Books 
WHERE Status = 'yes';

-- 2. List employee names and their respective salaries in descending order of salary:
SELECT Emp_name, Salary 
FROM Employee 
ORDER BY Salary DESC;

-- 3. Retrieve book titles and corresponding customers who issued those books:
SELECT Books.Book_title, Customer.Customer_name 
FROM IssueStatus 
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN 
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

-- 4. Display the total count of books in each category:
SELECT Category, COUNT(*) AS Total_Books 
FROM Books 
GROUP BY Category;

-- 5. Retrieve employee names and positions for employees with salaries above Rs. 50,000:
SELECT Emp_name, Position 
FROM Employee 
WHERE Salary > 50000;

-- 6. List customer names who registered before 2022-01-01 and have not issued any books:
SELECT Customer_name 
FROM Customer 
WHERE Reg_date < '2022-01-01' 
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7. Display branch numbers and total count of employees in each branch:
SELECT Branch_no, COUNT(*) AS Employee_Count 
FROM Employee 
GROUP BY Branch_no;

-- 8. Display names of customers who issued books in June 2023:
SELECT Customer_name 
FROM Customer 
WHERE Customer_Id IN (
    SELECT Issued_cust 
    FROM IssueStatus 
    WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30'
);

-- 9. Retrieve book titles containing the word "history":
SELECT Book_title 
FROM Books 
WHERE Book_title LIKE '%history%';

-- 10. Retrieve branch numbers with employee count greater than 5:
SELECT Branch_no, COUNT(*) AS Employee_Count 
FROM Employee 
GROUP BY Branch_no 
HAVING Employee_Count > 5;

-- 11. Retrieve names of employees managing branches and their branch addresses:
SELECT Emp_name, Branch_address 
FROM Employee 
JOIN Branch ON Employee.Branch_no = Branch.Branch_no 
WHERE Position = 'Manager';

-- 12. Display names of customers who issued books with a rental price higher than Rs. 25:
SELECT Customer_name 
FROM Customer 
JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust 
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN 
WHERE Rental_Price > 25;

