-- SalesSight 360: Dimension Table Joins
USE SalesSight360;

-- 1. Sales with customer information
SELECT
    s.﻿Order_ID,
    s.Order_Date,
    s.Customer_ID,
    c.Customer_Name,
    c.Customer_Segment,
    s.Region,
    s.Revenue,
    s.Profit
FROM Sales_Data AS s
LEFT JOIN Dim_Customer AS c
    ON s.Customer_ID = c.﻿Customer_ID;

-- 2. Sales with product information
-- Confirm the product join column names before running.
SELECT
    s.﻿Order_ID,
    s.Product,
    p.Category,
    s.Quantity,
    s.Revenue,
    s.Profit
FROM Sales_Data AS s
LEFT JOIN Dim_Product AS p
    ON s.Product = p.Product;

-- 3. Sales with sales representative information
-- Confirm that the representative field names match.
SELECT
    s.﻿Order_ID,
    s.Sales_Rep,
    r.Sales_Team,
    s.Revenue,
    s.Profit
FROM Sales_Data AS s
LEFT JOIN Dim_Sales AS r
    ON s.Sales_Rep = r.Sales_Rep;

-- 4. Sales with channel information
-- Confirm the matching channel field in Dim_Channel.
SELECT
    s.﻿Order_ID,
    s.Channel,
    c.Channel,
    s.Revenue
FROM Sales_Data AS s
LEFT JOIN Dim_Channel AS c
    ON s.Channel = c.Channel;

-- 5. Sales with sales stage information
-- Confirm the matching stage field in Dim_Stage.
SELECT
    s.﻿Order_ID,
    s.Sales_Stage,
    st.Sales_Stage,
    s.Forecast_Value
FROM Sales_Data AS s
LEFT JOIN Dim_Stage AS st
    ON s.Sales_Stage = st.Sales_Stage;