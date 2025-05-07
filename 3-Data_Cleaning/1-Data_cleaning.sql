-- data cleaning

SELECT *
FROM layoffs;

-- 1. REMOVE DUPLICATES
-- 2. STANDARDIZE THE DATA
-- 3. NULL VALUES OR BLANK
-- 4. REMOVE ANY COLUMNS

CREATE TABLE Layoffs_stagging
like layoffs;

insert Layoffs_stagging
select *
from layoffs;

select *
from Layoffs_stagging;


create table layoffs_stagging_2
like layoffs;

insert layoffs_stagging_2
select *
from layoffs;

select *
from layoffs_stagging_2;

-- 1. REMOVE DUPLICATES

select *,
row_number() 
	over(partition by 	company,
						location,
                        industry, 
                        total_laid_off, 
                        percentage_laid_off,
                        `date`, 
                        stage, 
                        country, 
                        funds_raised_millions
                        ) as row_num
from Layoffs_stagging;


with duplicates_cte as (
select *,
row_number() 
	over(partition by 	company,
						location,
                        industry, 
                        total_laid_off, 
                        percentage_laid_off,
                        `date`, 
                        stage, 
                        country, 
                        funds_raised_millions
                        ) as row_num
from Layoffs_stagging
)

select *
from duplicates_cte
where row_num > 1;

select *
from Layoffs_stagging
where company = 'Casper';


CREATE TABLE `layoffs_stagging_4` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into layoffs_stagging_4
select *,
row_number() 
	over(partition by 	company,
						location,
                        industry, 
                        total_laid_off, 
                        percentage_laid_off,
                        `date`, 
                        stage, 
                        country, 
                        funds_raised_millions
                        ) as row_num
from Layoffs_stagging;


delete
from layoffs_stagging_4
where row_num > 1;

select *
from layoffs_stagging_4
where company = 'Casper';

-- practice
-- create table and insert

create table layoffs_stagging_5
like layoffs;

insert layoffs_stagging_5
select *
from layoffs;

-- find duplicate and remove them
-- find duplicates

select *,
row_number()over(partition by 	company,
								location,
                                industry,
                                total_laid_off,
                                percentage_laid_off,
                                date,
                                stage,
                                country,
                                funds_raised_millions
) as row_num
from layoffs_stagging;



select *
from layoffs_stagging_5

















