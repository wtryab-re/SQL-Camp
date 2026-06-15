-- CTES ARE COMMON TABLE EXPRESSIONS, CREATE A SUBQUERY THAT CAN BE REFERENCED IN THE MAIN QUERY. CAN ONLY USE SUBQUERY IMMEDIATELY AFTER WE'VE BUILT IT. 

WITH CTE_EXAMPLE -- (COLUMN NAMES)
 AS (
SELECT gender, max(salary) max_sal, min(salary) min_sal, avg(salary) avg_sal, count(salary) count_sal
from employee_demographics as emp
join employee_salary as sal
group by gender
),
CTE_EXAMPLE2 AS (
SELECT * 
FROM EMPLOYEE_DEMOGRAPHICS 
WHERE GENDER = "MALE"
)
select * from cte_example
join cte_example2 on cte_example.gender = "male";

-- can write the column names instead of alias inside parentheses after with name parentheses as