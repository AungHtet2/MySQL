-- String Functions

select length('skyfall');

select first_name,length(first_name)
from employee_demographics
order by 2;

select upper('sky');
select lower('SKY');


select first_name, upper(first_name)
from employee_demographics;


select trim('      sky        ');

select rtrim('      sky        ');

select first_name, 
left(first_name, 4),
right(first_name, 4),
substring(first_name, 3, 2),
substring(birth_date,6,2) as birth_month
from employee_demographics;


-- replace

select first_name,replace(first_name, 'e','c')
from employee_demographics;

select first_name,LOCATE('CH',first_name)
from employee_demographics;

select first_name,last_name,
concat(first_name,' ',last_name) as full_name
from employee_demographics;

select *,month(birth_date),current_time()
from employee_demographics;

