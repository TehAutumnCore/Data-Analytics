/*Advanced SQL*/
/*
	Common Table Expression (CTEs)
created in memory, similar to subqueries
*/

--WITH CTE_Employee as 
--(SELECT FirstName, LastName, Gender, Salary,
--COUNT(gender) OVER (PARTITION BY Gender) as TotalGender,
--AVG(Salary) OVER (PARTITION BY Gender) as AvgSalary
--FROM SQLTutorial..EmployeeDemographics Demo
--JOIN SQLTutorial..EmployeeSalary Sal
--	ON Demo.EmployeeID = Sal.EmployeeID
--	WHERE Salary > '45000'
--)
--SELECT FirstName, AvgSalary
--FROM CTE_Employee


/*
	Temp Tables
*/
--DROP TABLE IF EXISTS #temp_Employee
--CREATE TABLE #temp_Employee ( --creating temp table
--EmployeeID int,
--JobTitle varchar(100),
--Salary int
--)

--SELECT *
--FROM #temp_Employee --select * from temp table

--INSERT INTO #temp_Employee VALUES ( --inseritng values into the temporary table
--'1001','HR','45000')

--INSERT INTO #temp_Employee
--SELECT * 
--FROM SQLTutorial..EmployeeSalary --inserts employeesalary data into temp_employee

--/*inserting data from large data set, to run queries off of */

--DROP TABLE IF EXISTS #temp_Employee2
--CREATE TABLE #Temp_Employee2 (
--JobTitle VARCHAR(50),
--EmployeesPerJob int,
--AvgAge int,
--AvgSalary int
--)

--INSERT INTO #Temp_Employee2
--SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
--FROM SQLTutorial..EmployeeDemographics Demo
--JOIN SQLTutorial..EmployeeSalary Sal
--	On Demo.EmployeeID = Sal.EmployeeID
--GROUP BY JobTitle

--SELECT * 
--FROM #Temp_Employee2

/*
	String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower
*/

--Drop Table EmployeeErrors

--DROP TABLE IF EXISTS EmployeeErrors
--CREATE TABLE EmployeeErrors (
--	EmployeeID varchar(50),
--	FirstName varchar(50),
--	LastName varchar(50)
--)

--INSERT INTO EmployeeErrors Values
--('1001  ','Jimbo','Halbert'),
--('  1002','Pamela','Beasely'),
--('1005','TOby','Flenderson - Fired')

--SELECT *
--FROM EmployeeErrors

----Using TRIM,LTRIM,RTRIM
--SELECT EmployeeID, TRIM(EmployeeID) as IDTRIM
--FROM EmployeeErrors

--SELECT EmployeeID, LTRIM(EmployeeID) as IDLTRIM
--FROM EmployeeErrors

--SELECT EmployeeID, RTRIM(EmployeeID) as IDRTRIM
--FROM EmployeeErrors

--Using Replace
--SELECT LastName, REPLACE(LastName, '- FIRED','') AS LastNameFixed
--FROM EmployeeErrors

--Using Substring
--SELECT FirstName,SUBSTRING(FirstName,1,3) as FNSubString --Firstname, start, length
--FROM EmployeeErrors

--SELECT EE.FirstName, SUBSTRING(EE.FirstName,1,3), ED.FirstName, SUBSTRING(ED.FirstName,1,3)
--FROM EmployeeErrors EE
--JOIN EmployeeDemographics ED
--	ON SUBSTRING(EE.FirstName,1,3) = SUBSTRING(ED.FirstName,1,3)

--Gender
--LastName
--AGE
--DOB

--Using Upper & Lower
--SELECT FirstName, LOWER(FirstName)
--FROM EmployeeErrors

--SELECT FirstName, UPPER(FirstName)
--FROM EmployeeErrors

/*
	Stored Procedures
*/

--CREATE PROCEDURE TEST
--AS
--SELECT *
--FROM EmployeeDemographics

--EXEC TEST

--CREATE PROCEDURE Temp_Employee
--AS
--BEGIN
--	CREATE TABLE #temp_employee (
--	JobTitle varchar(100),
--	EmployeesPerJob int,
--	AvgAge int,
--	AvgSalary int
--)
	
--	INSERT INTO #temp_employee
--	SELECT JobTitle, Count(JobTitle),Avg(Age),Avg(salary)
--	FROM SQLTutorial..EmployeeDemographics ED
--	JOIN SQLTutorial..EmployeeSalary ES
--		ON ED.EmployeeID = ES.EmployeeID
--	GROUP BY JobTitle
	
--	SELECT * 
--	FROM #temp_employee
--END
--EXEC Temp_Employee @JobTitle = 'Salesman'

/*
	Subqueries (in the SELECT, FROM, and WHERE statement)
*/

SELECT *
FROM EmployeeSalary

--Subquery in Select
SELECT ES.EmployeeID, ES.Salary, (SELECT AVG(Salary) FROM EmployeeSalary) AS ALLAvgSalary
FROM EmployeeSalary ES

--How to do it with Partition By


--Why Group by doesn't work


--Subquery in From