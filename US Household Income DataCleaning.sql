#
#DATA CLEANING
#
SELECT * 
FROM us_household_income;

SELECT *
FROM us_household_income_statistics;

ALTER TABLE us_household_income_statistics
RENAME COLUMN `ď»żid` TO `id`;

SELECT COUNT(id) 
FROM us_household_income;

SELECT COUNT(id)
FROM us_household_income_statistics;

SELECT id, COUNT(id)
FROM us_household_income
GROUP BY id
HAVING COUNT(id) > 1
;

SELECT *
FROM (
	SELECT row_id,
	id,
	ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS row_num
	FROM us_household_income
) AS row_table
WHERE row_num > 1
;

DELETE FROM us_household_income
WHERE row_id IN (
	SELECT row_id
	FROM (
		SELECT row_id,
		id,
		ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS row_num
		FROM us_household_income
	) AS row_table
	WHERE row_num > 1
);

SELECT id, COUNT(id)
FROM us_household_income_statistics
GROUP BY id
HAVING COUNT(id) > 1
;

SELECT DISTINCT State_name
FROM us_household_income
ORDER BY 1
;

UPDATE us_household_income
SET State_name = 'Georgia'
WHERE State_name = 'georia'
;

UPDATE us_household_income
SET State_name = 'Alabama'
WHERE State_name = 'alabama'
;

SELECT DISTINCT State_ab
FROM us_household_income
ORDER BY 1
;

SELECT *
FROM us_household_income
WHERE Place = ''
;

UPDATE us_household_income
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont';

SELECT Type, COUNT(Type)
FROM us_household_income
GROUP BY Type;

UPDATE us_household_income
SET Type = 'Borough'
WHERE Type = 'Boroughs';

SELECT *
FROM us_household_income;

SELECT ALand, AWater
FROM us_household_income
WHERE (AWater = 0 OR AWater = '' OR AWater = NULL)
;