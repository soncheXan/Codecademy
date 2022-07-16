-- What years are covered by the dataset?
SELECT DISTINCT year from population_years;


-- What is the largest population size for Gabon in this dataset?
select country, max(population) as 'Largest population size'
from population_years
where country like 'Gabon';


-- What were the 10 lowest population countries in 2005?
select country, population
from population_years
where year = 2005
order by population asc
limit 10;

-- What are all the distinct countries with a population of over 100 million in the year 2010?
select country, population
from population_years
where population > 100 and year = 2010
order by population desc;

-- How many countries in this dataset have the word “Islands” in their name?
select country 
from population_years
where country like '%Islands%'
group by country;

-- What is the difference in population between 2000 and 2010 in Indonesia?
select country, ((select population
    from population_years
    where country like 'Indonesia' 
    and year = 2010) - population)
  as 'Difference in population'
from population_years
where year = 2000 and country like 'Indonesia';