-- store procedure

create procedure large_salaries()
select *
from employee_salary
where salary >= 50000;

call large_salaries();

DELIMITER $$
create procedure female_large_salries()
BEGIN
	select *
	from employee_salary
	where salary >= 50000;
	select *
	from employee_salary
	where salary >= 10000;
END $$
DELIMITER ;

DELIMITER $$
create procedure check_salaries(p_first_name text)
BEGIN
	select *
	from employee_salary
    WHERE first_name = p_first_name
    ;
END $$	
DELIMITER ;

call check_salaries('Ann');

select *
from employee_demographics

