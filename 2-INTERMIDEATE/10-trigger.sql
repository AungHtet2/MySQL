-- trigger event

select *
from employee_salary;

select *
from employee_demographics;


DELIMITER $$
create trigger employee_insert
	after insert on employee_salary
    for each row
begin
	insert into employee_demographics ( employee_id, first_name, last_name)
    values (new.employee_id,new.first_name, new.last_name);
end $$
DELIMITER ;

insert into employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
values(21, 'Aung', 'Htet', 'Analyst', 46000, 10);



INSERT INTO employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (54, 'Becky', 'Lynch', 'Wrestler', 3000000, 43);

DROP TRIGGER IF EXISTS employee_insert_2;





-- EVENTS


DROP EVENT IF EXISTS delete_retiress;

DELIMITER $$

CREATE EVENT delete_retiress
ON SCHEDULE EVERY 10 SECOND
DO
  DELETE FROM employee_demographics
  WHERE age >= 45
$$

DELIMITER ;

select *
from employee_demographics;