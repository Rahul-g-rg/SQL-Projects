-- Creating a Database
CREATE DATABASE School;
USE School;

-- Creating a STUDENT table


-- Inserting data
insert into STUDENT (Roll_No, Name, Marks, Grade) values
(1, 'Alice', 85, 'A'),
(2, 'Boby', 76, 'B'),
(3, 'Charlie', 92, 'A'),
(4, 'Diana', 68, 'C');

-- Add column CONTACT (ALTER,ADD) 
ALTER TABLE STUDENT ADD Contact VARCHAR(15);

-- Remove the GRADE Column (alter,DROP) 
ALTER TABLE STUDENT DROP COLUMN Grade;

-- Rename the STUDENT table in to CLASSTEN
RENAME TABLE STUDENT TO CLASSTEN;

-- Delete all rows from the table (TRUNCATE)
truncate table CLASSTEN;

-- Remove the CLASSTEN table 
DROP TABLE CLASSTEN;