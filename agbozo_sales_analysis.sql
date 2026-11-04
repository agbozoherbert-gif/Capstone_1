--Sales Territory: New Castle (714)

SELECT *
FROM inventory_subcategories;

SELECT * 
FROM inventory_categories;

SELECT * 
FROM management;

SELECT * 
FROM online_sales;

SELECT *
FROM products;

SELECT *
FROM shipper_list;

SELECT *
FROM store_locations;

SELECT * 
FROM store_sales;

-- NewCastle (714)

-- What is total revenue overall for sales in the assigned territory, plus the start date and end date
-- that tell you what period the data covers?
SELECT SUM(Sale_Amount) 
       AS Total_Revenue
FROM store_sales
WHERE Store_ID = 714;

SELECT MIN(Transaction_Date) AS Start_Date,
       MAX(Transaction_Date) AS End_Date
FROM store_sales 
WHERE Store_ID = 714;
-- What is the revenue breakdown by year and month for the sales territory?
SELECT YEAR(Transaction_Date) AS Newcastle_Sales_Year,
       MONTH(Transaction_Date) AS Newcastle_Sales_Month,
       SUM(Sale_Amount) 
       AS Total_Revenue
FROM store_sales
WHERE Store_ID = 714
GROUP BY
       YEAR(Transaction_Date),
       MONTH(Transaction_Date)
ORDER BY Newcastle_Sales_Year,
       Newcastle_Sales_Month;       
-- Provide a comparison of total revenue for the specific sales territory and the region it belongs to.
SELECT 'New Castle' AS Location,
       SUM(ss.Sale_Amount) AS Total_Revenue
FROM store_sales ss 
JOIN store_locations sl
       ON ss.Store_ID = sl.StoreId
WHERE sl.StoreLocation = 'New Castle'

UNION ALL

SELECT 'West Region - Colorado Stores' AS Location,
       SUM(ss.Sale_Amount) AS Total_Revenue
FROM store_sales ss
JOIN store_locations sl
       ON ss.Store_ID = sl.StoreId
JOIN management m
       ON sl.State = m.State
WHERE m.Region = 'West'
        AND sl.State = 'Colorado';       
-- What is the number of transactions per month and average transaction amount by product
-- category for the sales territory?
SELECT YEAR(ss.Transaction_Date) AS NewCastle_Sales_Year,
       MONTH(ss.Transaction_Date) AS NewCastle_Sales_Month,
       ic.Category AS Product_Category,
       COUNT(*) AS Number_of_Transactions,
       CAST(AVG(ss.Sale_Amount) AS DECIMAL(12,2)) AS Average_Transaction_Qty
FROM store_sales ss 
JOIN products p 
       ON ss.Prod_Num = p.ProdNum
JOIN inventory_categories ic
       ON p.Categoryid = ic.Categoryid
WHERE ss.Store_ID = 714
GROUP BY YEAR(ss.Transaction_Date),
       MONTH(ss.Transaction_Date),
       ic.Category
ORDER BY NewCastle_Sales_Year,
       NewCastle_Sales_Month,
       Product_Category;       

DESCRIBE inventory_categories;
-- Can you provide a ranking of in-store sales performance by each store in the sales territory, or a
-- ranking of online sales performance by state within an online sales territory?
SELECT ShiptoState AS State,
       CAST(SUM(SalesTotal) AS DECIMAL(12,2)) 
       AS Total_Revenue,
       RANK() OVER (ORDER BY SUM(SalesTotal) DESC)
       AS Sales_Rank
FROM online_sales
GROUP BY ShiptoState
ORDER BY Sales_Rank;

-- Analysis: Sales are trending high in the Pacific Northwest, with California, Washington, and Oregon
-- What is your recommendation for where to focus sales attention in the next quarter?
SELECT
FROM
WHERE;
