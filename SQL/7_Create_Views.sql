-- SalesSight 360: Create SQL Views
USE SalesSight360;

-- 1. Main sales analysis view
CREATE OR REPLACE VIEW vw_Sales_Analysis AS
SELECT
    ﻿Order_ID,
    Order_Date,
    Customer_ID,
    Customer_Name,
    State,
    Region,
    Customer_Segment,
    Product,
    Category,
    Quantity,
    Revenue,
    Cost,
    Profit,
    Channel,
    Sales_Team,
    Sales_Rep,
    Sales_Stage,
    Forecast_Value,
    Target_Revenue
FROM Sales_Data;

-- 2. Regional sales summary view
CREATE OR REPLACE VIEW vw_Regional_Sales AS
SELECT
    Region,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT ﻿Order_ID) AS Total_Orders
FROM Sales_Data
GROUP BY Region;

-- 3. Category sales summary view
CREATE OR REPLACE VIEW vw_Category_Sales AS
SELECT
    Category,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM Sales_Data
GROUP BY Category;

-- 4. Channel sales summary view
CREATE OR REPLACE VIEW vw_Channel_Sales AS
SELECT
    Channel,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT ﻿Order_ID) AS Total_Orders
FROM Sales_Data
GROUP BY Channel;

-- 5. Monthly sales summary view
CREATE OR REPLACE VIEW vw_Monthly_Sales AS
SELECT
    YEAR(Order_Date) AS Sales_Year,
    MONTH(Order_Date) AS Month_Number,
    DATE_FORMAT(Order_Date, '%b %Y') AS Sales_Month,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit
FROM Sales_Data
GROUP BY
    YEAR(Order_Date),
    MONTH(Order_Date),
    DATE_FORMAT(Order_Date, '%b %Y');
    
-- Test the views
SELECT * FROM vw_Sales_Analysis;

SELECT * FROM vw_Regional_Sales;

SELECT * FROM vw_Category_Sales;

SELECT * FROM vw_Channel_Sales;

SELECT * FROM vw_Monthly_Sales;