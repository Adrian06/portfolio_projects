#
#US_HOUSEHOLD_INCOME EXPLORATORY DATA ANALYSIS
#

SELECT State_name, County, City, ALand, AWater
FROM us_household_income;

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY State_Name
ORDER BY 3 DESC;

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 10;

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY State_Name
ORDER BY 3 DESC
LIMIT 10;

SELECT *
FROM us_household_income u
JOIN us_household_income_statistics us
	ON u.id = us.id;
    
SELECT *
FROM us_household_income u
JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE Mean != 0;

SELECT u.State_Name, u.County, u.Type, u.Primary, us.Mean, us.Median
FROM us_household_income u
JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE Mean != 0;

SELECT u.State_Name, ROUND(AVG(us.Mean), 1),ROUND(AVG(us.Median), 1)
FROM us_household_income u
JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE Mean != 0
GROUP BY u.State_Name
ORDER BY 3 ASC
LIMIT 10;

SELECT u.Type, COUNT(u.Type), ROUND(AVG(us.Mean), 1),ROUND(AVG(us.Median), 1)
FROM us_household_income u
JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE Mean != 0
GROUP BY u.Type
ORDER BY 4 DESC
LIMIT 20;

SELECT *
FROM us_household_income
WHERE Type = 'Community';

SELECT u.Type, COUNT(u.Type), ROUND(AVG(us.Mean), 1),ROUND(AVG(us.Median), 1)
FROM us_household_income u
JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE Mean != 0
GROUP BY u.Type
HAVING COUNT(u.Type) > 100
ORDER BY 4 DESC
LIMIT 20;

SELECT u.State_Name, u.City, ROUND(AVG(us.Mean), 1), ROUND(AVG(us.Median), 1)
FROM us_household_income u
JOIN us_household_income_statistics us
	ON u.id = us.id
GROUP BY u.State_Name, u.City
ORDER BY ROUND(AVG(us.Mean), 1) DESC;