-- SalesSight 360: Database Created
CREATE DATABASE IF NOT EXISTS salessight360;
USE salessight360;

-- Show imported tables
SHOW TABLES;

-- Check main sales table structure
DESCRIBE Sales_Data;

-- Check main sales table record count
SELECT COUNT(*) AS Total_Records
FROM Sales_Data;