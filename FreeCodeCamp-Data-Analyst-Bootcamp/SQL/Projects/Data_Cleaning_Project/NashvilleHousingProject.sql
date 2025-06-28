SELECT *
FROM PortfolioProject..NashvilleHousing
WHERE OwnerName IS NOT NULL
ORDER BY UniqueID


/*

Cleaning Data in SQL Queries

*/



--------------------------------------------------------------------------------------------------------------------------

-- Standardize Date Format




 --------------------------------------------------------------------------------------------------------------------------

-- Populate Property Address data



--------------------------------------------------------------------------------------------------------------------------

-- Breaking out Address into Individual Columns (Address, City, State)



--------------------------------------------------------------------------------------------------------------------------


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