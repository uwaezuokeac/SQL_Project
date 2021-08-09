COVID-19 DATA EXPLORATION

Select *
From PortfolioProject..CovidData
Where continent is not null 
order by 3,4

--selects the data we will working with
Select Location,date,total_cases,new_cases,total_deaths,population
from PortfolioProject..CovidData
where continent is not null
order by 1,2

--Total cases Vs Total deaths
--Shows likelihood of dying if you contact COVID in your country.
Select Location,date,total_cases,new_cases,total_deaths,population, (total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProject..CovidData
where continent is not null
order by 1,2

--Total cases Vs Population
--Shows the percentage of the population that is infected
Select Location,date,total_cases,new_cases,total_deaths,population,(total_cases/population)*100 as PercentPopulationInfected
from PortfolioProject..CovidData
where continent is not null
order by 1,2

--Countries with highest infection rate compared to population
Select Location,population,MAX(total_cases) as HighestInfectionCount,MAX(total_cases/population)*100 as PercentPopulationInfected
from PortfolioProject..CovidData
where continent is not null
group by location,population
order by PercentPopulationInfected

--Countries with highest death count
Select location, MAX(cast(total_deaths as int)) as DeathCounts
from PortfolioProject..CovidData
group by location
order by DeathCounts Desc

--Continents with highest death count
Select continent,MAX(cast(total_deaths as int)) as DeathCounts
from PortfolioProject..CovidData
group by continent
order by DeathCounts DESC

--Global numbers
Select SUM(cast(new_cases as int)) as TotalCases, SUM(cast(new_deaths as int)) as TotalDeaths, SUM(cast(new_cases as int))/SUM(cast(new_deaths as int))*100 as DeathPercentage
from PortfolioProject..CovidData
where continent is not null
order by 1,2