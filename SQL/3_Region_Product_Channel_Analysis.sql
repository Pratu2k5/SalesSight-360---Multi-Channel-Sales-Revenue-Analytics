-- SalesSight 360: Region, Product and Channel Analysis
USE salessight360;

-- 1. Main KPI summary
SELECT
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT ﻿Order_ID) AS Total_Orders,
    SUM(Revenue) / NULLIF(COUNT(DISTINCT ﻿Order_ID), 0) AS Average_Order_Value
FROM sales_data;

-- 2. Revenue and profit by region
SELECT 
	Region,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT ﻿Order_ID) AS Total_Orders
FROM sales_data
GROUP BY Region
ORDER BY Total_Revenue DESC;

-- 3. Revenue by state
SELECT State,
    SUM(Revenue) AS Total_Revenue
FROM sales_data
GROUP BY State
ORDER BY Total_Revenue DESC;

-- 4. Revenue and profit by product category
SELECT Category,
	SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM sales_data
GROUP BY Category
ORDER BY Total_Revenue AND Total_Profit DESC;

-- 5. Product performance
SELECT
	Product,
	SUM(Quantity) AS Total_Quantity,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Product
ORDER BY Total_Revenue DESC;

-- 6. Revenue by sales channel
SELECT
	Channel,
    SUM(Revenue) AS Total_Revenue,
	SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT ﻿Order_ID) AS Total_Orders
FROM sales_data
GROUP BY Channel
ORDER BY Total_Revenue DESC;

-- 7. Revenue by customer segment
SELECT
	Customer_Segment,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT ﻿Order_ID) AS Total_Orders
FROM sales_data
GROUP BY Customer_Segment
ORDER BY Total_Revenue DESC;

-- 8. Revenue contribution by channel
SELECT
    Channel,
    ROUND(SUM(Revenue),2) AS Channel_Revenue,
    ROUND(
        SUM(Revenue) * 100.0 /
        NULLIF((SELECT SUM(Revenue) FROM Sales_Data), 0),
        2
    ) AS Revenue_Contribution_Percent
FROM Sales_Data
GROUP BY Channel
ORDER BY Channel_Revenue DESC;