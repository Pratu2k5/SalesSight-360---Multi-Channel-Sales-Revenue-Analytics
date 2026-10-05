-- SalesSight 360: Monthly Sales Analysis
USE SalesSight360;

-- 1. Monthly revenue and profit
SELECT
    YEAR(Order_Date) AS Sales_Year,
    MONTH(Order_Date) AS Month_Number,
    DATE_FORMAT(Order_Date, '%b %Y') AS Sales_Month,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT ﻿Order_ID) AS Total_Orders
FROM Sales_Data
GROUP BY
    YEAR(Order_Date),
    MONTH(Order_Date),
    DATE_FORMAT(Order_Date, '%b %Y')
ORDER BY
    Sales_Year,
    Month_Number;
    
-- 2. Yearly sales summary
SELECT
	YEAR(Order_Date) AS Salary_Year,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT ﻿Order_ID) AS Total_Orders
FROM sales_data
GROUP BY YEAR(Order_Date)
ORDER BY Salary_Year DESC;

-- 3. Quarterly revenue
SELECT
    YEAR(Order_Date) AS Sales_Year,
    QUARTER(Order_Date) AS Sales_Quarter,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit
FROM Sales_Data
GROUP BY
    YEAR(Order_Date),
    QUARTER(Order_Date)
ORDER BY
    Sales_Year,
    Sales_Quarter;
    
-- 4. Monthly revenue compared with forecast
SELECT
    YEAR(Order_Date) AS Sales_Year,
    MONTH(Order_Date) AS Month_Number,
    DATE_FORMAT(Order_Date, '%b %Y') AS Sales_Month,
    SUM(Revenue) AS Actual_Revenue,
    SUM(Forecast_Value) AS Forecast_Value
FROM Sales_Data
GROUP BY
    YEAR(Order_Date),
    MONTH(Order_Date),
    DATE_FORMAT(Order_Date, '%b %Y')
ORDER BY
    Sales_Year,
    Month_Number;