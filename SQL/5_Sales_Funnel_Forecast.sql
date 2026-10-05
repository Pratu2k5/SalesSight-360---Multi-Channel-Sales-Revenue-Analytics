-- SalesSight 360: Sales Funnel and Forecast Analysis
USE SalesSight360;

-- 1. Count records by sales stage
SELECT
    Sales_Stage,
    COUNT(*) AS Record_Count
FROM Sales_Data
GROUP BY Sales_Stage
ORDER BY Record_Count DESC;

-- 2. Revenue and forecast by sales stage
SELECT
    Sales_Stage,
    SUM(Revenue) AS Total_Revenue,
    SUM(Forecast_Value) AS Total_Forecast
FROM Sales_Data
GROUP BY Sales_Stage
ORDER BY Total_Forecast DESC;

-- 3. Closed Won and Closed Lost counts
SELECT
    Sales_Stage,
    COUNT(DISTINCT ﻿Order_ID) AS Total_Orders
FROM Sales_Data
WHERE Sales_Stage IN ('Closed Won', 'Closed Lost')
GROUP BY Sales_Stage;

-- 4. Win rate
SELECT
    SUM(CASE
        WHEN Sales_Stage = 'Closed Won' THEN 1
        ELSE 0
    END) * 100.0
    /
    NULLIF(
        SUM(CASE
            WHEN Sales_Stage IN ('Closed Won', 'Closed Lost') THEN 1
            ELSE 0
        END),
        0
    ) AS Win_Rate_Percent
FROM Sales_Data;

-- 5. Forecast by region
SELECT
    Region,
    SUM(Forecast_Value) AS Total_Forecast
FROM Sales_Data
GROUP BY Region
ORDER BY Total_Forecast DESC;

-- 6. Forecast by sales representative
SELECT
    Sales_Rep,
    SUM(Forecast_Value) AS Total_Forecast,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit
FROM Sales_Data
GROUP BY Sales_Rep
ORDER BY Total_Forecast DESC;

-- 7. Forecast variance
SELECT
    SUM(Forecast_Value) AS Total_Forecast,
    SUM(Target_Revenue) AS Total_Target,
    SUM(Forecast_Value) - SUM(Target_Revenue)
        AS Forecast_Variance
FROM Sales_Data;