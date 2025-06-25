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


/*
	Today's Topic: Union, Union All
Joins combine data by a common column
Unions combines data into a column
*/



--SELECT *
--FROM SQLTutorial.dbo.EmployeeDemographics
--UNION --removes duplicates
--SELECT *
--FROM SQLTutorial.dbo.WareHouseEmployeeDemographics

--SELECT *
--FROM SQLTutorial.dbo.EmployeeDemographics
--UNION ALL--shows all information including duplicates
--SELECT *
--FROM SQLTutorial.dbo.WareHouseEmployeeDemographics
--ORDER BY EmployeeID

--SELECT EmployeeID, FirstName, Age
--FROM SQLTutorial.dbo.EmployeeDemographics
--UNION --although different information, same data types such as int,str,int
--SELECT EmployeeID, JobTitle, Salary
--FROM SQLTutorial.dbo.EmployeeSalary
--ORDER BY EmployeeID

--SELECT *
--FROM SQLTutorial.dbo.EmployeeDemographics ED
--FULL Outer Join SQLTutorial.dbo.WareHouseEmployeeDemographics WED
--	ON ED.EmployeeID = WED.EmployeeID

/*
Today's Topic : Case Statement
*/

--SELECT FirstName, LastName, Age,
--CASE 
--	WHEN Age = 38 THEN 'Stanley'
--	WHEN Age > 30 THEN 'Old'
--	ELSE 'Baby'
--END AS 'Young Or Old'
--FROM SQLTutorial.dbo.EmployeeDemographics
--WHERE Age is NOT NULL
--ORDER BY Age

--CASE 
--	WHEN Age > 30 THEN 'Old'
--	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
--	Else 'Baby'
--END AS 'Young Or Old'
--FROM SQLTutorial.dbo.EmployeeDemographics
--WHERE Age is NOT NULL
--ORDER BY Age

--SELECT FirstName, LastName, JobTitle, Salary,
--CASE
--	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
--	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .5)
--	WHEN JobTitle = 'HR'THEN SALARY + (Salary * .000001)
--	ELSE SALARY + (SALARY * .03)
--END AS SalaryAfterRaise
--FROM SQLTutorial.dbo.EmployeeDemographics ED
--JOIN SQLTutorial.dbo.EmployeeSalary ES
--	ON ED.EmployeeID = ES.EmployeeID

/*
	Topic: Having Clause
*/

--SELECT JobTitle, COUNT(JobTitle) AS JobTitleCount
--FROM SQLTutorial.dbo.EmployeeDemographics ED
--JOIN SQLTutorial.dbo.EmployeeSalary ES 
--	ON ED.EmployeeID = ES.EmployeeID
--GROUP BY JobTitle
--HAVING COUNT(JobTitle) > 1 --WHERE COUNT(JobTitle) > 1
--ORDER BY JobTitleCount DESC

--SELECT JobTitle, AVG(Salary) AS SalaryAvg
--FROM SQLTutorial.dbo.EmployeeDemographics ED
--JOIN SQLTutorial.dbo.EmployeeSalary ES 
--	ON ED.EmployeeID = ES.EmployeeID
--GROUP BY JobTitle
--HAVING AVG(Salary) > 45000
--ORDER BY AVG(Salary) DESC

/*
Topic : Updating / Deleting Data
*/

--SELECT *
--FROM SQLTutorial.dbo.EmployeeDemographics ED

--UPDATE SQLTutorial.dbo.EmployeeDemographics
--SET EmployeeID = 1012, Age = 31, Gender = 'Female'
--WHERE FirstName = 'Holly' AND LastName = 'Flax'
--SET EmployeeID = 1012
--WHERE EmployeeID = 1012

--DELETE FROM SQLTutorial.dbo.EmployeeDemographics
--WHERE EmployeeID = 1005

--SELECT * /*Use SELECT to see what you were going to delete, then switch SELECT with DELETE*/
--FROM SQLTutorial.dbo.EmployeeDemographics
--WHERE EmployeeID = 1004

/*
Topic: Aliasing
*/

--SELECT FirstName + ' ' + LastName AS FullName
--FROM [SQLTutorial].[dbo].[EmployeeDemographics]

--SELECT Avg(Age) AS AvgAge
--FROM SQLTutorial.dbo.EmployeeDemographics

--SELECT Demo.EmployeeID, Sal.Salary
--FROM [SQLTutorial].[dbo].[EmployeeDemographics] AS Demo
--JOIN [SQLTutorial].[dbo].[EmployeeSalary] AS Sal
--	ON Demo.EmployeeID = Sal.EmployeeID

--SELECT DEMO.EmployeeID, DEMO.FirstName, DEMO.FirstName, SAL.JobTitle, WARE.Age
--FROM SQLTutorial.dbo.EmployeeDemographics DEMO
--LEFT JOIN SQLTutorial.dbo.EmployeeSalary SAL
--	ON DEMO.EmployeeID = SAL.EmployeeID
--LEFT JOIN SQLTutorial.dbo.WareHouseEmployeeDemographics WARE
--	ON DEMO.EmployeeID = WARE.EmployeeID

/*
	Partition By
*/

--SELECT *
--FROM SQLTutorial.dbo.EmployeeDemographics

--SELECT *
--FROM SQLTutorial.dbo.EmployeeSalary

--SELECT D.FirstName, D.LastName, D.Gender, S.Salary, COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender --row level detail, and group level insight, so it doesnt collapse data together like group by
--FROM SQLTutorial.dbo.EmployeeDemographics D
--JOIN SQLTutorial.dbo.EmployeeSalary S
--	ON D.EmployeeID = S.EmployeeID

--SELECT D.Gender, COUNT(Gender) AS GenderCount
--FROM SQLTutorial.dbo.EmployeeDemographics D
--JOIN SQLTutorial.dbo.EmployeeSalary S
--	ON D.EmployeeID = S.EmployeeID
--GROUP BY D.Gender