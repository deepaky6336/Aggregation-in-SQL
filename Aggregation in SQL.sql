Create database world;
use world;

##Question 1 : Count how many cities are there in each country?
select * From city;
select * From country;

select countrycode, count(*) as total_cities from city
group by countrycode;

## Question 2 : Display all continents having more than 30 countries.
select * From country;

select continent, count(*) as total_country from country
group by continent
Having count(*) > 30;

## Question 3 : List regions whose total population exceeds 200 million.
select * From country;

select region,
sum(country_pop) as total_country_pop from country
group by region
Having sum(country_pop) > 200000000;

## Question 4 : Find the top 5 continents by average GNP per country.
select * From country;

select continent, 
avg(GNP) as AVG_GNP from country
group by continent 
order by AVG_GNP desc
limit 5;

## Question 5 : Find the total number of official languages spoken in each continent.
select * From country_language;
select * From country;
use world;

Select distinct c.continent, count(CL.language) as Official_language from country C
left join country_language CL
on C.country_code = CL.countrycode
group by continent;

## Question 6 : Find the maximum and minimum GNP for each continent.
select * From country;

SELECT continent,
       MAX(COALESCE(GNP, 0)) AS Maximum_GNP,
       MIN(COALESCE(GNP, 0)) AS Minimum_GNP
FROM country
GROUP BY continent;

##Question 7 : Find the country with the highest average city population.
select * From country;

SELECT c.country_Name AS Country,
       AVG(ci.city_pop) AS Avg_City_Population
FROM Country c
JOIN City ci
ON c.country_Code = ci.CountryCode
GROUP BY c.country_Name
ORDER BY Avg_City_Population DESC
LIMIT 1;

## Question 8 : List continents where the average city population is greater than 200,000.

SELECT c.Continent,
       AVG(ci.city_pop) AS Avg_City_Population
FROM Country c
JOIN City ci
ON c.country_Code = ci.CountryCode
GROUP BY c.Continent
HAVING AVG(ci.city_pop) > 200000;

##Question 9 : Find the total population and average life expectancy for each continent, ordered by average life expectancy descending.

SELECT Continent,
       SUM(country_pop) AS Total_Population,
       AVG(LifeExpectancy) AS Avg_Life_Expectancy
FROM Country
GROUP BY Continent
ORDER BY Avg_Life_Expectancy DESC;

##Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those where the total population is over 200 million
select * From COuntry;

SELECT Continent,
       AVG(LifeExpectancy) AS Avg_Life_Expectancy,
       SUM(country_pop) AS Total_Population
FROM Country
GROUP BY Continent
HAVING SUM(country_pop) > 200000 
ORDER BY Avg_Life_Expectancy DESC
LIMIT 3;