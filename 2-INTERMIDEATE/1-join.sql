
-- inner join
select 
	dem.*,
	sal.salary
from employee_demographics as dem
inner join 
	employee_salary as sal on sal.employee_id = dem.employee_id;

-- outer join
select *
from employee_demographics as dem
left join 
	employee_salary as sal on sal.employee_id = dem.employee_id;

select *
from employee_demographics as dem
right join 
	employee_salary as sal on sal.employee_id = dem.employee_id;
    
select *
from parks_departments;

select *
from employee_salary;

select 
	dem.*,
	sal.salary,
    pd.department_name
from employee_demographics as dem
inner join 
	employee_salary as sal on sal.employee_id = dem.employee_id
inner join 
	parks_departments as pd on pd.department_id = sal.dept_id
order by salary desc