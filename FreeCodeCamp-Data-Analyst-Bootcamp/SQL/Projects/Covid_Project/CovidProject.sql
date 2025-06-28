SELECT *
FROM PortfolioProject..CovidDeaths
WHERE continent is not null 
ORDER BY 3,4


-- SELECT Data that we are going to be starting with

SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject..CovidDeaths
WHERE continent is not null 
ORDER BY 1,2


-- Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country

SELECT Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE location like '%states%'
and continent is not null 
ORDER BY 1,2


-- Total Cases vs Population
-- Shows what percentage of population infected with Covid

SELECT Location, date, Population, total_cases,  (total_cases/population)*100 AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
ORDER BY 1,2


-- Countries with Highest Infection Rate compared to Population

SELECT Location, MAX(TRY_CAST(Total_deaths AS int)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent is not null 
GROUP BY Location
ORDER BY TotalDeathCount DESC



-- BREAKING THINGS DOWN BY CONTINENT

-- Showing contintents with the highest death count per population

SELECT continent, MAX(TRY_CAST(Total_deaths AS INT)) AS TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent is not null
GROUP BY continent
ORDER BY TotalDeathCount DESC



-- Global Numbers

SELECT SUM(new_cases) AS TotalCases, SUM(TRY_CAST(new_deaths AS INT)) AS TotalDeaths, 
--SUM(TRY_CAST(new_deaths AS INT)) / SUM(new_cases) * 100 AS DeathPercentage 
Round((ISNULL(SUM(TRY_CAST(new_deaths AS INT)),0) * 1.0) / NULLIF(SUM(TRY_CAST(new_cases AS INT)),0) * 100.0,2) AS DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL AND new_cases IS NOT NULL AND new_deaths IS NOT NULL
ORDER BY 1,2


-- Looking at Total Population Vs Vaccination

SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
SUM(TRY_CONVERT(INT,cv.new_vaccinations)) OVER (PARTITION BY cd.location ORDER BY cd.location, cd.date) AS RollingPeopleVaccinated
FROM CovidDeaths cd
JOIN CovidVaccinations cv 
	ON cd.location = cv.location 
	AND cd.date = cv.date
WHERE cd.continent IS NOT NULL AND cv.new_vaccinations IS NOT NULL
ORDER BY 2,3

--USE CTE
WITH PopvsVac(Continent,Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated )
AS
(
SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
SUM(TRY_CONVERT(INT,cv.new_vaccinations)) OVER (PARTITION BY cd.location ORDER BY cd.location, cd.date) AS RollingPeopleVaccinated 
FROM CovidDeaths cd
JOIN CovidVaccinations cv 
	ON cd.location = cv.location 
	AND cd.date = cv.date
WHERE cd.continent IS NOT NULL AND cv.new_vaccinations IS NOT NULL
)

--SELECT *, (RollingPeopleVaccinated  / Population * 100) AS VaccinatedPopulationPercentage
SELECT *, ROUND(ISNULL(RollingPeopleVaccinated,0) * 1.0 / NULLIF(Population,0) * 100,2)
FROM PopvsVac


--TEMP TABLE
DROP TABLE IF EXISTS #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
	Continent nvarchar(255),
	Location nvarchar(255),
	Date datetime,
	Population numeric,
	New_vaccinations numeric,
	RollingPeopleVaccinated  numeric
)

INSERT INTO #PercentPopulationVaccinated
SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
SUM(TRY_CONVERT(INT,cv.new_vaccinations)) OVER (PARTITION BY cd.location ORDER BY cd.location, cd.date) AS RollingPeopleVaccinated 
FROM CovidDeaths cd
JOIN CovidVaccinations cv 
	ON cd.location = cv.location 
	AND cd.date = cv.date
--WHERE cd.continent IS NOT NULL AND cv.new_vaccinations IS NOT NULL
--ORDER BY 2,3

SELECT *, (RollingPeopleVaccinated  / Population * 100) AS VaccinatedPopulationPercentage
FROM #PercentPopulationVaccinated

--Creating View to store data for later visualizations

GO
CREATE VIEW PercentPopulationVaccinated AS
SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
SUM(TRY_CONVERT(INT,cv.new_vaccinations)) OVER (PARTITION BY cd.location ORDER BY cd.date) AS RollingPeopleVaccinated 
FROM CovidDeaths cd
JOIN CovidVaccinations cv 
	ON cd.location = cv.location 
	AND cd.date = cv.date
WHERE cd.continent IS NOT NULL
GO

--SELECT * 
--FROM PercentPopulationVaccinated