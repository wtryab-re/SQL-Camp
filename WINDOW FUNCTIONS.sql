use parks_and_recreation;

select salary , avg(salary) from employee_salary group by salary;


select salary , avg(salary)over() from employee_salary group by salary;


select emp.first_name gender, 
avg(salary) over(partition by gender)
from employee_demographics as emp
join employee_salary as sal
on emp.employee_id = sal.employee_id;

select emp.first_name, emp.gender, sal.salary,
sum(salary) over(partition by gender order by emp.employee_id) as rolling_total
from employee_demographics as emp
join employee_salary as sal
on emp.employee_id = sal.employee_id;

select emp.first_name, emp.gender, sal.salary,
row_number()over(partition by gender order by salary desc),
rank()over(partition by gender order by salary desc) rank_num,
dense_rank()over(partition by gender order by salary desc) dense_rans
from employee_demographics as emp
join employee_salary as sal
on emp.employee_id = sal.employee_id;

