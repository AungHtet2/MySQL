-- EDA

select *
from `layoffs_stagging_6.2`;

-- companies went under and its funding
select 
	company,
	percentage_laid_off,
    funds_raised_millions
from 
	`layoffs_stagging_6.2`
where 
	percentage_laid_off = 1 and funds_raised_millions is not null
order by 
	funds_raised_millions desc;

--
-- total laid off in three years by countries
select 
	country,
    sum(total_laid_off)
from 
	`layoffs_stagging_6.2`
where 
	total_laid_off is not null
group by 
	country
order by
	2 desc;
--
-- total laid off in industry
select 
	industry,
    sum(total_laid_off)
from 
	`layoffs_stagging_6.2`
where 
	total_laid_off is not null
group by 
	industry
order by
	2 desc;
--
-- total laid off by years
select 
	year(`date`) as Year,
    sum(total_laid_off)
from 
	`layoffs_stagging_6.2`
where 
	total_laid_off is not null
group by 
	Year
order by
	2 desc;
--
-- total laid off in consumer industry by year
SELECT 
	company,
    YEAR(`date`) AS Year,
    SUM(total_laid_off) AS Total_Laid_Off
    
FROM 
    `layoffs_stagging_6.2`
WHERE 
    total_laid_off IS NOT NULL 
GROUP BY 
    YEAR(`date`), company
ORDER BY
    Total_Laid_Off DESC;
    

WITH company_year as(
SELECT 
	company,
    YEAR(`date`) AS Year,
    SUM(total_laid_off) AS Total_Laid_Off    
FROM 
    `layoffs_stagging_6.2`
WHERE 
    total_laid_off IS NOT NULL 
GROUP BY 
    YEAR(`date`), company
),
company_year_rank as (
select *,
	dense_rank() over(partition by Year order by Total_Laid_Off desc) as ranking
from company_year
where year is not null
)
select *
from company_year_rank
where ranking <= 5;

SELECT 
        SUBSTRING(`date`, 1, 7) AS month,
        SUM(total_laid_off) AS total_laid_off
FROM 
        `layoffs_stagging_6.2`
WHERE 
        `date` IS NOT NULL
GROUP BY 
        SUBSTRING(`date`, 1, 7);
        
WITH rolling_total AS (
    SELECT 
        SUBSTRING(`date`, 1, 7) AS month,
        SUM(total_laid_off) AS total_laid_off
    FROM 
        `layoffs_stagging_6.2`
    WHERE 
        `date` IS NOT NULL
    GROUP BY 
        SUBSTRING(`date`, 1, 7)
)
SELECT 	
    month,
    total_laid_off,
    SUM(total_laid_off) OVER (ORDER BY month ASC) AS rolling_total_layoff
FROM 
    rolling_total
ORDER BY 
    month ASC;




    
    

