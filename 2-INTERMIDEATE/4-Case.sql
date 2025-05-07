-- case statement

select dem.*,sal.salary,
CASE
	WHEN salary <= 50000 THEN 'UNDER_PAID'
	WHEN salary between 50000 and 65000 then 'Normal'
    when salary >= 70000 then 'OVER_PAID'
END AS Sal

from employee_demographics as dem
inner join employee_salary as sal on sal.employee_id = dem.employee_id;

-- pay increase

select first_name,last_name,salary,
case
	when salary < 50000 then salary * 0.05
    when salary > 50000 then salary * 0.07
end as new_salary,
case
	when dept_id = 6 then salary * 0.10
end as bonus
from employee_salary
;


select *
from employee_demographics;

select *
from employee_salary;

select *
from parks_departments;



