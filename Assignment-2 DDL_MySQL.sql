CREATE DATABASE Sales;
-- Orders Table in the Sales Database
USE Sales;
CREATE table Orders (
Order_ID int PRIMARY KEY,  -- Primary key 
Customer_Name varchar(100) NOT NULL, -- NOT NULL
Product_Category varchar(50) NOT NULL,
Ordered_item varchar(100) NOT NULL,
Contact_No varchar(15) unique -- UNIQUE
);

-- New Column order_quantity
ALTER TABLE Orders add Order_Quantity int;

-- Rename the Orders Table to sales_orders
RENAME TABLE Orders to Sales_Orders;

-- Insert 10 Rows into the sales_orders Table
INSERT INTO Sales_Orders (Order_ID, Customer_Name, Product_Category, Ordered_item, Contact_No, Order_Quantity)
values
(1, 'Alice', 'Electronics', 'Smartphone', '1234567890', 2),
(2, 'Bob', 'Groceries', 'Apple', '9876543210', 5),
(3, 'Charlie', 'Clothing', 'T-shirt', '1122334455', 1),
(4, 'Diana', 'Electronics', 'Laptop', '2233445566', 1),
(5, 'Eve', 'Books', 'Novel', '3344556677', 3),
(6, 'Frank', 'Furniture', 'Chair', '4455667788', 4),
(7, 'Grace', 'Beauty', 'Lipstick', '5566778899', 2),
(8, 'Hank', 'Groceries', 'Banana', '6677889900', 6),
(9, 'Ivy', 'Clothing', 'Jeans', '7788990011', 2),
(10, 'Jack', 'Toys', 'Action Figure', '8899001122', 1);

-- Retrieve Customer Names and Ordered Items
SELECT Customer_Name, Ordered_item from Sales_Orders;

-- Update a Row in the sales_orders Table (if getting safe update error)
SET SQL_SAFE_UPDATES = 0; -- Temporarily Disable Safe Update Mode

UPDATE Sales_Orders
SET Ordered_item = 'Tablet'
WHERE Ordered_item = 'Smartphone';

SET SQL_SAFE_UPDATES = 1; -- Re-enable safe update mode 

-- Delete the sales_orders Table
DROP TABLE Sales_orders;