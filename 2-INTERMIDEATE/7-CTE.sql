-- cte
with CTE_Example as(
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
		first_name,dem.gender
)

select first_name,gender, avg(avg_salary)
from CTE_Example
group by first_name,gender;









with CTE_Example as(
	SELECT 
		dem.employee_id,
		dem.first_name,
		dem.gender,
		AVG(salary) AS avg_salary, 
		MAX(salary) AS max_salary, 
		MIN(salary) AS min_salary
	FROM 
		employee_salary as sal
	inner join employee_demographics as dem on dem.employee_id = sal.employee_id
	GROUP BY 
		dem.employee_id, dem.first_name, dem.gender
),
CTE_Example2 as (
select 
		employee_id,
		first_name,
		age
from 
	employee_demographics 
where employee_id in (
	select employee_id
	from employee_salary
	where salary >= 55000
)
)
select 
		RANK() OVER (PARTITION BY CTE_Example.gender ORDER BY avg_salary DESC) AS salary_rank,
		CTE_Example.*,
        CTE_Example2.age
		
from CTE_Example 
join CTE_Example2 on CTE_Example2.employee_id = CTE_Example.employee_id

