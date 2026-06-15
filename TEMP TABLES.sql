-- TEMP TABLES

CREATE TEMPORARY TABLE TEMP_TABLE (
-- COLUMN NAMES AND TYPES
first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(50)
);

select * from temp_table;

INSERT INTO temp_table
VALUES("WARDAH", "TAYYEB", "CHAINSAW MAN");

SELECT * FROM employee_salary;

CREATE temporary TABLE SALARY_OVER_50 (
SELECT * 
FROM employee_salary 
WHERE SALARY > 50000
)
;

SELECT * FROM SALARY_OVER_50;
