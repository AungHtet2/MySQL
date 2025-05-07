-- subqueries

select *
from employee_demographics
where employee_id in (
	select employee_id
	from employee_salary
	where dept_id = 1
);


SELECT first_name, salary
FROM employee_salary
WHERE salary > 
	(SELECT AVG(salary) FROM employee_salary);
    
select employee_salary.*,pd.department_name
from employee_salary
inner join parks_departments as pd on pd.department_id = employee_salary.dept_id
where dept_id in (    
	select department_id
	from parks_departments
)
;

select first_name,salary,
(select avg(salary)
from employee_salary)
from employee_salary;


select gender, avg(age),max(age),min(age)
from employee_demographics
group by gender;

select gender,avg(avg_max_age)
from (select gender, avg(age),max(age) as avg_max_age,min(age) as avg_min_age
from employee_demographics
group by gender
) as agg_table
group by gender;


SELECT 
    dem.first_name,
    dem.gender,
    AVG(salary) AS avg_salary, 
    MAX(salary) AS max_salary, 
    MIN(salary) AS min_salary
FROM 
    employee_salary as sal
inner join employee_demographics as dem on dem.employee_id = sal.employee_id
GROUP BY 
    first_name,dem.gender;
    
select gender, avg(max_salary),avg(min_salary)
from (SELECT 
    dem.first_name,
    dem.gender,
    AVG(salary) AS avg_salary, 
    MAX(salary) AS max_salary, 
    MIN(salary) AS min_salary
FROM 
    employee_salary as sal
inner join employee_demographics as dem on dem.employee_id = sal.employee_id
GROUP BY 
    first_name,dem.gender
) as agg_salary
group by gender;
    





