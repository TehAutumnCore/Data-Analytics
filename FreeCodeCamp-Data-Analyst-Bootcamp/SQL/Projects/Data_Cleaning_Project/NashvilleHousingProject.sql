/*

Cleaning Data in SQL Queries

*/

SELECT *
FROM PortfolioProject..NashvilleHousing


--------------------------------------------------------------------------------------------------------------------------

-- Standardize Date Format
--Original data
SELECT SaleDate, CONVERT(Date,SaleDate)
FROM PortfolioProject..NashvilleHousing

--Add a new column to store the cleaned date
ALTER TABLE NashvilleHousing
Add SaleDateConverted DATE

--update the new column with the converted date value
UPDATE NashvilleHousing
SET SaleDateConverted = CONVERT(Date,SaleDate)

--preview the result
SELECT SaleDate, SaleDateConverted
FROM PortfolioProject..NashvilleHousing

 -----------------------------------------------------------------------------------------------------------------------

-- Populate Property Address data



-------------------------------------------------------------------------------------------------------------------------

-- Breaking out Address into Individual Columns (Address, City, State)



-------------------------------------------------------------------------------------------------------------------------


-- Change Y and N to Yes and No in "Sold as Vacant" field


-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Remove Duplicates


---------------------------------------------------------------------------------------------------------

-- Delete Unused Columns



-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

--- Importing Data using OPENROWSET and BULK INSERT	

--  More advanced and looks cooler, but have to configure server appropriately to do correctly
--  Wanted to provide this in case you wanted to try it