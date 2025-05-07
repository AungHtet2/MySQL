-- UNION

select first_name,last_name
from employee_demographics

union distinct

select first_name,last_name
from employee_salary;


select first_name,last_name
from employee_demographics
union all
select first_name,last_name
from employee_salary;
------ ------ 
select first_name,last_name, 'OLD Man' as Label
from employee_demographics
where age > 40 and gender = 'Male'
union
select first_name,last_name, 'OLD Woman' as Label
from employee_demographics
where age > 40 and gender = 'Female'
union
select first_name,last_name, 'Highly_Paid_Employee' as Label
from employee_salary
where salary > 70000
order by first_name,last_name
;

