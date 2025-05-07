-- Data Cleaning
SELECT *
FROM `layoffs`;

-- Remove Duplicate
CREATE TABLE `layoffs_copy` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  row_num int
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;


INSERT INTO layoffs_copy
SELECT *,
  row_number() over(
    partition by company,
    location,
    industry,
    total_laid_off,
    percentage_laid_off,
    date,
    stage,
    country,
    funds_raised_millions
  )
FROM layoffs;


DELETE FROM `layoffs_copy`
WHERE row_num > 1;

ALTER TABLE layoffs_copy 
DROP COLUMN row_num;


-- standardize data
SELECT DISTINCT(industry)
from layoffs_copy
ORDER BY 1;

UPDATE layoffs_copy
SET industry = 'Crypto'
WHERE industry like 'Crypto%';

SELECT *
FROM layoffs_copy
WHERE industry is NULL
  OR industry = '';

UPDATE layoffs_copy
SET industry = NULL
WHERE industry = '';

SELECT *
FROM layoffs_copy
WHERE company = 'Airbnb';



UPDATE layoffs_copy AS t1
JOIN layoffs_copy AS t2
  ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry is NULL AND t2.industry is not null;

SELECT *
FROM `layoffs_copy`;