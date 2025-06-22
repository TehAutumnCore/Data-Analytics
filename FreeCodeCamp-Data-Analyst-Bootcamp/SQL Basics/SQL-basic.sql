--creating EmployeeDemographics table
--CREATE TABLE EmployeeDemographics
--(
--EmployeeID int, 
--FirstName varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50)
--)

--creating EmployeeSalary table
--CREATE TABLE EmployeeSalary
--(
--EmployeeID int,
--JobTitle varchar(50),
--Salary int
--)

--inserting values into the employeedemographics table
--INSERT INTO EmployeeDemographics VALUES
--(1001, 'Jim', 'Halpert',30,'Male')
--(1002, 'Pam','Beasly', 30, 'Female'),
--(1003,'Dwight','Schrute',29,'Male'),
--(1004,'Angela','Martin',31,'Female'),
--(1005,'Toby','Flenderson',32,'Male'),
--(1006,'Michael','Scott',35,'Male'),
--(1007,'Meredith','Palmer',32,'Female'),
--(1008,'Stanley','Hudson',38,'Male'),
--(1009,'Kevin','Malone',31,'Male')


--inserting values into the employee salary table
--INSERT INTO EmployeeSalary VALUES
--(1001, 'Salesman',45000),
--(1002,'Receptionist',36000),
--(1003,'Salesman',63000),
--(1004,'Accountant',47000),
--(1005,'HR',50000),
--(1006,'Regional Manager',65000),
--(1007,'Supplier Relations',41000),
--(1008,'Salesman',48000),
--(1009,'Accountant',42000)

--deleting an entry from the employeedemographics table where the ID is 1001
--DELETE FROM EmployeeDemoGraphics
--WHERE EmployeeID = 1001;


/*
Select Statement
*, Top, Distinct, Count, As, Max, Min, Avg
*/

--SELECT * 
--FROM EmployeeDemographics

--SELECT FirstName, LastName
--FROM EmployeeDemographics

--SELECT * all columns and rows; everything
--FROM EmployeeDemographics

--SELECT TOP 5 * --SELECT the top 5 of every column and row
--FROM EmployeeDemographics

--SELECT DISTINCT(EmployeeID) --grab all unique employeeIDs
--FROM EmployeeDemographics

--SELECT DISTINCT(Gender) --only grabs the two distinct unique values, 
--FROM EmployeeDemographics

--SELECT COUNT(LastName) AS LastNameCount--grabs the total count of LastName, and names column LastNameCount
--FROM EmployeeDemographics

--SELECT MAX(Salary) AS MaxSalary
--FROM SQLTutorial.dbo.EmployeeSalary --specifies where to pull from

--SELECT MIN(Salary) AS MinSalary
--FROM SQLTutorial.dbo.EmployeeSalary --Syntax: database.table

--SELECT AVG(Salary) AS AvgSalary
--FROM SQLTutorial.dbo.EmployeeSalary

/*
WHERE Statement
=, <>, <, >, And, Or, Like, Null, Not Null, In
*/

--SELECT *
--FROM SQLTutorial.dbo.EmployeeDemographics
--WHERE FirstName = 'Jim' --only looks for Jim

--SELECT * 
--FROM SQLTutorial.dbo.EmployeeDemographics 
--WHERE FirstName <> 'Jim' -- looks for entries that is not Jim

--SELECT * 
--FROM SQLTutorial.dbo.EmployeeDemographics
--WHERE Age = 30 --where the age = 30

--SELECT * 
--FROM SQLTutorial.dbo.EmployeeDemographics
--WHERE Age > 30 -- where age is more than 30

--SELECT * 
--FROM SQLTutorial.dbo.EmployeeDemographics
--WHERE Age >= 30 --where age is 30 and more

--SELECT * 
--FROM SQLTutorial.dbo.EmployeeDemographics
--WHERE Age < 32 --where age is less than 32

--SELECT * 
--FROM SQLTutorial.dbo.EmployeeDemographics
--WHERE Age <= 32 --where age is 32 and less

--SELECT * 
--FROM SQLTutorial.dbo.EmployeeDemographics
--WHERE Age > 30 And Gender = 'Male' --where age is more than 30, and is male

--SELECT * 
--FROM SQLTutorial.dbo.EmployeeDemographics
--WHERE Age <= 32 And Gender = 'Female' --where age is 32 and less, and is female

--% is a "Wildcard"
--SELECT * FROM EmployeeDemographics
--WHERE LastName LIKE 'S%' --look for last names that start with S

--SELECT * FROM EmployeeDemographics
--WHERE LastName LIKE '%T' --look for last names that end with T

--SELECT * FROM EmployeeDemographics
--WHERE LastName LIKE 'S%T' --look for last names that start with S and end with T

--SELECT * FROM EmployeeDemographics
--WHERE LastName LIKE 'S%O%T' --look for last names that start with S, Ends with T, and has an O

--SELECT * FROM EmployeeDemographics
--WHERE LastName LIKE '%S%' --look for last names that has an S anywhere within

--SELECT * FROM EmployeeDemographics
--WHERE FirstName is NULL

--SELECT * FROM EmployeeDemographics
--WHERE FirstName is NOT NULL

--SELECT * FROM EmployeeDemographics
--WHERE FirstName IN ('Jim','Michael') --where FirstName = 'Jim' AND FirstName = 'Michael'


/*
Group By, Order By
*/
SELECT * 
FROM EmployeeDemographics