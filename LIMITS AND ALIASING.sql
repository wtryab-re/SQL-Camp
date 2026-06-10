USE PARKS_and_RECREATION;
SELECT * FROM employee_demographics;
select * FROM employee_salary;

-- LIMIT & ALIASING

-- THIS GIVES TOP 3
SELECT *
FROM employee_demographics
order by AGE
LIMIT 3;

-- THIS GIVES THE ROW AFTER TOP 3
SELECT *
FROM employee_demographics
order by AGE
LIMIT 3,1;

-- ALIASING
-- USES AS

SELECT GENDER, AVG(AGE) AS AVERAGE_AGE
FROM employee_demographics
GROUP BY GENDER;