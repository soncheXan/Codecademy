-- How many entries in the database are from Africa?
select count(name) as 'Number of countries from Africa'
from countries
where continent like 'Africa';


-- What was the total population of Oceania in 2005?
select sum(population) as 'Total population of Oceania in 2005'
from population_years
inner join countries
  on population_years.country_id = countries.id
where countries.continent like 'Oceania'
  and population_years.year = 2005;


-- What is the average population of countries in South America in 2003?
select avg(population) as 'Avarage population of South America in 2005'
from population_years
inner join countries
  on population_years.country_id = countries.id
where countries.continent like 'South America'
  and population_years.year = 2003;


-- What country had the smallest population in 2007?
select name, continent, min(population) as 'Country how had the smallest population in 2007'
from population_years
inner join countries
  on population_years.country_id = countries.id
where population_years.year = 2007
limit 1;


-- What is the average population of Poland during the time period covered by this dataset?
select avg(population) as 'Averege Poland population during the time period covered by this dataset'
from population_years
inner join countries
  on population_years.country_id = countries.id
where countries.name like 'Poland';


-- How many countries have the word "The" in their name?
select count(*) 'Countries with the word "The" in their name'
from countries
where countries.name like '%The';


-- What was the total population of each continent in 2010?
select countries.continent, 
  sum(population_years.population) 'Total population'
from population_years
inner join countries
  on population_years.country_id = countries.id
where population_years.year = 2010
group by countries.continent
order by 2 desc;

