select *
from layoffs;

-- remove duplicates if any
-- standardize the data
-- Null values or blank data

create table layoffs_stagging_6
like layoffs;

insert layoffs_stagging_6
select *
from layoffs;

select *,
row_number() over(partition by 
								company,
								location,
								industry,
								total_laid_off,
								percentage_laid_off,
								`date`,
								stage,
								country,
								funds_raised_millions
) as row_num
from layoffs_stagging_6;

CREATE TABLE `layoffs_stagging_6.2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select *
from `layoffs_stagging_6.2`;

insert into `layoffs_stagging_6.2`
select *,
row_number() over(partition by 
								company,
								location,
								industry,
								total_laid_off,
								percentage_laid_off,
								`date`,
								stage,
								country,
								funds_raised_millions
) as row_num
from layoffs_stagging_6;

select *
from `layoffs_stagging_6.2`
where row_num > 1;



delete
from `layoffs_stagging_6.2`
where row_num > 1;

select *
from `layoffs_stagging_6.2`;


-- standardize date

select company, trim(company)
from `layoffs_stagging_6.2`;

update `layoffs_stagging_6.2`
set company = trim(company);

select distinct(industry)
from `layoffs_stagging_6.2`
order by 1;

select *
from `layoffs_stagging_6.2`
where industry like 'Crypto%';

update `layoffs_stagging_6.2`
set industry = 'Crypto'
where industry like 'Crypto%';

select distinct(location)
from `layoffs_stagging_6.2`;

select distinct(country)
from `layoffs_stagging_6.2`
order by 1;

SELECT `date`,
       STR_TO_DATE(`date`, '%m/%d/%Y') AS converted_date
FROM `layoffs_stagging_6.2`;


update `layoffs_stagging_6.2`
set `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

alter table `layoffs_stagging_6.2`
modify column `date` date;

select *
from `layoffs_stagging_6.2`;

-- remove null and populate


select *
from `layoffs_stagging_6.2`
where industry is null;

select *
from `layoffs_stagging_6.2`
where company = 'Airbnb';

UPDATE `layoffs_stagging_6.2`
SET industry = NULL
WHERE industry = '';

update `layoffs_stagging_6.2` as t1
join `layoffs_stagging_6.2` as t2
	on t1.company = t2.company
set t1.industry = t2.industry -- repopluate with t2 industry into t1 null industry
where (t1.industry is null and t2.industry is not null); -- repopluate with t2 industry into t1 null industry

select *
from `layoffs_stagging_6.2`
where total_laid_off is null and percentage_laid_off is null;

delete
from `layoffs_stagging_6.2`
where total_laid_off is null and percentage_laid_off is null;

alter table `layoffs_stagging_6.2`
drop column row_num;

select *
from `layoffs_stagging_6.2`;









