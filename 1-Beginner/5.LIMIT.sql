select *
from employee_demographics
order by age desc
limit 2, 1;


-- aliasing

SELECT gender, avg(AGE) AS AVG_AGE
from employee_demographics
group by gender
having avg(AGE) > 40;
