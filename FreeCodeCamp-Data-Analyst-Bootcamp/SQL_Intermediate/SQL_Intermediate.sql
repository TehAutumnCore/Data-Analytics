/*INTERMEDIATE*/

/*
Inner Joins, Full/Left/Right outer joins

Inner Join - middle where A overlap B
Left outer Join - table a
Right outer join - table b
Full outer join - table a and table b
*/

--SELECT * 
--FROM SQLTutorial.dbo.EmployeeDemographics

--SELECT * 
--FROM SQLTutorial.dbo.EmployeeSalary

--SELECT * 
--FROM SQLTutorial.dbo.EmployeeDemographics
--Inner Join SQLTutorial.dbo.EmployeeSalary --inner join is default
--ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID --connect both tables based off of EmployeeID from the first column from BOTH tables

--SELECT * 
--FROM SQLTutorial.dbo.EmployeeDemographics
--Full Outer Join SQLTutorial.dbo.EmployeeSalary --everything in left and right 
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT *
--FROM SQLTutorial.dbo.EmployeeDemographics
--Left Outer Join SQLTutorial.dbo.EmployeeSalary --Left, and what overlaps right
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT * 
--FROM SQLTutorial.dbo.EmployeeDemographics
--Right Outer Join SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT EmployeeDemographics.EmployeeID, FirstName,LastName, JobTitle,Salary
--FROM SQLTutorial.dbo.EmployeeDemographics
--Inner  Join SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


--SELECT EmployeeDemographics.EmployeeID, FirstName,LastName, JobTitle,Salary
--FROM SQLTutorial.dbo.EmployeeDemographics
--Right Outer Join SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT EmployeeSalary.EmployeeID, FirstName,LastName, JobTitle,Salary
--FROM SQLTutorial.dbo.EmployeeDemographics
--Left Outer Join SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--highest salary that isnt michael
--SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
--FROM SQLTutorial.dbo.EmployeeDemographics
--Inner Join SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE FirstName != 'Michael'
--ORDER BY Salary DESC


-- Average Salary for Salesman JobTitle
--SELECT JobTitle, AVG(Salary) as SalaryAverage
--FROM SQLTutorial.dbo.EmployeeDemographics
--Inner Join SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--Where JobTitle = 'Salesman'
--GROUP BY JobTitle

/*Unions | Union Operator*/