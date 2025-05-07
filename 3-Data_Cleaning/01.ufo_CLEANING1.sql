-- 1. Check original data
SELECT *
FROM `ufo-sightings-transformed`;

-- 2. Create a copy table with row_num field
CREATE TABLE `ufo-sightings-transformed_copy` (
  `MyUnknownColumn` INT DEFAULT NULL,
  `Date_time` TEXT,
  `date_documented` TEXT,
  `Year` INT DEFAULT NULL,
  `Month` INT DEFAULT NULL,
  `Hour` INT DEFAULT NULL,
  `Season` TEXT,
  `Country_Code` TEXT,
  `Country` TEXT,
  `Region` TEXT,
  `Locale` TEXT,
  `latitude` DOUBLE DEFAULT NULL,
  `longitude` DOUBLE DEFAULT NULL,
  `UFO_shape` TEXT,
  `length_of_encounter_seconds` DOUBLE DEFAULT NULL,
  `Encounter_Duration` TEXT,
  `Description` TEXT,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 3. Insert data with row numbers to find duplicates
INSERT INTO `ufo-sightings-transformed_copy`
SELECT *,
  ROW_NUMBER() OVER (
    PARTITION BY MyUnknownColumn,
                 Date_time,
                 date_documented,
                 `Year`,
                 `Month`,
                 Season,
                 Country_Code,
                 Country,
                 Region,
                 Locale, -- ✅ fixed typo: should be "Locale", not "Local"
                 latitude,
                 longitude,
                 UFO_shape,
                 length_of_encounter_seconds,
                 Encounter_Duration,
                 `Description`
  ) AS row_num
FROM `ufo-sightings-transformed`;  -- ✅ make sure this schema/table name is correct

-- 4. View result

SELECT *
FROM `ufo-sightings-transformed_copy`;


SELECT *
FROM `ufo-sightings-transformed_copy`
where row_num > 1;

-- There is no Duplicate Data

-- standardize data

SELECT Date_time,
       STR_TO_DATE(Date_time, '%Y-%m-%d %H:%i:%s') AS parsed_datetime
FROM `ufo-sightings-transformed_copy`;

update `ufo-sightings-transformed_copy`
set Date_time = STR_TO_DATE(Date_time, '%Y-%m-%d %H:%i:%s');

alter table `ufo-sightings-transformed_copy`
modify column Date_time date;

UPDATE `ufo-sightings-transformed_copy`
SET date_documented = STR_TO_DATE(date_documented, '%m-%d-%Y');

alter table `ufo-sightings-transformed_copy`
modify column date_documented date;


select distinct(Country)
from `ufo-sightings-transformed_copy`
order by 1;

select *
from `ufo-sightings-transformed_copy`
where Country = '';

delete
from `ufo-sightings-transformed_copy`
where Country = '';

select *
from `ufo-sightings-transformed_copy`
where UFO_shape = 'Light'
order by `Year`;






