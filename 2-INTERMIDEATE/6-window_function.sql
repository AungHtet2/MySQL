-- window functions

select 
		dem.gender,
		avg(salary)
from 
		employee_demographics as dem
join 
	employee_salary as sal on sal.employee_id =  dem.employee_id

group by 
		dem.gender;
        
        
select 
		dem.gender,
		avg(salary) over(partition by gender)
from 
		employee_demographics as dem
join 
	employee_salary as sal on sal.employee_id =  dem.employee_id;
    
    
select 
		row_number() over(partition by gender order by salary desc) as row_num,
        rank() over(partition by gender order by salary desc) as rank_num,
        dense_rank() over(partition by gender order by salary desc) as dense_rank_num,
        dem.employee_id,
        dem.first_name,
        dem.last_name,
        dem.gender,
        salary
from 
		employee_demographics as dem
join 
	employee_salary as sal on sal.employee_id =  dem.employee_id;
