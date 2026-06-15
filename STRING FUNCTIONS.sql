use parks_and_recreation;

select first_name, length(first_name) from employee_demographics;

select upper(first_name) from employee_demographics;

select lower(first_name) from employee_demographics;

select trim("                  wardah   ");

select ltrim("                  wardah   ");

select rtrim("                  wardah   ");

select first_name, left(first_name,3) from employee_demographics;

select first_name, right(first_name,3) from employee_demographics;

select * from employee_demographics;

select substring(birth_date,6,2) as month from employee_demographics;

select first_name, replace(first_name, "a", "z") from employee_demographics;

select first_name, locate("an", first_name)
from employee_demographics
where locate("an", first_name) > 0 ;

select first_name, last_name, concat(first_name," ",last_name) as full_name
from employee_demographics;