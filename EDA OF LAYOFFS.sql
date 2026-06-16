-- EXPLORATORY DATA ANALYSIS
Select * from layoffs_staging_2;

-- which company has laid off maximum people in percentage and in numbers
SELECT COMPANY, MAX(total_laid_off)
FROM layoffs_staging_2
GROUP BY COMPANY
ORDER BY MAX(total_laid_off) DESC
LIMIT 10;

-- BY PERCENTAGE
SELECT COMPANY, MAX(PERCENTAGE_LAID_OFF) AS laid_off_p
FROM layoffs_staging_2
GROUP BY COMPANY
HAVING LAID_OFF_P = 1;

-- MINIMUM LAYOFFS BY NUMBER
SELECT COMPANY, location , MIN(total_laid_off)
FROM layoffs_staging_2
GROUP BY COMPANY, location
HAVING MIN(TOTAL_LAID_OFF) IS NOT NULL
ORDER BY MIN(total_laid_off) ASC;

-- MINIMUM LAYOFFS BY PERCENTAGE

SELECT COMPANY, location, MIN(PERCENTAGE_LAID_OFF)
FROM layoffs_staging_2
GROUP BY COMPANY, location
HAVING MIN(percentage_laid_off) IS NOT NULL
ORDER BY MIN(percentage_laid_off) ASC;

-- TOTAL EACH COMPANY HAS LAID OFF
SELECT COMPANY, SUM(TOTAL_LAID_OFF)
FROM layoffs_staging_2
GROUP BY COMPANY;

-- which stage of company is laying of the most, the least
SELECT stage, sum(total_laid_off) as tl
from layoffs_staging_2
group by stage
order by tl desc;

-- which country and location is having max and min layoffs
SELECT country, location ,sum(total_laid_off) as tl
from layoffs_staging_2
group by country, location
order by tl desc;

SELECT country,sum(total_laid_off) as tl
from layoffs_staging_2
group by country
order by tl desc;

-- which industry is having max and min layoffs
SELECT industry ,sum(total_laid_off), MIN(total_laid_off), MAX(total_laid_off) as tl
from layoffs_staging_2
group by industry
order by tl desc;

-- min date record and max date record
SELECT MIN(`DATE`), MAX(`DATE`)
FROM layoffs_staging_2;

-- YEARWISE LAYOFFS TOTAL. SO FROM 2020 TO 2023
SELECT YEAR(`DATE`), SUM(TOTAL_LAID_OFF) 
FROM layoffs_staging_2
group by YEAR(`DATE`)
ORDER BY YEAR(`DATE`);

-- rolling total based on each month and year
SELECT substring(`DATE`,1 , 7) as 'Month', SUM(TOTAL_LAID_OFF)
FROM layoffs_staging_2
where `date` is not null
group by `Month`
order by `Month`;

-- rolling total
with cte as 
(
	SELECT substring(`DATE`,1 , 7) as 'Month', SUM(TOTAL_LAID_OFF) AS TOTAL_OFF
	FROM layoffs_staging_2
	where substring(`DATE`,1 , 7) is not null
	group by `Month`
	order by `Month`
)
SELECT `Month`,total_off, SUM(TOTAL_OFF)OVER(order by `Month`) FROM CTE;

-- COMPANY LAYOFFS / YEAR
SELECT COMPANY, YEAR(`DATE`) AS Y, SUM(TOTAL_LAID_OFF) AS TL
FROM layoffs_staging_2
GROUP BY COMPANY, Y
HAVING TL IS NOT NULL AND Y IS NOT NULL
ORDER BY COMPANY, Y;

WITH COMPANY_YEAR(COMPANY, YEARS, TOTAL_LAID_OFF) AS
(
	SELECT COMPANY, YEAR(`DATE`) AS Y, SUM(TOTAL_LAID_OFF) AS TL
FROM layoffs_staging_2
GROUP BY COMPANY, Y
HAVING TL IS NOT NULL AND Y IS NOT NULL
ORDER BY COMPANY, Y
),
COMPANY_YEAR_RANK AS (
	SELECT *, 
	DENSE_RANK()OVER(PARTITION BY YEARS ORDER BY TOTAL_LAID_OFF DESC) RANKS
	FROM COMPANY_YEAR
)
SELECT *
FROM COMPANY_YEAR_RANK
WHERE RANKS <=5