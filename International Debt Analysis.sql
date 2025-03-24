-- Viewing the dataset
select *
FROM datanalytics.international_debt;

-- 1. What is the total amount of debt owed by all countries in the dataset

select SUM(debt) as total_debt
from datanalytics.international_debt;

-- 2. How many distinct countries are recorded in the dataset?

select COUNT(distinct(country_name)) as countries
from datanalytics.international_debt;

-- 3. What are the distinct types of debt indicators and what do they represent?

select DISTINCT(indicator_code) as debt_indicator_codes, indicator_name
from datanalytics.international_debt;

-- 4. Which country has the highest total debt, and how much does it owe?

select country_name, SUM(debt) as total_debt
from datanalytics.international_debt
group by country_name 
order by total_debt desc
limit 1;

-- 5. What is the average debt across different debt indicators

select indicator_code, AVG(debt) as average_debt
from datanalytics.international_debt
group by indicator_code;

-- 6. Which country has made the highest amount of principal repayments?

select country_name, SUM(debt) as total_debt
from datanalytics.international_debt
WHERE indicator_code='DT.AMT.DLXF.CD'
group by country_name
order by total_debt desc
limit 1;


-- 7. What is the most common debt indicator across all countries

select indicator_code, COUNT(indicator_code) as debt_indicator_count
from datanalytics.international_debt
group by indicator_code
order by debt_indicator_count DESC;

-- 8 Identify any other key debt trends and summarize your findings

-- Which is the most common debt type

select indicator_name, SUM(debt) as total_debt
from datanalytics.international_debt
group by indicator_name
order by total_debt desc;

