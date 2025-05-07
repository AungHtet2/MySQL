-- WHERE Clause

select *
from employee_salary
where first_name = 'Leslie';

select *
from employee_salary
where salary <=50000
;

select *
from employee_demographics
where birth_date > '1985-01-01' or not gender = 'Male';

select *
from employee_demographics
where (first_name = 'Donna' and age = '46') or age > 44;

select *
from employee_salary;

-- LIKE Statement
-- % and _

select *
from employee_salary
where first_name like 'a%';

select *
from employee_salary
where first_name like 'a___%';

