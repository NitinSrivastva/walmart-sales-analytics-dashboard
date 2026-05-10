CREATE DATABASE walmart_project;
USE walmart_project;

DROP TABLE walmart_sales;

CREATE TABLE walmart_sales (
    Store INT,
    Date DATE,
    Weekly_Sales DECIMAL(12,2),
    Holiday_Flag INT,
    Temperature DECIMAL(6,2),
    Fuel_Price DECIMAL(6,2),
    CPI DECIMAL(8,2),
    Unemployment DECIMAL(6,2)
);

SELECT * FROM walmart_sales LIMIT 10;

-- The Walmart dataset generated total sales of 9.63 billion.
SELECT SUM(Weekly_Sales) 
AS total_sales 
FROM walmart_sales;

-- This query calculates the average weekly sales generated across all Walmart store records in the dataset.
SELECT AVG(Weekly_Sales) 
AS Average_Sales
FROM walmart_sales;

-- This query finds the highest weekly sales value recorded in the dataset.
SELECT MAX(Weekly_Sales) 
AS Highest_Sales
FROM walmart_sales;

-- This query finds the minimum weekly sales value recorded in the dataset.
SELECT MIN(Weekly_Sales) 
AS Lowest_Sales
FROM walmart_sales;

-- This query counts the total number of records available in the dataset.
SELECT COUNT(*) 
AS total_record 
FROM walmart_sales;

-- GROUP BY Store is used to combine records of the same store so that total sales can be calculated separately for each store.
SELECT Store,
SUM(Weekly_Sales) AS Total_Sales
FROM walmart_sales
GROUP BY Store
ORDER BY Total_Sales DESC;


SELECT Store,
SUM(Weekly_Sales) AS Total_Sales
FROM walmart_sales
GROUP BY Store
ORDER BY Total_Sales ASC;

-- Holiday weeks generated higher average sales compared to non-holiday weeks.
SELECT Holiday_Flag,
AVG(Weekly_Sales) AS Average_Sales
FROM walmart_sales
GROUP BY Holiday_Flag;

-- Which month generates highest sales?
-- MONTH(Date) extracts the month value from the Date column so sales can be analyzed month-wise.
SELECT MONTH(Date) AS Month,
SUM(Weekly_Sales) AS Total_Sales
FROM walmart_sales
GROUP BY MONTH(Date)
ORDER BY Total_Sales DESC;

-- Find Store with Highest Average Sales
-- Why AVG is Better than SUM 
-- ANS: AVG provides a better measure of consistent store performance, whereas SUM only shows total cumulative revenue. 
SELECT Store,
AVG(Weekly_Sales) AS Average_Sales
FROM walmart_sales
GROUP BY Store
ORDER BY Average_Sales DESC;


SELECT * FROM walmart_sales LIMIT 10;
