CREATE DATABASE ineuron_projects;

USE ineuron_projects;
CREATE TABLE iNTERNATIONAL_DEBT_DATA
	(country_name varchar(30),
	 country_code varchar(10),
	 indicator_name varchar(100),
	 indicator_code varchar(20),
	 debt float(40));
     
set session SQL_mode = 0;

LOAD DATA INFILE  "D:\\Analyzing_International_Debt_Statistics-\\debt_Data_Cleaned.CSV"
INTO TABLE International_debt_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

Select * from International_debt_data;

-- DATA load Complete -----------------------------------------------------------------------------------------------------------------------------

# 1.The World Bank's international debt data
SELECT * FROM International_debt_data;


 # 2. Finding the number of distinct countries
SELECT Count(Distinct Country_name) AS distinct_countries 
FROM International_debt_data;


# 3. Finding out the distinct debt indicators
SELECT DISTINCT indicator_code as distinct_debt_indicators 
FROM  International_debt_data;


#4. Totaling the amount of debt owed by the countries.
SELECT ROUND(SUM(DEBT),2) AS total_debt
FROM International_debt_data;


# 5. Country with Highest Debt 
SELECT country_name, sum(debt) As debt
FROM international_debt_data
GROUP BY 1
ORDER BY 2 desc 
LIMIT 1;


# 6. Average amount of debt Across all Indicators 
SELECT Indicator_code, indicator_name ,  Avg(debt)  AS avg_debt
FROM  international_debt_data
GROUP BY 1; 


# 7. Highest Amount of Principal repayments
SELECT country_name, indicator_code,  indicator_name , sum(debt) AS repayments
FROM  international_debt_data
WHERE indicator_name  LIKE 'Principal Repayments%'
group  by 1
order BY  4 Desc;


# 8. Most common debt Indicator
SELECT Indicator_code, Indicator_name , count(indicator_code) AS  Total_count  
FROM international_debt_data 
Group by 1 ,2
order by 3 DESC;


# 9. Other Viable Debt issues & Conclusion / Country with least debt
SELECT country_name, sum(debt) As debt
FROM international_debt_data
GROUP BY 1
ORDER BY 2 
LIMIT 1;







