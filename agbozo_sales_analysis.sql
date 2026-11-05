
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



-- SALES TERRITORY: OREGON

-- What is total revenue overall for sales in the assigned territory, plus the start date and end date
-- that tell you what period the data covers?

SELECT COUNT(*) AS Total_Transactions,
       SUM(SalesTotal) AS Total_Revenue,
       MIN(Date) AS Start_Date,
       MAX(Date) AS End_Date
FROM online_Sales
WHERE ShiptoState = 'Oregon';

-- What is the revenue breakdown by year and month for the sales territory?
SELECT YEAR(Date) AS Oregon_Sales_Year,
       MONTH(Date) AS Oregon_Sales_Month,
       SUM(SaleSTotal) 
       AS Total_Revenue
FROM online_sales
WHERE ShiptoState = 'Oregon'
GROUP BY
       YEAR(Date),
       MONTH(Date)
ORDER BY Oregon_Sales_Year,
       Oregon_Sales_Month;       
-- Provide a comparison of total revenue for the specific sales territory and the region it belongs to.

SELECT SUM(SalesTotal)
       AS West_Online_Revenue
FROM online_sales;     

-- OREGON ONLINE SALES REVENUE

SELECT 'Oregon' AS Territory,
       SUM(SalesTotal) AS Total_Revenue
FROM online_sales 
WHERE ShiptoState = 'Oregon'

UNION ALL

-- WEST REGION ONLINE SALES REVENUE

SELECT 'West Region' AS Territory,
       SUM(SalesTotal) AS Total_Revenue
FROM online_sales; 


-- What is the number of transactions per month and average transaction amount by product
-- category for the sales territory? 

SELECT YEAR(os.Date) AS Oregon_Sales_Year,
       MONTH(os.DATE) AS Oregon_Sales_Month,
       ic.Category AS Product_Category,
       COUNT(*) AS Number_of_Transactions,
       CAST(AVG(os.SalesTotal) AS DECIMAL(12,2)) 
       AS Average_Transcaction_Amount
FROM online_sales os
JOIN products p 
       ON os.ProdNum = p.ProdNum
JOIN inventory_categories ic 
       ON p.Categoryid = ic.Categoryid
WHERE os.ShiptoState = 'Oregon'
GROUP BY YEAR(os.Date),
       MONTH(os.Date),
       ic.Category
ORDER BY Oregon_Sales_Year,
       Oregon_Sales_Month,
       Product_Category;       

-- Can you provide a ranking of in-store sales performance by each store in the sales territory, or a
-- ranking of online sales performance by state within an online sales territory?


SELECT ShiptoState AS State,
       CAST(SUM(SalesTotal) AS DECIMAL(12,2)) 
       AS Total_Revenue,
       RANK() OVER (ORDER BY SUM(SalesTotal) DESC)
       AS Sales_Rank
FROM Online_sales
GROUP BY ShiptoState
ORDER BY Sales_Rank;


-- Analysis: Sales are trending high in the Pacific Northwest, with California, Washington, and Oregon
-- What is your recommendation for where to focus sales attention in the next quarter?

-- ANALYSIS ANSWER: For the next quarter, I recommend prioritizing the growth of Oregon's
-- online sales by focusing on product categories with strong customer activity and higher
-- average transaction amounts. The analysis shows that General Books category generates 
-- a substanstial volume of transactions, while Technology & Accesories produces considerably
-- higher average transaction amounts. I recommend developing targeted promotions for these 
-- categories to encourage repeat purchases while simultaneously increasing the value of individual
-- transactions. With this in mind, I believe California and Washington's figures should serve as 
-- benchmarks to help identify growth opportunities for Oregon. This could help strengthen their
-- competitive stance within the region. Sales campaigns should align with the monthly revenue 
-- and purchasing patterns identified within the analysis. This approach would allow the 
-- business to build progressively in Oregon utilzing their existing customer activty, increase
-- revenue, and and improve its contribution to regional online sales.

