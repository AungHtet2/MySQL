
SELECT *
FROM `layoffs_copy`;

-- companies went under and its funding

SELECT  company,
        percentage_laid_off,
        funds_raised_millions
FROM layoffs_copy
WHERE 
        percentage_laid_off = 1 AND funds_raised_millions is NOT NULL
ORDER BY 
        funds_raised_millions DESC;


-- total laid off in three years by countries

SELECT  country,
        SUM(total_laid_off) as Laid_off_counts

FROM layoffs_copy

WHERE total_laid_off is NOT NULL

GROUP BY country

ORDER BY 2 DESC;


-- total laid off in three years by countries

SELECT   
        industry,
        SUM(total_laid_off) as Laid_off_counts

FROM layoffs_copy

WHERE total_laid_off is NOT NULL

GROUP BY industry

ORDER BY 2 DESC;


-- total laid off by years

SELECT 
    YEAR(`date`) AS Year,
    SUM(total_laid_off) AS Total_Laid_Off
FROM 
    layoffs_copy
WHERE 
    total_laid_off IS NOT NULL AND `date` is NOT NULL
GROUP BY 
    Year
ORDER BY 
    Total_Laid_Off DESC;



 -- company_ranking
WITH company_year AS(
    SELECT company,
            YEAR(`date`) AS Year,
            SUM(total_laid_off) AS Laid_off_counts

    FROM 
        layoffs_copy
    WHERE total_laid_off IS NOT NULL
    GROUP BY 
        company,Year
    ),
company_year_rank AS (
    SELECT  *,
            DENSE_RANK() OVER(PARTITION BY Year ORDER BY Laid_off_counts DESC) as Ranking
    from company_year
where year is not null
)

SELECT *
FROM company_year_rank
WHERE ranking <= 5;
