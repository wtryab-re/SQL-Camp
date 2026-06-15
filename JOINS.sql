USE PARKS_AND_RECREATION;

SELECT * FROM employee_demographics;

SELECT * FROM EMPLOYEE_SALARY;

-- INNER JOIN
SELECT * FROM employee_demographics as dem
JOIN employee_salary as sal
ON dem.employee_id = sal.employee_id;

-- OUTER JOINS
-- LEFT OUTER JOIN: EVERYTHING FROM LEFT TABLE AND MATCHES FROM THE RIGHT TABLE
SELECT * FROM employee_demographics as dem
LEFT JOIN employee_salary as sal
ON dem.employee_id = sal.employee_id;

-- RIGHT OUTER JOIN: EVERYTHING FROM RIGHT TABLE AND MATCHES FROM THE LEFT TABLE
SELECT * FROM employee_demographics as dem
right JOIN employee_salary as sal
ON dem.employee_id = sal.employee_id;

-- SELF JOINS
SELECT * FROM employee_demographics AS E1
JOIN employee_demographics AS E2
ON E1.employee_id + 1 = E2.employee_id;

-- MULTIPLE JOINS
SELECT * from employee_demographics as emp
join employee_salary as sal
on emp.employee_id = sal.employee_id
join parks_departments as park
on park.department_id =  sal.dept_id