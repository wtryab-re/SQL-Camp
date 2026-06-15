use parks_and_recreation;

-- UNION COMBINES SELECT STATEMENTS

select first_name from employee_demographics
union distinct
select first_name from employee_salary;

select first_name from employee_demographics
union all
select first_name from employee_salary;

