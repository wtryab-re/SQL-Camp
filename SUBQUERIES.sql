
select * 
from employee_demographics
where employee_id
in (
	select employee_id 
	from employee_salary 
    where dept_id=1
    );

select first_name,salary, (select avg(salary) from employee_salary) from employee_salary
