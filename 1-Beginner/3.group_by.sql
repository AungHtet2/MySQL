select gender,count(gender) as gender_count
from employee_demographics
group by gender;
-- ORDER BY	

select *
FROM employee_demographics
order by age, gender;

select gender,avg(age),min(age),max(age),count(gender)
from employee_demographicsemployee_demographicsemployee_demographics
group by gender


