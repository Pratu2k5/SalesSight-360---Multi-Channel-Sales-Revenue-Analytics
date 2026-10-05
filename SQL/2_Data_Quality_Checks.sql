-- SalesSight 360: Data Quality Checks
USE salessight360;

-- 1. Check total rows
SELECT COUNT(*) AS Total_Rows
FROM sales_data;

-- 2. Check unique order IDs
SELECT DISTINCT COUNT(﻿Order_ID) AS Total_Orders
FROM sales_data;

-- 3. Find duplicate Order_ID values
SELECT
    ﻿Order_ID,
    COUNT(*) AS Total_Records
FROM sales_data
GROUP BY ﻿Order_ID
HAVING COUNT(*) > 1;

-- 4. Check missing important values
SELECT * FROM sales_data
WHERE ﻿Order_ID IS NULL
	OR Order_Date IS NULL
    OR Profit IS NULL
    OR Revenue IS NULL;
    
-- 5. Check negative financial values
SELECT * FROM sales_data
WHERE Revenue<0
	OR Cost<0;
    
-- 6. Check negative quantity
SELECT * FROM sales_data
WHERE Quantity<0;

-- 7. Check profit calculation
SELECT
    Revenue,
    Cost,
    Profit,
    Revenue - Cost AS Calculated_Profit,
    Profit - (Revenue - Cost) AS Difference
FROM sales_data
LIMIT 20;

SELECT COUNT(*) AS Mismatch_Count
FROM sales_data
WHERE (Profit - (Revenue - Cost)) > 1;

-- 8. Check sales stages
SELECT DISTINCT sales_stage
FROM sales_data
ORDER BY sales_stage;

-- 9. Check payment statuses
SELECT DISTINCT payment_status
FROM sales_data
ORDER BY payment_status;