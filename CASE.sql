use parks_and_recreation;

-- case statements are the if else of sql

select first_name , age,
case
when age>40 then "Old"
when age between 20 and 35 then "young"
end 
from employee_demographics;

-- pay increase and bonus
-- < 50k 5%
-- >50k 7%
-- finance = 10% bonus

select * from employee_salary;

select first_name, salary,
case
 when salary < 50000 then salary*1.05
 when salary > 50000 then salary*1.07
 end as "new salary",
 case when dept_id = 6 then salary*0.1 end as bonus
from employee_salary;